; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13120 () Bool)

(assert start!13120)

(declare-fun b!114686 () Bool)

(declare-fun b_free!2641 () Bool)

(declare-fun b_next!2641 () Bool)

(assert (=> b!114686 (= b_free!2641 (not b_next!2641))))

(declare-fun tp!10288 () Bool)

(declare-fun b_and!7073 () Bool)

(assert (=> b!114686 (= tp!10288 b_and!7073)))

(declare-fun b!114681 () Bool)

(declare-fun b_free!2643 () Bool)

(declare-fun b_next!2643 () Bool)

(assert (=> b!114681 (= b_free!2643 (not b_next!2643))))

(declare-fun tp!10285 () Bool)

(declare-fun b_and!7075 () Bool)

(assert (=> b!114681 (= tp!10285 b_and!7075)))

(declare-fun mapIsEmpty!4143 () Bool)

(declare-fun mapRes!4144 () Bool)

(assert (=> mapIsEmpty!4143 mapRes!4144))

(declare-fun mapNonEmpty!4143 () Bool)

(declare-fun tp!10287 () Bool)

(declare-fun e!74627 () Bool)

(assert (=> mapNonEmpty!4143 (= mapRes!4144 (and tp!10287 e!74627))))

(declare-fun mapKey!4144 () (_ BitVec 32))

(declare-datatypes ((V!3297 0))(
  ( (V!3298 (val!1413 Int)) )
))
(declare-datatypes ((array!4457 0))(
  ( (array!4458 (arr!2110 (Array (_ BitVec 32) (_ BitVec 64))) (size!2371 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1025 0))(
  ( (ValueCellFull!1025 (v!2987 V!3297)) (EmptyCell!1025) )
))
(declare-datatypes ((array!4459 0))(
  ( (array!4460 (arr!2111 (Array (_ BitVec 32) ValueCell!1025)) (size!2372 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!958 0))(
  ( (LongMapFixedSize!959 (defaultEntry!2688 Int) (mask!6885 (_ BitVec 32)) (extraKeys!2477 (_ BitVec 32)) (zeroValue!2555 V!3297) (minValue!2555 V!3297) (_size!528 (_ BitVec 32)) (_keys!4409 array!4457) (_values!2671 array!4459) (_vacant!528 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!958)

(declare-fun mapRest!4143 () (Array (_ BitVec 32) ValueCell!1025))

(declare-fun mapValue!4143 () ValueCell!1025)

(assert (=> mapNonEmpty!4143 (= (arr!2111 (_values!2671 newMap!16)) (store mapRest!4143 mapKey!4144 mapValue!4143))))

(declare-fun mapIsEmpty!4144 () Bool)

(declare-fun mapRes!4143 () Bool)

(assert (=> mapIsEmpty!4144 mapRes!4143))

(declare-fun b!114673 () Bool)

(declare-datatypes ((Unit!3570 0))(
  ( (Unit!3571) )
))
(declare-fun e!74626 () Unit!3570)

(declare-fun Unit!3572 () Unit!3570)

(assert (=> b!114673 (= e!74626 Unit!3572)))

(declare-fun lt!59751 () Unit!3570)

(declare-datatypes ((Cell!746 0))(
  ( (Cell!747 (v!2988 LongMapFixedSize!958)) )
))
(declare-datatypes ((LongMap!746 0))(
  ( (LongMap!747 (underlying!384 Cell!746)) )
))
(declare-fun thiss!992 () LongMap!746)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!124 (array!4457 array!4459 (_ BitVec 32) (_ BitVec 32) V!3297 V!3297 (_ BitVec 64) (_ BitVec 32) Int) Unit!3570)

(assert (=> b!114673 (= lt!59751 (lemmaListMapContainsThenArrayContainsFrom!124 (_keys!4409 (v!2988 (underlying!384 thiss!992))) (_values!2671 (v!2988 (underlying!384 thiss!992))) (mask!6885 (v!2988 (underlying!384 thiss!992))) (extraKeys!2477 (v!2988 (underlying!384 thiss!992))) (zeroValue!2555 (v!2988 (underlying!384 thiss!992))) (minValue!2555 (v!2988 (underlying!384 thiss!992))) (select (arr!2110 (_keys!4409 (v!2988 (underlying!384 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2688 (v!2988 (underlying!384 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!114673 (arrayContainsKey!0 (_keys!4409 (v!2988 (underlying!384 thiss!992))) (select (arr!2110 (_keys!4409 (v!2988 (underlying!384 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59749 () Unit!3570)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4457 (_ BitVec 32) (_ BitVec 32)) Unit!3570)

(assert (=> b!114673 (= lt!59749 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4409 (v!2988 (underlying!384 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1650 0))(
  ( (Nil!1647) (Cons!1646 (h!2246 (_ BitVec 64)) (t!5879 List!1650)) )
))
(declare-fun arrayNoDuplicates!0 (array!4457 (_ BitVec 32) List!1650) Bool)

(assert (=> b!114673 (arrayNoDuplicates!0 (_keys!4409 (v!2988 (underlying!384 thiss!992))) from!355 Nil!1647)))

(declare-fun lt!59752 () Unit!3570)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4457 (_ BitVec 32) (_ BitVec 64) List!1650) Unit!3570)

(assert (=> b!114673 (= lt!59752 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4409 (v!2988 (underlying!384 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2110 (_keys!4409 (v!2988 (underlying!384 thiss!992)))) from!355) (Cons!1646 (select (arr!2110 (_keys!4409 (v!2988 (underlying!384 thiss!992)))) from!355) Nil!1647)))))

(assert (=> b!114673 false))

(declare-fun b!114674 () Bool)

(declare-fun res!56399 () Bool)

(declare-fun e!74637 () Bool)

(assert (=> b!114674 (=> (not res!56399) (not e!74637))))

(assert (=> b!114674 (= res!56399 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6885 newMap!16)) (_size!528 (v!2988 (underlying!384 thiss!992)))))))

(declare-fun b!114675 () Bool)

(declare-fun e!74636 () Bool)

(declare-fun tp_is_empty!2737 () Bool)

(assert (=> b!114675 (= e!74636 tp_is_empty!2737)))

(declare-fun b!114676 () Bool)

(declare-fun e!74633 () Bool)

(assert (=> b!114676 (= e!74633 false)))

(declare-fun lt!59754 () Unit!3570)

(assert (=> b!114676 (= lt!59754 e!74626)))

(declare-datatypes ((tuple2!2450 0))(
  ( (tuple2!2451 (_1!1236 (_ BitVec 64)) (_2!1236 V!3297)) )
))
(declare-datatypes ((List!1651 0))(
  ( (Nil!1648) (Cons!1647 (h!2247 tuple2!2450) (t!5880 List!1651)) )
))
(declare-datatypes ((ListLongMap!1583 0))(
  ( (ListLongMap!1584 (toList!807 List!1651)) )
))
(declare-fun lt!59750 () ListLongMap!1583)

(declare-fun c!20485 () Bool)

(declare-fun contains!846 (ListLongMap!1583 (_ BitVec 64)) Bool)

(assert (=> b!114676 (= c!20485 (contains!846 lt!59750 (select (arr!2110 (_keys!4409 (v!2988 (underlying!384 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2452 0))(
  ( (tuple2!2453 (_1!1237 Bool) (_2!1237 LongMapFixedSize!958)) )
))
(declare-fun lt!59748 () tuple2!2452)

(declare-fun update!173 (LongMapFixedSize!958 (_ BitVec 64) V!3297) tuple2!2452)

(declare-fun get!1381 (ValueCell!1025 V!3297) V!3297)

(declare-fun dynLambda!396 (Int (_ BitVec 64)) V!3297)

(assert (=> b!114676 (= lt!59748 (update!173 newMap!16 (select (arr!2110 (_keys!4409 (v!2988 (underlying!384 thiss!992)))) from!355) (get!1381 (select (arr!2111 (_values!2671 (v!2988 (underlying!384 thiss!992)))) from!355) (dynLambda!396 (defaultEntry!2688 (v!2988 (underlying!384 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!4144 () Bool)

(declare-fun tp!10286 () Bool)

(declare-fun e!74638 () Bool)

(assert (=> mapNonEmpty!4144 (= mapRes!4143 (and tp!10286 e!74638))))

(declare-fun mapRest!4144 () (Array (_ BitVec 32) ValueCell!1025))

(declare-fun mapValue!4144 () ValueCell!1025)

(declare-fun mapKey!4143 () (_ BitVec 32))

(assert (=> mapNonEmpty!4144 (= (arr!2111 (_values!2671 (v!2988 (underlying!384 thiss!992)))) (store mapRest!4144 mapKey!4143 mapValue!4144))))

(declare-fun b!114677 () Bool)

(assert (=> b!114677 (= e!74637 e!74633)))

(declare-fun res!56401 () Bool)

(assert (=> b!114677 (=> (not res!56401) (not e!74633))))

(declare-fun lt!59753 () ListLongMap!1583)

(assert (=> b!114677 (= res!56401 (and (= lt!59753 lt!59750) (not (= (select (arr!2110 (_keys!4409 (v!2988 (underlying!384 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2110 (_keys!4409 (v!2988 (underlying!384 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1306 (LongMapFixedSize!958) ListLongMap!1583)

(assert (=> b!114677 (= lt!59750 (map!1306 newMap!16))))

(declare-fun getCurrentListMap!480 (array!4457 array!4459 (_ BitVec 32) (_ BitVec 32) V!3297 V!3297 (_ BitVec 32) Int) ListLongMap!1583)

(assert (=> b!114677 (= lt!59753 (getCurrentListMap!480 (_keys!4409 (v!2988 (underlying!384 thiss!992))) (_values!2671 (v!2988 (underlying!384 thiss!992))) (mask!6885 (v!2988 (underlying!384 thiss!992))) (extraKeys!2477 (v!2988 (underlying!384 thiss!992))) (zeroValue!2555 (v!2988 (underlying!384 thiss!992))) (minValue!2555 (v!2988 (underlying!384 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2688 (v!2988 (underlying!384 thiss!992)))))))

(declare-fun res!56400 () Bool)

(assert (=> start!13120 (=> (not res!56400) (not e!74637))))

(declare-fun valid!451 (LongMap!746) Bool)

(assert (=> start!13120 (= res!56400 (valid!451 thiss!992))))

(assert (=> start!13120 e!74637))

(declare-fun e!74628 () Bool)

(assert (=> start!13120 e!74628))

(assert (=> start!13120 true))

(declare-fun e!74632 () Bool)

(assert (=> start!13120 e!74632))

(declare-fun b!114678 () Bool)

(declare-fun e!74629 () Bool)

(declare-fun e!74639 () Bool)

(assert (=> b!114678 (= e!74629 e!74639)))

(declare-fun b!114679 () Bool)

(declare-fun e!74635 () Bool)

(declare-fun e!74631 () Bool)

(assert (=> b!114679 (= e!74635 (and e!74631 mapRes!4144))))

(declare-fun condMapEmpty!4144 () Bool)

(declare-fun mapDefault!4144 () ValueCell!1025)

(assert (=> b!114679 (= condMapEmpty!4144 (= (arr!2111 (_values!2671 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1025)) mapDefault!4144)))))

(declare-fun b!114680 () Bool)

(declare-fun res!56403 () Bool)

(assert (=> b!114680 (=> (not res!56403) (not e!74637))))

(declare-fun valid!452 (LongMapFixedSize!958) Bool)

(assert (=> b!114680 (= res!56403 (valid!452 newMap!16))))

(declare-fun array_inv!1337 (array!4457) Bool)

(declare-fun array_inv!1338 (array!4459) Bool)

(assert (=> b!114681 (= e!74632 (and tp!10285 tp_is_empty!2737 (array_inv!1337 (_keys!4409 newMap!16)) (array_inv!1338 (_values!2671 newMap!16)) e!74635))))

(declare-fun b!114682 () Bool)

(assert (=> b!114682 (= e!74631 tp_is_empty!2737)))

(declare-fun b!114683 () Bool)

(declare-fun e!74634 () Bool)

(assert (=> b!114683 (= e!74634 (and e!74636 mapRes!4143))))

(declare-fun condMapEmpty!4143 () Bool)

(declare-fun mapDefault!4143 () ValueCell!1025)

(assert (=> b!114683 (= condMapEmpty!4143 (= (arr!2111 (_values!2671 (v!2988 (underlying!384 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1025)) mapDefault!4143)))))

(declare-fun b!114684 () Bool)

(assert (=> b!114684 (= e!74638 tp_is_empty!2737)))

(declare-fun b!114685 () Bool)

(assert (=> b!114685 (= e!74627 tp_is_empty!2737)))

(assert (=> b!114686 (= e!74639 (and tp!10288 tp_is_empty!2737 (array_inv!1337 (_keys!4409 (v!2988 (underlying!384 thiss!992)))) (array_inv!1338 (_values!2671 (v!2988 (underlying!384 thiss!992)))) e!74634))))

(declare-fun b!114687 () Bool)

(declare-fun res!56402 () Bool)

(assert (=> b!114687 (=> (not res!56402) (not e!74637))))

(assert (=> b!114687 (= res!56402 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2371 (_keys!4409 (v!2988 (underlying!384 thiss!992)))))))))

(declare-fun b!114688 () Bool)

(declare-fun Unit!3573 () Unit!3570)

(assert (=> b!114688 (= e!74626 Unit!3573)))

(declare-fun b!114689 () Bool)

(assert (=> b!114689 (= e!74628 e!74629)))

(assert (= (and start!13120 res!56400) b!114687))

(assert (= (and b!114687 res!56402) b!114680))

(assert (= (and b!114680 res!56403) b!114674))

(assert (= (and b!114674 res!56399) b!114677))

(assert (= (and b!114677 res!56401) b!114676))

(assert (= (and b!114676 c!20485) b!114673))

(assert (= (and b!114676 (not c!20485)) b!114688))

(assert (= (and b!114683 condMapEmpty!4143) mapIsEmpty!4144))

(assert (= (and b!114683 (not condMapEmpty!4143)) mapNonEmpty!4144))

(get-info :version)

(assert (= (and mapNonEmpty!4144 ((_ is ValueCellFull!1025) mapValue!4144)) b!114684))

(assert (= (and b!114683 ((_ is ValueCellFull!1025) mapDefault!4143)) b!114675))

(assert (= b!114686 b!114683))

(assert (= b!114678 b!114686))

(assert (= b!114689 b!114678))

(assert (= start!13120 b!114689))

(assert (= (and b!114679 condMapEmpty!4144) mapIsEmpty!4143))

(assert (= (and b!114679 (not condMapEmpty!4144)) mapNonEmpty!4143))

(assert (= (and mapNonEmpty!4143 ((_ is ValueCellFull!1025) mapValue!4143)) b!114685))

(assert (= (and b!114679 ((_ is ValueCellFull!1025) mapDefault!4144)) b!114682))

(assert (= b!114681 b!114679))

(assert (= start!13120 b!114681))

(declare-fun b_lambda!5121 () Bool)

(assert (=> (not b_lambda!5121) (not b!114676)))

(declare-fun t!5876 () Bool)

(declare-fun tb!2193 () Bool)

(assert (=> (and b!114686 (= (defaultEntry!2688 (v!2988 (underlying!384 thiss!992))) (defaultEntry!2688 (v!2988 (underlying!384 thiss!992)))) t!5876) tb!2193))

(declare-fun result!3663 () Bool)

(assert (=> tb!2193 (= result!3663 tp_is_empty!2737)))

(assert (=> b!114676 t!5876))

(declare-fun b_and!7077 () Bool)

(assert (= b_and!7073 (and (=> t!5876 result!3663) b_and!7077)))

(declare-fun tb!2195 () Bool)

(declare-fun t!5878 () Bool)

(assert (=> (and b!114681 (= (defaultEntry!2688 newMap!16) (defaultEntry!2688 (v!2988 (underlying!384 thiss!992)))) t!5878) tb!2195))

(declare-fun result!3667 () Bool)

(assert (= result!3667 result!3663))

(assert (=> b!114676 t!5878))

(declare-fun b_and!7079 () Bool)

(assert (= b_and!7075 (and (=> t!5878 result!3667) b_and!7079)))

(declare-fun m!130809 () Bool)

(assert (=> b!114686 m!130809))

(declare-fun m!130811 () Bool)

(assert (=> b!114686 m!130811))

(declare-fun m!130813 () Bool)

(assert (=> mapNonEmpty!4143 m!130813))

(declare-fun m!130815 () Bool)

(assert (=> b!114680 m!130815))

(declare-fun m!130817 () Bool)

(assert (=> b!114677 m!130817))

(declare-fun m!130819 () Bool)

(assert (=> b!114677 m!130819))

(declare-fun m!130821 () Bool)

(assert (=> b!114677 m!130821))

(declare-fun m!130823 () Bool)

(assert (=> start!13120 m!130823))

(declare-fun m!130825 () Bool)

(assert (=> b!114676 m!130825))

(declare-fun m!130827 () Bool)

(assert (=> b!114676 m!130827))

(declare-fun m!130829 () Bool)

(assert (=> b!114676 m!130829))

(assert (=> b!114676 m!130817))

(assert (=> b!114676 m!130827))

(assert (=> b!114676 m!130817))

(declare-fun m!130831 () Bool)

(assert (=> b!114676 m!130831))

(assert (=> b!114676 m!130817))

(assert (=> b!114676 m!130829))

(declare-fun m!130833 () Bool)

(assert (=> b!114676 m!130833))

(assert (=> b!114676 m!130825))

(declare-fun m!130835 () Bool)

(assert (=> mapNonEmpty!4144 m!130835))

(declare-fun m!130837 () Bool)

(assert (=> b!114673 m!130837))

(declare-fun m!130839 () Bool)

(assert (=> b!114673 m!130839))

(assert (=> b!114673 m!130817))

(declare-fun m!130841 () Bool)

(assert (=> b!114673 m!130841))

(assert (=> b!114673 m!130817))

(assert (=> b!114673 m!130817))

(declare-fun m!130843 () Bool)

(assert (=> b!114673 m!130843))

(assert (=> b!114673 m!130817))

(declare-fun m!130845 () Bool)

(assert (=> b!114673 m!130845))

(declare-fun m!130847 () Bool)

(assert (=> b!114681 m!130847))

(declare-fun m!130849 () Bool)

(assert (=> b!114681 m!130849))

(check-sat b_and!7079 (not mapNonEmpty!4144) (not b_next!2641) b_and!7077 (not b!114680) (not b!114673) tp_is_empty!2737 (not b!114676) (not b!114681) (not b!114686) (not b_next!2643) (not b_lambda!5121) (not b!114677) (not start!13120) (not mapNonEmpty!4143))
(check-sat b_and!7077 b_and!7079 (not b_next!2641) (not b_next!2643))
