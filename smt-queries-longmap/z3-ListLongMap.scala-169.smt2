; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3232 () Bool)

(assert start!3232)

(declare-fun b!19638 () Bool)

(declare-fun b_free!691 () Bool)

(declare-fun b_next!691 () Bool)

(assert (=> b!19638 (= b_free!691 (not b_next!691))))

(declare-fun tp!3291 () Bool)

(declare-fun b_and!1349 () Bool)

(assert (=> b!19638 (= tp!3291 b_and!1349)))

(declare-fun mapIsEmpty!895 () Bool)

(declare-fun mapRes!895 () Bool)

(assert (=> mapIsEmpty!895 mapRes!895))

(declare-fun b!19637 () Bool)

(declare-fun e!12744 () Bool)

(declare-fun e!12745 () Bool)

(assert (=> b!19637 (= e!12744 e!12745)))

(declare-fun e!12741 () Bool)

(declare-fun tp_is_empty!955 () Bool)

(declare-datatypes ((V!1099 0))(
  ( (V!1100 (val!504 Int)) )
))
(declare-datatypes ((ValueCell!278 0))(
  ( (ValueCellFull!278 (v!1524 V!1099)) (EmptyCell!278) )
))
(declare-datatypes ((array!1111 0))(
  ( (array!1112 (arr!530 (Array (_ BitVec 32) ValueCell!278)) (size!623 (_ BitVec 32))) )
))
(declare-datatypes ((array!1113 0))(
  ( (array!1114 (arr!531 (Array (_ BitVec 32) (_ BitVec 64))) (size!624 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!142 0))(
  ( (LongMapFixedSize!143 (defaultEntry!1691 Int) (mask!4647 (_ BitVec 32)) (extraKeys!1600 (_ BitVec 32)) (zeroValue!1624 V!1099) (minValue!1624 V!1099) (_size!106 (_ BitVec 32)) (_keys!3118 array!1113) (_values!1686 array!1111) (_vacant!106 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!142 0))(
  ( (Cell!143 (v!1525 LongMapFixedSize!142)) )
))
(declare-datatypes ((LongMap!142 0))(
  ( (LongMap!143 (underlying!82 Cell!142)) )
))
(declare-fun thiss!938 () LongMap!142)

(declare-fun array_inv!379 (array!1113) Bool)

(declare-fun array_inv!380 (array!1111) Bool)

(assert (=> b!19638 (= e!12745 (and tp!3291 tp_is_empty!955 (array_inv!379 (_keys!3118 (v!1525 (underlying!82 thiss!938)))) (array_inv!380 (_values!1686 (v!1525 (underlying!82 thiss!938)))) e!12741))))

(declare-fun b!19639 () Bool)

(declare-fun e!12746 () Bool)

(assert (=> b!19639 (= e!12741 (and e!12746 mapRes!895))))

(declare-fun condMapEmpty!895 () Bool)

(declare-fun mapDefault!895 () ValueCell!278)

(assert (=> b!19639 (= condMapEmpty!895 (= (arr!530 (_values!1686 (v!1525 (underlying!82 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!278)) mapDefault!895)))))

(declare-fun res!13238 () Bool)

(declare-fun e!12742 () Bool)

(assert (=> start!3232 (=> (not res!13238) (not e!12742))))

(declare-fun valid!81 (LongMap!142) Bool)

(assert (=> start!3232 (= res!13238 (valid!81 thiss!938))))

(assert (=> start!3232 e!12742))

(declare-fun e!12743 () Bool)

(assert (=> start!3232 e!12743))

(declare-fun mapNonEmpty!895 () Bool)

(declare-fun tp!3292 () Bool)

(declare-fun e!12747 () Bool)

(assert (=> mapNonEmpty!895 (= mapRes!895 (and tp!3292 e!12747))))

(declare-fun mapKey!895 () (_ BitVec 32))

(declare-fun mapValue!895 () ValueCell!278)

(declare-fun mapRest!895 () (Array (_ BitVec 32) ValueCell!278))

(assert (=> mapNonEmpty!895 (= (arr!530 (_values!1686 (v!1525 (underlying!82 thiss!938)))) (store mapRest!895 mapKey!895 mapValue!895))))

(declare-fun b!19640 () Bool)

(declare-fun e!12740 () Bool)

(assert (=> b!19640 (= e!12742 e!12740)))

(declare-fun res!13239 () Bool)

(assert (=> b!19640 (=> (not res!13239) (not e!12740))))

(assert (=> b!19640 (= res!13239 (and (not (= (bvand (extraKeys!1600 (v!1525 (underlying!82 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1600 (v!1525 (underlying!82 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!5517 () LongMapFixedSize!142)

(declare-fun getNewLongMapFixedSize!13 ((_ BitVec 32) Int) LongMapFixedSize!142)

(declare-fun computeNewMask!8 (LongMap!142 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19640 (= lt!5517 (getNewLongMapFixedSize!13 (computeNewMask!8 thiss!938 (mask!4647 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))) (_size!106 (v!1525 (underlying!82 thiss!938)))) (defaultEntry!1691 (v!1525 (underlying!82 thiss!938)))))))

(declare-fun b!19641 () Bool)

(assert (=> b!19641 (= e!12746 tp_is_empty!955)))

(declare-fun b!19642 () Bool)

(assert (=> b!19642 (= e!12747 tp_is_empty!955)))

(declare-fun b!19643 () Bool)

(assert (=> b!19643 (= e!12743 e!12744)))

(declare-fun b!19644 () Bool)

(declare-fun valid!82 (LongMapFixedSize!142) Bool)

(declare-datatypes ((tuple2!830 0))(
  ( (tuple2!831 (_1!418 Bool) (_2!418 LongMapFixedSize!142)) )
))
(declare-fun update!16 (LongMapFixedSize!142 (_ BitVec 64) V!1099) tuple2!830)

(assert (=> b!19644 (= e!12740 (not (valid!82 (_2!418 (update!16 lt!5517 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1525 (underlying!82 thiss!938))))))))))

(assert (= (and start!3232 res!13238) b!19640))

(assert (= (and b!19640 res!13239) b!19644))

(assert (= (and b!19639 condMapEmpty!895) mapIsEmpty!895))

(assert (= (and b!19639 (not condMapEmpty!895)) mapNonEmpty!895))

(get-info :version)

(assert (= (and mapNonEmpty!895 ((_ is ValueCellFull!278) mapValue!895)) b!19642))

(assert (= (and b!19639 ((_ is ValueCellFull!278) mapDefault!895)) b!19641))

(assert (= b!19638 b!19639))

(assert (= b!19637 b!19638))

(assert (= b!19643 b!19637))

(assert (= start!3232 b!19643))

(declare-fun m!13795 () Bool)

(assert (=> b!19640 m!13795))

(assert (=> b!19640 m!13795))

(declare-fun m!13797 () Bool)

(assert (=> b!19640 m!13797))

(declare-fun m!13799 () Bool)

(assert (=> mapNonEmpty!895 m!13799))

(declare-fun m!13801 () Bool)

(assert (=> start!3232 m!13801))

(declare-fun m!13803 () Bool)

(assert (=> b!19638 m!13803))

(declare-fun m!13805 () Bool)

(assert (=> b!19638 m!13805))

(declare-fun m!13807 () Bool)

(assert (=> b!19644 m!13807))

(declare-fun m!13809 () Bool)

(assert (=> b!19644 m!13809))

(check-sat (not b!19644) (not start!3232) (not b_next!691) b_and!1349 tp_is_empty!955 (not b!19640) (not mapNonEmpty!895) (not b!19638))
(check-sat b_and!1349 (not b_next!691))
(get-model)

(declare-fun d!3601 () Bool)

(declare-fun res!13258 () Bool)

(declare-fun e!12804 () Bool)

(assert (=> d!3601 (=> (not res!13258) (not e!12804))))

(declare-fun simpleValid!14 (LongMapFixedSize!142) Bool)

(assert (=> d!3601 (= res!13258 (simpleValid!14 (_2!418 (update!16 lt!5517 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1525 (underlying!82 thiss!938)))))))))

(assert (=> d!3601 (= (valid!82 (_2!418 (update!16 lt!5517 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1525 (underlying!82 thiss!938)))))) e!12804)))

(declare-fun b!19699 () Bool)

(declare-fun res!13259 () Bool)

(assert (=> b!19699 (=> (not res!13259) (not e!12804))))

(declare-fun arrayCountValidKeys!0 (array!1113 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19699 (= res!13259 (= (arrayCountValidKeys!0 (_keys!3118 (_2!418 (update!16 lt!5517 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1525 (underlying!82 thiss!938)))))) #b00000000000000000000000000000000 (size!624 (_keys!3118 (_2!418 (update!16 lt!5517 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1525 (underlying!82 thiss!938)))))))) (_size!106 (_2!418 (update!16 lt!5517 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1525 (underlying!82 thiss!938))))))))))

(declare-fun b!19700 () Bool)

(declare-fun res!13260 () Bool)

(assert (=> b!19700 (=> (not res!13260) (not e!12804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1113 (_ BitVec 32)) Bool)

(assert (=> b!19700 (= res!13260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3118 (_2!418 (update!16 lt!5517 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1525 (underlying!82 thiss!938)))))) (mask!4647 (_2!418 (update!16 lt!5517 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1525 (underlying!82 thiss!938))))))))))

(declare-fun b!19701 () Bool)

(declare-datatypes ((List!546 0))(
  ( (Nil!543) (Cons!542 (h!1108 (_ BitVec 64)) (t!3187 List!546)) )
))
(declare-fun arrayNoDuplicates!0 (array!1113 (_ BitVec 32) List!546) Bool)

(assert (=> b!19701 (= e!12804 (arrayNoDuplicates!0 (_keys!3118 (_2!418 (update!16 lt!5517 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1525 (underlying!82 thiss!938)))))) #b00000000000000000000000000000000 Nil!543))))

(assert (= (and d!3601 res!13258) b!19699))

(assert (= (and b!19699 res!13259) b!19700))

(assert (= (and b!19700 res!13260) b!19701))

(declare-fun m!13843 () Bool)

(assert (=> d!3601 m!13843))

(declare-fun m!13845 () Bool)

(assert (=> b!19699 m!13845))

(declare-fun m!13847 () Bool)

(assert (=> b!19700 m!13847))

(declare-fun m!13849 () Bool)

(assert (=> b!19701 m!13849))

(assert (=> b!19644 d!3601))

(declare-fun b!19786 () Bool)

(declare-fun res!13289 () Bool)

(declare-fun e!12859 () Bool)

(assert (=> b!19786 (=> (not res!13289) (not e!12859))))

(declare-datatypes ((SeekEntryResult!47 0))(
  ( (MissingZero!47 (index!2308 (_ BitVec 32))) (Found!47 (index!2309 (_ BitVec 32))) (Intermediate!47 (undefined!859 Bool) (index!2310 (_ BitVec 32)) (x!4826 (_ BitVec 32))) (Undefined!47) (MissingVacant!47 (index!2311 (_ BitVec 32))) )
))
(declare-fun lt!5585 () SeekEntryResult!47)

(assert (=> b!19786 (= res!13289 (= (select (arr!531 (_keys!3118 lt!5517)) (index!2308 lt!5585)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!836 0))(
  ( (tuple2!837 (_1!421 (_ BitVec 64)) (_2!421 V!1099)) )
))
(declare-datatypes ((List!547 0))(
  ( (Nil!544) (Cons!543 (h!1109 tuple2!836) (t!3188 List!547)) )
))
(declare-datatypes ((ListLongMap!545 0))(
  ( (ListLongMap!546 (toList!288 List!547)) )
))
(declare-fun call!964 () ListLongMap!545)

(declare-fun e!12866 () Bool)

(declare-fun call!966 () ListLongMap!545)

(declare-fun b!19787 () Bool)

(declare-fun +!37 (ListLongMap!545 tuple2!836) ListLongMap!545)

(assert (=> b!19787 (= e!12866 (= call!966 (+!37 call!964 (tuple2!837 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1525 (underlying!82 thiss!938)))))))))

(declare-fun bm!950 () Bool)

(declare-fun call!973 () ListLongMap!545)

(declare-fun call!954 () ListLongMap!545)

(assert (=> bm!950 (= call!973 call!954)))

(declare-fun b!19788 () Bool)

(declare-fun e!12867 () tuple2!830)

(declare-fun lt!5592 () tuple2!830)

(assert (=> b!19788 (= e!12867 (tuple2!831 (_1!418 lt!5592) (_2!418 lt!5592)))))

(declare-fun call!972 () tuple2!830)

(assert (=> b!19788 (= lt!5592 call!972)))

(declare-fun b!19789 () Bool)

(declare-fun e!12855 () ListLongMap!545)

(assert (=> b!19789 (= e!12855 call!973)))

(declare-fun b!19790 () Bool)

(declare-fun e!12862 () Bool)

(declare-fun call!959 () Bool)

(assert (=> b!19790 (= e!12862 (not call!959))))

(declare-fun b!19791 () Bool)

(declare-fun e!12869 () Bool)

(declare-fun e!12865 () Bool)

(assert (=> b!19791 (= e!12869 e!12865)))

(declare-fun c!2121 () Bool)

(declare-fun lt!5578 () tuple2!830)

(assert (=> b!19791 (= c!2121 (_1!418 lt!5578))))

(declare-fun bm!951 () Bool)

(declare-fun c!2113 () Bool)

(declare-fun call!968 () ListLongMap!545)

(declare-fun c!2110 () Bool)

(assert (=> bm!951 (= call!968 (+!37 e!12855 (ite c!2110 (ite c!2113 (tuple2!837 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1525 (underlying!82 thiss!938)))) (tuple2!837 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1525 (underlying!82 thiss!938))))) (tuple2!837 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1525 (underlying!82 thiss!938)))))))))

(declare-fun c!2118 () Bool)

(assert (=> bm!951 (= c!2118 c!2110)))

(declare-fun b!19792 () Bool)

(declare-datatypes ((Unit!406 0))(
  ( (Unit!407) )
))
(declare-fun e!12853 () Unit!406)

(declare-fun lt!5581 () Unit!406)

(assert (=> b!19792 (= e!12853 lt!5581)))

(declare-fun call!965 () Unit!406)

(assert (=> b!19792 (= lt!5581 call!965)))

(declare-fun call!957 () SeekEntryResult!47)

(assert (=> b!19792 (= lt!5585 call!957)))

(declare-fun c!2116 () Bool)

(assert (=> b!19792 (= c!2116 ((_ is MissingZero!47) lt!5585))))

(declare-fun e!12868 () Bool)

(assert (=> b!19792 e!12868))

(declare-fun b!19793 () Bool)

(declare-fun res!13294 () Bool)

(declare-fun lt!5587 () SeekEntryResult!47)

(assert (=> b!19793 (= res!13294 (= (select (arr!531 (_keys!3118 lt!5517)) (index!2311 lt!5587)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!12864 () Bool)

(assert (=> b!19793 (=> (not res!13294) (not e!12864))))

(declare-fun b!19794 () Bool)

(assert (=> b!19794 (= e!12865 e!12866)))

(declare-fun res!13292 () Bool)

(declare-fun contains!220 (ListLongMap!545 (_ BitVec 64)) Bool)

(assert (=> b!19794 (= res!13292 (contains!220 call!966 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!19794 (=> (not res!13292) (not e!12866))))

(declare-fun b!19795 () Bool)

(declare-fun c!2120 () Bool)

(assert (=> b!19795 (= c!2120 ((_ is MissingVacant!47) lt!5587))))

(declare-fun e!12854 () Bool)

(declare-fun e!12870 () Bool)

(assert (=> b!19795 (= e!12854 e!12870)))

(declare-fun bm!952 () Bool)

(declare-fun call!956 () Bool)

(declare-fun call!970 () Bool)

(assert (=> bm!952 (= call!956 call!970)))

(declare-fun bm!953 () Bool)

(declare-fun call!975 () Bool)

(declare-fun call!976 () Bool)

(assert (=> bm!953 (= call!975 call!976)))

(declare-fun b!19796 () Bool)

(declare-fun e!12858 () Unit!406)

(declare-fun lt!5586 () Unit!406)

(assert (=> b!19796 (= e!12858 lt!5586)))

(declare-fun call!962 () Unit!406)

(assert (=> b!19796 (= lt!5586 call!962)))

(declare-fun lt!5602 () SeekEntryResult!47)

(declare-fun call!955 () SeekEntryResult!47)

(assert (=> b!19796 (= lt!5602 call!955)))

(declare-fun res!13293 () Bool)

(assert (=> b!19796 (= res!13293 ((_ is Found!47) lt!5602))))

(declare-fun e!12849 () Bool)

(assert (=> b!19796 (=> (not res!13293) (not e!12849))))

(assert (=> b!19796 e!12849))

(declare-fun bm!954 () Bool)

(declare-fun arrayContainsKey!0 (array!1113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!954 (= call!970 (arrayContainsKey!0 (_keys!3118 lt!5517) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun bm!955 () Bool)

(declare-fun call!974 () Bool)

(assert (=> bm!955 (= call!974 call!976)))

(declare-fun b!19797 () Bool)

(declare-fun res!13291 () Bool)

(assert (=> b!19797 (=> (not res!13291) (not e!12862))))

(assert (=> b!19797 (= res!13291 (= (select (arr!531 (_keys!3118 lt!5517)) (index!2308 lt!5587)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!19798 () Bool)

(declare-fun Unit!408 () Unit!406)

(assert (=> b!19798 (= e!12853 Unit!408)))

(declare-fun lt!5593 () Unit!406)

(assert (=> b!19798 (= lt!5593 call!962)))

(declare-fun lt!5580 () SeekEntryResult!47)

(assert (=> b!19798 (= lt!5580 call!957)))

(declare-fun res!13298 () Bool)

(assert (=> b!19798 (= res!13298 ((_ is Found!47) lt!5580))))

(declare-fun e!12861 () Bool)

(assert (=> b!19798 (=> (not res!13298) (not e!12861))))

(assert (=> b!19798 e!12861))

(declare-fun lt!5588 () Unit!406)

(assert (=> b!19798 (= lt!5588 lt!5593)))

(assert (=> b!19798 false))

(declare-fun lt!5598 () (_ BitVec 32))

(declare-fun lt!5604 () (_ BitVec 32))

(declare-fun lt!5600 () array!1111)

(declare-fun bm!956 () Bool)

(declare-fun call!960 () ListLongMap!545)

(declare-fun getCurrentListMap!120 (array!1113 array!1111 (_ BitVec 32) (_ BitVec 32) V!1099 V!1099 (_ BitVec 32) Int) ListLongMap!545)

(assert (=> bm!956 (= call!960 (getCurrentListMap!120 (_keys!3118 lt!5517) (ite c!2110 (_values!1686 lt!5517) lt!5600) (mask!4647 lt!5517) (ite c!2110 (ite c!2113 lt!5598 lt!5604) (extraKeys!1600 lt!5517)) (ite (and c!2110 c!2113) (zeroValue!1624 (v!1525 (underlying!82 thiss!938))) (zeroValue!1624 lt!5517)) (ite c!2110 (ite c!2113 (minValue!1624 lt!5517) (zeroValue!1624 (v!1525 (underlying!82 thiss!938)))) (minValue!1624 lt!5517)) #b00000000000000000000000000000000 (defaultEntry!1691 lt!5517)))))

(declare-fun b!19799 () Bool)

(declare-fun res!13300 () Bool)

(assert (=> b!19799 (= res!13300 call!974)))

(assert (=> b!19799 (=> (not res!13300) (not e!12861))))

(declare-fun b!19800 () Bool)

(declare-fun c!2114 () Bool)

(declare-fun lt!5583 () SeekEntryResult!47)

(assert (=> b!19800 (= c!2114 ((_ is MissingVacant!47) lt!5583))))

(declare-fun e!12851 () tuple2!830)

(assert (=> b!19800 (= e!12851 e!12867)))

(declare-fun b!19801 () Bool)

(assert (=> b!19801 (= e!12870 e!12864)))

(declare-fun res!13299 () Bool)

(declare-fun call!961 () Bool)

(assert (=> b!19801 (= res!13299 call!961)))

(assert (=> b!19801 (=> (not res!13299) (not e!12864))))

(declare-fun bm!957 () Bool)

(declare-fun map!377 (LongMapFixedSize!142) ListLongMap!545)

(assert (=> bm!957 (= call!964 (map!377 lt!5517))))

(declare-fun bm!958 () Bool)

(declare-fun call!958 () ListLongMap!545)

(assert (=> bm!958 (= call!958 call!960)))

(declare-fun bm!959 () Bool)

(declare-fun c!2115 () Bool)

(assert (=> bm!959 (= call!954 (getCurrentListMap!120 (_keys!3118 lt!5517) (ite (or c!2110 c!2115) (_values!1686 lt!5517) (array!1112 (store (arr!530 (_values!1686 lt!5517)) (index!2309 lt!5583) (ValueCellFull!278 (zeroValue!1624 (v!1525 (underlying!82 thiss!938))))) (size!623 (_values!1686 lt!5517)))) (mask!4647 lt!5517) (extraKeys!1600 lt!5517) (zeroValue!1624 lt!5517) (minValue!1624 lt!5517) #b00000000000000000000000000000000 (defaultEntry!1691 lt!5517)))))

(declare-fun b!19802 () Bool)

(declare-fun e!12857 () tuple2!830)

(assert (=> b!19802 (= e!12857 e!12851)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1113 (_ BitVec 32)) SeekEntryResult!47)

(assert (=> b!19802 (= lt!5583 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3118 lt!5517) (mask!4647 lt!5517)))))

(assert (=> b!19802 (= c!2115 ((_ is Undefined!47) lt!5583))))

(declare-fun b!19803 () Bool)

(declare-fun e!12850 () Bool)

(assert (=> b!19803 (= e!12850 ((_ is Undefined!47) lt!5585))))

(declare-fun b!19804 () Bool)

(declare-fun e!12856 () Bool)

(assert (=> b!19804 (= e!12856 (not call!956))))

(declare-fun b!19805 () Bool)

(declare-fun lt!5603 () Unit!406)

(declare-fun lt!5595 () Unit!406)

(assert (=> b!19805 (= lt!5603 lt!5595)))

(declare-fun call!971 () Bool)

(assert (=> b!19805 call!971))

(declare-fun lemmaValidKeyInArrayIsInListMap!3 (array!1113 array!1111 (_ BitVec 32) (_ BitVec 32) V!1099 V!1099 (_ BitVec 32) Int) Unit!406)

(assert (=> b!19805 (= lt!5595 (lemmaValidKeyInArrayIsInListMap!3 (_keys!3118 lt!5517) lt!5600 (mask!4647 lt!5517) (extraKeys!1600 lt!5517) (zeroValue!1624 lt!5517) (minValue!1624 lt!5517) (index!2309 lt!5583) (defaultEntry!1691 lt!5517)))))

(assert (=> b!19805 (= lt!5600 (array!1112 (store (arr!530 (_values!1686 lt!5517)) (index!2309 lt!5583) (ValueCellFull!278 (zeroValue!1624 (v!1525 (underlying!82 thiss!938))))) (size!623 (_values!1686 lt!5517))))))

(declare-fun lt!5597 () Unit!406)

(declare-fun lt!5584 () Unit!406)

(assert (=> b!19805 (= lt!5597 lt!5584)))

(declare-fun call!953 () ListLongMap!545)

(assert (=> b!19805 (= call!968 call!953)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!3 (array!1113 array!1111 (_ BitVec 32) (_ BitVec 32) V!1099 V!1099 (_ BitVec 32) (_ BitVec 64) V!1099 Int) Unit!406)

(assert (=> b!19805 (= lt!5584 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!3 (_keys!3118 lt!5517) (_values!1686 lt!5517) (mask!4647 lt!5517) (extraKeys!1600 lt!5517) (zeroValue!1624 lt!5517) (minValue!1624 lt!5517) (index!2309 lt!5583) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1525 (underlying!82 thiss!938))) (defaultEntry!1691 lt!5517)))))

(declare-fun lt!5582 () Unit!406)

(assert (=> b!19805 (= lt!5582 e!12858)))

(declare-fun c!2111 () Bool)

(assert (=> b!19805 (= c!2111 (contains!220 (getCurrentListMap!120 (_keys!3118 lt!5517) (_values!1686 lt!5517) (mask!4647 lt!5517) (extraKeys!1600 lt!5517) (zeroValue!1624 lt!5517) (minValue!1624 lt!5517) #b00000000000000000000000000000000 (defaultEntry!1691 lt!5517)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!12852 () tuple2!830)

(assert (=> b!19805 (= e!12852 (tuple2!831 true (LongMapFixedSize!143 (defaultEntry!1691 lt!5517) (mask!4647 lt!5517) (extraKeys!1600 lt!5517) (zeroValue!1624 lt!5517) (minValue!1624 lt!5517) (_size!106 lt!5517) (_keys!3118 lt!5517) (array!1112 (store (arr!530 (_values!1686 lt!5517)) (index!2309 lt!5583) (ValueCellFull!278 (zeroValue!1624 (v!1525 (underlying!82 thiss!938))))) (size!623 (_values!1686 lt!5517))) (_vacant!106 lt!5517))))))

(declare-fun bm!960 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!3 (array!1113 array!1111 (_ BitVec 32) (_ BitVec 32) V!1099 V!1099 (_ BitVec 64) Int) Unit!406)

(assert (=> bm!960 (= call!965 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!3 (_keys!3118 lt!5517) (_values!1686 lt!5517) (mask!4647 lt!5517) (extraKeys!1600 lt!5517) (zeroValue!1624 lt!5517) (minValue!1624 lt!5517) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1691 lt!5517)))))

(declare-fun b!19806 () Bool)

(declare-fun e!12863 () ListLongMap!545)

(assert (=> b!19806 (= e!12863 call!953)))

(declare-fun b!19807 () Bool)

(declare-fun lt!5599 () Unit!406)

(declare-fun lt!5590 () Unit!406)

(assert (=> b!19807 (= lt!5599 lt!5590)))

(declare-fun call!969 () ListLongMap!545)

(assert (=> b!19807 (= call!969 call!958)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!3 (array!1113 array!1111 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1099 V!1099 V!1099 Int) Unit!406)

(assert (=> b!19807 (= lt!5590 (lemmaChangeZeroKeyThenAddPairToListMap!3 (_keys!3118 lt!5517) (_values!1686 lt!5517) (mask!4647 lt!5517) (extraKeys!1600 lt!5517) lt!5598 (zeroValue!1624 lt!5517) (zeroValue!1624 (v!1525 (underlying!82 thiss!938))) (minValue!1624 lt!5517) (defaultEntry!1691 lt!5517)))))

(assert (=> b!19807 (= lt!5598 (bvor (extraKeys!1600 lt!5517) #b00000000000000000000000000000001))))

(declare-fun e!12860 () tuple2!830)

(assert (=> b!19807 (= e!12860 (tuple2!831 true (LongMapFixedSize!143 (defaultEntry!1691 lt!5517) (mask!4647 lt!5517) (bvor (extraKeys!1600 lt!5517) #b00000000000000000000000000000001) (zeroValue!1624 (v!1525 (underlying!82 thiss!938))) (minValue!1624 lt!5517) (_size!106 lt!5517) (_keys!3118 lt!5517) (_values!1686 lt!5517) (_vacant!106 lt!5517))))))

(declare-fun bm!961 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!3 (array!1113 array!1111 (_ BitVec 32) (_ BitVec 32) V!1099 V!1099 (_ BitVec 64) Int) Unit!406)

(assert (=> bm!961 (= call!962 (lemmaInListMapThenSeekEntryOrOpenFindsIt!3 (_keys!3118 lt!5517) (_values!1686 lt!5517) (mask!4647 lt!5517) (extraKeys!1600 lt!5517) (zeroValue!1624 lt!5517) (minValue!1624 lt!5517) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1691 lt!5517)))))

(declare-fun bm!962 () Bool)

(declare-fun updateHelperNewKey!3 (LongMapFixedSize!142 (_ BitVec 64) V!1099 (_ BitVec 32)) tuple2!830)

(assert (=> bm!962 (= call!972 (updateHelperNewKey!3 lt!5517 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1525 (underlying!82 thiss!938))) (ite c!2114 (index!2311 lt!5583) (index!2308 lt!5583))))))

(declare-fun b!19808 () Bool)

(assert (=> b!19808 (= e!12864 (not call!959))))

(declare-fun bm!963 () Bool)

(declare-fun call!963 () SeekEntryResult!47)

(assert (=> bm!963 (= call!955 call!963)))

(declare-fun b!19809 () Bool)

(assert (=> b!19809 (= e!12859 (not call!956))))

(declare-fun bm!964 () Bool)

(assert (=> bm!964 (= call!961 call!975)))

(declare-fun c!2117 () Bool)

(declare-fun bm!965 () Bool)

(declare-fun c!2123 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!965 (= call!976 (inRange!0 (ite c!2115 (ite c!2123 (index!2309 lt!5580) (ite c!2116 (index!2308 lt!5585) (index!2311 lt!5585))) (ite c!2111 (index!2309 lt!5602) (ite c!2117 (index!2308 lt!5587) (index!2311 lt!5587)))) (mask!4647 lt!5517)))))

(declare-fun b!19810 () Bool)

(declare-fun lt!5579 () tuple2!830)

(assert (=> b!19810 (= lt!5579 call!972)))

(assert (=> b!19810 (= e!12852 (tuple2!831 (_1!418 lt!5579) (_2!418 lt!5579)))))

(declare-fun b!19811 () Bool)

(declare-fun res!13296 () Bool)

(assert (=> b!19811 (= res!13296 call!975)))

(assert (=> b!19811 (=> (not res!13296) (not e!12849))))

(declare-fun b!19812 () Bool)

(declare-fun c!2122 () Bool)

(assert (=> b!19812 (= c!2122 ((_ is MissingVacant!47) lt!5585))))

(assert (=> b!19812 (= e!12868 e!12850)))

(declare-fun b!19813 () Bool)

(assert (=> b!19813 (= e!12867 e!12852)))

(declare-fun c!2112 () Bool)

(assert (=> b!19813 (= c!2112 ((_ is MissingZero!47) lt!5583))))

(declare-fun b!19814 () Bool)

(assert (=> b!19814 (= e!12855 (getCurrentListMap!120 (_keys!3118 lt!5517) (_values!1686 lt!5517) (mask!4647 lt!5517) (extraKeys!1600 lt!5517) (zeroValue!1624 lt!5517) (minValue!1624 lt!5517) #b00000000000000000000000000000000 (defaultEntry!1691 lt!5517)))))

(declare-fun bm!966 () Bool)

(assert (=> bm!966 (= call!953 call!954)))

(declare-fun b!19815 () Bool)

(assert (=> b!19815 (= e!12850 e!12856)))

(declare-fun res!13295 () Bool)

(declare-fun call!967 () Bool)

(assert (=> b!19815 (= res!13295 call!967)))

(assert (=> b!19815 (=> (not res!13295) (not e!12856))))

(declare-fun bm!967 () Bool)

(declare-fun c!2119 () Bool)

(assert (=> bm!967 (= c!2119 c!2115)))

(assert (=> bm!967 (= call!971 (contains!220 e!12863 (ite c!2115 #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!531 (_keys!3118 lt!5517)) (index!2309 lt!5583)))))))

(declare-fun bm!968 () Bool)

(assert (=> bm!968 (= call!957 call!963)))

(declare-fun b!19816 () Bool)

(assert (=> b!19816 (= e!12849 (= (select (arr!531 (_keys!3118 lt!5517)) (index!2309 lt!5602)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!19817 () Bool)

(assert (=> b!19817 (= e!12865 (= call!966 call!964))))

(declare-fun b!19818 () Bool)

(declare-fun Unit!409 () Unit!406)

(assert (=> b!19818 (= e!12858 Unit!409)))

(declare-fun lt!5601 () Unit!406)

(assert (=> b!19818 (= lt!5601 call!965)))

(assert (=> b!19818 (= lt!5587 call!955)))

(assert (=> b!19818 (= c!2117 ((_ is MissingZero!47) lt!5587))))

(assert (=> b!19818 e!12854))

(declare-fun lt!5596 () Unit!406)

(assert (=> b!19818 (= lt!5596 lt!5601)))

(assert (=> b!19818 false))

(declare-fun b!19819 () Bool)

(declare-fun res!13297 () Bool)

(assert (=> b!19819 (= res!13297 (= (select (arr!531 (_keys!3118 lt!5517)) (index!2311 lt!5585)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!19819 (=> (not res!13297) (not e!12856))))

(declare-fun b!19820 () Bool)

(assert (=> b!19820 (= e!12857 e!12860)))

(assert (=> b!19820 (= c!2113 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!19821 () Bool)

(declare-fun res!13301 () Bool)

(assert (=> b!19821 (=> (not res!13301) (not e!12862))))

(assert (=> b!19821 (= res!13301 call!961)))

(assert (=> b!19821 (= e!12854 e!12862)))

(declare-fun bm!969 () Bool)

(assert (=> bm!969 (= call!969 call!968)))

(declare-fun b!19822 () Bool)

(assert (=> b!19822 (= e!12870 ((_ is Undefined!47) lt!5587))))

(declare-fun d!3603 () Bool)

(assert (=> d!3603 e!12869))

(declare-fun res!13302 () Bool)

(assert (=> d!3603 (=> (not res!13302) (not e!12869))))

(assert (=> d!3603 (= res!13302 (valid!82 (_2!418 lt!5578)))))

(assert (=> d!3603 (= lt!5578 e!12857)))

(assert (=> d!3603 (= c!2110 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3603 (valid!82 lt!5517)))

(assert (=> d!3603 (= (update!16 lt!5517 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1624 (v!1525 (underlying!82 thiss!938)))) lt!5578)))

(declare-fun bm!970 () Bool)

(assert (=> bm!970 (= call!967 call!974)))

(declare-fun bm!971 () Bool)

(assert (=> bm!971 (= call!966 (map!377 (_2!418 lt!5578)))))

(declare-fun b!19823 () Bool)

(declare-fun res!13290 () Bool)

(assert (=> b!19823 (=> (not res!13290) (not e!12859))))

(assert (=> b!19823 (= res!13290 call!967)))

(assert (=> b!19823 (= e!12868 e!12859)))

(declare-fun bm!972 () Bool)

(assert (=> bm!972 (= call!963 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3118 lt!5517) (mask!4647 lt!5517)))))

(declare-fun b!19824 () Bool)

(assert (=> b!19824 (= e!12863 call!960)))

(declare-fun bm!973 () Bool)

(assert (=> bm!973 (= call!959 call!970)))

(declare-fun b!19825 () Bool)

(declare-fun lt!5589 () Unit!406)

(assert (=> b!19825 (= lt!5589 e!12853)))

(assert (=> b!19825 (= c!2123 call!971)))

(assert (=> b!19825 (= e!12851 (tuple2!831 false lt!5517))))

(declare-fun b!19826 () Bool)

(declare-fun lt!5591 () Unit!406)

(declare-fun lt!5594 () Unit!406)

(assert (=> b!19826 (= lt!5591 lt!5594)))

(assert (=> b!19826 (= call!969 call!958)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!3 (array!1113 array!1111 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1099 V!1099 V!1099 Int) Unit!406)

(assert (=> b!19826 (= lt!5594 (lemmaChangeLongMinValueKeyThenAddPairToListMap!3 (_keys!3118 lt!5517) (_values!1686 lt!5517) (mask!4647 lt!5517) (extraKeys!1600 lt!5517) lt!5604 (zeroValue!1624 lt!5517) (minValue!1624 lt!5517) (zeroValue!1624 (v!1525 (underlying!82 thiss!938))) (defaultEntry!1691 lt!5517)))))

(assert (=> b!19826 (= lt!5604 (bvor (extraKeys!1600 lt!5517) #b00000000000000000000000000000010))))

(assert (=> b!19826 (= e!12860 (tuple2!831 true (LongMapFixedSize!143 (defaultEntry!1691 lt!5517) (mask!4647 lt!5517) (bvor (extraKeys!1600 lt!5517) #b00000000000000000000000000000010) (zeroValue!1624 lt!5517) (zeroValue!1624 (v!1525 (underlying!82 thiss!938))) (_size!106 lt!5517) (_keys!3118 lt!5517) (_values!1686 lt!5517) (_vacant!106 lt!5517))))))

(declare-fun b!19827 () Bool)

(assert (=> b!19827 (= e!12861 (= (select (arr!531 (_keys!3118 lt!5517)) (index!2309 lt!5580)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!3603 c!2110) b!19820))

(assert (= (and d!3603 (not c!2110)) b!19802))

(assert (= (and b!19820 c!2113) b!19807))

(assert (= (and b!19820 (not c!2113)) b!19826))

(assert (= (or b!19807 b!19826) bm!958))

(assert (= (or b!19807 b!19826) bm!950))

(assert (= (or b!19807 b!19826) bm!969))

(assert (= (and b!19802 c!2115) b!19825))

(assert (= (and b!19802 (not c!2115)) b!19800))

(assert (= (and b!19825 c!2123) b!19798))

(assert (= (and b!19825 (not c!2123)) b!19792))

(assert (= (and b!19798 res!13298) b!19799))

(assert (= (and b!19799 res!13300) b!19827))

(assert (= (and b!19792 c!2116) b!19823))

(assert (= (and b!19792 (not c!2116)) b!19812))

(assert (= (and b!19823 res!13290) b!19786))

(assert (= (and b!19786 res!13289) b!19809))

(assert (= (and b!19812 c!2122) b!19815))

(assert (= (and b!19812 (not c!2122)) b!19803))

(assert (= (and b!19815 res!13295) b!19819))

(assert (= (and b!19819 res!13297) b!19804))

(assert (= (or b!19823 b!19815) bm!970))

(assert (= (or b!19809 b!19804) bm!952))

(assert (= (or b!19799 bm!970) bm!955))

(assert (= (or b!19798 b!19792) bm!968))

(assert (= (and b!19800 c!2114) b!19788))

(assert (= (and b!19800 (not c!2114)) b!19813))

(assert (= (and b!19813 c!2112) b!19810))

(assert (= (and b!19813 (not c!2112)) b!19805))

(assert (= (and b!19805 c!2111) b!19796))

(assert (= (and b!19805 (not c!2111)) b!19818))

(assert (= (and b!19796 res!13293) b!19811))

(assert (= (and b!19811 res!13296) b!19816))

(assert (= (and b!19818 c!2117) b!19821))

(assert (= (and b!19818 (not c!2117)) b!19795))

(assert (= (and b!19821 res!13301) b!19797))

(assert (= (and b!19797 res!13291) b!19790))

(assert (= (and b!19795 c!2120) b!19801))

(assert (= (and b!19795 (not c!2120)) b!19822))

(assert (= (and b!19801 res!13299) b!19793))

(assert (= (and b!19793 res!13294) b!19808))

(assert (= (or b!19821 b!19801) bm!964))

(assert (= (or b!19790 b!19808) bm!973))

(assert (= (or b!19811 bm!964) bm!953))

(assert (= (or b!19796 b!19818) bm!963))

(assert (= (or b!19788 b!19810) bm!962))

(assert (= (or b!19825 b!19805) bm!966))

(assert (= (or bm!952 bm!973) bm!954))

(assert (= (or bm!955 bm!953) bm!965))

(assert (= (or b!19792 b!19818) bm!960))

(assert (= (or bm!968 bm!963) bm!972))

(assert (= (or b!19798 b!19796) bm!961))

(assert (= (or b!19825 b!19805) bm!967))

(assert (= (and bm!967 c!2119) b!19806))

(assert (= (and bm!967 (not c!2119)) b!19824))

(assert (= (or bm!958 b!19824) bm!956))

(assert (= (or bm!950 bm!966) bm!959))

(assert (= (or bm!969 b!19805) bm!951))

(assert (= (and bm!951 c!2118) b!19789))

(assert (= (and bm!951 (not c!2118)) b!19814))

(assert (= (and d!3603 res!13302) b!19791))

(assert (= (and b!19791 c!2121) b!19794))

(assert (= (and b!19791 (not c!2121)) b!19817))

(assert (= (and b!19794 res!13292) b!19787))

(assert (= (or b!19794 b!19787 b!19817) bm!971))

(assert (= (or b!19787 b!19817) bm!957))

(declare-fun m!13851 () Bool)

(assert (=> bm!954 m!13851))

(declare-fun m!13853 () Bool)

(assert (=> bm!972 m!13853))

(declare-fun m!13855 () Bool)

(assert (=> b!19797 m!13855))

(declare-fun m!13857 () Bool)

(assert (=> bm!971 m!13857))

(assert (=> b!19802 m!13853))

(declare-fun m!13859 () Bool)

(assert (=> b!19816 m!13859))

(declare-fun m!13861 () Bool)

(assert (=> b!19805 m!13861))

(declare-fun m!13863 () Bool)

(assert (=> b!19805 m!13863))

(declare-fun m!13865 () Bool)

(assert (=> b!19805 m!13865))

(assert (=> b!19805 m!13865))

(declare-fun m!13867 () Bool)

(assert (=> b!19805 m!13867))

(declare-fun m!13869 () Bool)

(assert (=> b!19805 m!13869))

(declare-fun m!13871 () Bool)

(assert (=> bm!961 m!13871))

(declare-fun m!13873 () Bool)

(assert (=> b!19786 m!13873))

(declare-fun m!13875 () Bool)

(assert (=> b!19793 m!13875))

(declare-fun m!13877 () Bool)

(assert (=> b!19794 m!13877))

(declare-fun m!13879 () Bool)

(assert (=> d!3603 m!13879))

(declare-fun m!13881 () Bool)

(assert (=> d!3603 m!13881))

(declare-fun m!13883 () Bool)

(assert (=> b!19826 m!13883))

(assert (=> b!19814 m!13865))

(assert (=> bm!959 m!13869))

(declare-fun m!13885 () Bool)

(assert (=> bm!959 m!13885))

(declare-fun m!13887 () Bool)

(assert (=> b!19819 m!13887))

(declare-fun m!13889 () Bool)

(assert (=> bm!951 m!13889))

(declare-fun m!13891 () Bool)

(assert (=> bm!956 m!13891))

(declare-fun m!13893 () Bool)

(assert (=> b!19827 m!13893))

(declare-fun m!13895 () Bool)

(assert (=> bm!967 m!13895))

(declare-fun m!13897 () Bool)

(assert (=> bm!967 m!13897))

(declare-fun m!13899 () Bool)

(assert (=> bm!962 m!13899))

(declare-fun m!13901 () Bool)

(assert (=> b!19807 m!13901))

(declare-fun m!13903 () Bool)

(assert (=> bm!965 m!13903))

(declare-fun m!13905 () Bool)

(assert (=> b!19787 m!13905))

(declare-fun m!13907 () Bool)

(assert (=> bm!957 m!13907))

(declare-fun m!13909 () Bool)

(assert (=> bm!960 m!13909))

(assert (=> b!19644 d!3603))

(declare-fun d!3605 () Bool)

(assert (=> d!3605 (= (valid!81 thiss!938) (valid!82 (v!1525 (underlying!82 thiss!938))))))

(declare-fun bs!880 () Bool)

(assert (= bs!880 d!3605))

(declare-fun m!13911 () Bool)

(assert (=> bs!880 m!13911))

(assert (=> start!3232 d!3605))

(declare-fun d!3607 () Bool)

(assert (=> d!3607 (= (array_inv!379 (_keys!3118 (v!1525 (underlying!82 thiss!938)))) (bvsge (size!624 (_keys!3118 (v!1525 (underlying!82 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19638 d!3607))

(declare-fun d!3609 () Bool)

(assert (=> d!3609 (= (array_inv!380 (_values!1686 (v!1525 (underlying!82 thiss!938)))) (bvsge (size!623 (_values!1686 (v!1525 (underlying!82 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19638 d!3609))

(declare-fun b!19840 () Bool)

(declare-fun e!12879 () Bool)

(declare-fun lt!5670 () LongMapFixedSize!142)

(assert (=> b!19840 (= e!12879 (= (map!377 lt!5670) (ListLongMap!546 Nil!544)))))

(declare-fun b!19841 () Bool)

(declare-fun res!13308 () Bool)

(assert (=> b!19841 (=> (not res!13308) (not e!12879))))

(assert (=> b!19841 (= res!13308 (= (mask!4647 lt!5670) (computeNewMask!8 thiss!938 (mask!4647 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))) (_size!106 (v!1525 (underlying!82 thiss!938))))))))

(declare-fun b!19842 () Bool)

(declare-fun e!12878 () Unit!406)

(declare-fun Unit!410 () Unit!406)

(assert (=> b!19842 (= e!12878 Unit!410)))

(declare-fun lt!5671 () tuple2!836)

(declare-fun lt!5664 () LongMapFixedSize!142)

(declare-fun head!819 (List!547) tuple2!836)

(assert (=> b!19842 (= lt!5671 (head!819 (toList!288 (map!377 lt!5664))))))

(declare-fun lt!5669 () array!1113)

(assert (=> b!19842 (= lt!5669 (array!1114 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!8 thiss!938 (mask!4647 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))) (_size!106 (v!1525 (underlying!82 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5672 () (_ BitVec 32))

(assert (=> b!19842 (= lt!5672 #b00000000000000000000000000000000)))

(declare-fun lt!5667 () Unit!406)

(declare-fun lemmaKeyInListMapIsInArray!88 (array!1113 array!1111 (_ BitVec 32) (_ BitVec 32) V!1099 V!1099 (_ BitVec 64) Int) Unit!406)

(declare-fun dynLambda!131 (Int (_ BitVec 64)) V!1099)

(assert (=> b!19842 (= lt!5667 (lemmaKeyInListMapIsInArray!88 lt!5669 (array!1112 ((as const (Array (_ BitVec 32) ValueCell!278)) EmptyCell!278) (bvadd (computeNewMask!8 thiss!938 (mask!4647 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))) (_size!106 (v!1525 (underlying!82 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!8 thiss!938 (mask!4647 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))) (_size!106 (v!1525 (underlying!82 thiss!938)))) lt!5672 (dynLambda!131 (defaultEntry!1691 (v!1525 (underlying!82 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!131 (defaultEntry!1691 (v!1525 (underlying!82 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!421 lt!5671) (defaultEntry!1691 (v!1525 (underlying!82 thiss!938)))))))

(declare-fun c!2128 () Bool)

(assert (=> b!19842 (= c!2128 (and (not (= (_1!421 lt!5671) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!421 lt!5671) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!12877 () Bool)

(assert (=> b!19842 e!12877))

(declare-fun lt!5661 () Unit!406)

(assert (=> b!19842 (= lt!5661 lt!5667)))

(declare-fun lt!5652 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1113 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19842 (= lt!5652 (arrayScanForKey!0 (array!1114 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!8 thiss!938 (mask!4647 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))) (_size!106 (v!1525 (underlying!82 thiss!938)))) #b00000000000000000000000000000001)) (_1!421 lt!5671) #b00000000000000000000000000000000))))

(assert (=> b!19842 false))

(declare-fun b!19843 () Bool)

(assert (=> b!19843 (= e!12877 (ite (= (_1!421 lt!5671) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!5672 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!5672 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun d!3611 () Bool)

(assert (=> d!3611 e!12879))

(declare-fun res!13307 () Bool)

(assert (=> d!3611 (=> (not res!13307) (not e!12879))))

(assert (=> d!3611 (= res!13307 (valid!82 lt!5670))))

(assert (=> d!3611 (= lt!5670 lt!5664)))

(declare-fun lt!5655 () Unit!406)

(assert (=> d!3611 (= lt!5655 e!12878)))

(declare-fun c!2129 () Bool)

(assert (=> d!3611 (= c!2129 (not (= (map!377 lt!5664) (ListLongMap!546 Nil!544))))))

(declare-fun lt!5653 () Unit!406)

(declare-fun lt!5673 () Unit!406)

(assert (=> d!3611 (= lt!5653 lt!5673)))

(declare-fun lt!5651 () array!1113)

(declare-fun lt!5662 () (_ BitVec 32))

(declare-fun lt!5656 () List!546)

(assert (=> d!3611 (arrayNoDuplicates!0 lt!5651 lt!5662 lt!5656)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1113 (_ BitVec 32) (_ BitVec 32) List!546) Unit!406)

(assert (=> d!3611 (= lt!5673 (lemmaArrayNoDuplicatesInAll0Array!0 lt!5651 lt!5662 (bvadd (computeNewMask!8 thiss!938 (mask!4647 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))) (_size!106 (v!1525 (underlying!82 thiss!938)))) #b00000000000000000000000000000001) lt!5656))))

(assert (=> d!3611 (= lt!5656 Nil!543)))

(assert (=> d!3611 (= lt!5662 #b00000000000000000000000000000000)))

(assert (=> d!3611 (= lt!5651 (array!1114 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!8 thiss!938 (mask!4647 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))) (_size!106 (v!1525 (underlying!82 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5654 () Unit!406)

(declare-fun lt!5663 () Unit!406)

(assert (=> d!3611 (= lt!5654 lt!5663)))

(declare-fun lt!5657 () (_ BitVec 32))

(declare-fun lt!5659 () array!1113)

(assert (=> d!3611 (arrayForallSeekEntryOrOpenFound!0 lt!5657 lt!5659 (computeNewMask!8 thiss!938 (mask!4647 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))) (_size!106 (v!1525 (underlying!82 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1113 (_ BitVec 32) (_ BitVec 32)) Unit!406)

(assert (=> d!3611 (= lt!5663 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!5659 (computeNewMask!8 thiss!938 (mask!4647 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))) (_size!106 (v!1525 (underlying!82 thiss!938)))) lt!5657))))

(assert (=> d!3611 (= lt!5657 #b00000000000000000000000000000000)))

(assert (=> d!3611 (= lt!5659 (array!1114 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!8 thiss!938 (mask!4647 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))) (_size!106 (v!1525 (underlying!82 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5658 () Unit!406)

(declare-fun lt!5665 () Unit!406)

(assert (=> d!3611 (= lt!5658 lt!5665)))

(declare-fun lt!5668 () array!1113)

(declare-fun lt!5666 () (_ BitVec 32))

(declare-fun lt!5660 () (_ BitVec 32))

(assert (=> d!3611 (= (arrayCountValidKeys!0 lt!5668 lt!5666 lt!5660) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1113 (_ BitVec 32) (_ BitVec 32)) Unit!406)

(assert (=> d!3611 (= lt!5665 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!5668 lt!5666 lt!5660))))

(assert (=> d!3611 (= lt!5660 (bvadd (computeNewMask!8 thiss!938 (mask!4647 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))) (_size!106 (v!1525 (underlying!82 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3611 (= lt!5666 #b00000000000000000000000000000000)))

(assert (=> d!3611 (= lt!5668 (array!1114 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!8 thiss!938 (mask!4647 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))) (_size!106 (v!1525 (underlying!82 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> d!3611 (= lt!5664 (LongMapFixedSize!143 (defaultEntry!1691 (v!1525 (underlying!82 thiss!938))) (computeNewMask!8 thiss!938 (mask!4647 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))) (_size!106 (v!1525 (underlying!82 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!131 (defaultEntry!1691 (v!1525 (underlying!82 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!131 (defaultEntry!1691 (v!1525 (underlying!82 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1114 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!8 thiss!938 (mask!4647 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))) (_size!106 (v!1525 (underlying!82 thiss!938)))) #b00000000000000000000000000000001)) (array!1112 ((as const (Array (_ BitVec 32) ValueCell!278)) EmptyCell!278) (bvadd (computeNewMask!8 thiss!938 (mask!4647 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))) (_size!106 (v!1525 (underlying!82 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3611 (validMask!0 (computeNewMask!8 thiss!938 (mask!4647 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))) (_size!106 (v!1525 (underlying!82 thiss!938)))))))

(assert (=> d!3611 (= (getNewLongMapFixedSize!13 (computeNewMask!8 thiss!938 (mask!4647 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))) (_size!106 (v!1525 (underlying!82 thiss!938)))) (defaultEntry!1691 (v!1525 (underlying!82 thiss!938)))) lt!5670)))

(declare-fun b!19844 () Bool)

(assert (=> b!19844 (= e!12877 (arrayContainsKey!0 lt!5669 (_1!421 lt!5671) #b00000000000000000000000000000000))))

(declare-fun b!19845 () Bool)

(declare-fun Unit!411 () Unit!406)

(assert (=> b!19845 (= e!12878 Unit!411)))

(assert (= (and d!3611 c!2129) b!19842))

(assert (= (and d!3611 (not c!2129)) b!19845))

(assert (= (and b!19842 c!2128) b!19844))

(assert (= (and b!19842 (not c!2128)) b!19843))

(assert (= (and d!3611 res!13307) b!19841))

(assert (= (and b!19841 res!13308) b!19840))

(declare-fun b_lambda!1461 () Bool)

(assert (=> (not b_lambda!1461) (not b!19842)))

(declare-fun t!3186 () Bool)

(declare-fun tb!627 () Bool)

(assert (=> (and b!19638 (= (defaultEntry!1691 (v!1525 (underlying!82 thiss!938))) (defaultEntry!1691 (v!1525 (underlying!82 thiss!938)))) t!3186) tb!627))

(declare-fun result!1027 () Bool)

(assert (=> tb!627 (= result!1027 tp_is_empty!955)))

(assert (=> b!19842 t!3186))

(declare-fun b_and!1355 () Bool)

(assert (= b_and!1349 (and (=> t!3186 result!1027) b_and!1355)))

(declare-fun b_lambda!1463 () Bool)

(assert (=> (not b_lambda!1463) (not d!3611)))

(assert (=> d!3611 t!3186))

(declare-fun b_and!1357 () Bool)

(assert (= b_and!1355 (and (=> t!3186 result!1027) b_and!1357)))

(declare-fun m!13913 () Bool)

(assert (=> b!19840 m!13913))

(declare-fun m!13915 () Bool)

(assert (=> b!19842 m!13915))

(declare-fun m!13917 () Bool)

(assert (=> b!19842 m!13917))

(assert (=> b!19842 m!13795))

(declare-fun m!13919 () Bool)

(assert (=> b!19842 m!13919))

(assert (=> b!19842 m!13919))

(declare-fun m!13921 () Bool)

(assert (=> b!19842 m!13921))

(declare-fun m!13923 () Bool)

(assert (=> b!19842 m!13923))

(assert (=> b!19842 m!13919))

(declare-fun m!13925 () Bool)

(assert (=> d!3611 m!13925))

(declare-fun m!13927 () Bool)

(assert (=> d!3611 m!13927))

(declare-fun m!13929 () Bool)

(assert (=> d!3611 m!13929))

(assert (=> d!3611 m!13917))

(declare-fun m!13931 () Bool)

(assert (=> d!3611 m!13931))

(assert (=> d!3611 m!13795))

(declare-fun m!13933 () Bool)

(assert (=> d!3611 m!13933))

(declare-fun m!13935 () Bool)

(assert (=> d!3611 m!13935))

(assert (=> d!3611 m!13795))

(declare-fun m!13937 () Bool)

(assert (=> d!3611 m!13937))

(assert (=> d!3611 m!13795))

(declare-fun m!13939 () Bool)

(assert (=> d!3611 m!13939))

(assert (=> d!3611 m!13919))

(declare-fun m!13941 () Bool)

(assert (=> b!19844 m!13941))

(assert (=> b!19640 d!3611))

(declare-fun d!3613 () Bool)

(declare-fun e!12884 () Bool)

(assert (=> d!3613 e!12884))

(declare-fun res!13311 () Bool)

(assert (=> d!3613 (=> (not res!13311) (not e!12884))))

(declare-fun lt!5679 () (_ BitVec 32))

(assert (=> d!3613 (= res!13311 (validMask!0 lt!5679))))

(declare-datatypes ((tuple2!838 0))(
  ( (tuple2!839 (_1!422 Unit!406) (_2!422 (_ BitVec 32))) )
))
(declare-fun e!12885 () tuple2!838)

(assert (=> d!3613 (= lt!5679 (_2!422 e!12885))))

(declare-fun c!2132 () Bool)

(declare-fun lt!5678 () tuple2!838)

(assert (=> d!3613 (= c!2132 (and (bvsgt (_2!422 lt!5678) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!106 (v!1525 (underlying!82 thiss!938)))) (_2!422 lt!5678)) (bvsge (bvadd (bvand (bvashr (_2!422 lt!5678) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!106 (v!1525 (underlying!82 thiss!938))))))))

(declare-fun Unit!412 () Unit!406)

(declare-fun Unit!413 () Unit!406)

(assert (=> d!3613 (= lt!5678 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!106 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))))) (mask!4647 (v!1525 (underlying!82 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!106 (v!1525 (underlying!82 thiss!938)))) (mask!4647 (v!1525 (underlying!82 thiss!938))))) (tuple2!839 Unit!412 (bvand (bvadd (bvshl (mask!4647 (v!1525 (underlying!82 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!839 Unit!413 (mask!4647 (v!1525 (underlying!82 thiss!938))))))))

(assert (=> d!3613 (validMask!0 (mask!4647 (v!1525 (underlying!82 thiss!938))))))

(assert (=> d!3613 (= (computeNewMask!8 thiss!938 (mask!4647 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))) (_size!106 (v!1525 (underlying!82 thiss!938)))) lt!5679)))

(declare-fun b!19854 () Bool)

(declare-fun computeNewMaskWhile!5 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!838)

(assert (=> b!19854 (= e!12885 (computeNewMaskWhile!5 (_size!106 (v!1525 (underlying!82 thiss!938))) (_vacant!106 (v!1525 (underlying!82 thiss!938))) (mask!4647 (v!1525 (underlying!82 thiss!938))) (_2!422 lt!5678)))))

(declare-fun b!19855 () Bool)

(declare-fun Unit!414 () Unit!406)

(assert (=> b!19855 (= e!12885 (tuple2!839 Unit!414 (_2!422 lt!5678)))))

(declare-fun b!19856 () Bool)

(assert (=> b!19856 (= e!12884 (bvsle (_size!106 (v!1525 (underlying!82 thiss!938))) (bvadd lt!5679 #b00000000000000000000000000000001)))))

(assert (= (and d!3613 c!2132) b!19854))

(assert (= (and d!3613 (not c!2132)) b!19855))

(assert (= (and d!3613 res!13311) b!19856))

(declare-fun m!13943 () Bool)

(assert (=> d!3613 m!13943))

(declare-fun m!13945 () Bool)

(assert (=> d!3613 m!13945))

(declare-fun m!13947 () Bool)

(assert (=> b!19854 m!13947))

(assert (=> b!19640 d!3613))

(declare-fun condMapEmpty!904 () Bool)

(declare-fun mapDefault!904 () ValueCell!278)

(assert (=> mapNonEmpty!895 (= condMapEmpty!904 (= mapRest!895 ((as const (Array (_ BitVec 32) ValueCell!278)) mapDefault!904)))))

(declare-fun e!12890 () Bool)

(declare-fun mapRes!904 () Bool)

(assert (=> mapNonEmpty!895 (= tp!3292 (and e!12890 mapRes!904))))

(declare-fun b!19863 () Bool)

(declare-fun e!12891 () Bool)

(assert (=> b!19863 (= e!12891 tp_is_empty!955)))

(declare-fun mapNonEmpty!904 () Bool)

(declare-fun tp!3307 () Bool)

(assert (=> mapNonEmpty!904 (= mapRes!904 (and tp!3307 e!12891))))

(declare-fun mapRest!904 () (Array (_ BitVec 32) ValueCell!278))

(declare-fun mapKey!904 () (_ BitVec 32))

(declare-fun mapValue!904 () ValueCell!278)

(assert (=> mapNonEmpty!904 (= mapRest!895 (store mapRest!904 mapKey!904 mapValue!904))))

(declare-fun mapIsEmpty!904 () Bool)

(assert (=> mapIsEmpty!904 mapRes!904))

(declare-fun b!19864 () Bool)

(assert (=> b!19864 (= e!12890 tp_is_empty!955)))

(assert (= (and mapNonEmpty!895 condMapEmpty!904) mapIsEmpty!904))

(assert (= (and mapNonEmpty!895 (not condMapEmpty!904)) mapNonEmpty!904))

(assert (= (and mapNonEmpty!904 ((_ is ValueCellFull!278) mapValue!904)) b!19863))

(assert (= (and mapNonEmpty!895 ((_ is ValueCellFull!278) mapDefault!904)) b!19864))

(declare-fun m!13949 () Bool)

(assert (=> mapNonEmpty!904 m!13949))

(declare-fun b_lambda!1465 () Bool)

(assert (= b_lambda!1461 (or (and b!19638 b_free!691) b_lambda!1465)))

(declare-fun b_lambda!1467 () Bool)

(assert (= b_lambda!1463 (or (and b!19638 b_free!691) b_lambda!1467)))

(check-sat (not b_lambda!1465) (not d!3601) (not bm!957) (not bm!951) (not bm!965) (not b!19805) (not bm!954) (not b!19844) (not b!19787) (not d!3603) (not b!19826) (not b_next!691) (not bm!960) (not d!3611) (not b!19701) (not bm!972) (not bm!961) (not bm!971) (not b!19699) (not b!19840) (not b!19842) (not b!19814) (not b!19700) (not d!3613) (not b_lambda!1467) (not b!19794) (not b!19854) (not b!19807) (not bm!967) b_and!1357 tp_is_empty!955 (not bm!956) (not d!3605) (not bm!962) (not mapNonEmpty!904) (not bm!959) (not b!19802))
(check-sat b_and!1357 (not b_next!691))
