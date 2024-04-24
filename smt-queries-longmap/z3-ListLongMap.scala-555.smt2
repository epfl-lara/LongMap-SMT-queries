; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14974 () Bool)

(assert start!14974)

(declare-fun b!143775 () Bool)

(declare-fun b_free!3049 () Bool)

(declare-fun b_next!3049 () Bool)

(assert (=> b!143775 (= b_free!3049 (not b_next!3049))))

(declare-fun tp!11633 () Bool)

(declare-fun b_and!8965 () Bool)

(assert (=> b!143775 (= tp!11633 b_and!8965)))

(declare-fun b!143769 () Bool)

(declare-fun b_free!3051 () Bool)

(declare-fun b_next!3051 () Bool)

(assert (=> b!143769 (= b_free!3051 (not b_next!3051))))

(declare-fun tp!11635 () Bool)

(declare-fun b_and!8967 () Bool)

(assert (=> b!143769 (= tp!11635 b_and!8967)))

(declare-fun b!143763 () Bool)

(declare-fun e!93687 () Bool)

(declare-fun e!93693 () Bool)

(assert (=> b!143763 (= e!93687 e!93693)))

(declare-fun res!68496 () Bool)

(assert (=> b!143763 (=> (not res!68496) (not e!93693))))

(declare-datatypes ((V!3569 0))(
  ( (V!3570 (val!1515 Int)) )
))
(declare-datatypes ((array!4907 0))(
  ( (array!4908 (arr!2318 (Array (_ BitVec 32) (_ BitVec 64))) (size!2592 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1127 0))(
  ( (ValueCellFull!1127 (v!3307 V!3569)) (EmptyCell!1127) )
))
(declare-datatypes ((array!4909 0))(
  ( (array!4910 (arr!2319 (Array (_ BitVec 32) ValueCell!1127)) (size!2593 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1162 0))(
  ( (LongMapFixedSize!1163 (defaultEntry!2975 Int) (mask!7333 (_ BitVec 32)) (extraKeys!2724 (_ BitVec 32)) (zeroValue!2822 V!3569) (minValue!2822 V!3569) (_size!630 (_ BitVec 32)) (_keys!4740 array!4907) (_values!2958 array!4909) (_vacant!630 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!948 0))(
  ( (Cell!949 (v!3308 LongMapFixedSize!1162)) )
))
(declare-datatypes ((LongMap!948 0))(
  ( (LongMap!949 (underlying!485 Cell!948)) )
))
(declare-fun thiss!992 () LongMap!948)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2642 0))(
  ( (tuple2!2643 (_1!1332 (_ BitVec 64)) (_2!1332 V!3569)) )
))
(declare-datatypes ((List!1730 0))(
  ( (Nil!1727) (Cons!1726 (h!2334 tuple2!2642) (t!6347 List!1730)) )
))
(declare-datatypes ((ListLongMap!1695 0))(
  ( (ListLongMap!1696 (toList!863 List!1730)) )
))
(declare-fun lt!75416 () ListLongMap!1695)

(declare-fun contains!913 (ListLongMap!1695 (_ BitVec 64)) Bool)

(assert (=> b!143763 (= res!68496 (contains!913 lt!75416 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2644 0))(
  ( (tuple2!2645 (_1!1333 Bool) (_2!1333 LongMapFixedSize!1162)) )
))
(declare-fun lt!75418 () tuple2!2644)

(declare-fun newMap!16 () LongMapFixedSize!1162)

(declare-fun update!214 (LongMapFixedSize!1162 (_ BitVec 64) V!3569) tuple2!2644)

(declare-fun get!1546 (ValueCell!1127 V!3569) V!3569)

(declare-fun dynLambda!444 (Int (_ BitVec 64)) V!3569)

(assert (=> b!143763 (= lt!75418 (update!214 newMap!16 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!143764 () Bool)

(declare-fun e!93685 () Bool)

(declare-fun e!93681 () Bool)

(assert (=> b!143764 (= e!93685 e!93681)))

(declare-fun mapIsEmpty!4879 () Bool)

(declare-fun mapRes!4879 () Bool)

(assert (=> mapIsEmpty!4879 mapRes!4879))

(declare-fun b!143765 () Bool)

(declare-fun e!93679 () Bool)

(assert (=> b!143765 (= e!93681 e!93679)))

(declare-fun res!68497 () Bool)

(declare-fun e!93684 () Bool)

(assert (=> start!14974 (=> (not res!68497) (not e!93684))))

(declare-fun valid!576 (LongMap!948) Bool)

(assert (=> start!14974 (= res!68497 (valid!576 thiss!992))))

(assert (=> start!14974 e!93684))

(assert (=> start!14974 e!93685))

(assert (=> start!14974 true))

(declare-fun e!93680 () Bool)

(assert (=> start!14974 e!93680))

(declare-fun b!143766 () Bool)

(declare-fun e!93688 () Bool)

(declare-fun e!93695 () Bool)

(assert (=> b!143766 (= e!93688 e!93695)))

(declare-fun res!68491 () Bool)

(assert (=> b!143766 (=> (not res!68491) (not e!93695))))

(declare-datatypes ((List!1731 0))(
  ( (Nil!1728) (Cons!1727 (h!2335 (_ BitVec 64)) (t!6348 List!1731)) )
))
(declare-fun lt!75417 () List!1731)

(declare-fun contains!914 (List!1731 (_ BitVec 64)) Bool)

(assert (=> b!143766 (= res!68491 (not (contains!914 lt!75417 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!143767 () Bool)

(assert (=> b!143767 (= e!93693 (not e!93688))))

(declare-fun res!68492 () Bool)

(assert (=> b!143767 (=> res!68492 e!93688)))

(assert (=> b!143767 (= res!68492 (or (bvsge (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> b!143767 (= lt!75417 (Cons!1727 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) Nil!1728))))

(declare-fun arrayNoDuplicates!0 (array!4907 (_ BitVec 32) List!1731) Bool)

(assert (=> b!143767 (arrayNoDuplicates!0 (_keys!4740 (v!3308 (underlying!485 thiss!992))) from!355 Nil!1728)))

(declare-datatypes ((Unit!4553 0))(
  ( (Unit!4554) )
))
(declare-fun lt!75415 () Unit!4553)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4907 (_ BitVec 32) (_ BitVec 32)) Unit!4553)

(assert (=> b!143767 (= lt!75415 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4740 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143767 (arrayContainsKey!0 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!75420 () Unit!4553)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!144 (array!4907 array!4909 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 64) (_ BitVec 32) Int) Unit!4553)

(assert (=> b!143767 (= lt!75420 (lemmaListMapContainsThenArrayContainsFrom!144 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (_values!2958 (v!3308 (underlying!485 thiss!992))) (mask!7333 (v!3308 (underlying!485 thiss!992))) (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) (zeroValue!2822 (v!3308 (underlying!485 thiss!992))) (minValue!2822 (v!3308 (underlying!485 thiss!992))) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun b!143768 () Bool)

(declare-fun e!93686 () Bool)

(declare-fun tp_is_empty!2941 () Bool)

(assert (=> b!143768 (= e!93686 tp_is_empty!2941)))

(declare-fun mapNonEmpty!4879 () Bool)

(declare-fun tp!11636 () Bool)

(declare-fun e!93691 () Bool)

(assert (=> mapNonEmpty!4879 (= mapRes!4879 (and tp!11636 e!93691))))

(declare-fun mapRest!4879 () (Array (_ BitVec 32) ValueCell!1127))

(declare-fun mapValue!4879 () ValueCell!1127)

(declare-fun mapKey!4880 () (_ BitVec 32))

(assert (=> mapNonEmpty!4879 (= (arr!2319 (_values!2958 newMap!16)) (store mapRest!4879 mapKey!4880 mapValue!4879))))

(declare-fun e!93690 () Bool)

(declare-fun array_inv!1449 (array!4907) Bool)

(declare-fun array_inv!1450 (array!4909) Bool)

(assert (=> b!143769 (= e!93680 (and tp!11635 tp_is_empty!2941 (array_inv!1449 (_keys!4740 newMap!16)) (array_inv!1450 (_values!2958 newMap!16)) e!93690))))

(declare-fun b!143770 () Bool)

(declare-fun e!93694 () Bool)

(assert (=> b!143770 (= e!93690 (and e!93694 mapRes!4879))))

(declare-fun condMapEmpty!4880 () Bool)

(declare-fun mapDefault!4879 () ValueCell!1127)

(assert (=> b!143770 (= condMapEmpty!4880 (= (arr!2319 (_values!2958 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1127)) mapDefault!4879)))))

(declare-fun b!143771 () Bool)

(assert (=> b!143771 (= e!93694 tp_is_empty!2941)))

(declare-fun b!143772 () Bool)

(assert (=> b!143772 (= e!93684 e!93687)))

(declare-fun res!68493 () Bool)

(assert (=> b!143772 (=> (not res!68493) (not e!93687))))

(declare-fun lt!75419 () ListLongMap!1695)

(assert (=> b!143772 (= res!68493 (and (= lt!75419 lt!75416) (not (= (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1437 (LongMapFixedSize!1162) ListLongMap!1695)

(assert (=> b!143772 (= lt!75416 (map!1437 newMap!16))))

(declare-fun getCurrentListMap!535 (array!4907 array!4909 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 32) Int) ListLongMap!1695)

(assert (=> b!143772 (= lt!75419 (getCurrentListMap!535 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (_values!2958 (v!3308 (underlying!485 thiss!992))) (mask!7333 (v!3308 (underlying!485 thiss!992))) (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) (zeroValue!2822 (v!3308 (underlying!485 thiss!992))) (minValue!2822 (v!3308 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun b!143773 () Bool)

(declare-fun res!68494 () Bool)

(assert (=> b!143773 (=> res!68494 e!93688)))

(declare-fun noDuplicate!51 (List!1731) Bool)

(assert (=> b!143773 (= res!68494 (not (noDuplicate!51 lt!75417)))))

(declare-fun b!143774 () Bool)

(declare-fun e!93692 () Bool)

(assert (=> b!143774 (= e!93692 tp_is_empty!2941)))

(declare-fun e!93682 () Bool)

(assert (=> b!143775 (= e!93679 (and tp!11633 tp_is_empty!2941 (array_inv!1449 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (array_inv!1450 (_values!2958 (v!3308 (underlying!485 thiss!992)))) e!93682))))

(declare-fun b!143776 () Bool)

(assert (=> b!143776 (= e!93691 tp_is_empty!2941)))

(declare-fun b!143777 () Bool)

(assert (=> b!143777 (= e!93695 (not (contains!914 lt!75417 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!143778 () Bool)

(declare-fun res!68490 () Bool)

(assert (=> b!143778 (=> (not res!68490) (not e!93684))))

(assert (=> b!143778 (= res!68490 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7333 newMap!16)) (_size!630 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun b!143779 () Bool)

(declare-fun res!68495 () Bool)

(assert (=> b!143779 (=> (not res!68495) (not e!93684))))

(assert (=> b!143779 (= res!68495 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992)))))))))

(declare-fun mapIsEmpty!4880 () Bool)

(declare-fun mapRes!4880 () Bool)

(assert (=> mapIsEmpty!4880 mapRes!4880))

(declare-fun b!143780 () Bool)

(declare-fun res!68489 () Bool)

(assert (=> b!143780 (=> (not res!68489) (not e!93684))))

(declare-fun valid!577 (LongMapFixedSize!1162) Bool)

(assert (=> b!143780 (= res!68489 (valid!577 newMap!16))))

(declare-fun b!143781 () Bool)

(assert (=> b!143781 (= e!93682 (and e!93692 mapRes!4880))))

(declare-fun condMapEmpty!4879 () Bool)

(declare-fun mapDefault!4880 () ValueCell!1127)

(assert (=> b!143781 (= condMapEmpty!4879 (= (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1127)) mapDefault!4880)))))

(declare-fun mapNonEmpty!4880 () Bool)

(declare-fun tp!11634 () Bool)

(assert (=> mapNonEmpty!4880 (= mapRes!4880 (and tp!11634 e!93686))))

(declare-fun mapRest!4880 () (Array (_ BitVec 32) ValueCell!1127))

(declare-fun mapValue!4880 () ValueCell!1127)

(declare-fun mapKey!4879 () (_ BitVec 32))

(assert (=> mapNonEmpty!4880 (= (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) (store mapRest!4880 mapKey!4879 mapValue!4880))))

(assert (= (and start!14974 res!68497) b!143779))

(assert (= (and b!143779 res!68495) b!143780))

(assert (= (and b!143780 res!68489) b!143778))

(assert (= (and b!143778 res!68490) b!143772))

(assert (= (and b!143772 res!68493) b!143763))

(assert (= (and b!143763 res!68496) b!143767))

(assert (= (and b!143767 (not res!68492)) b!143773))

(assert (= (and b!143773 (not res!68494)) b!143766))

(assert (= (and b!143766 res!68491) b!143777))

(assert (= (and b!143781 condMapEmpty!4879) mapIsEmpty!4880))

(assert (= (and b!143781 (not condMapEmpty!4879)) mapNonEmpty!4880))

(get-info :version)

(assert (= (and mapNonEmpty!4880 ((_ is ValueCellFull!1127) mapValue!4880)) b!143768))

(assert (= (and b!143781 ((_ is ValueCellFull!1127) mapDefault!4880)) b!143774))

(assert (= b!143775 b!143781))

(assert (= b!143765 b!143775))

(assert (= b!143764 b!143765))

(assert (= start!14974 b!143764))

(assert (= (and b!143770 condMapEmpty!4880) mapIsEmpty!4879))

(assert (= (and b!143770 (not condMapEmpty!4880)) mapNonEmpty!4879))

(assert (= (and mapNonEmpty!4879 ((_ is ValueCellFull!1127) mapValue!4879)) b!143776))

(assert (= (and b!143770 ((_ is ValueCellFull!1127) mapDefault!4879)) b!143771))

(assert (= b!143769 b!143770))

(assert (= start!14974 b!143769))

(declare-fun b_lambda!6469 () Bool)

(assert (=> (not b_lambda!6469) (not b!143763)))

(declare-fun t!6344 () Bool)

(declare-fun tb!2577 () Bool)

(assert (=> (and b!143775 (= (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) (defaultEntry!2975 (v!3308 (underlying!485 thiss!992)))) t!6344) tb!2577))

(declare-fun result!4223 () Bool)

(assert (=> tb!2577 (= result!4223 tp_is_empty!2941)))

(assert (=> b!143763 t!6344))

(declare-fun b_and!8969 () Bool)

(assert (= b_and!8965 (and (=> t!6344 result!4223) b_and!8969)))

(declare-fun t!6346 () Bool)

(declare-fun tb!2579 () Bool)

(assert (=> (and b!143769 (= (defaultEntry!2975 newMap!16) (defaultEntry!2975 (v!3308 (underlying!485 thiss!992)))) t!6346) tb!2579))

(declare-fun result!4227 () Bool)

(assert (= result!4227 result!4223))

(assert (=> b!143763 t!6346))

(declare-fun b_and!8971 () Bool)

(assert (= b_and!8967 (and (=> t!6346 result!4227) b_and!8971)))

(declare-fun m!173529 () Bool)

(assert (=> b!143773 m!173529))

(declare-fun m!173531 () Bool)

(assert (=> b!143772 m!173531))

(declare-fun m!173533 () Bool)

(assert (=> b!143772 m!173533))

(declare-fun m!173535 () Bool)

(assert (=> b!143772 m!173535))

(declare-fun m!173537 () Bool)

(assert (=> mapNonEmpty!4879 m!173537))

(declare-fun m!173539 () Bool)

(assert (=> b!143769 m!173539))

(declare-fun m!173541 () Bool)

(assert (=> b!143769 m!173541))

(declare-fun m!173543 () Bool)

(assert (=> b!143780 m!173543))

(declare-fun m!173545 () Bool)

(assert (=> mapNonEmpty!4880 m!173545))

(declare-fun m!173547 () Bool)

(assert (=> start!14974 m!173547))

(declare-fun m!173549 () Bool)

(assert (=> b!143766 m!173549))

(declare-fun m!173551 () Bool)

(assert (=> b!143775 m!173551))

(declare-fun m!173553 () Bool)

(assert (=> b!143775 m!173553))

(declare-fun m!173555 () Bool)

(assert (=> b!143767 m!173555))

(declare-fun m!173557 () Bool)

(assert (=> b!143767 m!173557))

(assert (=> b!143767 m!173531))

(declare-fun m!173559 () Bool)

(assert (=> b!143767 m!173559))

(assert (=> b!143767 m!173531))

(assert (=> b!143767 m!173531))

(declare-fun m!173561 () Bool)

(assert (=> b!143767 m!173561))

(declare-fun m!173563 () Bool)

(assert (=> b!143763 m!173563))

(declare-fun m!173565 () Bool)

(assert (=> b!143763 m!173565))

(declare-fun m!173567 () Bool)

(assert (=> b!143763 m!173567))

(assert (=> b!143763 m!173531))

(declare-fun m!173569 () Bool)

(assert (=> b!143763 m!173569))

(assert (=> b!143763 m!173531))

(assert (=> b!143763 m!173565))

(assert (=> b!143763 m!173531))

(assert (=> b!143763 m!173567))

(declare-fun m!173571 () Bool)

(assert (=> b!143763 m!173571))

(assert (=> b!143763 m!173563))

(declare-fun m!173573 () Bool)

(assert (=> b!143777 m!173573))

(check-sat (not b!143772) (not b_next!3051) (not start!14974) (not b!143763) (not b_lambda!6469) b_and!8969 (not b!143777) b_and!8971 (not b!143769) (not b!143773) (not mapNonEmpty!4879) tp_is_empty!2941 (not b!143766) (not b!143775) (not mapNonEmpty!4880) (not b!143767) (not b!143780) (not b_next!3049))
(check-sat b_and!8969 b_and!8971 (not b_next!3049) (not b_next!3051))
(get-model)

(declare-fun b_lambda!6475 () Bool)

(assert (= b_lambda!6469 (or (and b!143775 b_free!3049) (and b!143769 b_free!3051 (= (defaultEntry!2975 newMap!16) (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))))) b_lambda!6475)))

(check-sat (not b!143772) (not b_next!3051) (not start!14974) (not b!143763) b_and!8969 (not b!143777) b_and!8971 (not b!143769) (not b!143773) (not mapNonEmpty!4879) (not b_lambda!6475) tp_is_empty!2941 (not b!143766) (not b!143775) (not mapNonEmpty!4880) (not b!143767) (not b!143780) (not b_next!3049))
(check-sat b_and!8969 b_and!8971 (not b_next!3049) (not b_next!3051))
(get-model)

(declare-fun d!45939 () Bool)

(assert (=> d!45939 (= (array_inv!1449 (_keys!4740 newMap!16)) (bvsge (size!2592 (_keys!4740 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143769 d!45939))

(declare-fun d!45941 () Bool)

(assert (=> d!45941 (= (array_inv!1450 (_values!2958 newMap!16)) (bvsge (size!2593 (_values!2958 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143769 d!45941))

(declare-fun d!45943 () Bool)

(declare-fun res!68556 () Bool)

(declare-fun e!93802 () Bool)

(assert (=> d!45943 (=> res!68556 e!93802)))

(assert (=> d!45943 (= res!68556 ((_ is Nil!1728) lt!75417))))

(assert (=> d!45943 (= (noDuplicate!51 lt!75417) e!93802)))

(declare-fun b!143906 () Bool)

(declare-fun e!93803 () Bool)

(assert (=> b!143906 (= e!93802 e!93803)))

(declare-fun res!68557 () Bool)

(assert (=> b!143906 (=> (not res!68557) (not e!93803))))

(assert (=> b!143906 (= res!68557 (not (contains!914 (t!6348 lt!75417) (h!2335 lt!75417))))))

(declare-fun b!143907 () Bool)

(assert (=> b!143907 (= e!93803 (noDuplicate!51 (t!6348 lt!75417)))))

(assert (= (and d!45943 (not res!68556)) b!143906))

(assert (= (and b!143906 res!68557) b!143907))

(declare-fun m!173667 () Bool)

(assert (=> b!143906 m!173667))

(declare-fun m!173669 () Bool)

(assert (=> b!143907 m!173669))

(assert (=> b!143773 d!45943))

(declare-fun b!143918 () Bool)

(declare-fun e!93815 () Bool)

(declare-fun e!93813 () Bool)

(assert (=> b!143918 (= e!93815 e!93813)))

(declare-fun c!27220 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!143918 (= c!27220 (validKeyInArray!0 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!143919 () Bool)

(declare-fun call!15936 () Bool)

(assert (=> b!143919 (= e!93813 call!15936)))

(declare-fun b!143920 () Bool)

(assert (=> b!143920 (= e!93813 call!15936)))

(declare-fun b!143921 () Bool)

(declare-fun e!93812 () Bool)

(assert (=> b!143921 (= e!93812 (contains!914 Nil!1728 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun d!45945 () Bool)

(declare-fun res!68566 () Bool)

(declare-fun e!93814 () Bool)

(assert (=> d!45945 (=> res!68566 e!93814)))

(assert (=> d!45945 (= res!68566 (bvsge from!355 (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992))))))))

(assert (=> d!45945 (= (arrayNoDuplicates!0 (_keys!4740 (v!3308 (underlying!485 thiss!992))) from!355 Nil!1728) e!93814)))

(declare-fun bm!15933 () Bool)

(assert (=> bm!15933 (= call!15936 (arrayNoDuplicates!0 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27220 (Cons!1727 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) Nil!1728) Nil!1728)))))

(declare-fun b!143922 () Bool)

(assert (=> b!143922 (= e!93814 e!93815)))

(declare-fun res!68564 () Bool)

(assert (=> b!143922 (=> (not res!68564) (not e!93815))))

(assert (=> b!143922 (= res!68564 (not e!93812))))

(declare-fun res!68565 () Bool)

(assert (=> b!143922 (=> (not res!68565) (not e!93812))))

(assert (=> b!143922 (= res!68565 (validKeyInArray!0 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (= (and d!45945 (not res!68566)) b!143922))

(assert (= (and b!143922 res!68565) b!143921))

(assert (= (and b!143922 res!68564) b!143918))

(assert (= (and b!143918 c!27220) b!143920))

(assert (= (and b!143918 (not c!27220)) b!143919))

(assert (= (or b!143920 b!143919) bm!15933))

(assert (=> b!143918 m!173531))

(assert (=> b!143918 m!173531))

(declare-fun m!173671 () Bool)

(assert (=> b!143918 m!173671))

(assert (=> b!143921 m!173531))

(assert (=> b!143921 m!173531))

(declare-fun m!173673 () Bool)

(assert (=> b!143921 m!173673))

(assert (=> bm!15933 m!173531))

(declare-fun m!173675 () Bool)

(assert (=> bm!15933 m!173675))

(assert (=> b!143922 m!173531))

(assert (=> b!143922 m!173531))

(assert (=> b!143922 m!173671))

(assert (=> b!143767 d!45945))

(declare-fun d!45947 () Bool)

(assert (=> d!45947 (arrayNoDuplicates!0 (_keys!4740 (v!3308 (underlying!485 thiss!992))) from!355 Nil!1728)))

(declare-fun lt!75459 () Unit!4553)

(declare-fun choose!39 (array!4907 (_ BitVec 32) (_ BitVec 32)) Unit!4553)

(assert (=> d!45947 (= lt!75459 (choose!39 (_keys!4740 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!45947 (bvslt (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!45947 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4740 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000000 from!355) lt!75459)))

(declare-fun bs!6091 () Bool)

(assert (= bs!6091 d!45947))

(assert (=> bs!6091 m!173557))

(declare-fun m!173677 () Bool)

(assert (=> bs!6091 m!173677))

(assert (=> b!143767 d!45947))

(declare-fun d!45949 () Bool)

(declare-fun res!68571 () Bool)

(declare-fun e!93820 () Bool)

(assert (=> d!45949 (=> res!68571 e!93820)))

(assert (=> d!45949 (= res!68571 (= (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!45949 (= (arrayContainsKey!0 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!93820)))

(declare-fun b!143927 () Bool)

(declare-fun e!93821 () Bool)

(assert (=> b!143927 (= e!93820 e!93821)))

(declare-fun res!68572 () Bool)

(assert (=> b!143927 (=> (not res!68572) (not e!93821))))

(assert (=> b!143927 (= res!68572 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992))))))))

(declare-fun b!143928 () Bool)

(assert (=> b!143928 (= e!93821 (arrayContainsKey!0 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!45949 (not res!68571)) b!143927))

(assert (= (and b!143927 res!68572) b!143928))

(declare-fun m!173679 () Bool)

(assert (=> d!45949 m!173679))

(assert (=> b!143928 m!173531))

(declare-fun m!173681 () Bool)

(assert (=> b!143928 m!173681))

(assert (=> b!143767 d!45949))

(declare-fun d!45951 () Bool)

(declare-fun e!93824 () Bool)

(assert (=> d!45951 e!93824))

(declare-fun c!27223 () Bool)

(assert (=> d!45951 (= c!27223 (and (not (= (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!75462 () Unit!4553)

(declare-fun choose!886 (array!4907 array!4909 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 64) (_ BitVec 32) Int) Unit!4553)

(assert (=> d!45951 (= lt!75462 (choose!886 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (_values!2958 (v!3308 (underlying!485 thiss!992))) (mask!7333 (v!3308 (underlying!485 thiss!992))) (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) (zeroValue!2822 (v!3308 (underlying!485 thiss!992))) (minValue!2822 (v!3308 (underlying!485 thiss!992))) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!45951 (validMask!0 (mask!7333 (v!3308 (underlying!485 thiss!992))))))

(assert (=> d!45951 (= (lemmaListMapContainsThenArrayContainsFrom!144 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (_values!2958 (v!3308 (underlying!485 thiss!992))) (mask!7333 (v!3308 (underlying!485 thiss!992))) (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) (zeroValue!2822 (v!3308 (underlying!485 thiss!992))) (minValue!2822 (v!3308 (underlying!485 thiss!992))) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3308 (underlying!485 thiss!992)))) lt!75462)))

(declare-fun b!143933 () Bool)

(assert (=> b!143933 (= e!93824 (arrayContainsKey!0 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!143934 () Bool)

(assert (=> b!143934 (= e!93824 (ite (= (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!45951 c!27223) b!143933))

(assert (= (and d!45951 (not c!27223)) b!143934))

(assert (=> d!45951 m!173531))

(declare-fun m!173683 () Bool)

(assert (=> d!45951 m!173683))

(declare-fun m!173685 () Bool)

(assert (=> d!45951 m!173685))

(assert (=> b!143933 m!173531))

(assert (=> b!143933 m!173561))

(assert (=> b!143767 d!45951))

(declare-fun d!45953 () Bool)

(declare-fun lt!75465 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!141 (List!1731) (InoxSet (_ BitVec 64)))

(assert (=> d!45953 (= lt!75465 (select (content!141 lt!75417) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!93830 () Bool)

(assert (=> d!45953 (= lt!75465 e!93830)))

(declare-fun res!68578 () Bool)

(assert (=> d!45953 (=> (not res!68578) (not e!93830))))

(assert (=> d!45953 (= res!68578 ((_ is Cons!1727) lt!75417))))

(assert (=> d!45953 (= (contains!914 lt!75417 #b1000000000000000000000000000000000000000000000000000000000000000) lt!75465)))

(declare-fun b!143939 () Bool)

(declare-fun e!93829 () Bool)

(assert (=> b!143939 (= e!93830 e!93829)))

(declare-fun res!68577 () Bool)

(assert (=> b!143939 (=> res!68577 e!93829)))

(assert (=> b!143939 (= res!68577 (= (h!2335 lt!75417) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143940 () Bool)

(assert (=> b!143940 (= e!93829 (contains!914 (t!6348 lt!75417) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!45953 res!68578) b!143939))

(assert (= (and b!143939 (not res!68577)) b!143940))

(declare-fun m!173687 () Bool)

(assert (=> d!45953 m!173687))

(declare-fun m!173689 () Bool)

(assert (=> d!45953 m!173689))

(declare-fun m!173691 () Bool)

(assert (=> b!143940 m!173691))

(assert (=> b!143777 d!45953))

(declare-fun d!45955 () Bool)

(declare-fun e!93835 () Bool)

(assert (=> d!45955 e!93835))

(declare-fun res!68581 () Bool)

(assert (=> d!45955 (=> res!68581 e!93835)))

(declare-fun lt!75474 () Bool)

(assert (=> d!45955 (= res!68581 (not lt!75474))))

(declare-fun lt!75476 () Bool)

(assert (=> d!45955 (= lt!75474 lt!75476)))

(declare-fun lt!75475 () Unit!4553)

(declare-fun e!93836 () Unit!4553)

(assert (=> d!45955 (= lt!75475 e!93836)))

(declare-fun c!27226 () Bool)

(assert (=> d!45955 (= c!27226 lt!75476)))

(declare-fun containsKey!182 (List!1730 (_ BitVec 64)) Bool)

(assert (=> d!45955 (= lt!75476 (containsKey!182 (toList!863 lt!75416) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!45955 (= (contains!913 lt!75416 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)) lt!75474)))

(declare-fun b!143947 () Bool)

(declare-fun lt!75477 () Unit!4553)

(assert (=> b!143947 (= e!93836 lt!75477)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!130 (List!1730 (_ BitVec 64)) Unit!4553)

(assert (=> b!143947 (= lt!75477 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!863 lt!75416) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-datatypes ((Option!185 0))(
  ( (Some!184 (v!3315 V!3569)) (None!183) )
))
(declare-fun isDefined!131 (Option!185) Bool)

(declare-fun getValueByKey!179 (List!1730 (_ BitVec 64)) Option!185)

(assert (=> b!143947 (isDefined!131 (getValueByKey!179 (toList!863 lt!75416) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!143948 () Bool)

(declare-fun Unit!4557 () Unit!4553)

(assert (=> b!143948 (= e!93836 Unit!4557)))

(declare-fun b!143949 () Bool)

(assert (=> b!143949 (= e!93835 (isDefined!131 (getValueByKey!179 (toList!863 lt!75416) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355))))))

(assert (= (and d!45955 c!27226) b!143947))

(assert (= (and d!45955 (not c!27226)) b!143948))

(assert (= (and d!45955 (not res!68581)) b!143949))

(assert (=> d!45955 m!173531))

(declare-fun m!173693 () Bool)

(assert (=> d!45955 m!173693))

(assert (=> b!143947 m!173531))

(declare-fun m!173695 () Bool)

(assert (=> b!143947 m!173695))

(assert (=> b!143947 m!173531))

(declare-fun m!173697 () Bool)

(assert (=> b!143947 m!173697))

(assert (=> b!143947 m!173697))

(declare-fun m!173699 () Bool)

(assert (=> b!143947 m!173699))

(assert (=> b!143949 m!173531))

(assert (=> b!143949 m!173697))

(assert (=> b!143949 m!173697))

(assert (=> b!143949 m!173699))

(assert (=> b!143763 d!45955))

(declare-fun bm!15982 () Bool)

(declare-fun call!15994 () ListLongMap!1695)

(declare-fun lt!75542 () tuple2!2644)

(assert (=> bm!15982 (= call!15994 (map!1437 (_2!1333 lt!75542)))))

(declare-fun b!144034 () Bool)

(declare-fun e!93894 () Bool)

(declare-fun call!15988 () Bool)

(assert (=> b!144034 (= e!93894 (not call!15988))))

(declare-datatypes ((SeekEntryResult!275 0))(
  ( (MissingZero!275 (index!3265 (_ BitVec 32))) (Found!275 (index!3266 (_ BitVec 32))) (Intermediate!275 (undefined!1087 Bool) (index!3267 (_ BitVec 32)) (x!16418 (_ BitVec 32))) (Undefined!275) (MissingVacant!275 (index!3268 (_ BitVec 32))) )
))
(declare-fun lt!75548 () SeekEntryResult!275)

(declare-fun b!144035 () Bool)

(declare-fun e!93897 () Bool)

(assert (=> b!144035 (= e!93897 (= (select (arr!2318 (_keys!4740 newMap!16)) (index!3266 lt!75548)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!144036 () Bool)

(declare-fun e!93886 () Bool)

(declare-fun e!93890 () Bool)

(assert (=> b!144036 (= e!93886 e!93890)))

(declare-fun c!27262 () Bool)

(assert (=> b!144036 (= c!27262 (_1!1333 lt!75542))))

(declare-fun bm!15983 () Bool)

(declare-fun call!15999 () ListLongMap!1695)

(declare-fun call!16006 () ListLongMap!1695)

(assert (=> bm!15983 (= call!15999 call!16006)))

(declare-fun bm!15984 () Bool)

(declare-fun call!16004 () SeekEntryResult!275)

(declare-fun call!16001 () SeekEntryResult!275)

(assert (=> bm!15984 (= call!16004 call!16001)))

(declare-fun bm!15985 () Bool)

(declare-fun call!15998 () ListLongMap!1695)

(assert (=> bm!15985 (= call!15998 call!16006)))

(declare-fun b!144037 () Bool)

(declare-fun e!93900 () ListLongMap!1695)

(assert (=> b!144037 (= e!93900 (getCurrentListMap!535 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun b!144038 () Bool)

(declare-fun call!15995 () ListLongMap!1695)

(assert (=> b!144038 (= e!93890 (= call!15994 call!15995))))

(declare-fun c!27259 () Bool)

(declare-fun bm!15986 () Bool)

(declare-fun c!27258 () Bool)

(declare-fun lt!75554 () SeekEntryResult!275)

(assert (=> bm!15986 (= call!16006 (getCurrentListMap!535 (_keys!4740 newMap!16) (ite (or c!27259 c!27258) (_values!2958 newMap!16) (array!4910 (store (arr!2319 (_values!2958 newMap!16)) (index!3266 lt!75554) (ValueCellFull!1127 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2593 (_values!2958 newMap!16)))) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun bm!15987 () Bool)

(declare-fun call!16005 () ListLongMap!1695)

(declare-fun call!16003 () ListLongMap!1695)

(assert (=> bm!15987 (= call!16005 call!16003)))

(declare-fun b!144039 () Bool)

(declare-fun res!68616 () Bool)

(declare-fun e!93902 () Bool)

(assert (=> b!144039 (=> (not res!68616) (not e!93902))))

(declare-fun lt!75557 () SeekEntryResult!275)

(assert (=> b!144039 (= res!68616 (= (select (arr!2318 (_keys!4740 newMap!16)) (index!3265 lt!75557)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144040 () Bool)

(declare-fun c!27268 () Bool)

(assert (=> b!144040 (= c!27268 ((_ is MissingVacant!275) lt!75557))))

(declare-fun e!93901 () Bool)

(declare-fun e!93895 () Bool)

(assert (=> b!144040 (= e!93901 e!93895)))

(declare-fun call!16002 () ListLongMap!1695)

(declare-fun e!93893 () ListLongMap!1695)

(declare-fun c!27263 () Bool)

(declare-fun bm!15988 () Bool)

(declare-fun +!175 (ListLongMap!1695 tuple2!2642) ListLongMap!1695)

(assert (=> bm!15988 (= call!16002 (+!175 e!93893 (ite c!27259 (ite c!27263 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!27264 () Bool)

(assert (=> bm!15988 (= c!27264 c!27259)))

(declare-fun b!144041 () Bool)

(declare-fun res!68623 () Bool)

(declare-fun call!15991 () Bool)

(assert (=> b!144041 (= res!68623 call!15991)))

(assert (=> b!144041 (=> (not res!68623) (not e!93897))))

(declare-fun b!144042 () Bool)

(declare-fun e!93887 () tuple2!2644)

(declare-fun lt!75551 () tuple2!2644)

(assert (=> b!144042 (= e!93887 (tuple2!2645 (_1!1333 lt!75551) (_2!1333 lt!75551)))))

(declare-fun call!15990 () tuple2!2644)

(assert (=> b!144042 (= lt!75551 call!15990)))

(declare-fun b!144043 () Bool)

(declare-fun e!93885 () Unit!4553)

(declare-fun Unit!4558 () Unit!4553)

(assert (=> b!144043 (= e!93885 Unit!4558)))

(declare-fun lt!75553 () Unit!4553)

(declare-fun call!15992 () Unit!4553)

(assert (=> b!144043 (= lt!75553 call!15992)))

(declare-fun call!15989 () SeekEntryResult!275)

(assert (=> b!144043 (= lt!75557 call!15989)))

(declare-fun c!27261 () Bool)

(assert (=> b!144043 (= c!27261 ((_ is MissingZero!275) lt!75557))))

(assert (=> b!144043 e!93901))

(declare-fun lt!75547 () Unit!4553)

(assert (=> b!144043 (= lt!75547 lt!75553)))

(assert (=> b!144043 false))

(declare-fun b!144044 () Bool)

(declare-fun lt!75544 () Unit!4553)

(assert (=> b!144044 (= e!93885 lt!75544)))

(declare-fun call!15993 () Unit!4553)

(assert (=> b!144044 (= lt!75544 call!15993)))

(declare-fun lt!75545 () SeekEntryResult!275)

(assert (=> b!144044 (= lt!75545 call!15989)))

(declare-fun res!68619 () Bool)

(assert (=> b!144044 (= res!68619 ((_ is Found!275) lt!75545))))

(declare-fun e!93898 () Bool)

(assert (=> b!144044 (=> (not res!68619) (not e!93898))))

(assert (=> b!144044 e!93898))

(declare-fun bm!15989 () Bool)

(assert (=> bm!15989 (= call!15995 (map!1437 newMap!16))))

(declare-fun b!144045 () Bool)

(declare-fun lt!75540 () Unit!4553)

(declare-fun e!93883 () Unit!4553)

(assert (=> b!144045 (= lt!75540 e!93883)))

(declare-fun c!27267 () Bool)

(declare-fun call!15986 () Bool)

(assert (=> b!144045 (= c!27267 call!15986)))

(declare-fun e!93892 () tuple2!2644)

(assert (=> b!144045 (= e!93892 (tuple2!2645 false newMap!16))))

(declare-fun b!144046 () Bool)

(declare-fun call!16000 () Bool)

(assert (=> b!144046 (= e!93902 (not call!16000))))

(declare-fun b!144047 () Bool)

(assert (=> b!144047 (= e!93893 call!15998)))

(declare-fun bm!15990 () Bool)

(declare-fun call!16007 () Bool)

(assert (=> bm!15990 (= call!15988 call!16007)))

(declare-fun b!144048 () Bool)

(assert (=> b!144048 (= e!93898 (= (select (arr!2318 (_keys!4740 newMap!16)) (index!3266 lt!75545)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun bm!15991 () Bool)

(declare-fun c!27265 () Bool)

(assert (=> bm!15991 (= c!27265 c!27258)))

(assert (=> bm!15991 (= call!15986 (contains!913 e!93900 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!144049 () Bool)

(declare-fun e!93899 () Bool)

(assert (=> b!144049 (= e!93890 e!93899)))

(declare-fun res!68615 () Bool)

(assert (=> b!144049 (= res!68615 (contains!913 call!15994 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> b!144049 (=> (not res!68615) (not e!93899))))

(declare-fun b!144050 () Bool)

(declare-fun e!93882 () tuple2!2644)

(assert (=> b!144050 (= e!93882 e!93892)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4907 (_ BitVec 32)) SeekEntryResult!275)

(assert (=> b!144050 (= lt!75554 (seekEntryOrOpen!0 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (_keys!4740 newMap!16) (mask!7333 newMap!16)))))

(assert (=> b!144050 (= c!27258 ((_ is Undefined!275) lt!75554))))

(declare-fun b!144051 () Bool)

(assert (=> b!144051 (= e!93899 (= call!15994 (+!175 call!15995 (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!144052 () Bool)

(declare-fun e!93888 () tuple2!2644)

(assert (=> b!144052 (= e!93882 e!93888)))

(assert (=> b!144052 (= c!27263 (= (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15992 () Bool)

(declare-fun call!15996 () Bool)

(declare-fun call!15997 () Bool)

(assert (=> bm!15992 (= call!15996 call!15997)))

(declare-fun b!144053 () Bool)

(declare-fun c!27266 () Bool)

(declare-fun lt!75550 () SeekEntryResult!275)

(assert (=> b!144053 (= c!27266 ((_ is MissingVacant!275) lt!75550))))

(declare-fun e!93884 () Bool)

(declare-fun e!93889 () Bool)

(assert (=> b!144053 (= e!93884 e!93889)))

(declare-fun bm!15993 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!67 (array!4907 array!4909 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 64) Int) Unit!4553)

(assert (=> bm!15993 (= call!15993 (lemmaInListMapThenSeekEntryOrOpenFindsIt!67 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (defaultEntry!2975 newMap!16)))))

(declare-fun b!144054 () Bool)

(assert (=> b!144054 (= e!93895 ((_ is Undefined!275) lt!75557))))

(declare-fun bm!15994 () Bool)

(declare-fun c!27257 () Bool)

(declare-fun updateHelperNewKey!67 (LongMapFixedSize!1162 (_ BitVec 64) V!3569 (_ BitVec 32)) tuple2!2644)

(assert (=> bm!15994 (= call!15990 (updateHelperNewKey!67 newMap!16 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554))))))

(declare-fun bm!15995 () Bool)

(assert (=> bm!15995 (= call!16001 (seekEntryOrOpen!0 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (_keys!4740 newMap!16) (mask!7333 newMap!16)))))

(declare-fun b!144055 () Bool)

(assert (=> b!144055 (= e!93893 (getCurrentListMap!535 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun b!144056 () Bool)

(declare-fun lt!75543 () Unit!4553)

(declare-fun lt!75552 () Unit!4553)

(assert (=> b!144056 (= lt!75543 lt!75552)))

(declare-fun call!15987 () ListLongMap!1695)

(assert (=> b!144056 (= call!15987 call!16005)))

(declare-fun lt!75555 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!67 (array!4907 array!4909 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 V!3569 Int) Unit!4553)

(assert (=> b!144056 (= lt!75552 (lemmaChangeLongMinValueKeyThenAddPairToListMap!67 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) lt!75555 (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2975 newMap!16)))))

(assert (=> b!144056 (= lt!75555 (bvor (extraKeys!2724 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!144056 (= e!93888 (tuple2!2645 true (LongMapFixedSize!1163 (defaultEntry!2975 newMap!16) (mask!7333 newMap!16) (bvor (extraKeys!2724 newMap!16) #b00000000000000000000000000000010) (zeroValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!630 newMap!16) (_keys!4740 newMap!16) (_values!2958 newMap!16) (_vacant!630 newMap!16))))))

(declare-fun b!144057 () Bool)

(declare-fun res!68617 () Bool)

(assert (=> b!144057 (=> (not res!68617) (not e!93894))))

(declare-fun call!15985 () Bool)

(assert (=> b!144057 (= res!68617 call!15985)))

(assert (=> b!144057 (= e!93884 e!93894)))

(declare-fun b!144058 () Bool)

(declare-fun lt!75535 () Unit!4553)

(declare-fun lt!75539 () Unit!4553)

(assert (=> b!144058 (= lt!75535 lt!75539)))

(assert (=> b!144058 (= call!15987 call!16005)))

(declare-fun lt!75546 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!67 (array!4907 array!4909 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 V!3569 Int) Unit!4553)

(assert (=> b!144058 (= lt!75539 (lemmaChangeZeroKeyThenAddPairToListMap!67 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) lt!75546 (zeroValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2822 newMap!16) (defaultEntry!2975 newMap!16)))))

(assert (=> b!144058 (= lt!75546 (bvor (extraKeys!2724 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!144058 (= e!93888 (tuple2!2645 true (LongMapFixedSize!1163 (defaultEntry!2975 newMap!16) (mask!7333 newMap!16) (bvor (extraKeys!2724 newMap!16) #b00000000000000000000000000000001) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2822 newMap!16) (_size!630 newMap!16) (_keys!4740 newMap!16) (_values!2958 newMap!16) (_vacant!630 newMap!16))))))

(declare-fun bm!15996 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!67 (array!4907 array!4909 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 64) Int) Unit!4553)

(assert (=> bm!15996 (= call!15992 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!67 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (defaultEntry!2975 newMap!16)))))

(declare-fun bm!15997 () Bool)

(declare-fun call!16008 () Bool)

(assert (=> bm!15997 (= call!15997 call!16008)))

(declare-fun bm!15998 () Bool)

(assert (=> bm!15998 (= call!15989 call!16001)))

(declare-fun b!144059 () Bool)

(declare-fun e!93891 () tuple2!2644)

(assert (=> b!144059 (= e!93887 e!93891)))

(declare-fun c!27255 () Bool)

(assert (=> b!144059 (= c!27255 ((_ is MissingZero!275) lt!75554))))

(declare-fun b!144060 () Bool)

(declare-fun e!93881 () Bool)

(assert (=> b!144060 (= e!93895 e!93881)))

(declare-fun res!68612 () Bool)

(assert (=> b!144060 (= res!68612 call!15996)))

(assert (=> b!144060 (=> (not res!68612) (not e!93881))))

(declare-fun bm!15999 () Bool)

(assert (=> bm!15999 (= call!15991 call!16008)))

(declare-fun b!144061 () Bool)

(assert (=> b!144061 (= c!27257 ((_ is MissingVacant!275) lt!75554))))

(assert (=> b!144061 (= e!93892 e!93887)))

(declare-fun d!45957 () Bool)

(assert (=> d!45957 e!93886))

(declare-fun res!68613 () Bool)

(assert (=> d!45957 (=> (not res!68613) (not e!93886))))

(assert (=> d!45957 (= res!68613 (valid!577 (_2!1333 lt!75542)))))

(assert (=> d!45957 (= lt!75542 e!93882)))

(assert (=> d!45957 (= c!27259 (= (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (bvneg (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355))))))

(assert (=> d!45957 (valid!577 newMap!16)))

(assert (=> d!45957 (= (update!214 newMap!16 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!75542)))

(declare-fun b!144062 () Bool)

(declare-fun e!93896 () Bool)

(assert (=> b!144062 (= e!93889 e!93896)))

(declare-fun res!68622 () Bool)

(assert (=> b!144062 (= res!68622 call!15985)))

(assert (=> b!144062 (=> (not res!68622) (not e!93896))))

(declare-fun bm!16000 () Bool)

(assert (=> bm!16000 (= call!16007 (arrayContainsKey!0 (_keys!4740 newMap!16) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!144063 () Bool)

(assert (=> b!144063 (= e!93889 ((_ is Undefined!275) lt!75550))))

(declare-fun bm!16001 () Bool)

(assert (=> bm!16001 (= call!15985 call!15991)))

(declare-fun b!144064 () Bool)

(declare-fun res!68614 () Bool)

(assert (=> b!144064 (= res!68614 (= (select (arr!2318 (_keys!4740 newMap!16)) (index!3268 lt!75557)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144064 (=> (not res!68614) (not e!93881))))

(declare-fun b!144065 () Bool)

(declare-fun lt!75534 () Unit!4553)

(declare-fun lt!75532 () Unit!4553)

(assert (=> b!144065 (= lt!75534 lt!75532)))

(assert (=> b!144065 (contains!913 call!16003 (select (arr!2318 (_keys!4740 newMap!16)) (index!3266 lt!75554)))))

(declare-fun lt!75541 () array!4909)

(declare-fun lemmaValidKeyInArrayIsInListMap!127 (array!4907 array!4909 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 32) Int) Unit!4553)

(assert (=> b!144065 (= lt!75532 (lemmaValidKeyInArrayIsInListMap!127 (_keys!4740 newMap!16) lt!75541 (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (index!3266 lt!75554) (defaultEntry!2975 newMap!16)))))

(assert (=> b!144065 (= lt!75541 (array!4910 (store (arr!2319 (_values!2958 newMap!16)) (index!3266 lt!75554) (ValueCellFull!1127 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2593 (_values!2958 newMap!16))))))

(declare-fun lt!75537 () Unit!4553)

(declare-fun lt!75533 () Unit!4553)

(assert (=> b!144065 (= lt!75537 lt!75533)))

(assert (=> b!144065 (= call!16002 call!15999)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!67 (array!4907 array!4909 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 32) (_ BitVec 64) V!3569 Int) Unit!4553)

(assert (=> b!144065 (= lt!75533 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!67 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (index!3266 lt!75554) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75538 () Unit!4553)

(assert (=> b!144065 (= lt!75538 e!93885)))

(declare-fun c!27256 () Bool)

(assert (=> b!144065 (= c!27256 call!15986)))

(assert (=> b!144065 (= e!93891 (tuple2!2645 true (LongMapFixedSize!1163 (defaultEntry!2975 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (_size!630 newMap!16) (_keys!4740 newMap!16) (array!4910 (store (arr!2319 (_values!2958 newMap!16)) (index!3266 lt!75554) (ValueCellFull!1127 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2593 (_values!2958 newMap!16))) (_vacant!630 newMap!16))))))

(declare-fun bm!16002 () Bool)

(assert (=> bm!16002 (= call!16000 call!16007)))

(declare-fun bm!16003 () Bool)

(assert (=> bm!16003 (= call!16003 (getCurrentListMap!535 (_keys!4740 newMap!16) (ite c!27259 (_values!2958 newMap!16) lt!75541) (mask!7333 newMap!16) (ite c!27259 (ite c!27263 lt!75546 lt!75555) (extraKeys!2724 newMap!16)) (ite (and c!27259 c!27263) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)) (ite c!27259 (ite c!27263 (minValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun b!144066 () Bool)

(assert (=> b!144066 (= e!93900 call!15999)))

(declare-fun b!144067 () Bool)

(declare-fun lt!75556 () Unit!4553)

(assert (=> b!144067 (= e!93883 lt!75556)))

(assert (=> b!144067 (= lt!75556 call!15992)))

(assert (=> b!144067 (= lt!75550 call!16004)))

(declare-fun c!27260 () Bool)

(assert (=> b!144067 (= c!27260 ((_ is MissingZero!275) lt!75550))))

(assert (=> b!144067 e!93884))

(declare-fun b!144068 () Bool)

(declare-fun res!68610 () Bool)

(assert (=> b!144068 (=> (not res!68610) (not e!93902))))

(assert (=> b!144068 (= res!68610 call!15996)))

(assert (=> b!144068 (= e!93901 e!93902)))

(declare-fun b!144069 () Bool)

(declare-fun res!68618 () Bool)

(assert (=> b!144069 (= res!68618 (= (select (arr!2318 (_keys!4740 newMap!16)) (index!3268 lt!75550)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144069 (=> (not res!68618) (not e!93896))))

(declare-fun bm!16004 () Bool)

(assert (=> bm!16004 (= call!15987 call!16002)))

(declare-fun b!144070 () Bool)

(declare-fun res!68620 () Bool)

(assert (=> b!144070 (= res!68620 call!15997)))

(assert (=> b!144070 (=> (not res!68620) (not e!93898))))

(declare-fun b!144071 () Bool)

(assert (=> b!144071 (= e!93896 (not call!15988))))

(declare-fun b!144072 () Bool)

(declare-fun res!68621 () Bool)

(assert (=> b!144072 (=> (not res!68621) (not e!93894))))

(assert (=> b!144072 (= res!68621 (= (select (arr!2318 (_keys!4740 newMap!16)) (index!3265 lt!75550)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144073 () Bool)

(assert (=> b!144073 (= e!93881 (not call!16000))))

(declare-fun bm!16005 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!16005 (= call!16008 (inRange!0 (ite c!27258 (ite c!27267 (index!3266 lt!75548) (ite c!27260 (index!3265 lt!75550) (index!3268 lt!75550))) (ite c!27256 (index!3266 lt!75545) (ite c!27261 (index!3265 lt!75557) (index!3268 lt!75557)))) (mask!7333 newMap!16)))))

(declare-fun b!144074 () Bool)

(declare-fun lt!75536 () tuple2!2644)

(assert (=> b!144074 (= lt!75536 call!15990)))

(assert (=> b!144074 (= e!93891 (tuple2!2645 (_1!1333 lt!75536) (_2!1333 lt!75536)))))

(declare-fun b!144075 () Bool)

(declare-fun Unit!4559 () Unit!4553)

(assert (=> b!144075 (= e!93883 Unit!4559)))

(declare-fun lt!75558 () Unit!4553)

(assert (=> b!144075 (= lt!75558 call!15993)))

(assert (=> b!144075 (= lt!75548 call!16004)))

(declare-fun res!68611 () Bool)

(assert (=> b!144075 (= res!68611 ((_ is Found!275) lt!75548))))

(assert (=> b!144075 (=> (not res!68611) (not e!93897))))

(assert (=> b!144075 e!93897))

(declare-fun lt!75549 () Unit!4553)

(assert (=> b!144075 (= lt!75549 lt!75558)))

(assert (=> b!144075 false))

(assert (= (and d!45957 c!27259) b!144052))

(assert (= (and d!45957 (not c!27259)) b!144050))

(assert (= (and b!144052 c!27263) b!144058))

(assert (= (and b!144052 (not c!27263)) b!144056))

(assert (= (or b!144058 b!144056) bm!15985))

(assert (= (or b!144058 b!144056) bm!15987))

(assert (= (or b!144058 b!144056) bm!16004))

(assert (= (and b!144050 c!27258) b!144045))

(assert (= (and b!144050 (not c!27258)) b!144061))

(assert (= (and b!144045 c!27267) b!144075))

(assert (= (and b!144045 (not c!27267)) b!144067))

(assert (= (and b!144075 res!68611) b!144041))

(assert (= (and b!144041 res!68623) b!144035))

(assert (= (and b!144067 c!27260) b!144057))

(assert (= (and b!144067 (not c!27260)) b!144053))

(assert (= (and b!144057 res!68617) b!144072))

(assert (= (and b!144072 res!68621) b!144034))

(assert (= (and b!144053 c!27266) b!144062))

(assert (= (and b!144053 (not c!27266)) b!144063))

(assert (= (and b!144062 res!68622) b!144069))

(assert (= (and b!144069 res!68618) b!144071))

(assert (= (or b!144057 b!144062) bm!16001))

(assert (= (or b!144034 b!144071) bm!15990))

(assert (= (or b!144041 bm!16001) bm!15999))

(assert (= (or b!144075 b!144067) bm!15984))

(assert (= (and b!144061 c!27257) b!144042))

(assert (= (and b!144061 (not c!27257)) b!144059))

(assert (= (and b!144059 c!27255) b!144074))

(assert (= (and b!144059 (not c!27255)) b!144065))

(assert (= (and b!144065 c!27256) b!144044))

(assert (= (and b!144065 (not c!27256)) b!144043))

(assert (= (and b!144044 res!68619) b!144070))

(assert (= (and b!144070 res!68620) b!144048))

(assert (= (and b!144043 c!27261) b!144068))

(assert (= (and b!144043 (not c!27261)) b!144040))

(assert (= (and b!144068 res!68610) b!144039))

(assert (= (and b!144039 res!68616) b!144046))

(assert (= (and b!144040 c!27268) b!144060))

(assert (= (and b!144040 (not c!27268)) b!144054))

(assert (= (and b!144060 res!68612) b!144064))

(assert (= (and b!144064 res!68614) b!144073))

(assert (= (or b!144068 b!144060) bm!15992))

(assert (= (or b!144046 b!144073) bm!16002))

(assert (= (or b!144070 bm!15992) bm!15997))

(assert (= (or b!144044 b!144043) bm!15998))

(assert (= (or b!144042 b!144074) bm!15994))

(assert (= (or b!144067 b!144043) bm!15996))

(assert (= (or bm!15990 bm!16002) bm!16000))

(assert (= (or bm!15984 bm!15998) bm!15995))

(assert (= (or b!144045 b!144065) bm!15983))

(assert (= (or b!144075 b!144044) bm!15993))

(assert (= (or bm!15999 bm!15997) bm!16005))

(assert (= (or b!144045 b!144065) bm!15991))

(assert (= (and bm!15991 c!27265) b!144066))

(assert (= (and bm!15991 (not c!27265)) b!144037))

(assert (= (or bm!15985 bm!15983) bm!15986))

(assert (= (or bm!15987 b!144065) bm!16003))

(assert (= (or bm!16004 b!144065) bm!15988))

(assert (= (and bm!15988 c!27264) b!144047))

(assert (= (and bm!15988 (not c!27264)) b!144055))

(assert (= (and d!45957 res!68613) b!144036))

(assert (= (and b!144036 c!27262) b!144049))

(assert (= (and b!144036 (not c!27262)) b!144038))

(assert (= (and b!144049 res!68615) b!144051))

(assert (= (or b!144051 b!144038) bm!15989))

(assert (= (or b!144049 b!144051 b!144038) bm!15982))

(declare-fun m!173701 () Bool)

(assert (=> b!144072 m!173701))

(declare-fun m!173703 () Bool)

(assert (=> b!144064 m!173703))

(declare-fun m!173705 () Bool)

(assert (=> b!144051 m!173705))

(declare-fun m!173707 () Bool)

(assert (=> bm!15988 m!173707))

(assert (=> b!144050 m!173531))

(declare-fun m!173709 () Bool)

(assert (=> b!144050 m!173709))

(declare-fun m!173711 () Bool)

(assert (=> b!144069 m!173711))

(declare-fun m!173713 () Bool)

(assert (=> b!144055 m!173713))

(declare-fun m!173715 () Bool)

(assert (=> b!144048 m!173715))

(assert (=> bm!15989 m!173533))

(declare-fun m!173717 () Bool)

(assert (=> bm!15982 m!173717))

(declare-fun m!173719 () Bool)

(assert (=> bm!16005 m!173719))

(assert (=> bm!15995 m!173531))

(assert (=> bm!15995 m!173709))

(declare-fun m!173721 () Bool)

(assert (=> b!144065 m!173721))

(assert (=> b!144065 m!173721))

(declare-fun m!173723 () Bool)

(assert (=> b!144065 m!173723))

(assert (=> b!144065 m!173531))

(assert (=> b!144065 m!173567))

(declare-fun m!173725 () Bool)

(assert (=> b!144065 m!173725))

(declare-fun m!173727 () Bool)

(assert (=> b!144065 m!173727))

(declare-fun m!173729 () Bool)

(assert (=> b!144065 m!173729))

(assert (=> bm!15996 m!173531))

(declare-fun m!173731 () Bool)

(assert (=> bm!15996 m!173731))

(declare-fun m!173733 () Bool)

(assert (=> b!144039 m!173733))

(assert (=> bm!16000 m!173531))

(declare-fun m!173735 () Bool)

(assert (=> bm!16000 m!173735))

(assert (=> b!144037 m!173713))

(declare-fun m!173737 () Bool)

(assert (=> d!45957 m!173737))

(assert (=> d!45957 m!173543))

(assert (=> b!144056 m!173567))

(declare-fun m!173739 () Bool)

(assert (=> b!144056 m!173739))

(declare-fun m!173741 () Bool)

(assert (=> bm!16003 m!173741))

(assert (=> b!144058 m!173567))

(declare-fun m!173743 () Bool)

(assert (=> b!144058 m!173743))

(declare-fun m!173745 () Bool)

(assert (=> b!144035 m!173745))

(assert (=> bm!15994 m!173531))

(assert (=> bm!15994 m!173567))

(declare-fun m!173747 () Bool)

(assert (=> bm!15994 m!173747))

(assert (=> bm!15986 m!173729))

(declare-fun m!173749 () Bool)

(assert (=> bm!15986 m!173749))

(assert (=> b!144049 m!173531))

(declare-fun m!173751 () Bool)

(assert (=> b!144049 m!173751))

(assert (=> bm!15993 m!173531))

(declare-fun m!173753 () Bool)

(assert (=> bm!15993 m!173753))

(assert (=> bm!15991 m!173531))

(declare-fun m!173755 () Bool)

(assert (=> bm!15991 m!173755))

(assert (=> b!143763 d!45957))

(declare-fun d!45959 () Bool)

(declare-fun c!27271 () Bool)

(assert (=> d!45959 (= c!27271 ((_ is ValueCellFull!1127) (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun e!93905 () V!3569)

(assert (=> d!45959 (= (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!93905)))

(declare-fun b!144080 () Bool)

(declare-fun get!1548 (ValueCell!1127 V!3569) V!3569)

(assert (=> b!144080 (= e!93905 (get!1548 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!144081 () Bool)

(declare-fun get!1549 (ValueCell!1127 V!3569) V!3569)

(assert (=> b!144081 (= e!93905 (get!1549 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45959 c!27271) b!144080))

(assert (= (and d!45959 (not c!27271)) b!144081))

(assert (=> b!144080 m!173563))

(assert (=> b!144080 m!173565))

(declare-fun m!173757 () Bool)

(assert (=> b!144080 m!173757))

(assert (=> b!144081 m!173563))

(assert (=> b!144081 m!173565))

(declare-fun m!173759 () Bool)

(assert (=> b!144081 m!173759))

(assert (=> b!143763 d!45959))

(declare-fun d!45961 () Bool)

(assert (=> d!45961 (= (map!1437 newMap!16) (getCurrentListMap!535 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun bs!6092 () Bool)

(assert (= bs!6092 d!45961))

(assert (=> bs!6092 m!173713))

(assert (=> b!143772 d!45961))

(declare-fun b!144124 () Bool)

(declare-fun e!93934 () Bool)

(declare-fun e!93941 () Bool)

(assert (=> b!144124 (= e!93934 e!93941)))

(declare-fun c!27289 () Bool)

(assert (=> b!144124 (= c!27289 (not (= (bvand (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144125 () Bool)

(declare-fun call!16026 () Bool)

(assert (=> b!144125 (= e!93941 (not call!16026))))

(declare-fun b!144126 () Bool)

(declare-fun e!93933 () ListLongMap!1695)

(declare-fun call!16024 () ListLongMap!1695)

(assert (=> b!144126 (= e!93933 call!16024)))

(declare-fun b!144127 () Bool)

(declare-fun e!93935 () Bool)

(declare-fun e!93940 () Bool)

(assert (=> b!144127 (= e!93935 e!93940)))

(declare-fun res!68648 () Bool)

(declare-fun call!16025 () Bool)

(assert (=> b!144127 (= res!68648 call!16025)))

(assert (=> b!144127 (=> (not res!68648) (not e!93940))))

(declare-fun b!144128 () Bool)

(assert (=> b!144128 (= e!93935 (not call!16025))))

(declare-fun b!144129 () Bool)

(declare-fun e!93939 () ListLongMap!1695)

(declare-fun call!16023 () ListLongMap!1695)

(assert (=> b!144129 (= e!93939 call!16023)))

(declare-fun b!144130 () Bool)

(declare-fun e!93936 () ListLongMap!1695)

(assert (=> b!144130 (= e!93936 e!93939)))

(declare-fun c!27285 () Bool)

(assert (=> b!144130 (= c!27285 (and (not (= (bvand (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144131 () Bool)

(declare-fun res!68646 () Bool)

(assert (=> b!144131 (=> (not res!68646) (not e!93934))))

(assert (=> b!144131 (= res!68646 e!93935)))

(declare-fun c!27286 () Bool)

(assert (=> b!144131 (= c!27286 (not (= (bvand (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!144132 () Bool)

(declare-fun e!93938 () Unit!4553)

(declare-fun lt!75618 () Unit!4553)

(assert (=> b!144132 (= e!93938 lt!75618)))

(declare-fun lt!75621 () ListLongMap!1695)

(declare-fun getCurrentListMapNoExtraKeys!142 (array!4907 array!4909 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 32) Int) ListLongMap!1695)

(assert (=> b!144132 (= lt!75621 (getCurrentListMapNoExtraKeys!142 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (_values!2958 (v!3308 (underlying!485 thiss!992))) (mask!7333 (v!3308 (underlying!485 thiss!992))) (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) (zeroValue!2822 (v!3308 (underlying!485 thiss!992))) (minValue!2822 (v!3308 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun lt!75607 () (_ BitVec 64))

(assert (=> b!144132 (= lt!75607 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75619 () (_ BitVec 64))

(assert (=> b!144132 (= lt!75619 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!75620 () Unit!4553)

(declare-fun addStillContains!98 (ListLongMap!1695 (_ BitVec 64) V!3569 (_ BitVec 64)) Unit!4553)

(assert (=> b!144132 (= lt!75620 (addStillContains!98 lt!75621 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))) lt!75619))))

(assert (=> b!144132 (contains!913 (+!175 lt!75621 (tuple2!2643 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))))) lt!75619)))

(declare-fun lt!75623 () Unit!4553)

(assert (=> b!144132 (= lt!75623 lt!75620)))

(declare-fun lt!75606 () ListLongMap!1695)

(assert (=> b!144132 (= lt!75606 (getCurrentListMapNoExtraKeys!142 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (_values!2958 (v!3308 (underlying!485 thiss!992))) (mask!7333 (v!3308 (underlying!485 thiss!992))) (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) (zeroValue!2822 (v!3308 (underlying!485 thiss!992))) (minValue!2822 (v!3308 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun lt!75605 () (_ BitVec 64))

(assert (=> b!144132 (= lt!75605 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75603 () (_ BitVec 64))

(assert (=> b!144132 (= lt!75603 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!75613 () Unit!4553)

(declare-fun addApplyDifferent!98 (ListLongMap!1695 (_ BitVec 64) V!3569 (_ BitVec 64)) Unit!4553)

(assert (=> b!144132 (= lt!75613 (addApplyDifferent!98 lt!75606 lt!75605 (minValue!2822 (v!3308 (underlying!485 thiss!992))) lt!75603))))

(declare-fun apply!122 (ListLongMap!1695 (_ BitVec 64)) V!3569)

(assert (=> b!144132 (= (apply!122 (+!175 lt!75606 (tuple2!2643 lt!75605 (minValue!2822 (v!3308 (underlying!485 thiss!992))))) lt!75603) (apply!122 lt!75606 lt!75603))))

(declare-fun lt!75622 () Unit!4553)

(assert (=> b!144132 (= lt!75622 lt!75613)))

(declare-fun lt!75612 () ListLongMap!1695)

(assert (=> b!144132 (= lt!75612 (getCurrentListMapNoExtraKeys!142 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (_values!2958 (v!3308 (underlying!485 thiss!992))) (mask!7333 (v!3308 (underlying!485 thiss!992))) (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) (zeroValue!2822 (v!3308 (underlying!485 thiss!992))) (minValue!2822 (v!3308 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun lt!75604 () (_ BitVec 64))

(assert (=> b!144132 (= lt!75604 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75608 () (_ BitVec 64))

(assert (=> b!144132 (= lt!75608 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!75615 () Unit!4553)

(assert (=> b!144132 (= lt!75615 (addApplyDifferent!98 lt!75612 lt!75604 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))) lt!75608))))

(assert (=> b!144132 (= (apply!122 (+!175 lt!75612 (tuple2!2643 lt!75604 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))))) lt!75608) (apply!122 lt!75612 lt!75608))))

(declare-fun lt!75610 () Unit!4553)

(assert (=> b!144132 (= lt!75610 lt!75615)))

(declare-fun lt!75616 () ListLongMap!1695)

(assert (=> b!144132 (= lt!75616 (getCurrentListMapNoExtraKeys!142 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (_values!2958 (v!3308 (underlying!485 thiss!992))) (mask!7333 (v!3308 (underlying!485 thiss!992))) (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) (zeroValue!2822 (v!3308 (underlying!485 thiss!992))) (minValue!2822 (v!3308 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun lt!75617 () (_ BitVec 64))

(assert (=> b!144132 (= lt!75617 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75611 () (_ BitVec 64))

(assert (=> b!144132 (= lt!75611 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!144132 (= lt!75618 (addApplyDifferent!98 lt!75616 lt!75617 (minValue!2822 (v!3308 (underlying!485 thiss!992))) lt!75611))))

(assert (=> b!144132 (= (apply!122 (+!175 lt!75616 (tuple2!2643 lt!75617 (minValue!2822 (v!3308 (underlying!485 thiss!992))))) lt!75611) (apply!122 lt!75616 lt!75611))))

(declare-fun e!93943 () Bool)

(declare-fun b!144133 () Bool)

(declare-fun lt!75609 () ListLongMap!1695)

(assert (=> b!144133 (= e!93943 (= (apply!122 lt!75609 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144133 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2593 (_values!2958 (v!3308 (underlying!485 thiss!992))))))))

(assert (=> b!144133 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992))))))))

(declare-fun bm!16021 () Bool)

(declare-fun call!16027 () ListLongMap!1695)

(assert (=> bm!16021 (= call!16027 (getCurrentListMapNoExtraKeys!142 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (_values!2958 (v!3308 (underlying!485 thiss!992))) (mask!7333 (v!3308 (underlying!485 thiss!992))) (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) (zeroValue!2822 (v!3308 (underlying!485 thiss!992))) (minValue!2822 (v!3308 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun d!45963 () Bool)

(assert (=> d!45963 e!93934))

(declare-fun res!68650 () Bool)

(assert (=> d!45963 (=> (not res!68650) (not e!93934))))

(assert (=> d!45963 (= res!68650 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992))))))))))

(declare-fun lt!75624 () ListLongMap!1695)

(assert (=> d!45963 (= lt!75609 lt!75624)))

(declare-fun lt!75614 () Unit!4553)

(assert (=> d!45963 (= lt!75614 e!93938)))

(declare-fun c!27284 () Bool)

(declare-fun e!93944 () Bool)

(assert (=> d!45963 (= c!27284 e!93944)))

(declare-fun res!68644 () Bool)

(assert (=> d!45963 (=> (not res!68644) (not e!93944))))

(assert (=> d!45963 (= res!68644 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992))))))))

(assert (=> d!45963 (= lt!75624 e!93936)))

(declare-fun c!27287 () Bool)

(assert (=> d!45963 (= c!27287 (and (not (= (bvand (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!45963 (validMask!0 (mask!7333 (v!3308 (underlying!485 thiss!992))))))

(assert (=> d!45963 (= (getCurrentListMap!535 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (_values!2958 (v!3308 (underlying!485 thiss!992))) (mask!7333 (v!3308 (underlying!485 thiss!992))) (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) (zeroValue!2822 (v!3308 (underlying!485 thiss!992))) (minValue!2822 (v!3308 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3308 (underlying!485 thiss!992)))) lt!75609)))

(declare-fun bm!16020 () Bool)

(declare-fun call!16029 () ListLongMap!1695)

(assert (=> bm!16020 (= call!16023 call!16029)))

(declare-fun b!144134 () Bool)

(declare-fun e!93932 () Bool)

(assert (=> b!144134 (= e!93932 (validKeyInArray!0 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!144135 () Bool)

(declare-fun e!93942 () Bool)

(assert (=> b!144135 (= e!93942 (= (apply!122 lt!75609 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2822 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun b!144136 () Bool)

(declare-fun res!68642 () Bool)

(assert (=> b!144136 (=> (not res!68642) (not e!93934))))

(declare-fun e!93937 () Bool)

(assert (=> b!144136 (= res!68642 e!93937)))

(declare-fun res!68649 () Bool)

(assert (=> b!144136 (=> res!68649 e!93937)))

(assert (=> b!144136 (= res!68649 (not e!93932))))

(declare-fun res!68647 () Bool)

(assert (=> b!144136 (=> (not res!68647) (not e!93932))))

(assert (=> b!144136 (= res!68647 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992))))))))

(declare-fun b!144137 () Bool)

(declare-fun c!27288 () Bool)

(assert (=> b!144137 (= c!27288 (and (not (= (bvand (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!144137 (= e!93939 e!93933)))

(declare-fun b!144138 () Bool)

(assert (=> b!144138 (= e!93933 call!16023)))

(declare-fun b!144139 () Bool)

(declare-fun Unit!4560 () Unit!4553)

(assert (=> b!144139 (= e!93938 Unit!4560)))

(declare-fun bm!16022 () Bool)

(assert (=> bm!16022 (= call!16025 (contains!913 lt!75609 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16023 () Bool)

(declare-fun call!16028 () ListLongMap!1695)

(assert (=> bm!16023 (= call!16029 (+!175 (ite c!27287 call!16027 (ite c!27285 call!16028 call!16024)) (ite (or c!27287 c!27285) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(declare-fun bm!16024 () Bool)

(assert (=> bm!16024 (= call!16024 call!16028)))

(declare-fun b!144140 () Bool)

(assert (=> b!144140 (= e!93937 e!93943)))

(declare-fun res!68643 () Bool)

(assert (=> b!144140 (=> (not res!68643) (not e!93943))))

(assert (=> b!144140 (= res!68643 (contains!913 lt!75609 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!144140 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992))))))))

(declare-fun b!144141 () Bool)

(assert (=> b!144141 (= e!93941 e!93942)))

(declare-fun res!68645 () Bool)

(assert (=> b!144141 (= res!68645 call!16026)))

(assert (=> b!144141 (=> (not res!68645) (not e!93942))))

(declare-fun b!144142 () Bool)

(assert (=> b!144142 (= e!93944 (validKeyInArray!0 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!16025 () Bool)

(assert (=> bm!16025 (= call!16026 (contains!913 lt!75609 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144143 () Bool)

(assert (=> b!144143 (= e!93936 (+!175 call!16029 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992))))))))

(declare-fun b!144144 () Bool)

(assert (=> b!144144 (= e!93940 (= (apply!122 lt!75609 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun bm!16026 () Bool)

(assert (=> bm!16026 (= call!16028 call!16027)))

(assert (= (and d!45963 c!27287) b!144143))

(assert (= (and d!45963 (not c!27287)) b!144130))

(assert (= (and b!144130 c!27285) b!144129))

(assert (= (and b!144130 (not c!27285)) b!144137))

(assert (= (and b!144137 c!27288) b!144138))

(assert (= (and b!144137 (not c!27288)) b!144126))

(assert (= (or b!144138 b!144126) bm!16024))

(assert (= (or b!144129 bm!16024) bm!16026))

(assert (= (or b!144129 b!144138) bm!16020))

(assert (= (or b!144143 bm!16026) bm!16021))

(assert (= (or b!144143 bm!16020) bm!16023))

(assert (= (and d!45963 res!68644) b!144142))

(assert (= (and d!45963 c!27284) b!144132))

(assert (= (and d!45963 (not c!27284)) b!144139))

(assert (= (and d!45963 res!68650) b!144136))

(assert (= (and b!144136 res!68647) b!144134))

(assert (= (and b!144136 (not res!68649)) b!144140))

(assert (= (and b!144140 res!68643) b!144133))

(assert (= (and b!144136 res!68642) b!144131))

(assert (= (and b!144131 c!27286) b!144127))

(assert (= (and b!144131 (not c!27286)) b!144128))

(assert (= (and b!144127 res!68648) b!144144))

(assert (= (or b!144127 b!144128) bm!16022))

(assert (= (and b!144131 res!68646) b!144124))

(assert (= (and b!144124 c!27289) b!144141))

(assert (= (and b!144124 (not c!27289)) b!144125))

(assert (= (and b!144141 res!68645) b!144135))

(assert (= (or b!144141 b!144125) bm!16025))

(declare-fun b_lambda!6477 () Bool)

(assert (=> (not b_lambda!6477) (not b!144133)))

(assert (=> b!144133 t!6344))

(declare-fun b_and!8989 () Bool)

(assert (= b_and!8969 (and (=> t!6344 result!4223) b_and!8989)))

(assert (=> b!144133 t!6346))

(declare-fun b_and!8991 () Bool)

(assert (= b_and!8971 (and (=> t!6346 result!4227) b_and!8991)))

(assert (=> b!144134 m!173679))

(assert (=> b!144134 m!173679))

(declare-fun m!173761 () Bool)

(assert (=> b!144134 m!173761))

(assert (=> b!144140 m!173679))

(assert (=> b!144140 m!173679))

(declare-fun m!173763 () Bool)

(assert (=> b!144140 m!173763))

(declare-fun m!173765 () Bool)

(assert (=> b!144132 m!173765))

(declare-fun m!173767 () Bool)

(assert (=> b!144132 m!173767))

(declare-fun m!173769 () Bool)

(assert (=> b!144132 m!173769))

(declare-fun m!173771 () Bool)

(assert (=> b!144132 m!173771))

(declare-fun m!173773 () Bool)

(assert (=> b!144132 m!173773))

(declare-fun m!173775 () Bool)

(assert (=> b!144132 m!173775))

(declare-fun m!173777 () Bool)

(assert (=> b!144132 m!173777))

(assert (=> b!144132 m!173679))

(declare-fun m!173779 () Bool)

(assert (=> b!144132 m!173779))

(declare-fun m!173781 () Bool)

(assert (=> b!144132 m!173781))

(assert (=> b!144132 m!173767))

(declare-fun m!173783 () Bool)

(assert (=> b!144132 m!173783))

(declare-fun m!173785 () Bool)

(assert (=> b!144132 m!173785))

(declare-fun m!173787 () Bool)

(assert (=> b!144132 m!173787))

(declare-fun m!173789 () Bool)

(assert (=> b!144132 m!173789))

(declare-fun m!173791 () Bool)

(assert (=> b!144132 m!173791))

(declare-fun m!173793 () Bool)

(assert (=> b!144132 m!173793))

(assert (=> b!144132 m!173785))

(declare-fun m!173795 () Bool)

(assert (=> b!144132 m!173795))

(assert (=> b!144132 m!173787))

(assert (=> b!144132 m!173779))

(declare-fun m!173797 () Bool)

(assert (=> bm!16023 m!173797))

(assert (=> bm!16021 m!173777))

(assert (=> b!144133 m!173565))

(assert (=> b!144133 m!173679))

(declare-fun m!173799 () Bool)

(assert (=> b!144133 m!173799))

(declare-fun m!173801 () Bool)

(assert (=> b!144133 m!173801))

(assert (=> b!144133 m!173679))

(assert (=> b!144133 m!173801))

(assert (=> b!144133 m!173565))

(declare-fun m!173803 () Bool)

(assert (=> b!144133 m!173803))

(assert (=> d!45963 m!173685))

(declare-fun m!173805 () Bool)

(assert (=> b!144135 m!173805))

(declare-fun m!173807 () Bool)

(assert (=> b!144143 m!173807))

(declare-fun m!173809 () Bool)

(assert (=> b!144144 m!173809))

(declare-fun m!173811 () Bool)

(assert (=> bm!16025 m!173811))

(declare-fun m!173813 () Bool)

(assert (=> bm!16022 m!173813))

(assert (=> b!144142 m!173679))

(assert (=> b!144142 m!173679))

(assert (=> b!144142 m!173761))

(assert (=> b!143772 d!45963))

(declare-fun d!45965 () Bool)

(assert (=> d!45965 (= (array_inv!1449 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvsge (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!143775 d!45965))

(declare-fun d!45967 () Bool)

(assert (=> d!45967 (= (array_inv!1450 (_values!2958 (v!3308 (underlying!485 thiss!992)))) (bvsge (size!2593 (_values!2958 (v!3308 (underlying!485 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!143775 d!45967))

(declare-fun d!45969 () Bool)

(assert (=> d!45969 (= (valid!576 thiss!992) (valid!577 (v!3308 (underlying!485 thiss!992))))))

(declare-fun bs!6093 () Bool)

(assert (= bs!6093 d!45969))

(declare-fun m!173815 () Bool)

(assert (=> bs!6093 m!173815))

(assert (=> start!14974 d!45969))

(declare-fun d!45971 () Bool)

(declare-fun lt!75625 () Bool)

(assert (=> d!45971 (= lt!75625 (select (content!141 lt!75417) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!93946 () Bool)

(assert (=> d!45971 (= lt!75625 e!93946)))

(declare-fun res!68652 () Bool)

(assert (=> d!45971 (=> (not res!68652) (not e!93946))))

(assert (=> d!45971 (= res!68652 ((_ is Cons!1727) lt!75417))))

(assert (=> d!45971 (= (contains!914 lt!75417 #b0000000000000000000000000000000000000000000000000000000000000000) lt!75625)))

(declare-fun b!144145 () Bool)

(declare-fun e!93945 () Bool)

(assert (=> b!144145 (= e!93946 e!93945)))

(declare-fun res!68651 () Bool)

(assert (=> b!144145 (=> res!68651 e!93945)))

(assert (=> b!144145 (= res!68651 (= (h!2335 lt!75417) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144146 () Bool)

(assert (=> b!144146 (= e!93945 (contains!914 (t!6348 lt!75417) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!45971 res!68652) b!144145))

(assert (= (and b!144145 (not res!68651)) b!144146))

(assert (=> d!45971 m!173687))

(declare-fun m!173817 () Bool)

(assert (=> d!45971 m!173817))

(declare-fun m!173819 () Bool)

(assert (=> b!144146 m!173819))

(assert (=> b!143766 d!45971))

(declare-fun d!45973 () Bool)

(declare-fun res!68659 () Bool)

(declare-fun e!93949 () Bool)

(assert (=> d!45973 (=> (not res!68659) (not e!93949))))

(declare-fun simpleValid!98 (LongMapFixedSize!1162) Bool)

(assert (=> d!45973 (= res!68659 (simpleValid!98 newMap!16))))

(assert (=> d!45973 (= (valid!577 newMap!16) e!93949)))

(declare-fun b!144153 () Bool)

(declare-fun res!68660 () Bool)

(assert (=> b!144153 (=> (not res!68660) (not e!93949))))

(declare-fun arrayCountValidKeys!0 (array!4907 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!144153 (= res!68660 (= (arrayCountValidKeys!0 (_keys!4740 newMap!16) #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))) (_size!630 newMap!16)))))

(declare-fun b!144154 () Bool)

(declare-fun res!68661 () Bool)

(assert (=> b!144154 (=> (not res!68661) (not e!93949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4907 (_ BitVec 32)) Bool)

(assert (=> b!144154 (= res!68661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4740 newMap!16) (mask!7333 newMap!16)))))

(declare-fun b!144155 () Bool)

(assert (=> b!144155 (= e!93949 (arrayNoDuplicates!0 (_keys!4740 newMap!16) #b00000000000000000000000000000000 Nil!1728))))

(assert (= (and d!45973 res!68659) b!144153))

(assert (= (and b!144153 res!68660) b!144154))

(assert (= (and b!144154 res!68661) b!144155))

(declare-fun m!173821 () Bool)

(assert (=> d!45973 m!173821))

(declare-fun m!173823 () Bool)

(assert (=> b!144153 m!173823))

(declare-fun m!173825 () Bool)

(assert (=> b!144154 m!173825))

(declare-fun m!173827 () Bool)

(assert (=> b!144155 m!173827))

(assert (=> b!143780 d!45973))

(declare-fun mapIsEmpty!4895 () Bool)

(declare-fun mapRes!4895 () Bool)

(assert (=> mapIsEmpty!4895 mapRes!4895))

(declare-fun b!144162 () Bool)

(declare-fun e!93955 () Bool)

(assert (=> b!144162 (= e!93955 tp_is_empty!2941)))

(declare-fun mapNonEmpty!4895 () Bool)

(declare-fun tp!11663 () Bool)

(assert (=> mapNonEmpty!4895 (= mapRes!4895 (and tp!11663 e!93955))))

(declare-fun mapRest!4895 () (Array (_ BitVec 32) ValueCell!1127))

(declare-fun mapValue!4895 () ValueCell!1127)

(declare-fun mapKey!4895 () (_ BitVec 32))

(assert (=> mapNonEmpty!4895 (= mapRest!4880 (store mapRest!4895 mapKey!4895 mapValue!4895))))

(declare-fun b!144163 () Bool)

(declare-fun e!93954 () Bool)

(assert (=> b!144163 (= e!93954 tp_is_empty!2941)))

(declare-fun condMapEmpty!4895 () Bool)

(declare-fun mapDefault!4895 () ValueCell!1127)

(assert (=> mapNonEmpty!4880 (= condMapEmpty!4895 (= mapRest!4880 ((as const (Array (_ BitVec 32) ValueCell!1127)) mapDefault!4895)))))

(assert (=> mapNonEmpty!4880 (= tp!11634 (and e!93954 mapRes!4895))))

(assert (= (and mapNonEmpty!4880 condMapEmpty!4895) mapIsEmpty!4895))

(assert (= (and mapNonEmpty!4880 (not condMapEmpty!4895)) mapNonEmpty!4895))

(assert (= (and mapNonEmpty!4895 ((_ is ValueCellFull!1127) mapValue!4895)) b!144162))

(assert (= (and mapNonEmpty!4880 ((_ is ValueCellFull!1127) mapDefault!4895)) b!144163))

(declare-fun m!173829 () Bool)

(assert (=> mapNonEmpty!4895 m!173829))

(declare-fun mapIsEmpty!4896 () Bool)

(declare-fun mapRes!4896 () Bool)

(assert (=> mapIsEmpty!4896 mapRes!4896))

(declare-fun b!144164 () Bool)

(declare-fun e!93957 () Bool)

(assert (=> b!144164 (= e!93957 tp_is_empty!2941)))

(declare-fun mapNonEmpty!4896 () Bool)

(declare-fun tp!11664 () Bool)

(assert (=> mapNonEmpty!4896 (= mapRes!4896 (and tp!11664 e!93957))))

(declare-fun mapRest!4896 () (Array (_ BitVec 32) ValueCell!1127))

(declare-fun mapKey!4896 () (_ BitVec 32))

(declare-fun mapValue!4896 () ValueCell!1127)

(assert (=> mapNonEmpty!4896 (= mapRest!4879 (store mapRest!4896 mapKey!4896 mapValue!4896))))

(declare-fun b!144165 () Bool)

(declare-fun e!93956 () Bool)

(assert (=> b!144165 (= e!93956 tp_is_empty!2941)))

(declare-fun condMapEmpty!4896 () Bool)

(declare-fun mapDefault!4896 () ValueCell!1127)

(assert (=> mapNonEmpty!4879 (= condMapEmpty!4896 (= mapRest!4879 ((as const (Array (_ BitVec 32) ValueCell!1127)) mapDefault!4896)))))

(assert (=> mapNonEmpty!4879 (= tp!11636 (and e!93956 mapRes!4896))))

(assert (= (and mapNonEmpty!4879 condMapEmpty!4896) mapIsEmpty!4896))

(assert (= (and mapNonEmpty!4879 (not condMapEmpty!4896)) mapNonEmpty!4896))

(assert (= (and mapNonEmpty!4896 ((_ is ValueCellFull!1127) mapValue!4896)) b!144164))

(assert (= (and mapNonEmpty!4879 ((_ is ValueCellFull!1127) mapDefault!4896)) b!144165))

(declare-fun m!173831 () Bool)

(assert (=> mapNonEmpty!4896 m!173831))

(declare-fun b_lambda!6479 () Bool)

(assert (= b_lambda!6477 (or (and b!143775 b_free!3049) (and b!143769 b_free!3051 (= (defaultEntry!2975 newMap!16) (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))))) b_lambda!6479)))

(check-sat (not bm!16022) (not b!144144) (not d!45969) (not b!143940) (not b!144058) (not b!144134) (not b!143949) (not bm!15982) (not b!144142) (not b_next!3049) (not bm!15994) (not b!144056) (not b!144135) (not mapNonEmpty!4896) b_and!8991 (not b!144050) b_and!8989 (not mapNonEmpty!4895) (not b_next!3051) (not b!144037) (not bm!15996) (not d!45973) (not b_lambda!6479) (not b!143933) (not b!144153) (not bm!16003) (not bm!15933) (not b!144132) (not bm!15986) (not b!144133) (not b!144055) (not d!45963) (not b!143947) (not b!144051) (not b!144155) (not d!45957) (not b!143907) (not b!143921) (not b!144081) (not b!143918) (not d!45971) (not b!144080) (not b!144143) (not b!144140) (not bm!16023) (not b!143928) (not bm!15991) (not bm!15989) (not d!45961) (not b!143906) (not bm!16000) (not b!144146) (not bm!16025) (not b!144049) (not bm!15995) (not b_lambda!6475) (not b!143922) (not bm!15988) (not b!144154) (not d!45953) (not bm!16005) (not b!144065) (not d!45955) (not d!45951) (not d!45947) (not bm!15993) tp_is_empty!2941 (not bm!16021))
(check-sat b_and!8989 b_and!8991 (not b_next!3049) (not b_next!3051))
(get-model)

(declare-fun d!45975 () Bool)

(declare-fun e!93958 () Bool)

(assert (=> d!45975 e!93958))

(declare-fun res!68662 () Bool)

(assert (=> d!45975 (=> res!68662 e!93958)))

(declare-fun lt!75626 () Bool)

(assert (=> d!45975 (= res!68662 (not lt!75626))))

(declare-fun lt!75628 () Bool)

(assert (=> d!45975 (= lt!75626 lt!75628)))

(declare-fun lt!75627 () Unit!4553)

(declare-fun e!93959 () Unit!4553)

(assert (=> d!45975 (= lt!75627 e!93959)))

(declare-fun c!27290 () Bool)

(assert (=> d!45975 (= c!27290 lt!75628)))

(assert (=> d!45975 (= lt!75628 (containsKey!182 (toList!863 lt!75609) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!45975 (= (contains!913 lt!75609 #b0000000000000000000000000000000000000000000000000000000000000000) lt!75626)))

(declare-fun b!144166 () Bool)

(declare-fun lt!75629 () Unit!4553)

(assert (=> b!144166 (= e!93959 lt!75629)))

(assert (=> b!144166 (= lt!75629 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!863 lt!75609) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144166 (isDefined!131 (getValueByKey!179 (toList!863 lt!75609) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144167 () Bool)

(declare-fun Unit!4561 () Unit!4553)

(assert (=> b!144167 (= e!93959 Unit!4561)))

(declare-fun b!144168 () Bool)

(assert (=> b!144168 (= e!93958 (isDefined!131 (getValueByKey!179 (toList!863 lt!75609) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45975 c!27290) b!144166))

(assert (= (and d!45975 (not c!27290)) b!144167))

(assert (= (and d!45975 (not res!68662)) b!144168))

(declare-fun m!173833 () Bool)

(assert (=> d!45975 m!173833))

(declare-fun m!173835 () Bool)

(assert (=> b!144166 m!173835))

(declare-fun m!173837 () Bool)

(assert (=> b!144166 m!173837))

(assert (=> b!144166 m!173837))

(declare-fun m!173839 () Bool)

(assert (=> b!144166 m!173839))

(assert (=> b!144168 m!173837))

(assert (=> b!144168 m!173837))

(assert (=> b!144168 m!173839))

(assert (=> bm!16022 d!45975))

(declare-fun d!45977 () Bool)

(assert (=> d!45977 (= (validMask!0 (mask!7333 (v!3308 (underlying!485 thiss!992)))) (and (or (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000001111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000011111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000001111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000011111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000001111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000011111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000111111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000000000000001111111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000000000000011111111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000000000000111111111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000000000001111111111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000000000011111111111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000000000111111111111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000000001111111111111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000000011111111111111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000000111111111111111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000001111111111111111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000011111111111111111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000000111111111111111111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000001111111111111111111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000011111111111111111111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00000111111111111111111111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00001111111111111111111111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00011111111111111111111111111111) (= (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7333 (v!3308 (underlying!485 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!45963 d!45977))

(declare-fun d!45979 () Bool)

(declare-fun res!68663 () Bool)

(declare-fun e!93960 () Bool)

(assert (=> d!45979 (=> res!68663 e!93960)))

(assert (=> d!45979 (= res!68663 ((_ is Nil!1728) (t!6348 lt!75417)))))

(assert (=> d!45979 (= (noDuplicate!51 (t!6348 lt!75417)) e!93960)))

(declare-fun b!144169 () Bool)

(declare-fun e!93961 () Bool)

(assert (=> b!144169 (= e!93960 e!93961)))

(declare-fun res!68664 () Bool)

(assert (=> b!144169 (=> (not res!68664) (not e!93961))))

(assert (=> b!144169 (= res!68664 (not (contains!914 (t!6348 (t!6348 lt!75417)) (h!2335 (t!6348 lt!75417)))))))

(declare-fun b!144170 () Bool)

(assert (=> b!144170 (= e!93961 (noDuplicate!51 (t!6348 (t!6348 lt!75417))))))

(assert (= (and d!45979 (not res!68663)) b!144169))

(assert (= (and b!144169 res!68664) b!144170))

(declare-fun m!173841 () Bool)

(assert (=> b!144169 m!173841))

(declare-fun m!173843 () Bool)

(assert (=> b!144170 m!173843))

(assert (=> b!143907 d!45979))

(declare-fun d!45981 () Bool)

(declare-fun e!93962 () Bool)

(assert (=> d!45981 e!93962))

(declare-fun res!68665 () Bool)

(assert (=> d!45981 (=> res!68665 e!93962)))

(declare-fun lt!75630 () Bool)

(assert (=> d!45981 (= res!68665 (not lt!75630))))

(declare-fun lt!75632 () Bool)

(assert (=> d!45981 (= lt!75630 lt!75632)))

(declare-fun lt!75631 () Unit!4553)

(declare-fun e!93963 () Unit!4553)

(assert (=> d!45981 (= lt!75631 e!93963)))

(declare-fun c!27291 () Bool)

(assert (=> d!45981 (= c!27291 lt!75632)))

(assert (=> d!45981 (= lt!75632 (containsKey!182 (toList!863 call!15994) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!45981 (= (contains!913 call!15994 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)) lt!75630)))

(declare-fun b!144171 () Bool)

(declare-fun lt!75633 () Unit!4553)

(assert (=> b!144171 (= e!93963 lt!75633)))

(assert (=> b!144171 (= lt!75633 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!863 call!15994) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> b!144171 (isDefined!131 (getValueByKey!179 (toList!863 call!15994) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!144172 () Bool)

(declare-fun Unit!4562 () Unit!4553)

(assert (=> b!144172 (= e!93963 Unit!4562)))

(declare-fun b!144173 () Bool)

(assert (=> b!144173 (= e!93962 (isDefined!131 (getValueByKey!179 (toList!863 call!15994) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355))))))

(assert (= (and d!45981 c!27291) b!144171))

(assert (= (and d!45981 (not c!27291)) b!144172))

(assert (= (and d!45981 (not res!68665)) b!144173))

(assert (=> d!45981 m!173531))

(declare-fun m!173845 () Bool)

(assert (=> d!45981 m!173845))

(assert (=> b!144171 m!173531))

(declare-fun m!173847 () Bool)

(assert (=> b!144171 m!173847))

(assert (=> b!144171 m!173531))

(declare-fun m!173849 () Bool)

(assert (=> b!144171 m!173849))

(assert (=> b!144171 m!173849))

(declare-fun m!173851 () Bool)

(assert (=> b!144171 m!173851))

(assert (=> b!144173 m!173531))

(assert (=> b!144173 m!173849))

(assert (=> b!144173 m!173849))

(assert (=> b!144173 m!173851))

(assert (=> b!144049 d!45981))

(declare-fun d!45983 () Bool)

(declare-fun e!93966 () Bool)

(assert (=> d!45983 e!93966))

(declare-fun res!68671 () Bool)

(assert (=> d!45983 (=> (not res!68671) (not e!93966))))

(declare-fun lt!75644 () ListLongMap!1695)

(assert (=> d!45983 (= res!68671 (contains!913 lt!75644 (_1!1332 (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!75645 () List!1730)

(assert (=> d!45983 (= lt!75644 (ListLongMap!1696 lt!75645))))

(declare-fun lt!75642 () Unit!4553)

(declare-fun lt!75643 () Unit!4553)

(assert (=> d!45983 (= lt!75642 lt!75643)))

(assert (=> d!45983 (= (getValueByKey!179 lt!75645 (_1!1332 (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!184 (_2!1332 (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!93 (List!1730 (_ BitVec 64) V!3569) Unit!4553)

(assert (=> d!45983 (= lt!75643 (lemmaContainsTupThenGetReturnValue!93 lt!75645 (_1!1332 (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!96 (List!1730 (_ BitVec 64) V!3569) List!1730)

(assert (=> d!45983 (= lt!75645 (insertStrictlySorted!96 (toList!863 call!15995) (_1!1332 (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1332 (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!45983 (= (+!175 call!15995 (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!75644)))

(declare-fun b!144178 () Bool)

(declare-fun res!68670 () Bool)

(assert (=> b!144178 (=> (not res!68670) (not e!93966))))

(assert (=> b!144178 (= res!68670 (= (getValueByKey!179 (toList!863 lt!75644) (_1!1332 (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!184 (_2!1332 (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!144179 () Bool)

(declare-fun contains!916 (List!1730 tuple2!2642) Bool)

(assert (=> b!144179 (= e!93966 (contains!916 (toList!863 lt!75644) (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!45983 res!68671) b!144178))

(assert (= (and b!144178 res!68670) b!144179))

(declare-fun m!173853 () Bool)

(assert (=> d!45983 m!173853))

(declare-fun m!173855 () Bool)

(assert (=> d!45983 m!173855))

(declare-fun m!173857 () Bool)

(assert (=> d!45983 m!173857))

(declare-fun m!173859 () Bool)

(assert (=> d!45983 m!173859))

(declare-fun m!173861 () Bool)

(assert (=> b!144178 m!173861))

(declare-fun m!173863 () Bool)

(assert (=> b!144179 m!173863))

(assert (=> b!144051 d!45983))

(declare-fun d!45985 () Bool)

(assert (=> d!45985 (= (validKeyInArray!0 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144134 d!45985))

(declare-fun b!144180 () Bool)

(declare-fun e!93969 () Bool)

(declare-fun e!93976 () Bool)

(assert (=> b!144180 (= e!93969 e!93976)))

(declare-fun c!27297 () Bool)

(assert (=> b!144180 (= c!27297 (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144181 () Bool)

(declare-fun call!16033 () Bool)

(assert (=> b!144181 (= e!93976 (not call!16033))))

(declare-fun b!144182 () Bool)

(declare-fun e!93968 () ListLongMap!1695)

(declare-fun call!16031 () ListLongMap!1695)

(assert (=> b!144182 (= e!93968 call!16031)))

(declare-fun b!144183 () Bool)

(declare-fun e!93970 () Bool)

(declare-fun e!93975 () Bool)

(assert (=> b!144183 (= e!93970 e!93975)))

(declare-fun res!68678 () Bool)

(declare-fun call!16032 () Bool)

(assert (=> b!144183 (= res!68678 call!16032)))

(assert (=> b!144183 (=> (not res!68678) (not e!93975))))

(declare-fun b!144184 () Bool)

(assert (=> b!144184 (= e!93970 (not call!16032))))

(declare-fun b!144185 () Bool)

(declare-fun e!93974 () ListLongMap!1695)

(declare-fun call!16030 () ListLongMap!1695)

(assert (=> b!144185 (= e!93974 call!16030)))

(declare-fun b!144186 () Bool)

(declare-fun e!93971 () ListLongMap!1695)

(assert (=> b!144186 (= e!93971 e!93974)))

(declare-fun c!27293 () Bool)

(assert (=> b!144186 (= c!27293 (and (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144187 () Bool)

(declare-fun res!68676 () Bool)

(assert (=> b!144187 (=> (not res!68676) (not e!93969))))

(assert (=> b!144187 (= res!68676 e!93970)))

(declare-fun c!27294 () Bool)

(assert (=> b!144187 (= c!27294 (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!144188 () Bool)

(declare-fun e!93973 () Unit!4553)

(declare-fun lt!75661 () Unit!4553)

(assert (=> b!144188 (= e!93973 lt!75661)))

(declare-fun lt!75664 () ListLongMap!1695)

(assert (=> b!144188 (= lt!75664 (getCurrentListMapNoExtraKeys!142 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75650 () (_ BitVec 64))

(assert (=> b!144188 (= lt!75650 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75662 () (_ BitVec 64))

(assert (=> b!144188 (= lt!75662 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75663 () Unit!4553)

(assert (=> b!144188 (= lt!75663 (addStillContains!98 lt!75664 lt!75650 (zeroValue!2822 newMap!16) lt!75662))))

(assert (=> b!144188 (contains!913 (+!175 lt!75664 (tuple2!2643 lt!75650 (zeroValue!2822 newMap!16))) lt!75662)))

(declare-fun lt!75666 () Unit!4553)

(assert (=> b!144188 (= lt!75666 lt!75663)))

(declare-fun lt!75649 () ListLongMap!1695)

(assert (=> b!144188 (= lt!75649 (getCurrentListMapNoExtraKeys!142 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75648 () (_ BitVec 64))

(assert (=> b!144188 (= lt!75648 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75646 () (_ BitVec 64))

(assert (=> b!144188 (= lt!75646 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75656 () Unit!4553)

(assert (=> b!144188 (= lt!75656 (addApplyDifferent!98 lt!75649 lt!75648 (minValue!2822 newMap!16) lt!75646))))

(assert (=> b!144188 (= (apply!122 (+!175 lt!75649 (tuple2!2643 lt!75648 (minValue!2822 newMap!16))) lt!75646) (apply!122 lt!75649 lt!75646))))

(declare-fun lt!75665 () Unit!4553)

(assert (=> b!144188 (= lt!75665 lt!75656)))

(declare-fun lt!75655 () ListLongMap!1695)

(assert (=> b!144188 (= lt!75655 (getCurrentListMapNoExtraKeys!142 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75647 () (_ BitVec 64))

(assert (=> b!144188 (= lt!75647 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75651 () (_ BitVec 64))

(assert (=> b!144188 (= lt!75651 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75658 () Unit!4553)

(assert (=> b!144188 (= lt!75658 (addApplyDifferent!98 lt!75655 lt!75647 (zeroValue!2822 newMap!16) lt!75651))))

(assert (=> b!144188 (= (apply!122 (+!175 lt!75655 (tuple2!2643 lt!75647 (zeroValue!2822 newMap!16))) lt!75651) (apply!122 lt!75655 lt!75651))))

(declare-fun lt!75653 () Unit!4553)

(assert (=> b!144188 (= lt!75653 lt!75658)))

(declare-fun lt!75659 () ListLongMap!1695)

(assert (=> b!144188 (= lt!75659 (getCurrentListMapNoExtraKeys!142 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75660 () (_ BitVec 64))

(assert (=> b!144188 (= lt!75660 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75654 () (_ BitVec 64))

(assert (=> b!144188 (= lt!75654 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!144188 (= lt!75661 (addApplyDifferent!98 lt!75659 lt!75660 (minValue!2822 newMap!16) lt!75654))))

(assert (=> b!144188 (= (apply!122 (+!175 lt!75659 (tuple2!2643 lt!75660 (minValue!2822 newMap!16))) lt!75654) (apply!122 lt!75659 lt!75654))))

(declare-fun b!144189 () Bool)

(declare-fun e!93978 () Bool)

(declare-fun lt!75652 () ListLongMap!1695)

(assert (=> b!144189 (= e!93978 (= (apply!122 lt!75652 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000)) (get!1546 (select (arr!2319 (_values!2958 newMap!16)) #b00000000000000000000000000000000) (dynLambda!444 (defaultEntry!2975 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144189 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2593 (_values!2958 newMap!16))))))

(assert (=> b!144189 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))))))

(declare-fun bm!16028 () Bool)

(declare-fun call!16034 () ListLongMap!1695)

(assert (=> bm!16028 (= call!16034 (getCurrentListMapNoExtraKeys!142 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun d!45987 () Bool)

(assert (=> d!45987 e!93969))

(declare-fun res!68680 () Bool)

(assert (=> d!45987 (=> (not res!68680) (not e!93969))))

(assert (=> d!45987 (= res!68680 (or (bvsge #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))))))))

(declare-fun lt!75667 () ListLongMap!1695)

(assert (=> d!45987 (= lt!75652 lt!75667)))

(declare-fun lt!75657 () Unit!4553)

(assert (=> d!45987 (= lt!75657 e!93973)))

(declare-fun c!27292 () Bool)

(declare-fun e!93979 () Bool)

(assert (=> d!45987 (= c!27292 e!93979)))

(declare-fun res!68674 () Bool)

(assert (=> d!45987 (=> (not res!68674) (not e!93979))))

(assert (=> d!45987 (= res!68674 (bvslt #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))))))

(assert (=> d!45987 (= lt!75667 e!93971)))

(declare-fun c!27295 () Bool)

(assert (=> d!45987 (= c!27295 (and (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!45987 (validMask!0 (mask!7333 newMap!16))))

(assert (=> d!45987 (= (getCurrentListMap!535 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) lt!75652)))

(declare-fun bm!16027 () Bool)

(declare-fun call!16036 () ListLongMap!1695)

(assert (=> bm!16027 (= call!16030 call!16036)))

(declare-fun b!144190 () Bool)

(declare-fun e!93967 () Bool)

(assert (=> b!144190 (= e!93967 (validKeyInArray!0 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144191 () Bool)

(declare-fun e!93977 () Bool)

(assert (=> b!144191 (= e!93977 (= (apply!122 lt!75652 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2822 newMap!16)))))

(declare-fun b!144192 () Bool)

(declare-fun res!68672 () Bool)

(assert (=> b!144192 (=> (not res!68672) (not e!93969))))

(declare-fun e!93972 () Bool)

(assert (=> b!144192 (= res!68672 e!93972)))

(declare-fun res!68679 () Bool)

(assert (=> b!144192 (=> res!68679 e!93972)))

(assert (=> b!144192 (= res!68679 (not e!93967))))

(declare-fun res!68677 () Bool)

(assert (=> b!144192 (=> (not res!68677) (not e!93967))))

(assert (=> b!144192 (= res!68677 (bvslt #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))))))

(declare-fun b!144193 () Bool)

(declare-fun c!27296 () Bool)

(assert (=> b!144193 (= c!27296 (and (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!144193 (= e!93974 e!93968)))

(declare-fun b!144194 () Bool)

(assert (=> b!144194 (= e!93968 call!16030)))

(declare-fun b!144195 () Bool)

(declare-fun Unit!4563 () Unit!4553)

(assert (=> b!144195 (= e!93973 Unit!4563)))

(declare-fun bm!16029 () Bool)

(assert (=> bm!16029 (= call!16032 (contains!913 lt!75652 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16030 () Bool)

(declare-fun call!16035 () ListLongMap!1695)

(assert (=> bm!16030 (= call!16036 (+!175 (ite c!27295 call!16034 (ite c!27293 call!16035 call!16031)) (ite (or c!27295 c!27293) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 newMap!16)))))))

(declare-fun bm!16031 () Bool)

(assert (=> bm!16031 (= call!16031 call!16035)))

(declare-fun b!144196 () Bool)

(assert (=> b!144196 (= e!93972 e!93978)))

(declare-fun res!68673 () Bool)

(assert (=> b!144196 (=> (not res!68673) (not e!93978))))

(assert (=> b!144196 (= res!68673 (contains!913 lt!75652 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!144196 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))))))

(declare-fun b!144197 () Bool)

(assert (=> b!144197 (= e!93976 e!93977)))

(declare-fun res!68675 () Bool)

(assert (=> b!144197 (= res!68675 call!16033)))

(assert (=> b!144197 (=> (not res!68675) (not e!93977))))

(declare-fun b!144198 () Bool)

(assert (=> b!144198 (= e!93979 (validKeyInArray!0 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!16032 () Bool)

(assert (=> bm!16032 (= call!16033 (contains!913 lt!75652 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144199 () Bool)

(assert (=> b!144199 (= e!93971 (+!175 call!16036 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 newMap!16))))))

(declare-fun b!144200 () Bool)

(assert (=> b!144200 (= e!93975 (= (apply!122 lt!75652 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2822 newMap!16)))))

(declare-fun bm!16033 () Bool)

(assert (=> bm!16033 (= call!16035 call!16034)))

(assert (= (and d!45987 c!27295) b!144199))

(assert (= (and d!45987 (not c!27295)) b!144186))

(assert (= (and b!144186 c!27293) b!144185))

(assert (= (and b!144186 (not c!27293)) b!144193))

(assert (= (and b!144193 c!27296) b!144194))

(assert (= (and b!144193 (not c!27296)) b!144182))

(assert (= (or b!144194 b!144182) bm!16031))

(assert (= (or b!144185 bm!16031) bm!16033))

(assert (= (or b!144185 b!144194) bm!16027))

(assert (= (or b!144199 bm!16033) bm!16028))

(assert (= (or b!144199 bm!16027) bm!16030))

(assert (= (and d!45987 res!68674) b!144198))

(assert (= (and d!45987 c!27292) b!144188))

(assert (= (and d!45987 (not c!27292)) b!144195))

(assert (= (and d!45987 res!68680) b!144192))

(assert (= (and b!144192 res!68677) b!144190))

(assert (= (and b!144192 (not res!68679)) b!144196))

(assert (= (and b!144196 res!68673) b!144189))

(assert (= (and b!144192 res!68672) b!144187))

(assert (= (and b!144187 c!27294) b!144183))

(assert (= (and b!144187 (not c!27294)) b!144184))

(assert (= (and b!144183 res!68678) b!144200))

(assert (= (or b!144183 b!144184) bm!16029))

(assert (= (and b!144187 res!68676) b!144180))

(assert (= (and b!144180 c!27297) b!144197))

(assert (= (and b!144180 (not c!27297)) b!144181))

(assert (= (and b!144197 res!68675) b!144191))

(assert (= (or b!144197 b!144181) bm!16032))

(declare-fun b_lambda!6481 () Bool)

(assert (=> (not b_lambda!6481) (not b!144189)))

(declare-fun tb!2589 () Bool)

(declare-fun t!6361 () Bool)

(assert (=> (and b!143775 (= (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) (defaultEntry!2975 newMap!16)) t!6361) tb!2589))

(declare-fun result!4243 () Bool)

(assert (=> tb!2589 (= result!4243 tp_is_empty!2941)))

(assert (=> b!144189 t!6361))

(declare-fun b_and!8993 () Bool)

(assert (= b_and!8989 (and (=> t!6361 result!4243) b_and!8993)))

(declare-fun t!6363 () Bool)

(declare-fun tb!2591 () Bool)

(assert (=> (and b!143769 (= (defaultEntry!2975 newMap!16) (defaultEntry!2975 newMap!16)) t!6363) tb!2591))

(declare-fun result!4245 () Bool)

(assert (= result!4245 result!4243))

(assert (=> b!144189 t!6363))

(declare-fun b_and!8995 () Bool)

(assert (= b_and!8991 (and (=> t!6363 result!4245) b_and!8995)))

(declare-fun m!173865 () Bool)

(assert (=> b!144190 m!173865))

(assert (=> b!144190 m!173865))

(declare-fun m!173867 () Bool)

(assert (=> b!144190 m!173867))

(assert (=> b!144196 m!173865))

(assert (=> b!144196 m!173865))

(declare-fun m!173869 () Bool)

(assert (=> b!144196 m!173869))

(declare-fun m!173871 () Bool)

(assert (=> b!144188 m!173871))

(declare-fun m!173873 () Bool)

(assert (=> b!144188 m!173873))

(declare-fun m!173875 () Bool)

(assert (=> b!144188 m!173875))

(declare-fun m!173877 () Bool)

(assert (=> b!144188 m!173877))

(declare-fun m!173879 () Bool)

(assert (=> b!144188 m!173879))

(declare-fun m!173881 () Bool)

(assert (=> b!144188 m!173881))

(declare-fun m!173883 () Bool)

(assert (=> b!144188 m!173883))

(assert (=> b!144188 m!173865))

(declare-fun m!173885 () Bool)

(assert (=> b!144188 m!173885))

(declare-fun m!173887 () Bool)

(assert (=> b!144188 m!173887))

(assert (=> b!144188 m!173873))

(declare-fun m!173889 () Bool)

(assert (=> b!144188 m!173889))

(declare-fun m!173891 () Bool)

(assert (=> b!144188 m!173891))

(declare-fun m!173893 () Bool)

(assert (=> b!144188 m!173893))

(declare-fun m!173895 () Bool)

(assert (=> b!144188 m!173895))

(declare-fun m!173897 () Bool)

(assert (=> b!144188 m!173897))

(declare-fun m!173899 () Bool)

(assert (=> b!144188 m!173899))

(assert (=> b!144188 m!173891))

(declare-fun m!173901 () Bool)

(assert (=> b!144188 m!173901))

(assert (=> b!144188 m!173893))

(assert (=> b!144188 m!173885))

(declare-fun m!173903 () Bool)

(assert (=> bm!16030 m!173903))

(assert (=> bm!16028 m!173883))

(declare-fun m!173905 () Bool)

(assert (=> b!144189 m!173905))

(assert (=> b!144189 m!173865))

(declare-fun m!173907 () Bool)

(assert (=> b!144189 m!173907))

(declare-fun m!173909 () Bool)

(assert (=> b!144189 m!173909))

(assert (=> b!144189 m!173865))

(assert (=> b!144189 m!173909))

(assert (=> b!144189 m!173905))

(declare-fun m!173911 () Bool)

(assert (=> b!144189 m!173911))

(declare-fun m!173913 () Bool)

(assert (=> d!45987 m!173913))

(declare-fun m!173915 () Bool)

(assert (=> b!144191 m!173915))

(declare-fun m!173917 () Bool)

(assert (=> b!144199 m!173917))

(declare-fun m!173919 () Bool)

(assert (=> b!144200 m!173919))

(declare-fun m!173921 () Bool)

(assert (=> bm!16032 m!173921))

(declare-fun m!173923 () Bool)

(assert (=> bm!16029 m!173923))

(assert (=> b!144198 m!173865))

(assert (=> b!144198 m!173865))

(assert (=> b!144198 m!173867))

(assert (=> d!45961 d!45987))

(declare-fun d!45989 () Bool)

(declare-fun isEmpty!428 (Option!185) Bool)

(assert (=> d!45989 (= (isDefined!131 (getValueByKey!179 (toList!863 lt!75416) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355))) (not (isEmpty!428 (getValueByKey!179 (toList!863 lt!75416) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))))

(declare-fun bs!6094 () Bool)

(assert (= bs!6094 d!45989))

(assert (=> bs!6094 m!173697))

(declare-fun m!173925 () Bool)

(assert (=> bs!6094 m!173925))

(assert (=> b!143949 d!45989))

(declare-fun b!144212 () Bool)

(declare-fun e!93985 () Option!185)

(assert (=> b!144212 (= e!93985 None!183)))

(declare-fun b!144209 () Bool)

(declare-fun e!93984 () Option!185)

(assert (=> b!144209 (= e!93984 (Some!184 (_2!1332 (h!2334 (toList!863 lt!75416)))))))

(declare-fun b!144211 () Bool)

(assert (=> b!144211 (= e!93985 (getValueByKey!179 (t!6347 (toList!863 lt!75416)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun c!27302 () Bool)

(declare-fun d!45991 () Bool)

(assert (=> d!45991 (= c!27302 (and ((_ is Cons!1726) (toList!863 lt!75416)) (= (_1!1332 (h!2334 (toList!863 lt!75416))) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355))))))

(assert (=> d!45991 (= (getValueByKey!179 (toList!863 lt!75416) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)) e!93984)))

(declare-fun b!144210 () Bool)

(assert (=> b!144210 (= e!93984 e!93985)))

(declare-fun c!27303 () Bool)

(assert (=> b!144210 (= c!27303 (and ((_ is Cons!1726) (toList!863 lt!75416)) (not (= (_1!1332 (h!2334 (toList!863 lt!75416))) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))))

(assert (= (and d!45991 c!27302) b!144209))

(assert (= (and d!45991 (not c!27302)) b!144210))

(assert (= (and b!144210 c!27303) b!144211))

(assert (= (and b!144210 (not c!27303)) b!144212))

(assert (=> b!144211 m!173531))

(declare-fun m!173927 () Bool)

(assert (=> b!144211 m!173927))

(assert (=> b!143949 d!45991))

(declare-fun d!45993 () Bool)

(assert (=> d!45993 (= (inRange!0 (ite c!27258 (ite c!27267 (index!3266 lt!75548) (ite c!27260 (index!3265 lt!75550) (index!3268 lt!75550))) (ite c!27256 (index!3266 lt!75545) (ite c!27261 (index!3265 lt!75557) (index!3268 lt!75557)))) (mask!7333 newMap!16)) (and (bvsge (ite c!27258 (ite c!27267 (index!3266 lt!75548) (ite c!27260 (index!3265 lt!75550) (index!3268 lt!75550))) (ite c!27256 (index!3266 lt!75545) (ite c!27261 (index!3265 lt!75557) (index!3268 lt!75557)))) #b00000000000000000000000000000000) (bvslt (ite c!27258 (ite c!27267 (index!3266 lt!75548) (ite c!27260 (index!3265 lt!75550) (index!3268 lt!75550))) (ite c!27256 (index!3266 lt!75545) (ite c!27261 (index!3265 lt!75557) (index!3268 lt!75557)))) (bvadd (mask!7333 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!16005 d!45993))

(declare-fun d!45995 () Bool)

(assert (=> d!45995 (= (map!1437 (_2!1333 lt!75542)) (getCurrentListMap!535 (_keys!4740 (_2!1333 lt!75542)) (_values!2958 (_2!1333 lt!75542)) (mask!7333 (_2!1333 lt!75542)) (extraKeys!2724 (_2!1333 lt!75542)) (zeroValue!2822 (_2!1333 lt!75542)) (minValue!2822 (_2!1333 lt!75542)) #b00000000000000000000000000000000 (defaultEntry!2975 (_2!1333 lt!75542))))))

(declare-fun bs!6095 () Bool)

(assert (= bs!6095 d!45995))

(declare-fun m!173929 () Bool)

(assert (=> bs!6095 m!173929))

(assert (=> bm!15982 d!45995))

(declare-fun b!144221 () Bool)

(declare-fun res!68692 () Bool)

(declare-fun e!93988 () Bool)

(assert (=> b!144221 (=> (not res!68692) (not e!93988))))

(assert (=> b!144221 (= res!68692 (and (= (size!2593 (_values!2958 newMap!16)) (bvadd (mask!7333 newMap!16) #b00000000000000000000000000000001)) (= (size!2592 (_keys!4740 newMap!16)) (size!2593 (_values!2958 newMap!16))) (bvsge (_size!630 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!630 newMap!16) (bvadd (mask!7333 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!45997 () Bool)

(declare-fun res!68691 () Bool)

(assert (=> d!45997 (=> (not res!68691) (not e!93988))))

(assert (=> d!45997 (= res!68691 (validMask!0 (mask!7333 newMap!16)))))

(assert (=> d!45997 (= (simpleValid!98 newMap!16) e!93988)))

(declare-fun b!144224 () Bool)

(assert (=> b!144224 (= e!93988 (and (bvsge (extraKeys!2724 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2724 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!630 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!144223 () Bool)

(declare-fun res!68690 () Bool)

(assert (=> b!144223 (=> (not res!68690) (not e!93988))))

(declare-fun size!2598 (LongMapFixedSize!1162) (_ BitVec 32))

(assert (=> b!144223 (= res!68690 (= (size!2598 newMap!16) (bvadd (_size!630 newMap!16) (bvsdiv (bvadd (extraKeys!2724 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!144222 () Bool)

(declare-fun res!68689 () Bool)

(assert (=> b!144222 (=> (not res!68689) (not e!93988))))

(assert (=> b!144222 (= res!68689 (bvsge (size!2598 newMap!16) (_size!630 newMap!16)))))

(assert (= (and d!45997 res!68691) b!144221))

(assert (= (and b!144221 res!68692) b!144222))

(assert (= (and b!144222 res!68689) b!144223))

(assert (= (and b!144223 res!68690) b!144224))

(assert (=> d!45997 m!173913))

(declare-fun m!173931 () Bool)

(assert (=> b!144223 m!173931))

(assert (=> b!144222 m!173931))

(assert (=> d!45973 d!45997))

(declare-fun d!45999 () Bool)

(declare-fun c!27306 () Bool)

(assert (=> d!45999 (= c!27306 ((_ is Nil!1728) lt!75417))))

(declare-fun e!93991 () (InoxSet (_ BitVec 64)))

(assert (=> d!45999 (= (content!141 lt!75417) e!93991)))

(declare-fun b!144229 () Bool)

(assert (=> b!144229 (= e!93991 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!144230 () Bool)

(assert (=> b!144230 (= e!93991 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!2335 lt!75417) true) (content!141 (t!6348 lt!75417))))))

(assert (= (and d!45999 c!27306) b!144229))

(assert (= (and d!45999 (not c!27306)) b!144230))

(declare-fun m!173933 () Bool)

(assert (=> b!144230 m!173933))

(declare-fun m!173935 () Bool)

(assert (=> b!144230 m!173935))

(assert (=> d!45953 d!45999))

(declare-fun d!46001 () Bool)

(declare-fun res!68693 () Bool)

(declare-fun e!93992 () Bool)

(assert (=> d!46001 (=> (not res!68693) (not e!93992))))

(assert (=> d!46001 (= res!68693 (simpleValid!98 (v!3308 (underlying!485 thiss!992))))))

(assert (=> d!46001 (= (valid!577 (v!3308 (underlying!485 thiss!992))) e!93992)))

(declare-fun b!144231 () Bool)

(declare-fun res!68694 () Bool)

(assert (=> b!144231 (=> (not res!68694) (not e!93992))))

(assert (=> b!144231 (= res!68694 (= (arrayCountValidKeys!0 (_keys!4740 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000000 (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992))))) (_size!630 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun b!144232 () Bool)

(declare-fun res!68695 () Bool)

(assert (=> b!144232 (=> (not res!68695) (not e!93992))))

(assert (=> b!144232 (= res!68695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (mask!7333 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun b!144233 () Bool)

(assert (=> b!144233 (= e!93992 (arrayNoDuplicates!0 (_keys!4740 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000000 Nil!1728))))

(assert (= (and d!46001 res!68693) b!144231))

(assert (= (and b!144231 res!68694) b!144232))

(assert (= (and b!144232 res!68695) b!144233))

(declare-fun m!173937 () Bool)

(assert (=> d!46001 m!173937))

(declare-fun m!173939 () Bool)

(assert (=> b!144231 m!173939))

(declare-fun m!173941 () Bool)

(assert (=> b!144232 m!173941))

(declare-fun m!173943 () Bool)

(assert (=> b!144233 m!173943))

(assert (=> d!45969 d!46001))

(declare-fun call!16045 () Bool)

(declare-fun bm!16042 () Bool)

(assert (=> bm!16042 (= call!16045 (arrayContainsKey!0 (_keys!4740 newMap!16) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!75756 () tuple2!2644)

(declare-fun e!94013 () Bool)

(declare-fun b!144268 () Bool)

(assert (=> b!144268 (= e!94013 (= (map!1437 (_2!1333 lt!75756)) (+!175 (map!1437 newMap!16) (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!144269 () Bool)

(declare-fun res!68717 () Bool)

(declare-fun e!94014 () Bool)

(assert (=> b!144269 (=> (not res!68717) (not e!94014))))

(declare-fun call!16046 () Bool)

(assert (=> b!144269 (= res!68717 call!16046)))

(declare-fun e!94010 () Bool)

(assert (=> b!144269 (= e!94010 e!94014)))

(declare-fun b!144270 () Bool)

(declare-fun e!94015 () Bool)

(assert (=> b!144270 (= e!94015 (not call!16045))))

(declare-fun c!27318 () Bool)

(declare-fun call!16047 () Bool)

(declare-fun bm!16043 () Bool)

(declare-fun lt!75747 () SeekEntryResult!275)

(declare-fun lt!75732 () SeekEntryResult!275)

(declare-fun c!27315 () Bool)

(assert (=> bm!16043 (= call!16047 (inRange!0 (ite c!27318 (index!3266 lt!75732) (ite c!27315 (index!3265 lt!75747) (index!3268 lt!75747))) (mask!7333 newMap!16)))))

(declare-fun e!94016 () Bool)

(declare-fun b!144271 () Bool)

(assert (=> b!144271 (= e!94016 (= (select (arr!2318 (_keys!4740 newMap!16)) (index!3266 lt!75732)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun bm!16044 () Bool)

(assert (=> bm!16044 (= call!16046 call!16047)))

(declare-fun b!144272 () Bool)

(declare-fun e!94012 () Bool)

(assert (=> b!144272 (= e!94012 ((_ is Undefined!275) lt!75747))))

(declare-fun d!46003 () Bool)

(assert (=> d!46003 e!94013))

(declare-fun res!68719 () Bool)

(assert (=> d!46003 (=> (not res!68719) (not e!94013))))

(assert (=> d!46003 (= res!68719 (_1!1333 lt!75756))))

(assert (=> d!46003 (= lt!75756 (tuple2!2645 true (LongMapFixedSize!1163 (defaultEntry!2975 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (bvadd (_size!630 newMap!16) #b00000000000000000000000000000001) (array!4908 (store (arr!2318 (_keys!4740 newMap!16)) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)) (size!2592 (_keys!4740 newMap!16))) (array!4910 (store (arr!2319 (_values!2958 newMap!16)) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554)) (ValueCellFull!1127 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2593 (_values!2958 newMap!16))) (_vacant!630 newMap!16))))))

(declare-fun lt!75740 () Unit!4553)

(declare-fun lt!75757 () Unit!4553)

(assert (=> d!46003 (= lt!75740 lt!75757)))

(declare-fun lt!75743 () array!4909)

(declare-fun lt!75753 () array!4907)

(assert (=> d!46003 (contains!913 (getCurrentListMap!535 lt!75753 lt!75743 (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) (select (store (arr!2318 (_keys!4740 newMap!16)) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554))))))

(assert (=> d!46003 (= lt!75757 (lemmaValidKeyInArrayIsInListMap!127 lt!75753 lt!75743 (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554)) (defaultEntry!2975 newMap!16)))))

(assert (=> d!46003 (= lt!75743 (array!4910 (store (arr!2319 (_values!2958 newMap!16)) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554)) (ValueCellFull!1127 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2593 (_values!2958 newMap!16))))))

(assert (=> d!46003 (= lt!75753 (array!4908 (store (arr!2318 (_keys!4740 newMap!16)) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)) (size!2592 (_keys!4740 newMap!16))))))

(declare-fun lt!75755 () Unit!4553)

(declare-fun lt!75739 () Unit!4553)

(assert (=> d!46003 (= lt!75755 lt!75739)))

(declare-fun lt!75751 () array!4907)

(assert (=> d!46003 (= (arrayCountValidKeys!0 lt!75751 (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554)) (bvadd (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4907 (_ BitVec 32)) Unit!4553)

(assert (=> d!46003 (= lt!75739 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!75751 (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554))))))

(assert (=> d!46003 (= lt!75751 (array!4908 (store (arr!2318 (_keys!4740 newMap!16)) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)) (size!2592 (_keys!4740 newMap!16))))))

(declare-fun lt!75730 () Unit!4553)

(declare-fun lt!75731 () Unit!4553)

(assert (=> d!46003 (= lt!75730 lt!75731)))

(declare-fun lt!75735 () array!4907)

(assert (=> d!46003 (arrayContainsKey!0 lt!75735 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4907 (_ BitVec 64) (_ BitVec 32)) Unit!4553)

(assert (=> d!46003 (= lt!75731 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!75735 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554))))))

(assert (=> d!46003 (= lt!75735 (array!4908 (store (arr!2318 (_keys!4740 newMap!16)) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)) (size!2592 (_keys!4740 newMap!16))))))

(declare-fun lt!75744 () Unit!4553)

(declare-fun lt!75734 () Unit!4553)

(assert (=> d!46003 (= lt!75744 lt!75734)))

(assert (=> d!46003 (= (+!175 (getCurrentListMap!535 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!535 (array!4908 (store (arr!2318 (_keys!4740 newMap!16)) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)) (size!2592 (_keys!4740 newMap!16))) (array!4910 (store (arr!2319 (_values!2958 newMap!16)) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554)) (ValueCellFull!1127 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2593 (_values!2958 newMap!16))) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!47 (array!4907 array!4909 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 32) (_ BitVec 64) V!3569 Int) Unit!4553)

(assert (=> d!46003 (= lt!75734 (lemmaAddValidKeyToArrayThenAddPairToListMap!47 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75733 () Unit!4553)

(declare-fun lt!75736 () Unit!4553)

(assert (=> d!46003 (= lt!75733 lt!75736)))

(assert (=> d!46003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4908 (store (arr!2318 (_keys!4740 newMap!16)) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)) (size!2592 (_keys!4740 newMap!16))) (mask!7333 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4907 (_ BitVec 32) (_ BitVec 32)) Unit!4553)

(assert (=> d!46003 (= lt!75736 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (_keys!4740 newMap!16) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554)) (mask!7333 newMap!16)))))

(declare-fun lt!75737 () Unit!4553)

(declare-fun lt!75752 () Unit!4553)

(assert (=> d!46003 (= lt!75737 lt!75752)))

(assert (=> d!46003 (= (arrayCountValidKeys!0 (array!4908 (store (arr!2318 (_keys!4740 newMap!16)) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)) (size!2592 (_keys!4740 newMap!16))) #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4740 newMap!16) #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4907 (_ BitVec 32) (_ BitVec 64)) Unit!4553)

(assert (=> d!46003 (= lt!75752 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4740 newMap!16) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun lt!75750 () Unit!4553)

(declare-fun lt!75748 () Unit!4553)

(assert (=> d!46003 (= lt!75750 lt!75748)))

(declare-fun lt!75738 () List!1731)

(declare-fun lt!75749 () (_ BitVec 32))

(assert (=> d!46003 (arrayNoDuplicates!0 (array!4908 (store (arr!2318 (_keys!4740 newMap!16)) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)) (size!2592 (_keys!4740 newMap!16))) lt!75749 lt!75738)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4907 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1731) Unit!4553)

(assert (=> d!46003 (= lt!75748 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4740 newMap!16) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554)) lt!75749 lt!75738))))

(assert (=> d!46003 (= lt!75738 Nil!1728)))

(assert (=> d!46003 (= lt!75749 #b00000000000000000000000000000000)))

(declare-fun lt!75746 () Unit!4553)

(declare-fun e!94009 () Unit!4553)

(assert (=> d!46003 (= lt!75746 e!94009)))

(declare-fun c!27317 () Bool)

(assert (=> d!46003 (= c!27317 (arrayContainsKey!0 (_keys!4740 newMap!16) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!75742 () Unit!4553)

(declare-fun e!94011 () Unit!4553)

(assert (=> d!46003 (= lt!75742 e!94011)))

(assert (=> d!46003 (= c!27318 (contains!913 (getCurrentListMap!535 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!46003 (valid!577 newMap!16)))

(assert (=> d!46003 (= (updateHelperNewKey!67 newMap!16 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27257 (index!3268 lt!75554) (index!3265 lt!75554))) lt!75756)))

(declare-fun b!144273 () Bool)

(declare-fun Unit!4564 () Unit!4553)

(assert (=> b!144273 (= e!94009 Unit!4564)))

(declare-fun lt!75754 () Unit!4553)

(declare-fun lemmaArrayContainsKeyThenInListMap!47 (array!4907 array!4909 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 64) (_ BitVec 32) Int) Unit!4553)

(assert (=> b!144273 (= lt!75754 (lemmaArrayContainsKeyThenInListMap!47 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(assert (=> b!144273 (contains!913 (getCurrentListMap!535 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355))))

(declare-fun lt!75728 () Unit!4553)

(assert (=> b!144273 (= lt!75728 lt!75754)))

(assert (=> b!144273 false))

(declare-fun b!144274 () Bool)

(declare-fun res!68718 () Bool)

(assert (=> b!144274 (= res!68718 call!16047)))

(assert (=> b!144274 (=> (not res!68718) (not e!94016))))

(declare-fun b!144275 () Bool)

(declare-fun res!68721 () Bool)

(assert (=> b!144275 (=> (not res!68721) (not e!94013))))

(assert (=> b!144275 (= res!68721 (contains!913 (map!1437 (_2!1333 lt!75756)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!144276 () Bool)

(declare-fun res!68716 () Bool)

(assert (=> b!144276 (=> (not res!68716) (not e!94014))))

(assert (=> b!144276 (= res!68716 (= (select (arr!2318 (_keys!4740 newMap!16)) (index!3265 lt!75747)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144277 () Bool)

(declare-fun Unit!4565 () Unit!4553)

(assert (=> b!144277 (= e!94011 Unit!4565)))

(declare-fun lt!75745 () Unit!4553)

(assert (=> b!144277 (= lt!75745 (lemmaInListMapThenSeekEntryOrOpenFindsIt!67 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (defaultEntry!2975 newMap!16)))))

(declare-fun call!16048 () SeekEntryResult!275)

(assert (=> b!144277 (= lt!75732 call!16048)))

(declare-fun res!68715 () Bool)

(assert (=> b!144277 (= res!68715 ((_ is Found!275) lt!75732))))

(assert (=> b!144277 (=> (not res!68715) (not e!94016))))

(assert (=> b!144277 e!94016))

(declare-fun lt!75729 () Unit!4553)

(assert (=> b!144277 (= lt!75729 lt!75745)))

(assert (=> b!144277 false))

(declare-fun b!144278 () Bool)

(assert (=> b!144278 (= e!94014 (not call!16045))))

(declare-fun b!144279 () Bool)

(declare-fun res!68720 () Bool)

(assert (=> b!144279 (= res!68720 (= (select (arr!2318 (_keys!4740 newMap!16)) (index!3268 lt!75747)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144279 (=> (not res!68720) (not e!94015))))

(declare-fun b!144280 () Bool)

(assert (=> b!144280 (= e!94012 e!94015)))

(declare-fun res!68714 () Bool)

(assert (=> b!144280 (= res!68714 call!16046)))

(assert (=> b!144280 (=> (not res!68714) (not e!94015))))

(declare-fun b!144281 () Bool)

(declare-fun Unit!4566 () Unit!4553)

(assert (=> b!144281 (= e!94009 Unit!4566)))

(declare-fun b!144282 () Bool)

(declare-fun c!27316 () Bool)

(assert (=> b!144282 (= c!27316 ((_ is MissingVacant!275) lt!75747))))

(assert (=> b!144282 (= e!94010 e!94012)))

(declare-fun b!144283 () Bool)

(declare-fun res!68722 () Bool)

(assert (=> b!144283 (=> (not res!68722) (not e!94013))))

(assert (=> b!144283 (= res!68722 (valid!577 (_2!1333 lt!75756)))))

(declare-fun bm!16045 () Bool)

(assert (=> bm!16045 (= call!16048 (seekEntryOrOpen!0 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (_keys!4740 newMap!16) (mask!7333 newMap!16)))))

(declare-fun b!144284 () Bool)

(declare-fun lt!75741 () Unit!4553)

(assert (=> b!144284 (= e!94011 lt!75741)))

(assert (=> b!144284 (= lt!75741 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!67 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (defaultEntry!2975 newMap!16)))))

(assert (=> b!144284 (= lt!75747 call!16048)))

(assert (=> b!144284 (= c!27315 ((_ is MissingZero!275) lt!75747))))

(assert (=> b!144284 e!94010))

(assert (= (and d!46003 c!27318) b!144277))

(assert (= (and d!46003 (not c!27318)) b!144284))

(assert (= (and b!144277 res!68715) b!144274))

(assert (= (and b!144274 res!68718) b!144271))

(assert (= (and b!144284 c!27315) b!144269))

(assert (= (and b!144284 (not c!27315)) b!144282))

(assert (= (and b!144269 res!68717) b!144276))

(assert (= (and b!144276 res!68716) b!144278))

(assert (= (and b!144282 c!27316) b!144280))

(assert (= (and b!144282 (not c!27316)) b!144272))

(assert (= (and b!144280 res!68714) b!144279))

(assert (= (and b!144279 res!68720) b!144270))

(assert (= (or b!144269 b!144280) bm!16044))

(assert (= (or b!144278 b!144270) bm!16042))

(assert (= (or b!144274 bm!16044) bm!16043))

(assert (= (or b!144277 b!144284) bm!16045))

(assert (= (and d!46003 c!27317) b!144273))

(assert (= (and d!46003 (not c!27317)) b!144281))

(assert (= (and d!46003 res!68719) b!144283))

(assert (= (and b!144283 res!68722) b!144275))

(assert (= (and b!144275 res!68721) b!144268))

(assert (=> b!144277 m!173531))

(assert (=> b!144277 m!173753))

(declare-fun m!173945 () Bool)

(assert (=> b!144276 m!173945))

(declare-fun m!173947 () Bool)

(assert (=> b!144279 m!173947))

(assert (=> b!144284 m!173531))

(assert (=> b!144284 m!173731))

(declare-fun m!173949 () Bool)

(assert (=> b!144283 m!173949))

(declare-fun m!173951 () Bool)

(assert (=> b!144268 m!173951))

(assert (=> b!144268 m!173533))

(assert (=> b!144268 m!173533))

(declare-fun m!173953 () Bool)

(assert (=> b!144268 m!173953))

(assert (=> b!144273 m!173531))

(declare-fun m!173955 () Bool)

(assert (=> b!144273 m!173955))

(assert (=> b!144273 m!173713))

(assert (=> b!144273 m!173713))

(assert (=> b!144273 m!173531))

(declare-fun m!173957 () Bool)

(assert (=> b!144273 m!173957))

(assert (=> b!144275 m!173951))

(assert (=> b!144275 m!173951))

(assert (=> b!144275 m!173531))

(declare-fun m!173959 () Bool)

(assert (=> b!144275 m!173959))

(declare-fun m!173961 () Bool)

(assert (=> b!144271 m!173961))

(assert (=> bm!16045 m!173531))

(assert (=> bm!16045 m!173709))

(declare-fun m!173963 () Bool)

(assert (=> bm!16043 m!173963))

(assert (=> d!46003 m!173531))

(declare-fun m!173965 () Bool)

(assert (=> d!46003 m!173965))

(declare-fun m!173967 () Bool)

(assert (=> d!46003 m!173967))

(assert (=> d!46003 m!173531))

(assert (=> d!46003 m!173735))

(declare-fun m!173969 () Bool)

(assert (=> d!46003 m!173969))

(declare-fun m!173971 () Bool)

(assert (=> d!46003 m!173971))

(declare-fun m!173973 () Bool)

(assert (=> d!46003 m!173973))

(declare-fun m!173975 () Bool)

(assert (=> d!46003 m!173975))

(assert (=> d!46003 m!173713))

(assert (=> d!46003 m!173531))

(assert (=> d!46003 m!173567))

(declare-fun m!173977 () Bool)

(assert (=> d!46003 m!173977))

(assert (=> d!46003 m!173713))

(assert (=> d!46003 m!173531))

(assert (=> d!46003 m!173957))

(assert (=> d!46003 m!173531))

(declare-fun m!173979 () Bool)

(assert (=> d!46003 m!173979))

(declare-fun m!173981 () Bool)

(assert (=> d!46003 m!173981))

(assert (=> d!46003 m!173531))

(declare-fun m!173983 () Bool)

(assert (=> d!46003 m!173983))

(declare-fun m!173985 () Bool)

(assert (=> d!46003 m!173985))

(declare-fun m!173987 () Bool)

(assert (=> d!46003 m!173987))

(assert (=> d!46003 m!173973))

(declare-fun m!173989 () Bool)

(assert (=> d!46003 m!173989))

(assert (=> d!46003 m!173713))

(declare-fun m!173991 () Bool)

(assert (=> d!46003 m!173991))

(declare-fun m!173993 () Bool)

(assert (=> d!46003 m!173993))

(assert (=> d!46003 m!173531))

(declare-fun m!173995 () Bool)

(assert (=> d!46003 m!173995))

(declare-fun m!173997 () Bool)

(assert (=> d!46003 m!173997))

(assert (=> d!46003 m!173971))

(assert (=> d!46003 m!173823))

(declare-fun m!173999 () Bool)

(assert (=> d!46003 m!173999))

(assert (=> d!46003 m!173543))

(assert (=> d!46003 m!173531))

(declare-fun m!174001 () Bool)

(assert (=> d!46003 m!174001))

(assert (=> bm!16042 m!173531))

(assert (=> bm!16042 m!173735))

(assert (=> bm!15994 d!46003))

(assert (=> b!144055 d!45987))

(declare-fun d!46005 () Bool)

(declare-fun lt!75758 () Bool)

(assert (=> d!46005 (= lt!75758 (select (content!141 Nil!1728) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun e!94018 () Bool)

(assert (=> d!46005 (= lt!75758 e!94018)))

(declare-fun res!68724 () Bool)

(assert (=> d!46005 (=> (not res!68724) (not e!94018))))

(assert (=> d!46005 (= res!68724 ((_ is Cons!1727) Nil!1728))))

(assert (=> d!46005 (= (contains!914 Nil!1728 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)) lt!75758)))

(declare-fun b!144285 () Bool)

(declare-fun e!94017 () Bool)

(assert (=> b!144285 (= e!94018 e!94017)))

(declare-fun res!68723 () Bool)

(assert (=> b!144285 (=> res!68723 e!94017)))

(assert (=> b!144285 (= res!68723 (= (h!2335 Nil!1728) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!144286 () Bool)

(assert (=> b!144286 (= e!94017 (contains!914 (t!6348 Nil!1728) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (= (and d!46005 res!68724) b!144285))

(assert (= (and b!144285 (not res!68723)) b!144286))

(declare-fun m!174003 () Bool)

(assert (=> d!46005 m!174003))

(assert (=> d!46005 m!173531))

(declare-fun m!174005 () Bool)

(assert (=> d!46005 m!174005))

(assert (=> b!144286 m!173531))

(declare-fun m!174007 () Bool)

(assert (=> b!144286 m!174007))

(assert (=> b!143921 d!46005))

(declare-fun d!46007 () Bool)

(declare-fun get!1550 (Option!185) V!3569)

(assert (=> d!46007 (= (apply!122 lt!75616 lt!75611) (get!1550 (getValueByKey!179 (toList!863 lt!75616) lt!75611)))))

(declare-fun bs!6096 () Bool)

(assert (= bs!6096 d!46007))

(declare-fun m!174009 () Bool)

(assert (=> bs!6096 m!174009))

(assert (=> bs!6096 m!174009))

(declare-fun m!174011 () Bool)

(assert (=> bs!6096 m!174011))

(assert (=> b!144132 d!46007))

(declare-fun d!46009 () Bool)

(declare-fun e!94019 () Bool)

(assert (=> d!46009 e!94019))

(declare-fun res!68726 () Bool)

(assert (=> d!46009 (=> (not res!68726) (not e!94019))))

(declare-fun lt!75761 () ListLongMap!1695)

(assert (=> d!46009 (= res!68726 (contains!913 lt!75761 (_1!1332 (tuple2!2643 lt!75617 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(declare-fun lt!75762 () List!1730)

(assert (=> d!46009 (= lt!75761 (ListLongMap!1696 lt!75762))))

(declare-fun lt!75759 () Unit!4553)

(declare-fun lt!75760 () Unit!4553)

(assert (=> d!46009 (= lt!75759 lt!75760)))

(assert (=> d!46009 (= (getValueByKey!179 lt!75762 (_1!1332 (tuple2!2643 lt!75617 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))) (Some!184 (_2!1332 (tuple2!2643 lt!75617 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46009 (= lt!75760 (lemmaContainsTupThenGetReturnValue!93 lt!75762 (_1!1332 (tuple2!2643 lt!75617 (minValue!2822 (v!3308 (underlying!485 thiss!992))))) (_2!1332 (tuple2!2643 lt!75617 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46009 (= lt!75762 (insertStrictlySorted!96 (toList!863 lt!75616) (_1!1332 (tuple2!2643 lt!75617 (minValue!2822 (v!3308 (underlying!485 thiss!992))))) (_2!1332 (tuple2!2643 lt!75617 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46009 (= (+!175 lt!75616 (tuple2!2643 lt!75617 (minValue!2822 (v!3308 (underlying!485 thiss!992))))) lt!75761)))

(declare-fun b!144287 () Bool)

(declare-fun res!68725 () Bool)

(assert (=> b!144287 (=> (not res!68725) (not e!94019))))

(assert (=> b!144287 (= res!68725 (= (getValueByKey!179 (toList!863 lt!75761) (_1!1332 (tuple2!2643 lt!75617 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))) (Some!184 (_2!1332 (tuple2!2643 lt!75617 (minValue!2822 (v!3308 (underlying!485 thiss!992))))))))))

(declare-fun b!144288 () Bool)

(assert (=> b!144288 (= e!94019 (contains!916 (toList!863 lt!75761) (tuple2!2643 lt!75617 (minValue!2822 (v!3308 (underlying!485 thiss!992))))))))

(assert (= (and d!46009 res!68726) b!144287))

(assert (= (and b!144287 res!68725) b!144288))

(declare-fun m!174013 () Bool)

(assert (=> d!46009 m!174013))

(declare-fun m!174015 () Bool)

(assert (=> d!46009 m!174015))

(declare-fun m!174017 () Bool)

(assert (=> d!46009 m!174017))

(declare-fun m!174019 () Bool)

(assert (=> d!46009 m!174019))

(declare-fun m!174021 () Bool)

(assert (=> b!144287 m!174021))

(declare-fun m!174023 () Bool)

(assert (=> b!144288 m!174023))

(assert (=> b!144132 d!46009))

(declare-fun d!46011 () Bool)

(assert (=> d!46011 (= (apply!122 (+!175 lt!75616 (tuple2!2643 lt!75617 (minValue!2822 (v!3308 (underlying!485 thiss!992))))) lt!75611) (apply!122 lt!75616 lt!75611))))

(declare-fun lt!75765 () Unit!4553)

(declare-fun choose!887 (ListLongMap!1695 (_ BitVec 64) V!3569 (_ BitVec 64)) Unit!4553)

(assert (=> d!46011 (= lt!75765 (choose!887 lt!75616 lt!75617 (minValue!2822 (v!3308 (underlying!485 thiss!992))) lt!75611))))

(declare-fun e!94022 () Bool)

(assert (=> d!46011 e!94022))

(declare-fun res!68729 () Bool)

(assert (=> d!46011 (=> (not res!68729) (not e!94022))))

(assert (=> d!46011 (= res!68729 (contains!913 lt!75616 lt!75611))))

(assert (=> d!46011 (= (addApplyDifferent!98 lt!75616 lt!75617 (minValue!2822 (v!3308 (underlying!485 thiss!992))) lt!75611) lt!75765)))

(declare-fun b!144292 () Bool)

(assert (=> b!144292 (= e!94022 (not (= lt!75611 lt!75617)))))

(assert (= (and d!46011 res!68729) b!144292))

(declare-fun m!174025 () Bool)

(assert (=> d!46011 m!174025))

(assert (=> d!46011 m!173779))

(assert (=> d!46011 m!173791))

(declare-fun m!174027 () Bool)

(assert (=> d!46011 m!174027))

(assert (=> d!46011 m!173779))

(assert (=> d!46011 m!173781))

(assert (=> b!144132 d!46011))

(declare-fun d!46013 () Bool)

(assert (=> d!46013 (= (apply!122 (+!175 lt!75606 (tuple2!2643 lt!75605 (minValue!2822 (v!3308 (underlying!485 thiss!992))))) lt!75603) (apply!122 lt!75606 lt!75603))))

(declare-fun lt!75766 () Unit!4553)

(assert (=> d!46013 (= lt!75766 (choose!887 lt!75606 lt!75605 (minValue!2822 (v!3308 (underlying!485 thiss!992))) lt!75603))))

(declare-fun e!94023 () Bool)

(assert (=> d!46013 e!94023))

(declare-fun res!68730 () Bool)

(assert (=> d!46013 (=> (not res!68730) (not e!94023))))

(assert (=> d!46013 (= res!68730 (contains!913 lt!75606 lt!75603))))

(assert (=> d!46013 (= (addApplyDifferent!98 lt!75606 lt!75605 (minValue!2822 (v!3308 (underlying!485 thiss!992))) lt!75603) lt!75766)))

(declare-fun b!144293 () Bool)

(assert (=> b!144293 (= e!94023 (not (= lt!75603 lt!75605)))))

(assert (= (and d!46013 res!68730) b!144293))

(declare-fun m!174029 () Bool)

(assert (=> d!46013 m!174029))

(assert (=> d!46013 m!173785))

(assert (=> d!46013 m!173765))

(declare-fun m!174031 () Bool)

(assert (=> d!46013 m!174031))

(assert (=> d!46013 m!173785))

(assert (=> d!46013 m!173795))

(assert (=> b!144132 d!46013))

(declare-fun d!46015 () Bool)

(assert (=> d!46015 (= (apply!122 (+!175 lt!75612 (tuple2!2643 lt!75604 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))))) lt!75608) (apply!122 lt!75612 lt!75608))))

(declare-fun lt!75767 () Unit!4553)

(assert (=> d!46015 (= lt!75767 (choose!887 lt!75612 lt!75604 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))) lt!75608))))

(declare-fun e!94024 () Bool)

(assert (=> d!46015 e!94024))

(declare-fun res!68731 () Bool)

(assert (=> d!46015 (=> (not res!68731) (not e!94024))))

(assert (=> d!46015 (= res!68731 (contains!913 lt!75612 lt!75608))))

(assert (=> d!46015 (= (addApplyDifferent!98 lt!75612 lt!75604 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))) lt!75608) lt!75767)))

(declare-fun b!144294 () Bool)

(assert (=> b!144294 (= e!94024 (not (= lt!75608 lt!75604)))))

(assert (= (and d!46015 res!68731) b!144294))

(declare-fun m!174033 () Bool)

(assert (=> d!46015 m!174033))

(assert (=> d!46015 m!173767))

(assert (=> d!46015 m!173773))

(declare-fun m!174035 () Bool)

(assert (=> d!46015 m!174035))

(assert (=> d!46015 m!173767))

(assert (=> d!46015 m!173783))

(assert (=> b!144132 d!46015))

(declare-fun d!46017 () Bool)

(declare-fun e!94025 () Bool)

(assert (=> d!46017 e!94025))

(declare-fun res!68733 () Bool)

(assert (=> d!46017 (=> (not res!68733) (not e!94025))))

(declare-fun lt!75770 () ListLongMap!1695)

(assert (=> d!46017 (= res!68733 (contains!913 lt!75770 (_1!1332 (tuple2!2643 lt!75605 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(declare-fun lt!75771 () List!1730)

(assert (=> d!46017 (= lt!75770 (ListLongMap!1696 lt!75771))))

(declare-fun lt!75768 () Unit!4553)

(declare-fun lt!75769 () Unit!4553)

(assert (=> d!46017 (= lt!75768 lt!75769)))

(assert (=> d!46017 (= (getValueByKey!179 lt!75771 (_1!1332 (tuple2!2643 lt!75605 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))) (Some!184 (_2!1332 (tuple2!2643 lt!75605 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46017 (= lt!75769 (lemmaContainsTupThenGetReturnValue!93 lt!75771 (_1!1332 (tuple2!2643 lt!75605 (minValue!2822 (v!3308 (underlying!485 thiss!992))))) (_2!1332 (tuple2!2643 lt!75605 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46017 (= lt!75771 (insertStrictlySorted!96 (toList!863 lt!75606) (_1!1332 (tuple2!2643 lt!75605 (minValue!2822 (v!3308 (underlying!485 thiss!992))))) (_2!1332 (tuple2!2643 lt!75605 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46017 (= (+!175 lt!75606 (tuple2!2643 lt!75605 (minValue!2822 (v!3308 (underlying!485 thiss!992))))) lt!75770)))

(declare-fun b!144295 () Bool)

(declare-fun res!68732 () Bool)

(assert (=> b!144295 (=> (not res!68732) (not e!94025))))

(assert (=> b!144295 (= res!68732 (= (getValueByKey!179 (toList!863 lt!75770) (_1!1332 (tuple2!2643 lt!75605 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))) (Some!184 (_2!1332 (tuple2!2643 lt!75605 (minValue!2822 (v!3308 (underlying!485 thiss!992))))))))))

(declare-fun b!144296 () Bool)

(assert (=> b!144296 (= e!94025 (contains!916 (toList!863 lt!75770) (tuple2!2643 lt!75605 (minValue!2822 (v!3308 (underlying!485 thiss!992))))))))

(assert (= (and d!46017 res!68733) b!144295))

(assert (= (and b!144295 res!68732) b!144296))

(declare-fun m!174037 () Bool)

(assert (=> d!46017 m!174037))

(declare-fun m!174039 () Bool)

(assert (=> d!46017 m!174039))

(declare-fun m!174041 () Bool)

(assert (=> d!46017 m!174041))

(declare-fun m!174043 () Bool)

(assert (=> d!46017 m!174043))

(declare-fun m!174045 () Bool)

(assert (=> b!144295 m!174045))

(declare-fun m!174047 () Bool)

(assert (=> b!144296 m!174047))

(assert (=> b!144132 d!46017))

(declare-fun d!46019 () Bool)

(assert (=> d!46019 (= (apply!122 (+!175 lt!75612 (tuple2!2643 lt!75604 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))))) lt!75608) (get!1550 (getValueByKey!179 (toList!863 (+!175 lt!75612 (tuple2!2643 lt!75604 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))))) lt!75608)))))

(declare-fun bs!6097 () Bool)

(assert (= bs!6097 d!46019))

(declare-fun m!174049 () Bool)

(assert (=> bs!6097 m!174049))

(assert (=> bs!6097 m!174049))

(declare-fun m!174051 () Bool)

(assert (=> bs!6097 m!174051))

(assert (=> b!144132 d!46019))

(declare-fun d!46021 () Bool)

(assert (=> d!46021 (= (apply!122 (+!175 lt!75606 (tuple2!2643 lt!75605 (minValue!2822 (v!3308 (underlying!485 thiss!992))))) lt!75603) (get!1550 (getValueByKey!179 (toList!863 (+!175 lt!75606 (tuple2!2643 lt!75605 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))) lt!75603)))))

(declare-fun bs!6098 () Bool)

(assert (= bs!6098 d!46021))

(declare-fun m!174053 () Bool)

(assert (=> bs!6098 m!174053))

(assert (=> bs!6098 m!174053))

(declare-fun m!174055 () Bool)

(assert (=> bs!6098 m!174055))

(assert (=> b!144132 d!46021))

(declare-fun b!144321 () Bool)

(declare-fun lt!75788 () Unit!4553)

(declare-fun lt!75789 () Unit!4553)

(assert (=> b!144321 (= lt!75788 lt!75789)))

(declare-fun lt!75790 () (_ BitVec 64))

(declare-fun lt!75792 () (_ BitVec 64))

(declare-fun lt!75787 () V!3569)

(declare-fun lt!75791 () ListLongMap!1695)

(assert (=> b!144321 (not (contains!913 (+!175 lt!75791 (tuple2!2643 lt!75792 lt!75787)) lt!75790))))

(declare-fun addStillNotContains!68 (ListLongMap!1695 (_ BitVec 64) V!3569 (_ BitVec 64)) Unit!4553)

(assert (=> b!144321 (= lt!75789 (addStillNotContains!68 lt!75791 lt!75792 lt!75787 lt!75790))))

(assert (=> b!144321 (= lt!75790 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!144321 (= lt!75787 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!144321 (= lt!75792 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!16051 () ListLongMap!1695)

(assert (=> b!144321 (= lt!75791 call!16051)))

(declare-fun e!94046 () ListLongMap!1695)

(assert (=> b!144321 (= e!94046 (+!175 call!16051 (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!94041 () Bool)

(declare-fun lt!75786 () ListLongMap!1695)

(declare-fun b!144322 () Bool)

(assert (=> b!144322 (= e!94041 (= lt!75786 (getCurrentListMapNoExtraKeys!142 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (_values!2958 (v!3308 (underlying!485 thiss!992))) (mask!7333 (v!3308 (underlying!485 thiss!992))) (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) (zeroValue!2822 (v!3308 (underlying!485 thiss!992))) (minValue!2822 (v!3308 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))))))))

(declare-fun b!144323 () Bool)

(declare-fun e!94043 () Bool)

(declare-fun e!94045 () Bool)

(assert (=> b!144323 (= e!94043 e!94045)))

(assert (=> b!144323 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992))))))))

(declare-fun res!68745 () Bool)

(assert (=> b!144323 (= res!68745 (contains!913 lt!75786 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!144323 (=> (not res!68745) (not e!94045))))

(declare-fun b!144324 () Bool)

(declare-fun e!94040 () ListLongMap!1695)

(assert (=> b!144324 (= e!94040 (ListLongMap!1696 Nil!1727))))

(declare-fun d!46023 () Bool)

(declare-fun e!94042 () Bool)

(assert (=> d!46023 e!94042))

(declare-fun res!68744 () Bool)

(assert (=> d!46023 (=> (not res!68744) (not e!94042))))

(assert (=> d!46023 (= res!68744 (not (contains!913 lt!75786 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46023 (= lt!75786 e!94040)))

(declare-fun c!27327 () Bool)

(assert (=> d!46023 (= c!27327 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992))))))))

(assert (=> d!46023 (validMask!0 (mask!7333 (v!3308 (underlying!485 thiss!992))))))

(assert (=> d!46023 (= (getCurrentListMapNoExtraKeys!142 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (_values!2958 (v!3308 (underlying!485 thiss!992))) (mask!7333 (v!3308 (underlying!485 thiss!992))) (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) (zeroValue!2822 (v!3308 (underlying!485 thiss!992))) (minValue!2822 (v!3308 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3308 (underlying!485 thiss!992)))) lt!75786)))

(declare-fun b!144325 () Bool)

(assert (=> b!144325 (= e!94043 e!94041)))

(declare-fun c!27330 () Bool)

(assert (=> b!144325 (= c!27330 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992))))))))

(declare-fun b!144326 () Bool)

(assert (=> b!144326 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992))))))))

(assert (=> b!144326 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2593 (_values!2958 (v!3308 (underlying!485 thiss!992))))))))

(assert (=> b!144326 (= e!94045 (= (apply!122 lt!75786 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!144327 () Bool)

(assert (=> b!144327 (= e!94046 call!16051)))

(declare-fun b!144328 () Bool)

(declare-fun isEmpty!429 (ListLongMap!1695) Bool)

(assert (=> b!144328 (= e!94041 (isEmpty!429 lt!75786))))

(declare-fun bm!16048 () Bool)

(assert (=> bm!16048 (= call!16051 (getCurrentListMapNoExtraKeys!142 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (_values!2958 (v!3308 (underlying!485 thiss!992))) (mask!7333 (v!3308 (underlying!485 thiss!992))) (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) (zeroValue!2822 (v!3308 (underlying!485 thiss!992))) (minValue!2822 (v!3308 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2975 (v!3308 (underlying!485 thiss!992)))))))

(declare-fun b!144329 () Bool)

(declare-fun e!94044 () Bool)

(assert (=> b!144329 (= e!94044 (validKeyInArray!0 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!144329 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!144330 () Bool)

(declare-fun res!68742 () Bool)

(assert (=> b!144330 (=> (not res!68742) (not e!94042))))

(assert (=> b!144330 (= res!68742 (not (contains!913 lt!75786 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!144331 () Bool)

(assert (=> b!144331 (= e!94040 e!94046)))

(declare-fun c!27328 () Bool)

(assert (=> b!144331 (= c!27328 (validKeyInArray!0 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!144332 () Bool)

(assert (=> b!144332 (= e!94042 e!94043)))

(declare-fun c!27329 () Bool)

(assert (=> b!144332 (= c!27329 e!94044)))

(declare-fun res!68743 () Bool)

(assert (=> b!144332 (=> (not res!68743) (not e!94044))))

(assert (=> b!144332 (= res!68743 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992))))))))

(assert (= (and d!46023 c!27327) b!144324))

(assert (= (and d!46023 (not c!27327)) b!144331))

(assert (= (and b!144331 c!27328) b!144321))

(assert (= (and b!144331 (not c!27328)) b!144327))

(assert (= (or b!144321 b!144327) bm!16048))

(assert (= (and d!46023 res!68744) b!144330))

(assert (= (and b!144330 res!68742) b!144332))

(assert (= (and b!144332 res!68743) b!144329))

(assert (= (and b!144332 c!27329) b!144323))

(assert (= (and b!144332 (not c!27329)) b!144325))

(assert (= (and b!144323 res!68745) b!144326))

(assert (= (and b!144325 c!27330) b!144322))

(assert (= (and b!144325 (not c!27330)) b!144328))

(declare-fun b_lambda!6483 () Bool)

(assert (=> (not b_lambda!6483) (not b!144321)))

(assert (=> b!144321 t!6344))

(declare-fun b_and!8997 () Bool)

(assert (= b_and!8993 (and (=> t!6344 result!4223) b_and!8997)))

(assert (=> b!144321 t!6346))

(declare-fun b_and!8999 () Bool)

(assert (= b_and!8995 (and (=> t!6346 result!4227) b_and!8999)))

(declare-fun b_lambda!6485 () Bool)

(assert (=> (not b_lambda!6485) (not b!144326)))

(assert (=> b!144326 t!6344))

(declare-fun b_and!9001 () Bool)

(assert (= b_and!8997 (and (=> t!6344 result!4223) b_and!9001)))

(assert (=> b!144326 t!6346))

(declare-fun b_and!9003 () Bool)

(assert (= b_and!8999 (and (=> t!6346 result!4227) b_and!9003)))

(declare-fun m!174057 () Bool)

(assert (=> b!144330 m!174057))

(assert (=> b!144326 m!173679))

(declare-fun m!174059 () Bool)

(assert (=> b!144326 m!174059))

(assert (=> b!144326 m!173801))

(assert (=> b!144326 m!173565))

(assert (=> b!144326 m!173803))

(assert (=> b!144326 m!173565))

(assert (=> b!144326 m!173801))

(assert (=> b!144326 m!173679))

(declare-fun m!174061 () Bool)

(assert (=> bm!16048 m!174061))

(declare-fun m!174063 () Bool)

(assert (=> b!144328 m!174063))

(assert (=> b!144322 m!174061))

(declare-fun m!174065 () Bool)

(assert (=> b!144321 m!174065))

(assert (=> b!144321 m!173801))

(assert (=> b!144321 m!173565))

(assert (=> b!144321 m!173803))

(declare-fun m!174067 () Bool)

(assert (=> b!144321 m!174067))

(declare-fun m!174069 () Bool)

(assert (=> b!144321 m!174069))

(assert (=> b!144321 m!174067))

(declare-fun m!174071 () Bool)

(assert (=> b!144321 m!174071))

(assert (=> b!144321 m!173565))

(assert (=> b!144321 m!173801))

(assert (=> b!144321 m!173679))

(declare-fun m!174073 () Bool)

(assert (=> d!46023 m!174073))

(assert (=> d!46023 m!173685))

(assert (=> b!144323 m!173679))

(assert (=> b!144323 m!173679))

(declare-fun m!174075 () Bool)

(assert (=> b!144323 m!174075))

(assert (=> b!144329 m!173679))

(assert (=> b!144329 m!173679))

(assert (=> b!144329 m!173761))

(assert (=> b!144331 m!173679))

(assert (=> b!144331 m!173679))

(assert (=> b!144331 m!173761))

(assert (=> b!144132 d!46023))

(declare-fun d!46025 () Bool)

(declare-fun e!94047 () Bool)

(assert (=> d!46025 e!94047))

(declare-fun res!68746 () Bool)

(assert (=> d!46025 (=> res!68746 e!94047)))

(declare-fun lt!75793 () Bool)

(assert (=> d!46025 (= res!68746 (not lt!75793))))

(declare-fun lt!75795 () Bool)

(assert (=> d!46025 (= lt!75793 lt!75795)))

(declare-fun lt!75794 () Unit!4553)

(declare-fun e!94048 () Unit!4553)

(assert (=> d!46025 (= lt!75794 e!94048)))

(declare-fun c!27331 () Bool)

(assert (=> d!46025 (= c!27331 lt!75795)))

(assert (=> d!46025 (= lt!75795 (containsKey!182 (toList!863 (+!175 lt!75621 (tuple2!2643 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))))) lt!75619))))

(assert (=> d!46025 (= (contains!913 (+!175 lt!75621 (tuple2!2643 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))))) lt!75619) lt!75793)))

(declare-fun b!144333 () Bool)

(declare-fun lt!75796 () Unit!4553)

(assert (=> b!144333 (= e!94048 lt!75796)))

(assert (=> b!144333 (= lt!75796 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!863 (+!175 lt!75621 (tuple2!2643 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))))) lt!75619))))

(assert (=> b!144333 (isDefined!131 (getValueByKey!179 (toList!863 (+!175 lt!75621 (tuple2!2643 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))))) lt!75619))))

(declare-fun b!144334 () Bool)

(declare-fun Unit!4567 () Unit!4553)

(assert (=> b!144334 (= e!94048 Unit!4567)))

(declare-fun b!144335 () Bool)

(assert (=> b!144335 (= e!94047 (isDefined!131 (getValueByKey!179 (toList!863 (+!175 lt!75621 (tuple2!2643 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))))) lt!75619)))))

(assert (= (and d!46025 c!27331) b!144333))

(assert (= (and d!46025 (not c!27331)) b!144334))

(assert (= (and d!46025 (not res!68746)) b!144335))

(declare-fun m!174077 () Bool)

(assert (=> d!46025 m!174077))

(declare-fun m!174079 () Bool)

(assert (=> b!144333 m!174079))

(declare-fun m!174081 () Bool)

(assert (=> b!144333 m!174081))

(assert (=> b!144333 m!174081))

(declare-fun m!174083 () Bool)

(assert (=> b!144333 m!174083))

(assert (=> b!144335 m!174081))

(assert (=> b!144335 m!174081))

(assert (=> b!144335 m!174083))

(assert (=> b!144132 d!46025))

(declare-fun d!46027 () Bool)

(assert (=> d!46027 (= (apply!122 lt!75606 lt!75603) (get!1550 (getValueByKey!179 (toList!863 lt!75606) lt!75603)))))

(declare-fun bs!6099 () Bool)

(assert (= bs!6099 d!46027))

(declare-fun m!174085 () Bool)

(assert (=> bs!6099 m!174085))

(assert (=> bs!6099 m!174085))

(declare-fun m!174087 () Bool)

(assert (=> bs!6099 m!174087))

(assert (=> b!144132 d!46027))

(declare-fun d!46029 () Bool)

(declare-fun e!94049 () Bool)

(assert (=> d!46029 e!94049))

(declare-fun res!68748 () Bool)

(assert (=> d!46029 (=> (not res!68748) (not e!94049))))

(declare-fun lt!75799 () ListLongMap!1695)

(assert (=> d!46029 (= res!68748 (contains!913 lt!75799 (_1!1332 (tuple2!2643 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(declare-fun lt!75800 () List!1730)

(assert (=> d!46029 (= lt!75799 (ListLongMap!1696 lt!75800))))

(declare-fun lt!75797 () Unit!4553)

(declare-fun lt!75798 () Unit!4553)

(assert (=> d!46029 (= lt!75797 lt!75798)))

(assert (=> d!46029 (= (getValueByKey!179 lt!75800 (_1!1332 (tuple2!2643 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))))) (Some!184 (_2!1332 (tuple2!2643 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46029 (= lt!75798 (lemmaContainsTupThenGetReturnValue!93 lt!75800 (_1!1332 (tuple2!2643 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))))) (_2!1332 (tuple2!2643 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46029 (= lt!75800 (insertStrictlySorted!96 (toList!863 lt!75621) (_1!1332 (tuple2!2643 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))))) (_2!1332 (tuple2!2643 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46029 (= (+!175 lt!75621 (tuple2!2643 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))))) lt!75799)))

(declare-fun b!144336 () Bool)

(declare-fun res!68747 () Bool)

(assert (=> b!144336 (=> (not res!68747) (not e!94049))))

(assert (=> b!144336 (= res!68747 (= (getValueByKey!179 (toList!863 lt!75799) (_1!1332 (tuple2!2643 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))))) (Some!184 (_2!1332 (tuple2!2643 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))))))))))

(declare-fun b!144337 () Bool)

(assert (=> b!144337 (= e!94049 (contains!916 (toList!863 lt!75799) (tuple2!2643 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))))))))

(assert (= (and d!46029 res!68748) b!144336))

(assert (= (and b!144336 res!68747) b!144337))

(declare-fun m!174089 () Bool)

(assert (=> d!46029 m!174089))

(declare-fun m!174091 () Bool)

(assert (=> d!46029 m!174091))

(declare-fun m!174093 () Bool)

(assert (=> d!46029 m!174093))

(declare-fun m!174095 () Bool)

(assert (=> d!46029 m!174095))

(declare-fun m!174097 () Bool)

(assert (=> b!144336 m!174097))

(declare-fun m!174099 () Bool)

(assert (=> b!144337 m!174099))

(assert (=> b!144132 d!46029))

(declare-fun d!46031 () Bool)

(assert (=> d!46031 (= (apply!122 lt!75612 lt!75608) (get!1550 (getValueByKey!179 (toList!863 lt!75612) lt!75608)))))

(declare-fun bs!6100 () Bool)

(assert (= bs!6100 d!46031))

(declare-fun m!174101 () Bool)

(assert (=> bs!6100 m!174101))

(assert (=> bs!6100 m!174101))

(declare-fun m!174103 () Bool)

(assert (=> bs!6100 m!174103))

(assert (=> b!144132 d!46031))

(declare-fun d!46033 () Bool)

(declare-fun e!94050 () Bool)

(assert (=> d!46033 e!94050))

(declare-fun res!68750 () Bool)

(assert (=> d!46033 (=> (not res!68750) (not e!94050))))

(declare-fun lt!75803 () ListLongMap!1695)

(assert (=> d!46033 (= res!68750 (contains!913 lt!75803 (_1!1332 (tuple2!2643 lt!75604 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(declare-fun lt!75804 () List!1730)

(assert (=> d!46033 (= lt!75803 (ListLongMap!1696 lt!75804))))

(declare-fun lt!75801 () Unit!4553)

(declare-fun lt!75802 () Unit!4553)

(assert (=> d!46033 (= lt!75801 lt!75802)))

(assert (=> d!46033 (= (getValueByKey!179 lt!75804 (_1!1332 (tuple2!2643 lt!75604 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))))) (Some!184 (_2!1332 (tuple2!2643 lt!75604 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46033 (= lt!75802 (lemmaContainsTupThenGetReturnValue!93 lt!75804 (_1!1332 (tuple2!2643 lt!75604 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))))) (_2!1332 (tuple2!2643 lt!75604 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46033 (= lt!75804 (insertStrictlySorted!96 (toList!863 lt!75612) (_1!1332 (tuple2!2643 lt!75604 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))))) (_2!1332 (tuple2!2643 lt!75604 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46033 (= (+!175 lt!75612 (tuple2!2643 lt!75604 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))))) lt!75803)))

(declare-fun b!144338 () Bool)

(declare-fun res!68749 () Bool)

(assert (=> b!144338 (=> (not res!68749) (not e!94050))))

(assert (=> b!144338 (= res!68749 (= (getValueByKey!179 (toList!863 lt!75803) (_1!1332 (tuple2!2643 lt!75604 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))))) (Some!184 (_2!1332 (tuple2!2643 lt!75604 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))))))))))

(declare-fun b!144339 () Bool)

(assert (=> b!144339 (= e!94050 (contains!916 (toList!863 lt!75803) (tuple2!2643 lt!75604 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))))))))

(assert (= (and d!46033 res!68750) b!144338))

(assert (= (and b!144338 res!68749) b!144339))

(declare-fun m!174105 () Bool)

(assert (=> d!46033 m!174105))

(declare-fun m!174107 () Bool)

(assert (=> d!46033 m!174107))

(declare-fun m!174109 () Bool)

(assert (=> d!46033 m!174109))

(declare-fun m!174111 () Bool)

(assert (=> d!46033 m!174111))

(declare-fun m!174113 () Bool)

(assert (=> b!144338 m!174113))

(declare-fun m!174115 () Bool)

(assert (=> b!144339 m!174115))

(assert (=> b!144132 d!46033))

(declare-fun d!46035 () Bool)

(assert (=> d!46035 (contains!913 (+!175 lt!75621 (tuple2!2643 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))))) lt!75619)))

(declare-fun lt!75807 () Unit!4553)

(declare-fun choose!888 (ListLongMap!1695 (_ BitVec 64) V!3569 (_ BitVec 64)) Unit!4553)

(assert (=> d!46035 (= lt!75807 (choose!888 lt!75621 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))) lt!75619))))

(assert (=> d!46035 (contains!913 lt!75621 lt!75619)))

(assert (=> d!46035 (= (addStillContains!98 lt!75621 lt!75607 (zeroValue!2822 (v!3308 (underlying!485 thiss!992))) lt!75619) lt!75807)))

(declare-fun bs!6101 () Bool)

(assert (= bs!6101 d!46035))

(assert (=> bs!6101 m!173787))

(assert (=> bs!6101 m!173787))

(assert (=> bs!6101 m!173789))

(declare-fun m!174117 () Bool)

(assert (=> bs!6101 m!174117))

(declare-fun m!174119 () Bool)

(assert (=> bs!6101 m!174119))

(assert (=> b!144132 d!46035))

(declare-fun d!46037 () Bool)

(assert (=> d!46037 (= (apply!122 (+!175 lt!75616 (tuple2!2643 lt!75617 (minValue!2822 (v!3308 (underlying!485 thiss!992))))) lt!75611) (get!1550 (getValueByKey!179 (toList!863 (+!175 lt!75616 (tuple2!2643 lt!75617 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))) lt!75611)))))

(declare-fun bs!6102 () Bool)

(assert (= bs!6102 d!46037))

(declare-fun m!174121 () Bool)

(assert (=> bs!6102 m!174121))

(assert (=> bs!6102 m!174121))

(declare-fun m!174123 () Bool)

(assert (=> bs!6102 m!174123))

(assert (=> b!144132 d!46037))

(declare-fun b!144349 () Bool)

(declare-fun e!94057 () Bool)

(declare-fun call!16054 () Bool)

(assert (=> b!144349 (= e!94057 call!16054)))

(declare-fun b!144350 () Bool)

(declare-fun e!94059 () Bool)

(assert (=> b!144350 (= e!94059 e!94057)))

(declare-fun c!27334 () Bool)

(assert (=> b!144350 (= c!27334 (validKeyInArray!0 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144351 () Bool)

(declare-fun e!94058 () Bool)

(assert (=> b!144351 (= e!94057 e!94058)))

(declare-fun lt!75816 () (_ BitVec 64))

(assert (=> b!144351 (= lt!75816 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75815 () Unit!4553)

(assert (=> b!144351 (= lt!75815 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4740 newMap!16) lt!75816 #b00000000000000000000000000000000))))

(assert (=> b!144351 (arrayContainsKey!0 (_keys!4740 newMap!16) lt!75816 #b00000000000000000000000000000000)))

(declare-fun lt!75814 () Unit!4553)

(assert (=> b!144351 (= lt!75814 lt!75815)))

(declare-fun res!68756 () Bool)

(assert (=> b!144351 (= res!68756 (= (seekEntryOrOpen!0 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000) (_keys!4740 newMap!16) (mask!7333 newMap!16)) (Found!275 #b00000000000000000000000000000000)))))

(assert (=> b!144351 (=> (not res!68756) (not e!94058))))

(declare-fun bm!16051 () Bool)

(assert (=> bm!16051 (= call!16054 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4740 newMap!16) (mask!7333 newMap!16)))))

(declare-fun d!46039 () Bool)

(declare-fun res!68755 () Bool)

(assert (=> d!46039 (=> res!68755 e!94059)))

(assert (=> d!46039 (= res!68755 (bvsge #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))))))

(assert (=> d!46039 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4740 newMap!16) (mask!7333 newMap!16)) e!94059)))

(declare-fun b!144352 () Bool)

(assert (=> b!144352 (= e!94058 call!16054)))

(assert (= (and d!46039 (not res!68755)) b!144350))

(assert (= (and b!144350 c!27334) b!144351))

(assert (= (and b!144350 (not c!27334)) b!144349))

(assert (= (and b!144351 res!68756) b!144352))

(assert (= (or b!144352 b!144349) bm!16051))

(assert (=> b!144350 m!173865))

(assert (=> b!144350 m!173865))

(assert (=> b!144350 m!173867))

(assert (=> b!144351 m!173865))

(declare-fun m!174125 () Bool)

(assert (=> b!144351 m!174125))

(declare-fun m!174127 () Bool)

(assert (=> b!144351 m!174127))

(assert (=> b!144351 m!173865))

(declare-fun m!174129 () Bool)

(assert (=> b!144351 m!174129))

(declare-fun m!174131 () Bool)

(assert (=> bm!16051 m!174131))

(assert (=> b!144154 d!46039))

(declare-fun d!46041 () Bool)

(declare-fun lt!75817 () Bool)

(assert (=> d!46041 (= lt!75817 (select (content!141 (t!6348 lt!75417)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94061 () Bool)

(assert (=> d!46041 (= lt!75817 e!94061)))

(declare-fun res!68758 () Bool)

(assert (=> d!46041 (=> (not res!68758) (not e!94061))))

(assert (=> d!46041 (= res!68758 ((_ is Cons!1727) (t!6348 lt!75417)))))

(assert (=> d!46041 (= (contains!914 (t!6348 lt!75417) #b1000000000000000000000000000000000000000000000000000000000000000) lt!75817)))

(declare-fun b!144353 () Bool)

(declare-fun e!94060 () Bool)

(assert (=> b!144353 (= e!94061 e!94060)))

(declare-fun res!68757 () Bool)

(assert (=> b!144353 (=> res!68757 e!94060)))

(assert (=> b!144353 (= res!68757 (= (h!2335 (t!6348 lt!75417)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144354 () Bool)

(assert (=> b!144354 (= e!94060 (contains!914 (t!6348 (t!6348 lt!75417)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46041 res!68758) b!144353))

(assert (= (and b!144353 (not res!68757)) b!144354))

(assert (=> d!46041 m!173935))

(declare-fun m!174133 () Bool)

(assert (=> d!46041 m!174133))

(declare-fun m!174135 () Bool)

(assert (=> b!144354 m!174135))

(assert (=> b!143940 d!46041))

(declare-fun d!46043 () Bool)

(assert (=> d!46043 (= (validKeyInArray!0 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)) (and (not (= (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143922 d!46043))

(assert (=> bm!16021 d!46023))

(declare-fun d!46045 () Bool)

(declare-fun res!68759 () Bool)

(declare-fun e!94062 () Bool)

(assert (=> d!46045 (=> (not res!68759) (not e!94062))))

(assert (=> d!46045 (= res!68759 (simpleValid!98 (_2!1333 lt!75542)))))

(assert (=> d!46045 (= (valid!577 (_2!1333 lt!75542)) e!94062)))

(declare-fun b!144355 () Bool)

(declare-fun res!68760 () Bool)

(assert (=> b!144355 (=> (not res!68760) (not e!94062))))

(assert (=> b!144355 (= res!68760 (= (arrayCountValidKeys!0 (_keys!4740 (_2!1333 lt!75542)) #b00000000000000000000000000000000 (size!2592 (_keys!4740 (_2!1333 lt!75542)))) (_size!630 (_2!1333 lt!75542))))))

(declare-fun b!144356 () Bool)

(declare-fun res!68761 () Bool)

(assert (=> b!144356 (=> (not res!68761) (not e!94062))))

(assert (=> b!144356 (= res!68761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4740 (_2!1333 lt!75542)) (mask!7333 (_2!1333 lt!75542))))))

(declare-fun b!144357 () Bool)

(assert (=> b!144357 (= e!94062 (arrayNoDuplicates!0 (_keys!4740 (_2!1333 lt!75542)) #b00000000000000000000000000000000 Nil!1728))))

(assert (= (and d!46045 res!68759) b!144355))

(assert (= (and b!144355 res!68760) b!144356))

(assert (= (and b!144356 res!68761) b!144357))

(declare-fun m!174137 () Bool)

(assert (=> d!46045 m!174137))

(declare-fun m!174139 () Bool)

(assert (=> b!144355 m!174139))

(declare-fun m!174141 () Bool)

(assert (=> b!144356 m!174141))

(declare-fun m!174143 () Bool)

(assert (=> b!144357 m!174143))

(assert (=> d!45957 d!46045))

(assert (=> d!45957 d!45973))

(declare-fun d!46047 () Bool)

(declare-fun lt!75818 () Bool)

(assert (=> d!46047 (= lt!75818 (select (content!141 (t!6348 lt!75417)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94064 () Bool)

(assert (=> d!46047 (= lt!75818 e!94064)))

(declare-fun res!68763 () Bool)

(assert (=> d!46047 (=> (not res!68763) (not e!94064))))

(assert (=> d!46047 (= res!68763 ((_ is Cons!1727) (t!6348 lt!75417)))))

(assert (=> d!46047 (= (contains!914 (t!6348 lt!75417) #b0000000000000000000000000000000000000000000000000000000000000000) lt!75818)))

(declare-fun b!144358 () Bool)

(declare-fun e!94063 () Bool)

(assert (=> b!144358 (= e!94064 e!94063)))

(declare-fun res!68762 () Bool)

(assert (=> b!144358 (=> res!68762 e!94063)))

(assert (=> b!144358 (= res!68762 (= (h!2335 (t!6348 lt!75417)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144359 () Bool)

(assert (=> b!144359 (= e!94063 (contains!914 (t!6348 (t!6348 lt!75417)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46047 res!68763) b!144358))

(assert (= (and b!144358 (not res!68762)) b!144359))

(assert (=> d!46047 m!173935))

(declare-fun m!174145 () Bool)

(assert (=> d!46047 m!174145))

(declare-fun m!174147 () Bool)

(assert (=> b!144359 m!174147))

(assert (=> b!144146 d!46047))

(declare-fun d!46049 () Bool)

(declare-fun e!94065 () Bool)

(assert (=> d!46049 e!94065))

(declare-fun res!68764 () Bool)

(assert (=> d!46049 (=> res!68764 e!94065)))

(declare-fun lt!75819 () Bool)

(assert (=> d!46049 (= res!68764 (not lt!75819))))

(declare-fun lt!75821 () Bool)

(assert (=> d!46049 (= lt!75819 lt!75821)))

(declare-fun lt!75820 () Unit!4553)

(declare-fun e!94066 () Unit!4553)

(assert (=> d!46049 (= lt!75820 e!94066)))

(declare-fun c!27335 () Bool)

(assert (=> d!46049 (= c!27335 lt!75821)))

(assert (=> d!46049 (= lt!75821 (containsKey!182 (toList!863 lt!75609) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!46049 (= (contains!913 lt!75609 #b1000000000000000000000000000000000000000000000000000000000000000) lt!75819)))

(declare-fun b!144360 () Bool)

(declare-fun lt!75822 () Unit!4553)

(assert (=> b!144360 (= e!94066 lt!75822)))

(assert (=> b!144360 (= lt!75822 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!863 lt!75609) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144360 (isDefined!131 (getValueByKey!179 (toList!863 lt!75609) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144361 () Bool)

(declare-fun Unit!4568 () Unit!4553)

(assert (=> b!144361 (= e!94066 Unit!4568)))

(declare-fun b!144362 () Bool)

(assert (=> b!144362 (= e!94065 (isDefined!131 (getValueByKey!179 (toList!863 lt!75609) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46049 c!27335) b!144360))

(assert (= (and d!46049 (not c!27335)) b!144361))

(assert (= (and d!46049 (not res!68764)) b!144362))

(declare-fun m!174149 () Bool)

(assert (=> d!46049 m!174149))

(declare-fun m!174151 () Bool)

(assert (=> b!144360 m!174151))

(declare-fun m!174153 () Bool)

(assert (=> b!144360 m!174153))

(assert (=> b!144360 m!174153))

(declare-fun m!174155 () Bool)

(assert (=> b!144360 m!174155))

(assert (=> b!144362 m!174153))

(assert (=> b!144362 m!174153))

(assert (=> b!144362 m!174155))

(assert (=> bm!16025 d!46049))

(declare-fun d!46051 () Bool)

(assert (=> d!46051 (= (get!1548 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3307 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> b!144080 d!46051))

(declare-fun d!46053 () Bool)

(assert (=> d!46053 (= (apply!122 lt!75609 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1550 (getValueByKey!179 (toList!863 lt!75609) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6103 () Bool)

(assert (= bs!6103 d!46053))

(assert (=> bs!6103 m!173837))

(assert (=> bs!6103 m!173837))

(declare-fun m!174157 () Bool)

(assert (=> bs!6103 m!174157))

(assert (=> b!144144 d!46053))

(declare-fun d!46055 () Bool)

(declare-fun e!94069 () Bool)

(assert (=> d!46055 e!94069))

(declare-fun res!68770 () Bool)

(assert (=> d!46055 (=> (not res!68770) (not e!94069))))

(declare-fun lt!75827 () SeekEntryResult!275)

(assert (=> d!46055 (= res!68770 ((_ is Found!275) lt!75827))))

(assert (=> d!46055 (= lt!75827 (seekEntryOrOpen!0 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (_keys!4740 newMap!16) (mask!7333 newMap!16)))))

(declare-fun lt!75828 () Unit!4553)

(declare-fun choose!889 (array!4907 array!4909 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 64) Int) Unit!4553)

(assert (=> d!46055 (= lt!75828 (choose!889 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (defaultEntry!2975 newMap!16)))))

(assert (=> d!46055 (validMask!0 (mask!7333 newMap!16))))

(assert (=> d!46055 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!67 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (defaultEntry!2975 newMap!16)) lt!75828)))

(declare-fun b!144367 () Bool)

(declare-fun res!68769 () Bool)

(assert (=> b!144367 (=> (not res!68769) (not e!94069))))

(assert (=> b!144367 (= res!68769 (inRange!0 (index!3266 lt!75827) (mask!7333 newMap!16)))))

(declare-fun b!144368 () Bool)

(assert (=> b!144368 (= e!94069 (= (select (arr!2318 (_keys!4740 newMap!16)) (index!3266 lt!75827)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> b!144368 (and (bvsge (index!3266 lt!75827) #b00000000000000000000000000000000) (bvslt (index!3266 lt!75827) (size!2592 (_keys!4740 newMap!16))))))

(assert (= (and d!46055 res!68770) b!144367))

(assert (= (and b!144367 res!68769) b!144368))

(assert (=> d!46055 m!173531))

(assert (=> d!46055 m!173709))

(assert (=> d!46055 m!173531))

(declare-fun m!174159 () Bool)

(assert (=> d!46055 m!174159))

(assert (=> d!46055 m!173913))

(declare-fun m!174161 () Bool)

(assert (=> b!144367 m!174161))

(declare-fun m!174163 () Bool)

(assert (=> b!144368 m!174163))

(assert (=> bm!15993 d!46055))

(declare-fun d!46057 () Bool)

(declare-fun e!94072 () Bool)

(assert (=> d!46057 e!94072))

(declare-fun c!27338 () Bool)

(assert (=> d!46057 (= c!27338 (and (not (= (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!46057 true))

(declare-fun _$29!171 () Unit!4553)

(assert (=> d!46057 (= (choose!886 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (_values!2958 (v!3308 (underlying!485 thiss!992))) (mask!7333 (v!3308 (underlying!485 thiss!992))) (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) (zeroValue!2822 (v!3308 (underlying!485 thiss!992))) (minValue!2822 (v!3308 (underlying!485 thiss!992))) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3308 (underlying!485 thiss!992)))) _$29!171)))

(declare-fun b!144373 () Bool)

(assert (=> b!144373 (= e!94072 (arrayContainsKey!0 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!144374 () Bool)

(assert (=> b!144374 (= e!94072 (ite (= (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2724 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!46057 c!27338) b!144373))

(assert (= (and d!46057 (not c!27338)) b!144374))

(assert (=> b!144373 m!173531))

(assert (=> b!144373 m!173561))

(assert (=> d!45951 d!46057))

(assert (=> d!45951 d!45977))

(declare-fun d!46059 () Bool)

(declare-fun lt!75829 () Bool)

(assert (=> d!46059 (= lt!75829 (select (content!141 (t!6348 lt!75417)) (h!2335 lt!75417)))))

(declare-fun e!94074 () Bool)

(assert (=> d!46059 (= lt!75829 e!94074)))

(declare-fun res!68772 () Bool)

(assert (=> d!46059 (=> (not res!68772) (not e!94074))))

(assert (=> d!46059 (= res!68772 ((_ is Cons!1727) (t!6348 lt!75417)))))

(assert (=> d!46059 (= (contains!914 (t!6348 lt!75417) (h!2335 lt!75417)) lt!75829)))

(declare-fun b!144375 () Bool)

(declare-fun e!94073 () Bool)

(assert (=> b!144375 (= e!94074 e!94073)))

(declare-fun res!68771 () Bool)

(assert (=> b!144375 (=> res!68771 e!94073)))

(assert (=> b!144375 (= res!68771 (= (h!2335 (t!6348 lt!75417)) (h!2335 lt!75417)))))

(declare-fun b!144376 () Bool)

(assert (=> b!144376 (= e!94073 (contains!914 (t!6348 (t!6348 lt!75417)) (h!2335 lt!75417)))))

(assert (= (and d!46059 res!68772) b!144375))

(assert (= (and b!144375 (not res!68771)) b!144376))

(assert (=> d!46059 m!173935))

(declare-fun m!174165 () Bool)

(assert (=> d!46059 m!174165))

(declare-fun m!174167 () Bool)

(assert (=> b!144376 m!174167))

(assert (=> b!143906 d!46059))

(declare-fun d!46061 () Bool)

(declare-fun e!94075 () Bool)

(assert (=> d!46061 e!94075))

(declare-fun res!68773 () Bool)

(assert (=> d!46061 (=> res!68773 e!94075)))

(declare-fun lt!75830 () Bool)

(assert (=> d!46061 (= res!68773 (not lt!75830))))

(declare-fun lt!75832 () Bool)

(assert (=> d!46061 (= lt!75830 lt!75832)))

(declare-fun lt!75831 () Unit!4553)

(declare-fun e!94076 () Unit!4553)

(assert (=> d!46061 (= lt!75831 e!94076)))

(declare-fun c!27339 () Bool)

(assert (=> d!46061 (= c!27339 lt!75832)))

(assert (=> d!46061 (= lt!75832 (containsKey!182 (toList!863 e!93900) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!46061 (= (contains!913 e!93900 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)) lt!75830)))

(declare-fun b!144377 () Bool)

(declare-fun lt!75833 () Unit!4553)

(assert (=> b!144377 (= e!94076 lt!75833)))

(assert (=> b!144377 (= lt!75833 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!863 e!93900) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> b!144377 (isDefined!131 (getValueByKey!179 (toList!863 e!93900) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!144378 () Bool)

(declare-fun Unit!4569 () Unit!4553)

(assert (=> b!144378 (= e!94076 Unit!4569)))

(declare-fun b!144379 () Bool)

(assert (=> b!144379 (= e!94075 (isDefined!131 (getValueByKey!179 (toList!863 e!93900) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355))))))

(assert (= (and d!46061 c!27339) b!144377))

(assert (= (and d!46061 (not c!27339)) b!144378))

(assert (= (and d!46061 (not res!68773)) b!144379))

(assert (=> d!46061 m!173531))

(declare-fun m!174169 () Bool)

(assert (=> d!46061 m!174169))

(assert (=> b!144377 m!173531))

(declare-fun m!174171 () Bool)

(assert (=> b!144377 m!174171))

(assert (=> b!144377 m!173531))

(declare-fun m!174173 () Bool)

(assert (=> b!144377 m!174173))

(assert (=> b!144377 m!174173))

(declare-fun m!174175 () Bool)

(assert (=> b!144377 m!174175))

(assert (=> b!144379 m!173531))

(assert (=> b!144379 m!174173))

(assert (=> b!144379 m!174173))

(assert (=> b!144379 m!174175))

(assert (=> bm!15991 d!46061))

(declare-fun d!46063 () Bool)

(declare-fun res!68778 () Bool)

(declare-fun e!94081 () Bool)

(assert (=> d!46063 (=> res!68778 e!94081)))

(assert (=> d!46063 (= res!68778 (and ((_ is Cons!1726) (toList!863 lt!75416)) (= (_1!1332 (h!2334 (toList!863 lt!75416))) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355))))))

(assert (=> d!46063 (= (containsKey!182 (toList!863 lt!75416) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)) e!94081)))

(declare-fun b!144384 () Bool)

(declare-fun e!94082 () Bool)

(assert (=> b!144384 (= e!94081 e!94082)))

(declare-fun res!68779 () Bool)

(assert (=> b!144384 (=> (not res!68779) (not e!94082))))

(assert (=> b!144384 (= res!68779 (and (or (not ((_ is Cons!1726) (toList!863 lt!75416))) (bvsle (_1!1332 (h!2334 (toList!863 lt!75416))) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355))) ((_ is Cons!1726) (toList!863 lt!75416)) (bvslt (_1!1332 (h!2334 (toList!863 lt!75416))) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355))))))

(declare-fun b!144385 () Bool)

(assert (=> b!144385 (= e!94082 (containsKey!182 (t!6347 (toList!863 lt!75416)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (= (and d!46063 (not res!68778)) b!144384))

(assert (= (and b!144384 res!68779) b!144385))

(assert (=> b!144385 m!173531))

(declare-fun m!174177 () Bool)

(assert (=> b!144385 m!174177))

(assert (=> d!45955 d!46063))

(assert (=> d!45947 d!45945))

(declare-fun d!46065 () Bool)

(assert (=> d!46065 (arrayNoDuplicates!0 (_keys!4740 (v!3308 (underlying!485 thiss!992))) from!355 Nil!1728)))

(assert (=> d!46065 true))

(declare-fun _$71!171 () Unit!4553)

(assert (=> d!46065 (= (choose!39 (_keys!4740 (v!3308 (underlying!485 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!171)))

(declare-fun bs!6104 () Bool)

(assert (= bs!6104 d!46065))

(assert (=> bs!6104 m!173557))

(assert (=> d!45947 d!46065))

(declare-fun d!46067 () Bool)

(declare-fun e!94083 () Bool)

(assert (=> d!46067 e!94083))

(declare-fun res!68781 () Bool)

(assert (=> d!46067 (=> (not res!68781) (not e!94083))))

(declare-fun lt!75836 () ListLongMap!1695)

(assert (=> d!46067 (= res!68781 (contains!913 lt!75836 (_1!1332 (ite (or c!27287 c!27285) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992))))))))))

(declare-fun lt!75837 () List!1730)

(assert (=> d!46067 (= lt!75836 (ListLongMap!1696 lt!75837))))

(declare-fun lt!75834 () Unit!4553)

(declare-fun lt!75835 () Unit!4553)

(assert (=> d!46067 (= lt!75834 lt!75835)))

(assert (=> d!46067 (= (getValueByKey!179 lt!75837 (_1!1332 (ite (or c!27287 c!27285) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992))))))) (Some!184 (_2!1332 (ite (or c!27287 c!27285) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992))))))))))

(assert (=> d!46067 (= lt!75835 (lemmaContainsTupThenGetReturnValue!93 lt!75837 (_1!1332 (ite (or c!27287 c!27285) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))) (_2!1332 (ite (or c!27287 c!27285) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992))))))))))

(assert (=> d!46067 (= lt!75837 (insertStrictlySorted!96 (toList!863 (ite c!27287 call!16027 (ite c!27285 call!16028 call!16024))) (_1!1332 (ite (or c!27287 c!27285) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))) (_2!1332 (ite (or c!27287 c!27285) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992))))))))))

(assert (=> d!46067 (= (+!175 (ite c!27287 call!16027 (ite c!27285 call!16028 call!16024)) (ite (or c!27287 c!27285) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))) lt!75836)))

(declare-fun b!144386 () Bool)

(declare-fun res!68780 () Bool)

(assert (=> b!144386 (=> (not res!68780) (not e!94083))))

(assert (=> b!144386 (= res!68780 (= (getValueByKey!179 (toList!863 lt!75836) (_1!1332 (ite (or c!27287 c!27285) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992))))))) (Some!184 (_2!1332 (ite (or c!27287 c!27285) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))))))))

(declare-fun b!144387 () Bool)

(assert (=> b!144387 (= e!94083 (contains!916 (toList!863 lt!75836) (ite (or c!27287 c!27285) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3308 (underlying!485 thiss!992)))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(assert (= (and d!46067 res!68781) b!144386))

(assert (= (and b!144386 res!68780) b!144387))

(declare-fun m!174179 () Bool)

(assert (=> d!46067 m!174179))

(declare-fun m!174181 () Bool)

(assert (=> d!46067 m!174181))

(declare-fun m!174183 () Bool)

(assert (=> d!46067 m!174183))

(declare-fun m!174185 () Bool)

(assert (=> d!46067 m!174185))

(declare-fun m!174187 () Bool)

(assert (=> b!144386 m!174187))

(declare-fun m!174189 () Bool)

(assert (=> b!144387 m!174189))

(assert (=> bm!16023 d!46067))

(declare-fun b!144400 () Bool)

(declare-fun e!94090 () SeekEntryResult!275)

(declare-fun e!94092 () SeekEntryResult!275)

(assert (=> b!144400 (= e!94090 e!94092)))

(declare-fun lt!75844 () (_ BitVec 64))

(declare-fun lt!75845 () SeekEntryResult!275)

(assert (=> b!144400 (= lt!75844 (select (arr!2318 (_keys!4740 newMap!16)) (index!3267 lt!75845)))))

(declare-fun c!27346 () Bool)

(assert (=> b!144400 (= c!27346 (= lt!75844 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!144402 () Bool)

(assert (=> b!144402 (= e!94092 (Found!275 (index!3267 lt!75845)))))

(declare-fun b!144403 () Bool)

(assert (=> b!144403 (= e!94090 Undefined!275)))

(declare-fun b!144404 () Bool)

(declare-fun c!27347 () Bool)

(assert (=> b!144404 (= c!27347 (= lt!75844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94091 () SeekEntryResult!275)

(assert (=> b!144404 (= e!94092 e!94091)))

(declare-fun b!144405 () Bool)

(assert (=> b!144405 (= e!94091 (MissingZero!275 (index!3267 lt!75845)))))

(declare-fun d!46069 () Bool)

(declare-fun lt!75846 () SeekEntryResult!275)

(assert (=> d!46069 (and (or ((_ is Undefined!275) lt!75846) (not ((_ is Found!275) lt!75846)) (and (bvsge (index!3266 lt!75846) #b00000000000000000000000000000000) (bvslt (index!3266 lt!75846) (size!2592 (_keys!4740 newMap!16))))) (or ((_ is Undefined!275) lt!75846) ((_ is Found!275) lt!75846) (not ((_ is MissingZero!275) lt!75846)) (and (bvsge (index!3265 lt!75846) #b00000000000000000000000000000000) (bvslt (index!3265 lt!75846) (size!2592 (_keys!4740 newMap!16))))) (or ((_ is Undefined!275) lt!75846) ((_ is Found!275) lt!75846) ((_ is MissingZero!275) lt!75846) (not ((_ is MissingVacant!275) lt!75846)) (and (bvsge (index!3268 lt!75846) #b00000000000000000000000000000000) (bvslt (index!3268 lt!75846) (size!2592 (_keys!4740 newMap!16))))) (or ((_ is Undefined!275) lt!75846) (ite ((_ is Found!275) lt!75846) (= (select (arr!2318 (_keys!4740 newMap!16)) (index!3266 lt!75846)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)) (ite ((_ is MissingZero!275) lt!75846) (= (select (arr!2318 (_keys!4740 newMap!16)) (index!3265 lt!75846)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!275) lt!75846) (= (select (arr!2318 (_keys!4740 newMap!16)) (index!3268 lt!75846)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!46069 (= lt!75846 e!94090)))

(declare-fun c!27348 () Bool)

(assert (=> d!46069 (= c!27348 (and ((_ is Intermediate!275) lt!75845) (undefined!1087 lt!75845)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4907 (_ BitVec 32)) SeekEntryResult!275)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!46069 (= lt!75845 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (mask!7333 newMap!16)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (_keys!4740 newMap!16) (mask!7333 newMap!16)))))

(assert (=> d!46069 (validMask!0 (mask!7333 newMap!16))))

(assert (=> d!46069 (= (seekEntryOrOpen!0 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (_keys!4740 newMap!16) (mask!7333 newMap!16)) lt!75846)))

(declare-fun b!144401 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4907 (_ BitVec 32)) SeekEntryResult!275)

(assert (=> b!144401 (= e!94091 (seekKeyOrZeroReturnVacant!0 (x!16418 lt!75845) (index!3267 lt!75845) (index!3267 lt!75845) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (_keys!4740 newMap!16) (mask!7333 newMap!16)))))

(assert (= (and d!46069 c!27348) b!144403))

(assert (= (and d!46069 (not c!27348)) b!144400))

(assert (= (and b!144400 c!27346) b!144402))

(assert (= (and b!144400 (not c!27346)) b!144404))

(assert (= (and b!144404 c!27347) b!144405))

(assert (= (and b!144404 (not c!27347)) b!144401))

(declare-fun m!174191 () Bool)

(assert (=> b!144400 m!174191))

(declare-fun m!174193 () Bool)

(assert (=> d!46069 m!174193))

(assert (=> d!46069 m!173531))

(declare-fun m!174195 () Bool)

(assert (=> d!46069 m!174195))

(declare-fun m!174197 () Bool)

(assert (=> d!46069 m!174197))

(assert (=> d!46069 m!173531))

(assert (=> d!46069 m!174193))

(declare-fun m!174199 () Bool)

(assert (=> d!46069 m!174199))

(declare-fun m!174201 () Bool)

(assert (=> d!46069 m!174201))

(assert (=> d!46069 m!173913))

(assert (=> b!144401 m!173531))

(declare-fun m!174203 () Bool)

(assert (=> b!144401 m!174203))

(assert (=> b!144050 d!46069))

(declare-fun d!46071 () Bool)

(declare-fun res!68782 () Bool)

(declare-fun e!94093 () Bool)

(assert (=> d!46071 (=> res!68782 e!94093)))

(assert (=> d!46071 (= res!68782 (= (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!46071 (= (arrayContainsKey!0 (_keys!4740 newMap!16) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000) e!94093)))

(declare-fun b!144406 () Bool)

(declare-fun e!94094 () Bool)

(assert (=> b!144406 (= e!94093 e!94094)))

(declare-fun res!68783 () Bool)

(assert (=> b!144406 (=> (not res!68783) (not e!94094))))

(assert (=> b!144406 (= res!68783 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2592 (_keys!4740 newMap!16))))))

(declare-fun b!144407 () Bool)

(assert (=> b!144407 (= e!94094 (arrayContainsKey!0 (_keys!4740 newMap!16) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!46071 (not res!68782)) b!144406))

(assert (= (and b!144406 res!68783) b!144407))

(assert (=> d!46071 m!173865))

(assert (=> b!144407 m!173531))

(declare-fun m!174205 () Bool)

(assert (=> b!144407 m!174205))

(assert (=> bm!16000 d!46071))

(declare-fun d!46073 () Bool)

(declare-fun e!94095 () Bool)

(assert (=> d!46073 e!94095))

(declare-fun res!68784 () Bool)

(assert (=> d!46073 (=> res!68784 e!94095)))

(declare-fun lt!75847 () Bool)

(assert (=> d!46073 (= res!68784 (not lt!75847))))

(declare-fun lt!75849 () Bool)

(assert (=> d!46073 (= lt!75847 lt!75849)))

(declare-fun lt!75848 () Unit!4553)

(declare-fun e!94096 () Unit!4553)

(assert (=> d!46073 (= lt!75848 e!94096)))

(declare-fun c!27349 () Bool)

(assert (=> d!46073 (= c!27349 lt!75849)))

(assert (=> d!46073 (= lt!75849 (containsKey!182 (toList!863 lt!75609) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!46073 (= (contains!913 lt!75609 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!75847)))

(declare-fun b!144408 () Bool)

(declare-fun lt!75850 () Unit!4553)

(assert (=> b!144408 (= e!94096 lt!75850)))

(assert (=> b!144408 (= lt!75850 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!863 lt!75609) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!144408 (isDefined!131 (getValueByKey!179 (toList!863 lt!75609) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!144409 () Bool)

(declare-fun Unit!4570 () Unit!4553)

(assert (=> b!144409 (= e!94096 Unit!4570)))

(declare-fun b!144410 () Bool)

(assert (=> b!144410 (= e!94095 (isDefined!131 (getValueByKey!179 (toList!863 lt!75609) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!46073 c!27349) b!144408))

(assert (= (and d!46073 (not c!27349)) b!144409))

(assert (= (and d!46073 (not res!68784)) b!144410))

(assert (=> d!46073 m!173679))

(declare-fun m!174207 () Bool)

(assert (=> d!46073 m!174207))

(assert (=> b!144408 m!173679))

(declare-fun m!174209 () Bool)

(assert (=> b!144408 m!174209))

(assert (=> b!144408 m!173679))

(declare-fun m!174211 () Bool)

(assert (=> b!144408 m!174211))

(assert (=> b!144408 m!174211))

(declare-fun m!174213 () Bool)

(assert (=> b!144408 m!174213))

(assert (=> b!144410 m!173679))

(assert (=> b!144410 m!174211))

(assert (=> b!144410 m!174211))

(assert (=> b!144410 m!174213))

(assert (=> b!144140 d!46073))

(assert (=> b!143933 d!45949))

(assert (=> bm!15989 d!45961))

(declare-fun b!144427 () Bool)

(declare-fun e!94106 () Bool)

(declare-fun e!94105 () Bool)

(assert (=> b!144427 (= e!94106 e!94105)))

(declare-fun c!27354 () Bool)

(declare-fun lt!75855 () SeekEntryResult!275)

(assert (=> b!144427 (= c!27354 ((_ is MissingVacant!275) lt!75855))))

(declare-fun b!144428 () Bool)

(assert (=> b!144428 (= e!94105 ((_ is Undefined!275) lt!75855))))

(declare-fun b!144430 () Bool)

(declare-fun res!68793 () Bool)

(declare-fun e!94107 () Bool)

(assert (=> b!144430 (=> (not res!68793) (not e!94107))))

(declare-fun call!16059 () Bool)

(assert (=> b!144430 (= res!68793 call!16059)))

(assert (=> b!144430 (= e!94105 e!94107)))

(declare-fun c!27355 () Bool)

(declare-fun bm!16056 () Bool)

(assert (=> bm!16056 (= call!16059 (inRange!0 (ite c!27355 (index!3265 lt!75855) (index!3268 lt!75855)) (mask!7333 newMap!16)))))

(declare-fun b!144431 () Bool)

(declare-fun e!94108 () Bool)

(declare-fun call!16060 () Bool)

(assert (=> b!144431 (= e!94108 (not call!16060))))

(declare-fun b!144432 () Bool)

(assert (=> b!144432 (and (bvsge (index!3265 lt!75855) #b00000000000000000000000000000000) (bvslt (index!3265 lt!75855) (size!2592 (_keys!4740 newMap!16))))))

(declare-fun res!68796 () Bool)

(assert (=> b!144432 (= res!68796 (= (select (arr!2318 (_keys!4740 newMap!16)) (index!3265 lt!75855)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144432 (=> (not res!68796) (not e!94108))))

(declare-fun b!144433 () Bool)

(declare-fun res!68794 () Bool)

(assert (=> b!144433 (=> (not res!68794) (not e!94107))))

(assert (=> b!144433 (= res!68794 (= (select (arr!2318 (_keys!4740 newMap!16)) (index!3268 lt!75855)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144433 (and (bvsge (index!3268 lt!75855) #b00000000000000000000000000000000) (bvslt (index!3268 lt!75855) (size!2592 (_keys!4740 newMap!16))))))

(declare-fun bm!16057 () Bool)

(assert (=> bm!16057 (= call!16060 (arrayContainsKey!0 (_keys!4740 newMap!16) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!144434 () Bool)

(assert (=> b!144434 (= e!94106 e!94108)))

(declare-fun res!68795 () Bool)

(assert (=> b!144434 (= res!68795 call!16059)))

(assert (=> b!144434 (=> (not res!68795) (not e!94108))))

(declare-fun b!144429 () Bool)

(assert (=> b!144429 (= e!94107 (not call!16060))))

(declare-fun d!46075 () Bool)

(assert (=> d!46075 e!94106))

(assert (=> d!46075 (= c!27355 ((_ is MissingZero!275) lt!75855))))

(assert (=> d!46075 (= lt!75855 (seekEntryOrOpen!0 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (_keys!4740 newMap!16) (mask!7333 newMap!16)))))

(declare-fun lt!75856 () Unit!4553)

(declare-fun choose!890 (array!4907 array!4909 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 64) Int) Unit!4553)

(assert (=> d!46075 (= lt!75856 (choose!890 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (defaultEntry!2975 newMap!16)))))

(assert (=> d!46075 (validMask!0 (mask!7333 newMap!16))))

(assert (=> d!46075 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!67 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (defaultEntry!2975 newMap!16)) lt!75856)))

(assert (= (and d!46075 c!27355) b!144434))

(assert (= (and d!46075 (not c!27355)) b!144427))

(assert (= (and b!144434 res!68795) b!144432))

(assert (= (and b!144432 res!68796) b!144431))

(assert (= (and b!144427 c!27354) b!144430))

(assert (= (and b!144427 (not c!27354)) b!144428))

(assert (= (and b!144430 res!68793) b!144433))

(assert (= (and b!144433 res!68794) b!144429))

(assert (= (or b!144434 b!144430) bm!16056))

(assert (= (or b!144431 b!144429) bm!16057))

(declare-fun m!174215 () Bool)

(assert (=> b!144433 m!174215))

(declare-fun m!174217 () Bool)

(assert (=> bm!16056 m!174217))

(assert (=> d!46075 m!173531))

(assert (=> d!46075 m!173709))

(assert (=> d!46075 m!173531))

(declare-fun m!174219 () Bool)

(assert (=> d!46075 m!174219))

(assert (=> d!46075 m!173913))

(declare-fun m!174221 () Bool)

(assert (=> b!144432 m!174221))

(assert (=> bm!16057 m!173531))

(assert (=> bm!16057 m!173735))

(assert (=> bm!15996 d!46075))

(declare-fun d!46077 () Bool)

(assert (=> d!46077 (= (apply!122 lt!75609 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1550 (getValueByKey!179 (toList!863 lt!75609) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6105 () Bool)

(assert (= bs!6105 d!46077))

(assert (=> bs!6105 m!174153))

(assert (=> bs!6105 m!174153))

(declare-fun m!174223 () Bool)

(assert (=> bs!6105 m!174223))

(assert (=> b!144135 d!46077))

(declare-fun d!46079 () Bool)

(declare-fun res!68797 () Bool)

(declare-fun e!94109 () Bool)

(assert (=> d!46079 (=> res!68797 e!94109)))

(assert (=> d!46079 (= res!68797 (= (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!46079 (= (arrayContainsKey!0 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!94109)))

(declare-fun b!144435 () Bool)

(declare-fun e!94110 () Bool)

(assert (=> b!144435 (= e!94109 e!94110)))

(declare-fun res!68798 () Bool)

(assert (=> b!144435 (=> (not res!68798) (not e!94110))))

(assert (=> b!144435 (= res!68798 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992))))))))

(declare-fun b!144436 () Bool)

(assert (=> b!144436 (= e!94110 (arrayContainsKey!0 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!46079 (not res!68797)) b!144435))

(assert (= (and b!144435 res!68798) b!144436))

(declare-fun m!174225 () Bool)

(assert (=> d!46079 m!174225))

(assert (=> b!144436 m!173531))

(declare-fun m!174227 () Bool)

(assert (=> b!144436 m!174227))

(assert (=> b!143928 d!46079))

(assert (=> d!45971 d!45999))

(assert (=> bm!15995 d!46069))

(declare-fun b!144445 () Bool)

(declare-fun e!94116 () (_ BitVec 32))

(declare-fun call!16063 () (_ BitVec 32))

(assert (=> b!144445 (= e!94116 (bvadd #b00000000000000000000000000000001 call!16063))))

(declare-fun b!144446 () Bool)

(declare-fun e!94115 () (_ BitVec 32))

(assert (=> b!144446 (= e!94115 e!94116)))

(declare-fun c!27361 () Bool)

(assert (=> b!144446 (= c!27361 (validKeyInArray!0 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144447 () Bool)

(assert (=> b!144447 (= e!94116 call!16063)))

(declare-fun d!46081 () Bool)

(declare-fun lt!75859 () (_ BitVec 32))

(assert (=> d!46081 (and (bvsge lt!75859 #b00000000000000000000000000000000) (bvsle lt!75859 (bvsub (size!2592 (_keys!4740 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!46081 (= lt!75859 e!94115)))

(declare-fun c!27360 () Bool)

(assert (=> d!46081 (= c!27360 (bvsge #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))))))

(assert (=> d!46081 (and (bvsle #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2592 (_keys!4740 newMap!16)) (size!2592 (_keys!4740 newMap!16))))))

(assert (=> d!46081 (= (arrayCountValidKeys!0 (_keys!4740 newMap!16) #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))) lt!75859)))

(declare-fun bm!16060 () Bool)

(assert (=> bm!16060 (= call!16063 (arrayCountValidKeys!0 (_keys!4740 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2592 (_keys!4740 newMap!16))))))

(declare-fun b!144448 () Bool)

(assert (=> b!144448 (= e!94115 #b00000000000000000000000000000000)))

(assert (= (and d!46081 c!27360) b!144448))

(assert (= (and d!46081 (not c!27360)) b!144446))

(assert (= (and b!144446 c!27361) b!144445))

(assert (= (and b!144446 (not c!27361)) b!144447))

(assert (= (or b!144445 b!144447) bm!16060))

(assert (=> b!144446 m!173865))

(assert (=> b!144446 m!173865))

(assert (=> b!144446 m!173867))

(declare-fun m!174229 () Bool)

(assert (=> bm!16060 m!174229))

(assert (=> b!144153 d!46081))

(declare-fun d!46083 () Bool)

(declare-fun e!94117 () Bool)

(assert (=> d!46083 e!94117))

(declare-fun res!68800 () Bool)

(assert (=> d!46083 (=> (not res!68800) (not e!94117))))

(declare-fun lt!75862 () ListLongMap!1695)

(assert (=> d!46083 (= res!68800 (contains!913 lt!75862 (_1!1332 (ite c!27259 (ite c!27263 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!75863 () List!1730)

(assert (=> d!46083 (= lt!75862 (ListLongMap!1696 lt!75863))))

(declare-fun lt!75860 () Unit!4553)

(declare-fun lt!75861 () Unit!4553)

(assert (=> d!46083 (= lt!75860 lt!75861)))

(assert (=> d!46083 (= (getValueByKey!179 lt!75863 (_1!1332 (ite c!27259 (ite c!27263 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!184 (_2!1332 (ite c!27259 (ite c!27263 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!46083 (= lt!75861 (lemmaContainsTupThenGetReturnValue!93 lt!75863 (_1!1332 (ite c!27259 (ite c!27263 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1332 (ite c!27259 (ite c!27263 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!46083 (= lt!75863 (insertStrictlySorted!96 (toList!863 e!93893) (_1!1332 (ite c!27259 (ite c!27263 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1332 (ite c!27259 (ite c!27263 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!46083 (= (+!175 e!93893 (ite c!27259 (ite c!27263 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!75862)))

(declare-fun b!144449 () Bool)

(declare-fun res!68799 () Bool)

(assert (=> b!144449 (=> (not res!68799) (not e!94117))))

(assert (=> b!144449 (= res!68799 (= (getValueByKey!179 (toList!863 lt!75862) (_1!1332 (ite c!27259 (ite c!27263 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!184 (_2!1332 (ite c!27259 (ite c!27263 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!144450 () Bool)

(assert (=> b!144450 (= e!94117 (contains!916 (toList!863 lt!75862) (ite c!27259 (ite c!27263 (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!46083 res!68800) b!144449))

(assert (= (and b!144449 res!68799) b!144450))

(declare-fun m!174231 () Bool)

(assert (=> d!46083 m!174231))

(declare-fun m!174233 () Bool)

(assert (=> d!46083 m!174233))

(declare-fun m!174235 () Bool)

(assert (=> d!46083 m!174235))

(declare-fun m!174237 () Bool)

(assert (=> d!46083 m!174237))

(declare-fun m!174239 () Bool)

(assert (=> b!144449 m!174239))

(declare-fun m!174241 () Bool)

(assert (=> b!144450 m!174241))

(assert (=> bm!15988 d!46083))

(declare-fun d!46085 () Bool)

(assert (=> d!46085 (= (apply!122 lt!75609 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1550 (getValueByKey!179 (toList!863 lt!75609) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!6106 () Bool)

(assert (= bs!6106 d!46085))

(assert (=> bs!6106 m!173679))

(assert (=> bs!6106 m!174211))

(assert (=> bs!6106 m!174211))

(declare-fun m!174243 () Bool)

(assert (=> bs!6106 m!174243))

(assert (=> b!144133 d!46085))

(declare-fun d!46087 () Bool)

(declare-fun c!27362 () Bool)

(assert (=> d!46087 (= c!27362 ((_ is ValueCellFull!1127) (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!94118 () V!3569)

(assert (=> d!46087 (= (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!94118)))

(declare-fun b!144451 () Bool)

(assert (=> b!144451 (= e!94118 (get!1548 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!144452 () Bool)

(assert (=> b!144452 (= e!94118 (get!1549 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46087 c!27362) b!144451))

(assert (= (and d!46087 (not c!27362)) b!144452))

(assert (=> b!144451 m!173801))

(assert (=> b!144451 m!173565))

(declare-fun m!174245 () Bool)

(assert (=> b!144451 m!174245))

(assert (=> b!144452 m!173801))

(assert (=> b!144452 m!173565))

(declare-fun m!174247 () Bool)

(assert (=> b!144452 m!174247))

(assert (=> b!144133 d!46087))

(declare-fun b!144453 () Bool)

(declare-fun e!94122 () Bool)

(declare-fun e!94120 () Bool)

(assert (=> b!144453 (= e!94122 e!94120)))

(declare-fun c!27363 () Bool)

(assert (=> b!144453 (= c!27363 (validKeyInArray!0 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144454 () Bool)

(declare-fun call!16064 () Bool)

(assert (=> b!144454 (= e!94120 call!16064)))

(declare-fun b!144455 () Bool)

(assert (=> b!144455 (= e!94120 call!16064)))

(declare-fun b!144456 () Bool)

(declare-fun e!94119 () Bool)

(assert (=> b!144456 (= e!94119 (contains!914 Nil!1728 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!46089 () Bool)

(declare-fun res!68803 () Bool)

(declare-fun e!94121 () Bool)

(assert (=> d!46089 (=> res!68803 e!94121)))

(assert (=> d!46089 (= res!68803 (bvsge #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))))))

(assert (=> d!46089 (= (arrayNoDuplicates!0 (_keys!4740 newMap!16) #b00000000000000000000000000000000 Nil!1728) e!94121)))

(declare-fun bm!16061 () Bool)

(assert (=> bm!16061 (= call!16064 (arrayNoDuplicates!0 (_keys!4740 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!27363 (Cons!1727 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000) Nil!1728) Nil!1728)))))

(declare-fun b!144457 () Bool)

(assert (=> b!144457 (= e!94121 e!94122)))

(declare-fun res!68801 () Bool)

(assert (=> b!144457 (=> (not res!68801) (not e!94122))))

(assert (=> b!144457 (= res!68801 (not e!94119))))

(declare-fun res!68802 () Bool)

(assert (=> b!144457 (=> (not res!68802) (not e!94119))))

(assert (=> b!144457 (= res!68802 (validKeyInArray!0 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!46089 (not res!68803)) b!144457))

(assert (= (and b!144457 res!68802) b!144456))

(assert (= (and b!144457 res!68801) b!144453))

(assert (= (and b!144453 c!27363) b!144455))

(assert (= (and b!144453 (not c!27363)) b!144454))

(assert (= (or b!144455 b!144454) bm!16061))

(assert (=> b!144453 m!173865))

(assert (=> b!144453 m!173865))

(assert (=> b!144453 m!173867))

(assert (=> b!144456 m!173865))

(assert (=> b!144456 m!173865))

(declare-fun m!174249 () Bool)

(assert (=> b!144456 m!174249))

(assert (=> bm!16061 m!173865))

(declare-fun m!174251 () Bool)

(assert (=> bm!16061 m!174251))

(assert (=> b!144457 m!173865))

(assert (=> b!144457 m!173865))

(assert (=> b!144457 m!173867))

(assert (=> b!144155 d!46089))

(declare-fun d!46091 () Bool)

(assert (=> d!46091 (= (+!175 (getCurrentListMap!535 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!535 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) lt!75555 (zeroValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75866 () Unit!4553)

(declare-fun choose!891 (array!4907 array!4909 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 V!3569 Int) Unit!4553)

(assert (=> d!46091 (= lt!75866 (choose!891 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) lt!75555 (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2975 newMap!16)))))

(assert (=> d!46091 (validMask!0 (mask!7333 newMap!16))))

(assert (=> d!46091 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!67 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) lt!75555 (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2975 newMap!16)) lt!75866)))

(declare-fun bs!6107 () Bool)

(assert (= bs!6107 d!46091))

(assert (=> bs!6107 m!173567))

(declare-fun m!174253 () Bool)

(assert (=> bs!6107 m!174253))

(assert (=> bs!6107 m!173713))

(assert (=> bs!6107 m!173713))

(declare-fun m!174255 () Bool)

(assert (=> bs!6107 m!174255))

(assert (=> bs!6107 m!173567))

(declare-fun m!174257 () Bool)

(assert (=> bs!6107 m!174257))

(assert (=> bs!6107 m!173913))

(assert (=> b!144056 d!46091))

(declare-fun b!144458 () Bool)

(declare-fun e!94126 () Bool)

(declare-fun e!94124 () Bool)

(assert (=> b!144458 (= e!94126 e!94124)))

(declare-fun c!27364 () Bool)

(assert (=> b!144458 (= c!27364 (validKeyInArray!0 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!144459 () Bool)

(declare-fun call!16065 () Bool)

(assert (=> b!144459 (= e!94124 call!16065)))

(declare-fun b!144460 () Bool)

(assert (=> b!144460 (= e!94124 call!16065)))

(declare-fun b!144461 () Bool)

(declare-fun e!94123 () Bool)

(assert (=> b!144461 (= e!94123 (contains!914 (ite c!27220 (Cons!1727 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) Nil!1728) Nil!1728) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun d!46093 () Bool)

(declare-fun res!68806 () Bool)

(declare-fun e!94125 () Bool)

(assert (=> d!46093 (=> res!68806 e!94125)))

(assert (=> d!46093 (= res!68806 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2592 (_keys!4740 (v!3308 (underlying!485 thiss!992))))))))

(assert (=> d!46093 (= (arrayNoDuplicates!0 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27220 (Cons!1727 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) Nil!1728) Nil!1728)) e!94125)))

(declare-fun bm!16062 () Bool)

(assert (=> bm!16062 (= call!16065 (arrayNoDuplicates!0 (_keys!4740 (v!3308 (underlying!485 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!27364 (Cons!1727 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!27220 (Cons!1727 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) Nil!1728) Nil!1728)) (ite c!27220 (Cons!1727 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) Nil!1728) Nil!1728))))))

(declare-fun b!144462 () Bool)

(assert (=> b!144462 (= e!94125 e!94126)))

(declare-fun res!68804 () Bool)

(assert (=> b!144462 (=> (not res!68804) (not e!94126))))

(assert (=> b!144462 (= res!68804 (not e!94123))))

(declare-fun res!68805 () Bool)

(assert (=> b!144462 (=> (not res!68805) (not e!94123))))

(assert (=> b!144462 (= res!68805 (validKeyInArray!0 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!46093 (not res!68806)) b!144462))

(assert (= (and b!144462 res!68805) b!144461))

(assert (= (and b!144462 res!68804) b!144458))

(assert (= (and b!144458 c!27364) b!144460))

(assert (= (and b!144458 (not c!27364)) b!144459))

(assert (= (or b!144460 b!144459) bm!16062))

(declare-fun m!174259 () Bool)

(assert (=> b!144458 m!174259))

(assert (=> b!144458 m!174259))

(declare-fun m!174261 () Bool)

(assert (=> b!144458 m!174261))

(assert (=> b!144461 m!174259))

(assert (=> b!144461 m!174259))

(declare-fun m!174263 () Bool)

(assert (=> b!144461 m!174263))

(assert (=> bm!16062 m!174259))

(declare-fun m!174265 () Bool)

(assert (=> bm!16062 m!174265))

(assert (=> b!144462 m!174259))

(assert (=> b!144462 m!174259))

(assert (=> b!144462 m!174261))

(assert (=> bm!15933 d!46093))

(declare-fun d!46095 () Bool)

(assert (=> d!46095 (= (+!175 (getCurrentListMap!535 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!535 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) lt!75546 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75869 () Unit!4553)

(declare-fun choose!892 (array!4907 array!4909 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 V!3569 Int) Unit!4553)

(assert (=> d!46095 (= lt!75869 (choose!892 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) lt!75546 (zeroValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2822 newMap!16) (defaultEntry!2975 newMap!16)))))

(assert (=> d!46095 (validMask!0 (mask!7333 newMap!16))))

(assert (=> d!46095 (= (lemmaChangeZeroKeyThenAddPairToListMap!67 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) lt!75546 (zeroValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2822 newMap!16) (defaultEntry!2975 newMap!16)) lt!75869)))

(declare-fun bs!6108 () Bool)

(assert (= bs!6108 d!46095))

(assert (=> bs!6108 m!173713))

(declare-fun m!174267 () Bool)

(assert (=> bs!6108 m!174267))

(assert (=> bs!6108 m!173713))

(assert (=> bs!6108 m!173913))

(assert (=> bs!6108 m!173567))

(declare-fun m!174269 () Bool)

(assert (=> bs!6108 m!174269))

(assert (=> bs!6108 m!173567))

(declare-fun m!174271 () Bool)

(assert (=> bs!6108 m!174271))

(assert (=> b!144058 d!46095))

(declare-fun d!46097 () Bool)

(assert (=> d!46097 (isDefined!131 (getValueByKey!179 (toList!863 lt!75416) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun lt!75872 () Unit!4553)

(declare-fun choose!893 (List!1730 (_ BitVec 64)) Unit!4553)

(assert (=> d!46097 (= lt!75872 (choose!893 (toList!863 lt!75416) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(declare-fun e!94129 () Bool)

(assert (=> d!46097 e!94129))

(declare-fun res!68809 () Bool)

(assert (=> d!46097 (=> (not res!68809) (not e!94129))))

(declare-fun isStrictlySorted!314 (List!1730) Bool)

(assert (=> d!46097 (= res!68809 (isStrictlySorted!314 (toList!863 lt!75416)))))

(assert (=> d!46097 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!863 lt!75416) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)) lt!75872)))

(declare-fun b!144465 () Bool)

(assert (=> b!144465 (= e!94129 (containsKey!182 (toList!863 lt!75416) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355)))))

(assert (= (and d!46097 res!68809) b!144465))

(assert (=> d!46097 m!173531))

(assert (=> d!46097 m!173697))

(assert (=> d!46097 m!173697))

(assert (=> d!46097 m!173699))

(assert (=> d!46097 m!173531))

(declare-fun m!174273 () Bool)

(assert (=> d!46097 m!174273))

(declare-fun m!174275 () Bool)

(assert (=> d!46097 m!174275))

(assert (=> b!144465 m!173531))

(assert (=> b!144465 m!173693))

(assert (=> b!143947 d!46097))

(assert (=> b!143947 d!45989))

(assert (=> b!143947 d!45991))

(assert (=> b!144037 d!45987))

(assert (=> b!144142 d!45985))

(declare-fun d!46099 () Bool)

(declare-fun e!94130 () Bool)

(assert (=> d!46099 e!94130))

(declare-fun res!68810 () Bool)

(assert (=> d!46099 (=> res!68810 e!94130)))

(declare-fun lt!75873 () Bool)

(assert (=> d!46099 (= res!68810 (not lt!75873))))

(declare-fun lt!75875 () Bool)

(assert (=> d!46099 (= lt!75873 lt!75875)))

(declare-fun lt!75874 () Unit!4553)

(declare-fun e!94131 () Unit!4553)

(assert (=> d!46099 (= lt!75874 e!94131)))

(declare-fun c!27365 () Bool)

(assert (=> d!46099 (= c!27365 lt!75875)))

(assert (=> d!46099 (= lt!75875 (containsKey!182 (toList!863 call!16003) (select (arr!2318 (_keys!4740 newMap!16)) (index!3266 lt!75554))))))

(assert (=> d!46099 (= (contains!913 call!16003 (select (arr!2318 (_keys!4740 newMap!16)) (index!3266 lt!75554))) lt!75873)))

(declare-fun b!144466 () Bool)

(declare-fun lt!75876 () Unit!4553)

(assert (=> b!144466 (= e!94131 lt!75876)))

(assert (=> b!144466 (= lt!75876 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!863 call!16003) (select (arr!2318 (_keys!4740 newMap!16)) (index!3266 lt!75554))))))

(assert (=> b!144466 (isDefined!131 (getValueByKey!179 (toList!863 call!16003) (select (arr!2318 (_keys!4740 newMap!16)) (index!3266 lt!75554))))))

(declare-fun b!144467 () Bool)

(declare-fun Unit!4571 () Unit!4553)

(assert (=> b!144467 (= e!94131 Unit!4571)))

(declare-fun b!144468 () Bool)

(assert (=> b!144468 (= e!94130 (isDefined!131 (getValueByKey!179 (toList!863 call!16003) (select (arr!2318 (_keys!4740 newMap!16)) (index!3266 lt!75554)))))))

(assert (= (and d!46099 c!27365) b!144466))

(assert (= (and d!46099 (not c!27365)) b!144467))

(assert (= (and d!46099 (not res!68810)) b!144468))

(assert (=> d!46099 m!173721))

(declare-fun m!174277 () Bool)

(assert (=> d!46099 m!174277))

(assert (=> b!144466 m!173721))

(declare-fun m!174279 () Bool)

(assert (=> b!144466 m!174279))

(assert (=> b!144466 m!173721))

(declare-fun m!174281 () Bool)

(assert (=> b!144466 m!174281))

(assert (=> b!144466 m!174281))

(declare-fun m!174283 () Bool)

(assert (=> b!144466 m!174283))

(assert (=> b!144468 m!173721))

(assert (=> b!144468 m!174281))

(assert (=> b!144468 m!174281))

(assert (=> b!144468 m!174283))

(assert (=> b!144065 d!46099))

(declare-fun d!46101 () Bool)

(declare-fun e!94134 () Bool)

(assert (=> d!46101 e!94134))

(declare-fun res!68813 () Bool)

(assert (=> d!46101 (=> (not res!68813) (not e!94134))))

(assert (=> d!46101 (= res!68813 (and (bvsge (index!3266 lt!75554) #b00000000000000000000000000000000) (bvslt (index!3266 lt!75554) (size!2592 (_keys!4740 newMap!16)))))))

(declare-fun lt!75879 () Unit!4553)

(declare-fun choose!894 (array!4907 array!4909 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 32) Int) Unit!4553)

(assert (=> d!46101 (= lt!75879 (choose!894 (_keys!4740 newMap!16) lt!75541 (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (index!3266 lt!75554) (defaultEntry!2975 newMap!16)))))

(assert (=> d!46101 (validMask!0 (mask!7333 newMap!16))))

(assert (=> d!46101 (= (lemmaValidKeyInArrayIsInListMap!127 (_keys!4740 newMap!16) lt!75541 (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (index!3266 lt!75554) (defaultEntry!2975 newMap!16)) lt!75879)))

(declare-fun b!144471 () Bool)

(assert (=> b!144471 (= e!94134 (contains!913 (getCurrentListMap!535 (_keys!4740 newMap!16) lt!75541 (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) (select (arr!2318 (_keys!4740 newMap!16)) (index!3266 lt!75554))))))

(assert (= (and d!46101 res!68813) b!144471))

(declare-fun m!174285 () Bool)

(assert (=> d!46101 m!174285))

(assert (=> d!46101 m!173913))

(declare-fun m!174287 () Bool)

(assert (=> b!144471 m!174287))

(assert (=> b!144471 m!173721))

(assert (=> b!144471 m!174287))

(assert (=> b!144471 m!173721))

(declare-fun m!174289 () Bool)

(assert (=> b!144471 m!174289))

(assert (=> b!144065 d!46101))

(declare-fun d!46103 () Bool)

(declare-fun e!94137 () Bool)

(assert (=> d!46103 e!94137))

(declare-fun res!68816 () Bool)

(assert (=> d!46103 (=> (not res!68816) (not e!94137))))

(assert (=> d!46103 (= res!68816 (and (bvsge (index!3266 lt!75554) #b00000000000000000000000000000000) (bvslt (index!3266 lt!75554) (size!2593 (_values!2958 newMap!16)))))))

(declare-fun lt!75882 () Unit!4553)

(declare-fun choose!895 (array!4907 array!4909 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 32) (_ BitVec 64) V!3569 Int) Unit!4553)

(assert (=> d!46103 (= lt!75882 (choose!895 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (index!3266 lt!75554) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2975 newMap!16)))))

(assert (=> d!46103 (validMask!0 (mask!7333 newMap!16))))

(assert (=> d!46103 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!67 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (index!3266 lt!75554) (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2975 newMap!16)) lt!75882)))

(declare-fun b!144474 () Bool)

(assert (=> b!144474 (= e!94137 (= (+!175 (getCurrentListMap!535 (_keys!4740 newMap!16) (_values!2958 newMap!16) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) (tuple2!2643 (select (arr!2318 (_keys!4740 (v!3308 (underlying!485 thiss!992)))) from!355) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!535 (_keys!4740 newMap!16) (array!4910 (store (arr!2319 (_values!2958 newMap!16)) (index!3266 lt!75554) (ValueCellFull!1127 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2593 (_values!2958 newMap!16))) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16))))))

(assert (= (and d!46103 res!68816) b!144474))

(assert (=> d!46103 m!173531))

(assert (=> d!46103 m!173567))

(declare-fun m!174291 () Bool)

(assert (=> d!46103 m!174291))

(assert (=> d!46103 m!173913))

(assert (=> b!144474 m!173713))

(assert (=> b!144474 m!173713))

(assert (=> b!144474 m!173991))

(assert (=> b!144474 m!173729))

(declare-fun m!174293 () Bool)

(assert (=> b!144474 m!174293))

(assert (=> b!144065 d!46103))

(declare-fun d!46105 () Bool)

(declare-fun e!94138 () Bool)

(assert (=> d!46105 e!94138))

(declare-fun res!68818 () Bool)

(assert (=> d!46105 (=> (not res!68818) (not e!94138))))

(declare-fun lt!75885 () ListLongMap!1695)

(assert (=> d!46105 (= res!68818 (contains!913 lt!75885 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(declare-fun lt!75886 () List!1730)

(assert (=> d!46105 (= lt!75885 (ListLongMap!1696 lt!75886))))

(declare-fun lt!75883 () Unit!4553)

(declare-fun lt!75884 () Unit!4553)

(assert (=> d!46105 (= lt!75883 lt!75884)))

(assert (=> d!46105 (= (getValueByKey!179 lt!75886 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))) (Some!184 (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46105 (= lt!75884 (lemmaContainsTupThenGetReturnValue!93 lt!75886 (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992))))) (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46105 (= lt!75886 (insertStrictlySorted!96 (toList!863 call!16029) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992))))) (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))))))

(assert (=> d!46105 (= (+!175 call!16029 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992))))) lt!75885)))

(declare-fun b!144475 () Bool)

(declare-fun res!68817 () Bool)

(assert (=> b!144475 (=> (not res!68817) (not e!94138))))

(assert (=> b!144475 (= res!68817 (= (getValueByKey!179 (toList!863 lt!75885) (_1!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992)))))) (Some!184 (_2!1332 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992))))))))))

(declare-fun b!144476 () Bool)

(assert (=> b!144476 (= e!94138 (contains!916 (toList!863 lt!75885) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3308 (underlying!485 thiss!992))))))))

(assert (= (and d!46105 res!68818) b!144475))

(assert (= (and b!144475 res!68817) b!144476))

(declare-fun m!174295 () Bool)

(assert (=> d!46105 m!174295))

(declare-fun m!174297 () Bool)

(assert (=> d!46105 m!174297))

(declare-fun m!174299 () Bool)

(assert (=> d!46105 m!174299))

(declare-fun m!174301 () Bool)

(assert (=> d!46105 m!174301))

(declare-fun m!174303 () Bool)

(assert (=> b!144475 m!174303))

(declare-fun m!174305 () Bool)

(assert (=> b!144476 m!174305))

(assert (=> b!144143 d!46105))

(declare-fun b!144477 () Bool)

(declare-fun e!94141 () Bool)

(declare-fun e!94148 () Bool)

(assert (=> b!144477 (= e!94141 e!94148)))

(declare-fun c!27371 () Bool)

(assert (=> b!144477 (= c!27371 (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144478 () Bool)

(declare-fun call!16069 () Bool)

(assert (=> b!144478 (= e!94148 (not call!16069))))

(declare-fun b!144479 () Bool)

(declare-fun e!94140 () ListLongMap!1695)

(declare-fun call!16067 () ListLongMap!1695)

(assert (=> b!144479 (= e!94140 call!16067)))

(declare-fun b!144480 () Bool)

(declare-fun e!94142 () Bool)

(declare-fun e!94147 () Bool)

(assert (=> b!144480 (= e!94142 e!94147)))

(declare-fun res!68825 () Bool)

(declare-fun call!16068 () Bool)

(assert (=> b!144480 (= res!68825 call!16068)))

(assert (=> b!144480 (=> (not res!68825) (not e!94147))))

(declare-fun b!144481 () Bool)

(assert (=> b!144481 (= e!94142 (not call!16068))))

(declare-fun b!144482 () Bool)

(declare-fun e!94146 () ListLongMap!1695)

(declare-fun call!16066 () ListLongMap!1695)

(assert (=> b!144482 (= e!94146 call!16066)))

(declare-fun b!144483 () Bool)

(declare-fun e!94143 () ListLongMap!1695)

(assert (=> b!144483 (= e!94143 e!94146)))

(declare-fun c!27367 () Bool)

(assert (=> b!144483 (= c!27367 (and (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144484 () Bool)

(declare-fun res!68823 () Bool)

(assert (=> b!144484 (=> (not res!68823) (not e!94141))))

(assert (=> b!144484 (= res!68823 e!94142)))

(declare-fun c!27368 () Bool)

(assert (=> b!144484 (= c!27368 (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!144485 () Bool)

(declare-fun e!94145 () Unit!4553)

(declare-fun lt!75902 () Unit!4553)

(assert (=> b!144485 (= e!94145 lt!75902)))

(declare-fun lt!75905 () ListLongMap!1695)

(assert (=> b!144485 (= lt!75905 (getCurrentListMapNoExtraKeys!142 (_keys!4740 newMap!16) (ite (or c!27259 c!27258) (_values!2958 newMap!16) (array!4910 (store (arr!2319 (_values!2958 newMap!16)) (index!3266 lt!75554) (ValueCellFull!1127 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2593 (_values!2958 newMap!16)))) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75891 () (_ BitVec 64))

(assert (=> b!144485 (= lt!75891 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75903 () (_ BitVec 64))

(assert (=> b!144485 (= lt!75903 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75904 () Unit!4553)

(assert (=> b!144485 (= lt!75904 (addStillContains!98 lt!75905 lt!75891 (zeroValue!2822 newMap!16) lt!75903))))

(assert (=> b!144485 (contains!913 (+!175 lt!75905 (tuple2!2643 lt!75891 (zeroValue!2822 newMap!16))) lt!75903)))

(declare-fun lt!75907 () Unit!4553)

(assert (=> b!144485 (= lt!75907 lt!75904)))

(declare-fun lt!75890 () ListLongMap!1695)

(assert (=> b!144485 (= lt!75890 (getCurrentListMapNoExtraKeys!142 (_keys!4740 newMap!16) (ite (or c!27259 c!27258) (_values!2958 newMap!16) (array!4910 (store (arr!2319 (_values!2958 newMap!16)) (index!3266 lt!75554) (ValueCellFull!1127 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2593 (_values!2958 newMap!16)))) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75889 () (_ BitVec 64))

(assert (=> b!144485 (= lt!75889 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75887 () (_ BitVec 64))

(assert (=> b!144485 (= lt!75887 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75897 () Unit!4553)

(assert (=> b!144485 (= lt!75897 (addApplyDifferent!98 lt!75890 lt!75889 (minValue!2822 newMap!16) lt!75887))))

(assert (=> b!144485 (= (apply!122 (+!175 lt!75890 (tuple2!2643 lt!75889 (minValue!2822 newMap!16))) lt!75887) (apply!122 lt!75890 lt!75887))))

(declare-fun lt!75906 () Unit!4553)

(assert (=> b!144485 (= lt!75906 lt!75897)))

(declare-fun lt!75896 () ListLongMap!1695)

(assert (=> b!144485 (= lt!75896 (getCurrentListMapNoExtraKeys!142 (_keys!4740 newMap!16) (ite (or c!27259 c!27258) (_values!2958 newMap!16) (array!4910 (store (arr!2319 (_values!2958 newMap!16)) (index!3266 lt!75554) (ValueCellFull!1127 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2593 (_values!2958 newMap!16)))) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75888 () (_ BitVec 64))

(assert (=> b!144485 (= lt!75888 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75892 () (_ BitVec 64))

(assert (=> b!144485 (= lt!75892 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75899 () Unit!4553)

(assert (=> b!144485 (= lt!75899 (addApplyDifferent!98 lt!75896 lt!75888 (zeroValue!2822 newMap!16) lt!75892))))

(assert (=> b!144485 (= (apply!122 (+!175 lt!75896 (tuple2!2643 lt!75888 (zeroValue!2822 newMap!16))) lt!75892) (apply!122 lt!75896 lt!75892))))

(declare-fun lt!75894 () Unit!4553)

(assert (=> b!144485 (= lt!75894 lt!75899)))

(declare-fun lt!75900 () ListLongMap!1695)

(assert (=> b!144485 (= lt!75900 (getCurrentListMapNoExtraKeys!142 (_keys!4740 newMap!16) (ite (or c!27259 c!27258) (_values!2958 newMap!16) (array!4910 (store (arr!2319 (_values!2958 newMap!16)) (index!3266 lt!75554) (ValueCellFull!1127 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2593 (_values!2958 newMap!16)))) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75901 () (_ BitVec 64))

(assert (=> b!144485 (= lt!75901 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75895 () (_ BitVec 64))

(assert (=> b!144485 (= lt!75895 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!144485 (= lt!75902 (addApplyDifferent!98 lt!75900 lt!75901 (minValue!2822 newMap!16) lt!75895))))

(assert (=> b!144485 (= (apply!122 (+!175 lt!75900 (tuple2!2643 lt!75901 (minValue!2822 newMap!16))) lt!75895) (apply!122 lt!75900 lt!75895))))

(declare-fun b!144486 () Bool)

(declare-fun e!94150 () Bool)

(declare-fun lt!75893 () ListLongMap!1695)

(assert (=> b!144486 (= e!94150 (= (apply!122 lt!75893 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000)) (get!1546 (select (arr!2319 (ite (or c!27259 c!27258) (_values!2958 newMap!16) (array!4910 (store (arr!2319 (_values!2958 newMap!16)) (index!3266 lt!75554) (ValueCellFull!1127 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2593 (_values!2958 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!444 (defaultEntry!2975 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144486 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2593 (ite (or c!27259 c!27258) (_values!2958 newMap!16) (array!4910 (store (arr!2319 (_values!2958 newMap!16)) (index!3266 lt!75554) (ValueCellFull!1127 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2593 (_values!2958 newMap!16)))))))))

(assert (=> b!144486 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))))))

(declare-fun call!16070 () ListLongMap!1695)

(declare-fun bm!16064 () Bool)

(assert (=> bm!16064 (= call!16070 (getCurrentListMapNoExtraKeys!142 (_keys!4740 newMap!16) (ite (or c!27259 c!27258) (_values!2958 newMap!16) (array!4910 (store (arr!2319 (_values!2958 newMap!16)) (index!3266 lt!75554) (ValueCellFull!1127 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2593 (_values!2958 newMap!16)))) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun d!46107 () Bool)

(assert (=> d!46107 e!94141))

(declare-fun res!68827 () Bool)

(assert (=> d!46107 (=> (not res!68827) (not e!94141))))

(assert (=> d!46107 (= res!68827 (or (bvsge #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))))))))

(declare-fun lt!75908 () ListLongMap!1695)

(assert (=> d!46107 (= lt!75893 lt!75908)))

(declare-fun lt!75898 () Unit!4553)

(assert (=> d!46107 (= lt!75898 e!94145)))

(declare-fun c!27366 () Bool)

(declare-fun e!94151 () Bool)

(assert (=> d!46107 (= c!27366 e!94151)))

(declare-fun res!68821 () Bool)

(assert (=> d!46107 (=> (not res!68821) (not e!94151))))

(assert (=> d!46107 (= res!68821 (bvslt #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))))))

(assert (=> d!46107 (= lt!75908 e!94143)))

(declare-fun c!27369 () Bool)

(assert (=> d!46107 (= c!27369 (and (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46107 (validMask!0 (mask!7333 newMap!16))))

(assert (=> d!46107 (= (getCurrentListMap!535 (_keys!4740 newMap!16) (ite (or c!27259 c!27258) (_values!2958 newMap!16) (array!4910 (store (arr!2319 (_values!2958 newMap!16)) (index!3266 lt!75554) (ValueCellFull!1127 (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2593 (_values!2958 newMap!16)))) (mask!7333 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) lt!75893)))

(declare-fun bm!16063 () Bool)

(declare-fun call!16072 () ListLongMap!1695)

(assert (=> bm!16063 (= call!16066 call!16072)))

(declare-fun b!144487 () Bool)

(declare-fun e!94139 () Bool)

(assert (=> b!144487 (= e!94139 (validKeyInArray!0 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144488 () Bool)

(declare-fun e!94149 () Bool)

(assert (=> b!144488 (= e!94149 (= (apply!122 lt!75893 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2822 newMap!16)))))

(declare-fun b!144489 () Bool)

(declare-fun res!68819 () Bool)

(assert (=> b!144489 (=> (not res!68819) (not e!94141))))

(declare-fun e!94144 () Bool)

(assert (=> b!144489 (= res!68819 e!94144)))

(declare-fun res!68826 () Bool)

(assert (=> b!144489 (=> res!68826 e!94144)))

(assert (=> b!144489 (= res!68826 (not e!94139))))

(declare-fun res!68824 () Bool)

(assert (=> b!144489 (=> (not res!68824) (not e!94139))))

(assert (=> b!144489 (= res!68824 (bvslt #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))))))

(declare-fun b!144490 () Bool)

(declare-fun c!27370 () Bool)

(assert (=> b!144490 (= c!27370 (and (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!144490 (= e!94146 e!94140)))

(declare-fun b!144491 () Bool)

(assert (=> b!144491 (= e!94140 call!16066)))

(declare-fun b!144492 () Bool)

(declare-fun Unit!4572 () Unit!4553)

(assert (=> b!144492 (= e!94145 Unit!4572)))

(declare-fun bm!16065 () Bool)

(assert (=> bm!16065 (= call!16068 (contains!913 lt!75893 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16066 () Bool)

(declare-fun call!16071 () ListLongMap!1695)

(assert (=> bm!16066 (= call!16072 (+!175 (ite c!27369 call!16070 (ite c!27367 call!16071 call!16067)) (ite (or c!27369 c!27367) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 newMap!16)) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 newMap!16)))))))

(declare-fun bm!16067 () Bool)

(assert (=> bm!16067 (= call!16067 call!16071)))

(declare-fun b!144493 () Bool)

(assert (=> b!144493 (= e!94144 e!94150)))

(declare-fun res!68820 () Bool)

(assert (=> b!144493 (=> (not res!68820) (not e!94150))))

(assert (=> b!144493 (= res!68820 (contains!913 lt!75893 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!144493 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))))))

(declare-fun b!144494 () Bool)

(assert (=> b!144494 (= e!94148 e!94149)))

(declare-fun res!68822 () Bool)

(assert (=> b!144494 (= res!68822 call!16069)))

(assert (=> b!144494 (=> (not res!68822) (not e!94149))))

(declare-fun b!144495 () Bool)

(assert (=> b!144495 (= e!94151 (validKeyInArray!0 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!16068 () Bool)

(assert (=> bm!16068 (= call!16069 (contains!913 lt!75893 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144496 () Bool)

(assert (=> b!144496 (= e!94143 (+!175 call!16072 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 newMap!16))))))

(declare-fun b!144497 () Bool)

(assert (=> b!144497 (= e!94147 (= (apply!122 lt!75893 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2822 newMap!16)))))

(declare-fun bm!16069 () Bool)

(assert (=> bm!16069 (= call!16071 call!16070)))

(assert (= (and d!46107 c!27369) b!144496))

(assert (= (and d!46107 (not c!27369)) b!144483))

(assert (= (and b!144483 c!27367) b!144482))

(assert (= (and b!144483 (not c!27367)) b!144490))

(assert (= (and b!144490 c!27370) b!144491))

(assert (= (and b!144490 (not c!27370)) b!144479))

(assert (= (or b!144491 b!144479) bm!16067))

(assert (= (or b!144482 bm!16067) bm!16069))

(assert (= (or b!144482 b!144491) bm!16063))

(assert (= (or b!144496 bm!16069) bm!16064))

(assert (= (or b!144496 bm!16063) bm!16066))

(assert (= (and d!46107 res!68821) b!144495))

(assert (= (and d!46107 c!27366) b!144485))

(assert (= (and d!46107 (not c!27366)) b!144492))

(assert (= (and d!46107 res!68827) b!144489))

(assert (= (and b!144489 res!68824) b!144487))

(assert (= (and b!144489 (not res!68826)) b!144493))

(assert (= (and b!144493 res!68820) b!144486))

(assert (= (and b!144489 res!68819) b!144484))

(assert (= (and b!144484 c!27368) b!144480))

(assert (= (and b!144484 (not c!27368)) b!144481))

(assert (= (and b!144480 res!68825) b!144497))

(assert (= (or b!144480 b!144481) bm!16065))

(assert (= (and b!144484 res!68823) b!144477))

(assert (= (and b!144477 c!27371) b!144494))

(assert (= (and b!144477 (not c!27371)) b!144478))

(assert (= (and b!144494 res!68822) b!144488))

(assert (= (or b!144494 b!144478) bm!16068))

(declare-fun b_lambda!6487 () Bool)

(assert (=> (not b_lambda!6487) (not b!144486)))

(assert (=> b!144486 t!6361))

(declare-fun b_and!9005 () Bool)

(assert (= b_and!9001 (and (=> t!6361 result!4243) b_and!9005)))

(assert (=> b!144486 t!6363))

(declare-fun b_and!9007 () Bool)

(assert (= b_and!9003 (and (=> t!6363 result!4245) b_and!9007)))

(assert (=> b!144487 m!173865))

(assert (=> b!144487 m!173865))

(assert (=> b!144487 m!173867))

(assert (=> b!144493 m!173865))

(assert (=> b!144493 m!173865))

(declare-fun m!174307 () Bool)

(assert (=> b!144493 m!174307))

(declare-fun m!174309 () Bool)

(assert (=> b!144485 m!174309))

(declare-fun m!174311 () Bool)

(assert (=> b!144485 m!174311))

(declare-fun m!174313 () Bool)

(assert (=> b!144485 m!174313))

(declare-fun m!174315 () Bool)

(assert (=> b!144485 m!174315))

(declare-fun m!174317 () Bool)

(assert (=> b!144485 m!174317))

(declare-fun m!174319 () Bool)

(assert (=> b!144485 m!174319))

(declare-fun m!174321 () Bool)

(assert (=> b!144485 m!174321))

(assert (=> b!144485 m!173865))

(declare-fun m!174323 () Bool)

(assert (=> b!144485 m!174323))

(declare-fun m!174325 () Bool)

(assert (=> b!144485 m!174325))

(assert (=> b!144485 m!174311))

(declare-fun m!174327 () Bool)

(assert (=> b!144485 m!174327))

(declare-fun m!174329 () Bool)

(assert (=> b!144485 m!174329))

(declare-fun m!174331 () Bool)

(assert (=> b!144485 m!174331))

(declare-fun m!174333 () Bool)

(assert (=> b!144485 m!174333))

(declare-fun m!174335 () Bool)

(assert (=> b!144485 m!174335))

(declare-fun m!174337 () Bool)

(assert (=> b!144485 m!174337))

(assert (=> b!144485 m!174329))

(declare-fun m!174339 () Bool)

(assert (=> b!144485 m!174339))

(assert (=> b!144485 m!174331))

(assert (=> b!144485 m!174323))

(declare-fun m!174341 () Bool)

(assert (=> bm!16066 m!174341))

(assert (=> bm!16064 m!174321))

(assert (=> b!144486 m!173905))

(assert (=> b!144486 m!173865))

(declare-fun m!174343 () Bool)

(assert (=> b!144486 m!174343))

(declare-fun m!174345 () Bool)

(assert (=> b!144486 m!174345))

(assert (=> b!144486 m!173865))

(assert (=> b!144486 m!174345))

(assert (=> b!144486 m!173905))

(declare-fun m!174347 () Bool)

(assert (=> b!144486 m!174347))

(assert (=> d!46107 m!173913))

(declare-fun m!174349 () Bool)

(assert (=> b!144488 m!174349))

(declare-fun m!174351 () Bool)

(assert (=> b!144496 m!174351))

(declare-fun m!174353 () Bool)

(assert (=> b!144497 m!174353))

(declare-fun m!174355 () Bool)

(assert (=> bm!16068 m!174355))

(declare-fun m!174357 () Bool)

(assert (=> bm!16065 m!174357))

(assert (=> b!144495 m!173865))

(assert (=> b!144495 m!173865))

(assert (=> b!144495 m!173867))

(assert (=> bm!15986 d!46107))

(declare-fun d!46109 () Bool)

(assert (=> d!46109 (= (get!1549 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144081 d!46109))

(assert (=> b!143918 d!46043))

(declare-fun b!144498 () Bool)

(declare-fun e!94154 () Bool)

(declare-fun e!94161 () Bool)

(assert (=> b!144498 (= e!94154 e!94161)))

(declare-fun c!27377 () Bool)

(assert (=> b!144498 (= c!27377 (not (= (bvand (ite c!27259 (ite c!27263 lt!75546 lt!75555) (extraKeys!2724 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144499 () Bool)

(declare-fun call!16076 () Bool)

(assert (=> b!144499 (= e!94161 (not call!16076))))

(declare-fun b!144500 () Bool)

(declare-fun e!94153 () ListLongMap!1695)

(declare-fun call!16074 () ListLongMap!1695)

(assert (=> b!144500 (= e!94153 call!16074)))

(declare-fun b!144501 () Bool)

(declare-fun e!94155 () Bool)

(declare-fun e!94160 () Bool)

(assert (=> b!144501 (= e!94155 e!94160)))

(declare-fun res!68834 () Bool)

(declare-fun call!16075 () Bool)

(assert (=> b!144501 (= res!68834 call!16075)))

(assert (=> b!144501 (=> (not res!68834) (not e!94160))))

(declare-fun b!144502 () Bool)

(assert (=> b!144502 (= e!94155 (not call!16075))))

(declare-fun b!144503 () Bool)

(declare-fun e!94159 () ListLongMap!1695)

(declare-fun call!16073 () ListLongMap!1695)

(assert (=> b!144503 (= e!94159 call!16073)))

(declare-fun b!144504 () Bool)

(declare-fun e!94156 () ListLongMap!1695)

(assert (=> b!144504 (= e!94156 e!94159)))

(declare-fun c!27373 () Bool)

(assert (=> b!144504 (= c!27373 (and (not (= (bvand (ite c!27259 (ite c!27263 lt!75546 lt!75555) (extraKeys!2724 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!27259 (ite c!27263 lt!75546 lt!75555) (extraKeys!2724 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144505 () Bool)

(declare-fun res!68832 () Bool)

(assert (=> b!144505 (=> (not res!68832) (not e!94154))))

(assert (=> b!144505 (= res!68832 e!94155)))

(declare-fun c!27374 () Bool)

(assert (=> b!144505 (= c!27374 (not (= (bvand (ite c!27259 (ite c!27263 lt!75546 lt!75555) (extraKeys!2724 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!144506 () Bool)

(declare-fun e!94158 () Unit!4553)

(declare-fun lt!75924 () Unit!4553)

(assert (=> b!144506 (= e!94158 lt!75924)))

(declare-fun lt!75927 () ListLongMap!1695)

(assert (=> b!144506 (= lt!75927 (getCurrentListMapNoExtraKeys!142 (_keys!4740 newMap!16) (ite c!27259 (_values!2958 newMap!16) lt!75541) (mask!7333 newMap!16) (ite c!27259 (ite c!27263 lt!75546 lt!75555) (extraKeys!2724 newMap!16)) (ite (and c!27259 c!27263) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)) (ite c!27259 (ite c!27263 (minValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75913 () (_ BitVec 64))

(assert (=> b!144506 (= lt!75913 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75925 () (_ BitVec 64))

(assert (=> b!144506 (= lt!75925 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75926 () Unit!4553)

(assert (=> b!144506 (= lt!75926 (addStillContains!98 lt!75927 lt!75913 (ite (and c!27259 c!27263) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)) lt!75925))))

(assert (=> b!144506 (contains!913 (+!175 lt!75927 (tuple2!2643 lt!75913 (ite (and c!27259 c!27263) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)))) lt!75925)))

(declare-fun lt!75929 () Unit!4553)

(assert (=> b!144506 (= lt!75929 lt!75926)))

(declare-fun lt!75912 () ListLongMap!1695)

(assert (=> b!144506 (= lt!75912 (getCurrentListMapNoExtraKeys!142 (_keys!4740 newMap!16) (ite c!27259 (_values!2958 newMap!16) lt!75541) (mask!7333 newMap!16) (ite c!27259 (ite c!27263 lt!75546 lt!75555) (extraKeys!2724 newMap!16)) (ite (and c!27259 c!27263) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)) (ite c!27259 (ite c!27263 (minValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75911 () (_ BitVec 64))

(assert (=> b!144506 (= lt!75911 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75909 () (_ BitVec 64))

(assert (=> b!144506 (= lt!75909 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75919 () Unit!4553)

(assert (=> b!144506 (= lt!75919 (addApplyDifferent!98 lt!75912 lt!75911 (ite c!27259 (ite c!27263 (minValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)) lt!75909))))

(assert (=> b!144506 (= (apply!122 (+!175 lt!75912 (tuple2!2643 lt!75911 (ite c!27259 (ite c!27263 (minValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)))) lt!75909) (apply!122 lt!75912 lt!75909))))

(declare-fun lt!75928 () Unit!4553)

(assert (=> b!144506 (= lt!75928 lt!75919)))

(declare-fun lt!75918 () ListLongMap!1695)

(assert (=> b!144506 (= lt!75918 (getCurrentListMapNoExtraKeys!142 (_keys!4740 newMap!16) (ite c!27259 (_values!2958 newMap!16) lt!75541) (mask!7333 newMap!16) (ite c!27259 (ite c!27263 lt!75546 lt!75555) (extraKeys!2724 newMap!16)) (ite (and c!27259 c!27263) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)) (ite c!27259 (ite c!27263 (minValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75910 () (_ BitVec 64))

(assert (=> b!144506 (= lt!75910 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75914 () (_ BitVec 64))

(assert (=> b!144506 (= lt!75914 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75921 () Unit!4553)

(assert (=> b!144506 (= lt!75921 (addApplyDifferent!98 lt!75918 lt!75910 (ite (and c!27259 c!27263) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)) lt!75914))))

(assert (=> b!144506 (= (apply!122 (+!175 lt!75918 (tuple2!2643 lt!75910 (ite (and c!27259 c!27263) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)))) lt!75914) (apply!122 lt!75918 lt!75914))))

(declare-fun lt!75916 () Unit!4553)

(assert (=> b!144506 (= lt!75916 lt!75921)))

(declare-fun lt!75922 () ListLongMap!1695)

(assert (=> b!144506 (= lt!75922 (getCurrentListMapNoExtraKeys!142 (_keys!4740 newMap!16) (ite c!27259 (_values!2958 newMap!16) lt!75541) (mask!7333 newMap!16) (ite c!27259 (ite c!27263 lt!75546 lt!75555) (extraKeys!2724 newMap!16)) (ite (and c!27259 c!27263) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)) (ite c!27259 (ite c!27263 (minValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75923 () (_ BitVec 64))

(assert (=> b!144506 (= lt!75923 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75917 () (_ BitVec 64))

(assert (=> b!144506 (= lt!75917 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!144506 (= lt!75924 (addApplyDifferent!98 lt!75922 lt!75923 (ite c!27259 (ite c!27263 (minValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)) lt!75917))))

(assert (=> b!144506 (= (apply!122 (+!175 lt!75922 (tuple2!2643 lt!75923 (ite c!27259 (ite c!27263 (minValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)))) lt!75917) (apply!122 lt!75922 lt!75917))))

(declare-fun b!144507 () Bool)

(declare-fun e!94163 () Bool)

(declare-fun lt!75915 () ListLongMap!1695)

(assert (=> b!144507 (= e!94163 (= (apply!122 lt!75915 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000)) (get!1546 (select (arr!2319 (ite c!27259 (_values!2958 newMap!16) lt!75541)) #b00000000000000000000000000000000) (dynLambda!444 (defaultEntry!2975 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144507 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2593 (ite c!27259 (_values!2958 newMap!16) lt!75541))))))

(assert (=> b!144507 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))))))

(declare-fun bm!16071 () Bool)

(declare-fun call!16077 () ListLongMap!1695)

(assert (=> bm!16071 (= call!16077 (getCurrentListMapNoExtraKeys!142 (_keys!4740 newMap!16) (ite c!27259 (_values!2958 newMap!16) lt!75541) (mask!7333 newMap!16) (ite c!27259 (ite c!27263 lt!75546 lt!75555) (extraKeys!2724 newMap!16)) (ite (and c!27259 c!27263) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)) (ite c!27259 (ite c!27263 (minValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun d!46111 () Bool)

(assert (=> d!46111 e!94154))

(declare-fun res!68836 () Bool)

(assert (=> d!46111 (=> (not res!68836) (not e!94154))))

(assert (=> d!46111 (= res!68836 (or (bvsge #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))))))))

(declare-fun lt!75930 () ListLongMap!1695)

(assert (=> d!46111 (= lt!75915 lt!75930)))

(declare-fun lt!75920 () Unit!4553)

(assert (=> d!46111 (= lt!75920 e!94158)))

(declare-fun c!27372 () Bool)

(declare-fun e!94164 () Bool)

(assert (=> d!46111 (= c!27372 e!94164)))

(declare-fun res!68830 () Bool)

(assert (=> d!46111 (=> (not res!68830) (not e!94164))))

(assert (=> d!46111 (= res!68830 (bvslt #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))))))

(assert (=> d!46111 (= lt!75930 e!94156)))

(declare-fun c!27375 () Bool)

(assert (=> d!46111 (= c!27375 (and (not (= (bvand (ite c!27259 (ite c!27263 lt!75546 lt!75555) (extraKeys!2724 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!27259 (ite c!27263 lt!75546 lt!75555) (extraKeys!2724 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46111 (validMask!0 (mask!7333 newMap!16))))

(assert (=> d!46111 (= (getCurrentListMap!535 (_keys!4740 newMap!16) (ite c!27259 (_values!2958 newMap!16) lt!75541) (mask!7333 newMap!16) (ite c!27259 (ite c!27263 lt!75546 lt!75555) (extraKeys!2724 newMap!16)) (ite (and c!27259 c!27263) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)) (ite c!27259 (ite c!27263 (minValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) lt!75915)))

(declare-fun bm!16070 () Bool)

(declare-fun call!16079 () ListLongMap!1695)

(assert (=> bm!16070 (= call!16073 call!16079)))

(declare-fun b!144508 () Bool)

(declare-fun e!94152 () Bool)

(assert (=> b!144508 (= e!94152 (validKeyInArray!0 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!94162 () Bool)

(declare-fun b!144509 () Bool)

(assert (=> b!144509 (= e!94162 (= (apply!122 lt!75915 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!27259 (ite c!27263 (minValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16))))))

(declare-fun b!144510 () Bool)

(declare-fun res!68828 () Bool)

(assert (=> b!144510 (=> (not res!68828) (not e!94154))))

(declare-fun e!94157 () Bool)

(assert (=> b!144510 (= res!68828 e!94157)))

(declare-fun res!68835 () Bool)

(assert (=> b!144510 (=> res!68835 e!94157)))

(assert (=> b!144510 (= res!68835 (not e!94152))))

(declare-fun res!68833 () Bool)

(assert (=> b!144510 (=> (not res!68833) (not e!94152))))

(assert (=> b!144510 (= res!68833 (bvslt #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))))))

(declare-fun c!27376 () Bool)

(declare-fun b!144511 () Bool)

(assert (=> b!144511 (= c!27376 (and (not (= (bvand (ite c!27259 (ite c!27263 lt!75546 lt!75555) (extraKeys!2724 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!27259 (ite c!27263 lt!75546 lt!75555) (extraKeys!2724 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!144511 (= e!94159 e!94153)))

(declare-fun b!144512 () Bool)

(assert (=> b!144512 (= e!94153 call!16073)))

(declare-fun b!144513 () Bool)

(declare-fun Unit!4573 () Unit!4553)

(assert (=> b!144513 (= e!94158 Unit!4573)))

(declare-fun bm!16072 () Bool)

(assert (=> bm!16072 (= call!16075 (contains!913 lt!75915 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!16078 () ListLongMap!1695)

(declare-fun bm!16073 () Bool)

(assert (=> bm!16073 (= call!16079 (+!175 (ite c!27375 call!16077 (ite c!27373 call!16078 call!16074)) (ite (or c!27375 c!27373) (tuple2!2643 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!27259 c!27263) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16))) (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!27259 (ite c!27263 (minValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16))))))))

(declare-fun bm!16074 () Bool)

(assert (=> bm!16074 (= call!16074 call!16078)))

(declare-fun b!144514 () Bool)

(assert (=> b!144514 (= e!94157 e!94163)))

(declare-fun res!68829 () Bool)

(assert (=> b!144514 (=> (not res!68829) (not e!94163))))

(assert (=> b!144514 (= res!68829 (contains!913 lt!75915 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!144514 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2592 (_keys!4740 newMap!16))))))

(declare-fun b!144515 () Bool)

(assert (=> b!144515 (= e!94161 e!94162)))

(declare-fun res!68831 () Bool)

(assert (=> b!144515 (= res!68831 call!16076)))

(assert (=> b!144515 (=> (not res!68831) (not e!94162))))

(declare-fun b!144516 () Bool)

(assert (=> b!144516 (= e!94164 (validKeyInArray!0 (select (arr!2318 (_keys!4740 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!16075 () Bool)

(assert (=> bm!16075 (= call!16076 (contains!913 lt!75915 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144517 () Bool)

(assert (=> b!144517 (= e!94156 (+!175 call!16079 (tuple2!2643 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!27259 (ite c!27263 (minValue!2822 newMap!16) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)))))))

(declare-fun b!144518 () Bool)

(assert (=> b!144518 (= e!94160 (= (apply!122 lt!75915 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!27259 c!27263) (get!1546 (select (arr!2319 (_values!2958 (v!3308 (underlying!485 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16))))))

(declare-fun bm!16076 () Bool)

(assert (=> bm!16076 (= call!16078 call!16077)))

(assert (= (and d!46111 c!27375) b!144517))

(assert (= (and d!46111 (not c!27375)) b!144504))

(assert (= (and b!144504 c!27373) b!144503))

(assert (= (and b!144504 (not c!27373)) b!144511))

(assert (= (and b!144511 c!27376) b!144512))

(assert (= (and b!144511 (not c!27376)) b!144500))

(assert (= (or b!144512 b!144500) bm!16074))

(assert (= (or b!144503 bm!16074) bm!16076))

(assert (= (or b!144503 b!144512) bm!16070))

(assert (= (or b!144517 bm!16076) bm!16071))

(assert (= (or b!144517 bm!16070) bm!16073))

(assert (= (and d!46111 res!68830) b!144516))

(assert (= (and d!46111 c!27372) b!144506))

(assert (= (and d!46111 (not c!27372)) b!144513))

(assert (= (and d!46111 res!68836) b!144510))

(assert (= (and b!144510 res!68833) b!144508))

(assert (= (and b!144510 (not res!68835)) b!144514))

(assert (= (and b!144514 res!68829) b!144507))

(assert (= (and b!144510 res!68828) b!144505))

(assert (= (and b!144505 c!27374) b!144501))

(assert (= (and b!144505 (not c!27374)) b!144502))

(assert (= (and b!144501 res!68834) b!144518))

(assert (= (or b!144501 b!144502) bm!16072))

(assert (= (and b!144505 res!68832) b!144498))

(assert (= (and b!144498 c!27377) b!144515))

(assert (= (and b!144498 (not c!27377)) b!144499))

(assert (= (and b!144515 res!68831) b!144509))

(assert (= (or b!144515 b!144499) bm!16075))

(declare-fun b_lambda!6489 () Bool)

(assert (=> (not b_lambda!6489) (not b!144507)))

(assert (=> b!144507 t!6361))

(declare-fun b_and!9009 () Bool)

(assert (= b_and!9005 (and (=> t!6361 result!4243) b_and!9009)))

(assert (=> b!144507 t!6363))

(declare-fun b_and!9011 () Bool)

(assert (= b_and!9007 (and (=> t!6363 result!4245) b_and!9011)))

(assert (=> b!144508 m!173865))

(assert (=> b!144508 m!173865))

(assert (=> b!144508 m!173867))

(assert (=> b!144514 m!173865))

(assert (=> b!144514 m!173865))

(declare-fun m!174359 () Bool)

(assert (=> b!144514 m!174359))

(declare-fun m!174361 () Bool)

(assert (=> b!144506 m!174361))

(declare-fun m!174363 () Bool)

(assert (=> b!144506 m!174363))

(declare-fun m!174365 () Bool)

(assert (=> b!144506 m!174365))

(declare-fun m!174367 () Bool)

(assert (=> b!144506 m!174367))

(declare-fun m!174369 () Bool)

(assert (=> b!144506 m!174369))

(declare-fun m!174371 () Bool)

(assert (=> b!144506 m!174371))

(declare-fun m!174373 () Bool)

(assert (=> b!144506 m!174373))

(assert (=> b!144506 m!173865))

(declare-fun m!174375 () Bool)

(assert (=> b!144506 m!174375))

(declare-fun m!174377 () Bool)

(assert (=> b!144506 m!174377))

(assert (=> b!144506 m!174363))

(declare-fun m!174379 () Bool)

(assert (=> b!144506 m!174379))

(declare-fun m!174381 () Bool)

(assert (=> b!144506 m!174381))

(declare-fun m!174383 () Bool)

(assert (=> b!144506 m!174383))

(declare-fun m!174385 () Bool)

(assert (=> b!144506 m!174385))

(declare-fun m!174387 () Bool)

(assert (=> b!144506 m!174387))

(declare-fun m!174389 () Bool)

(assert (=> b!144506 m!174389))

(assert (=> b!144506 m!174381))

(declare-fun m!174391 () Bool)

(assert (=> b!144506 m!174391))

(assert (=> b!144506 m!174383))

(assert (=> b!144506 m!174375))

(declare-fun m!174393 () Bool)

(assert (=> bm!16073 m!174393))

(assert (=> bm!16071 m!174373))

(assert (=> b!144507 m!173905))

(assert (=> b!144507 m!173865))

(declare-fun m!174395 () Bool)

(assert (=> b!144507 m!174395))

(declare-fun m!174397 () Bool)

(assert (=> b!144507 m!174397))

(assert (=> b!144507 m!173865))

(assert (=> b!144507 m!174397))

(assert (=> b!144507 m!173905))

(declare-fun m!174399 () Bool)

(assert (=> b!144507 m!174399))

(assert (=> d!46111 m!173913))

(declare-fun m!174401 () Bool)

(assert (=> b!144509 m!174401))

(declare-fun m!174403 () Bool)

(assert (=> b!144517 m!174403))

(declare-fun m!174405 () Bool)

(assert (=> b!144518 m!174405))

(declare-fun m!174407 () Bool)

(assert (=> bm!16075 m!174407))

(declare-fun m!174409 () Bool)

(assert (=> bm!16072 m!174409))

(assert (=> b!144516 m!173865))

(assert (=> b!144516 m!173865))

(assert (=> b!144516 m!173867))

(assert (=> bm!16003 d!46111))

(declare-fun mapIsEmpty!4897 () Bool)

(declare-fun mapRes!4897 () Bool)

(assert (=> mapIsEmpty!4897 mapRes!4897))

(declare-fun b!144519 () Bool)

(declare-fun e!94166 () Bool)

(assert (=> b!144519 (= e!94166 tp_is_empty!2941)))

(declare-fun mapNonEmpty!4897 () Bool)

(declare-fun tp!11665 () Bool)

(assert (=> mapNonEmpty!4897 (= mapRes!4897 (and tp!11665 e!94166))))

(declare-fun mapKey!4897 () (_ BitVec 32))

(declare-fun mapRest!4897 () (Array (_ BitVec 32) ValueCell!1127))

(declare-fun mapValue!4897 () ValueCell!1127)

(assert (=> mapNonEmpty!4897 (= mapRest!4895 (store mapRest!4897 mapKey!4897 mapValue!4897))))

(declare-fun b!144520 () Bool)

(declare-fun e!94165 () Bool)

(assert (=> b!144520 (= e!94165 tp_is_empty!2941)))

(declare-fun condMapEmpty!4897 () Bool)

(declare-fun mapDefault!4897 () ValueCell!1127)

(assert (=> mapNonEmpty!4895 (= condMapEmpty!4897 (= mapRest!4895 ((as const (Array (_ BitVec 32) ValueCell!1127)) mapDefault!4897)))))

(assert (=> mapNonEmpty!4895 (= tp!11663 (and e!94165 mapRes!4897))))

(assert (= (and mapNonEmpty!4895 condMapEmpty!4897) mapIsEmpty!4897))

(assert (= (and mapNonEmpty!4895 (not condMapEmpty!4897)) mapNonEmpty!4897))

(assert (= (and mapNonEmpty!4897 ((_ is ValueCellFull!1127) mapValue!4897)) b!144519))

(assert (= (and mapNonEmpty!4895 ((_ is ValueCellFull!1127) mapDefault!4897)) b!144520))

(declare-fun m!174411 () Bool)

(assert (=> mapNonEmpty!4897 m!174411))

(declare-fun mapIsEmpty!4898 () Bool)

(declare-fun mapRes!4898 () Bool)

(assert (=> mapIsEmpty!4898 mapRes!4898))

(declare-fun b!144521 () Bool)

(declare-fun e!94168 () Bool)

(assert (=> b!144521 (= e!94168 tp_is_empty!2941)))

(declare-fun mapNonEmpty!4898 () Bool)

(declare-fun tp!11666 () Bool)

(assert (=> mapNonEmpty!4898 (= mapRes!4898 (and tp!11666 e!94168))))

(declare-fun mapRest!4898 () (Array (_ BitVec 32) ValueCell!1127))

(declare-fun mapKey!4898 () (_ BitVec 32))

(declare-fun mapValue!4898 () ValueCell!1127)

(assert (=> mapNonEmpty!4898 (= mapRest!4896 (store mapRest!4898 mapKey!4898 mapValue!4898))))

(declare-fun b!144522 () Bool)

(declare-fun e!94167 () Bool)

(assert (=> b!144522 (= e!94167 tp_is_empty!2941)))

(declare-fun condMapEmpty!4898 () Bool)

(declare-fun mapDefault!4898 () ValueCell!1127)

(assert (=> mapNonEmpty!4896 (= condMapEmpty!4898 (= mapRest!4896 ((as const (Array (_ BitVec 32) ValueCell!1127)) mapDefault!4898)))))

(assert (=> mapNonEmpty!4896 (= tp!11664 (and e!94167 mapRes!4898))))

(assert (= (and mapNonEmpty!4896 condMapEmpty!4898) mapIsEmpty!4898))

(assert (= (and mapNonEmpty!4896 (not condMapEmpty!4898)) mapNonEmpty!4898))

(assert (= (and mapNonEmpty!4898 ((_ is ValueCellFull!1127) mapValue!4898)) b!144521))

(assert (= (and mapNonEmpty!4896 ((_ is ValueCellFull!1127) mapDefault!4898)) b!144522))

(declare-fun m!174413 () Bool)

(assert (=> mapNonEmpty!4898 m!174413))

(declare-fun b_lambda!6491 () Bool)

(assert (= b_lambda!6487 (or (and b!143775 b_free!3049 (= (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) (defaultEntry!2975 newMap!16))) (and b!143769 b_free!3051) b_lambda!6491)))

(declare-fun b_lambda!6493 () Bool)

(assert (= b_lambda!6483 (or (and b!143775 b_free!3049) (and b!143769 b_free!3051 (= (defaultEntry!2975 newMap!16) (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))))) b_lambda!6493)))

(declare-fun b_lambda!6495 () Bool)

(assert (= b_lambda!6481 (or (and b!143775 b_free!3049 (= (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) (defaultEntry!2975 newMap!16))) (and b!143769 b_free!3051) b_lambda!6495)))

(declare-fun b_lambda!6497 () Bool)

(assert (= b_lambda!6485 (or (and b!143775 b_free!3049) (and b!143769 b_free!3051 (= (defaultEntry!2975 newMap!16) (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))))) b_lambda!6497)))

(declare-fun b_lambda!6499 () Bool)

(assert (= b_lambda!6489 (or (and b!143775 b_free!3049 (= (defaultEntry!2975 (v!3308 (underlying!485 thiss!992))) (defaultEntry!2975 newMap!16))) (and b!143769 b_free!3051) b_lambda!6499)))

(check-sat (not bm!16071) (not b!144231) (not bm!16032) (not b!144461) (not bm!16064) (not b!144452) (not b!144373) (not b!144449) (not b!144486) (not b!144496) (not d!46065) (not b!144497) (not d!46047) (not b!144223) (not bm!16043) (not bm!16051) (not d!46037) (not d!45989) (not b!144354) (not d!46055) (not bm!16068) (not d!46091) (not b!144326) (not d!46103) (not b!144362) (not d!46005) (not bm!16048) (not bm!16045) (not d!46045) (not b!144166) (not b!144230) (not b!144410) (not d!45987) (not d!46097) (not b!144233) (not d!46035) (not b!144458) (not d!46031) (not d!46069) (not d!45981) (not d!46083) (not d!46017) (not b!144456) (not b_next!3051) (not d!46001) (not b!144198) (not b!144323) (not b!144339) (not b!144328) (not b!144329) (not b!144517) (not b!144453) (not b!144507) (not b!144189) (not d!46059) (not b_lambda!6491) (not b!144338) (not b!144211) (not b!144446) (not d!46053) (not b!144462) (not b!144191) (not b!144493) (not b!144357) (not bm!16065) (not b!144288) (not b!144474) (not d!46011) (not b!144509) (not b!144379) (not d!46021) (not b_lambda!6497) (not b!144506) (not b_lambda!6479) (not b!144475) (not d!46095) (not b!144333) (not bm!16072) (not b!144436) (not b!144468) (not d!46013) (not b!144355) (not d!46033) (not bm!16062) (not b!144356) (not d!46019) (not b!144466) (not d!46023) (not b!144283) (not b!144170) (not bm!16075) b_and!9009 (not b!144385) (not bm!16028) (not b!144331) (not b!144387) (not d!46015) (not b!144179) (not bm!16056) (not b!144190) (not d!45983) (not b!144330) (not b!144171) (not b!144268) (not d!45995) (not d!46073) (not b!144199) (not d!46041) (not d!46003) (not b!144516) (not d!46027) (not b_lambda!6495) (not mapNonEmpty!4897) (not b!144321) (not b!144178) (not b!144450) (not b_lambda!6493) (not b!144360) (not b!144401) (not d!46075) (not b!144457) (not d!46107) (not b!144465) (not d!46077) (not b!144284) (not d!46085) (not b!144188) (not bm!16066) (not b!144408) (not b!144359) (not b!144514) (not d!46067) (not d!46029) (not b!144407) (not b!144287) (not b!144336) (not d!45975) (not b!144386) (not d!46101) (not d!46105) (not b!144295) (not d!46099) (not b!144273) (not b!144351) (not b!144168) (not b!144196) (not bm!16030) (not b!144367) (not b_lambda!6475) (not d!46025) (not b!144173) (not b!144286) (not b!144451) (not b!144296) (not b!144275) (not bm!16060) (not b!144508) (not b!144476) (not d!46111) (not d!46049) (not b!144335) (not mapNonEmpty!4898) (not d!45997) (not d!46061) (not bm!16061) (not b!144337) (not b!144377) (not b!144277) (not bm!16042) (not b!144222) b_and!9011 (not b!144518) (not b!144376) (not b_next!3049) (not b!144322) (not b!144487) (not bm!16029) (not d!46009) (not b!144169) (not b!144350) (not b!144232) (not b!144488) tp_is_empty!2941 (not b!144471) (not bm!16073) (not b_lambda!6499) (not bm!16057) (not d!46007) (not b!144485) (not b!144200) (not b!144495))
(check-sat b_and!9009 b_and!9011 (not b_next!3049) (not b_next!3051))
