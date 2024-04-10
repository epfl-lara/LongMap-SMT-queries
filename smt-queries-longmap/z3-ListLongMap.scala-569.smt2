; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15482 () Bool)

(assert start!15482)

(declare-fun b!154039 () Bool)

(declare-fun b_free!3221 () Bool)

(declare-fun b_next!3221 () Bool)

(assert (=> b!154039 (= b_free!3221 (not b_next!3221))))

(declare-fun tp!12186 () Bool)

(declare-fun b_and!9591 () Bool)

(assert (=> b!154039 (= tp!12186 b_and!9591)))

(declare-fun b!154038 () Bool)

(declare-fun b_free!3223 () Bool)

(declare-fun b_next!3223 () Bool)

(assert (=> b!154038 (= b_free!3223 (not b_next!3223))))

(declare-fun tp!12185 () Bool)

(declare-fun b_and!9593 () Bool)

(assert (=> b!154038 (= tp!12185 b_and!9593)))

(declare-fun b!154034 () Bool)

(declare-fun e!100647 () Bool)

(declare-fun e!100646 () Bool)

(assert (=> b!154034 (= e!100647 e!100646)))

(declare-fun b!154035 () Bool)

(declare-fun e!100651 () Bool)

(declare-fun e!100655 () Bool)

(declare-fun mapRes!5171 () Bool)

(assert (=> b!154035 (= e!100651 (and e!100655 mapRes!5171))))

(declare-fun condMapEmpty!5171 () Bool)

(declare-datatypes ((V!3683 0))(
  ( (V!3684 (val!1558 Int)) )
))
(declare-datatypes ((array!5105 0))(
  ( (array!5106 (arr!2411 (Array (_ BitVec 32) (_ BitVec 64))) (size!2688 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1170 0))(
  ( (ValueCellFull!1170 (v!3418 V!3683)) (EmptyCell!1170) )
))
(declare-datatypes ((array!5107 0))(
  ( (array!5108 (arr!2412 (Array (_ BitVec 32) ValueCell!1170)) (size!2689 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1248 0))(
  ( (LongMapFixedSize!1249 (defaultEntry!3064 Int) (mask!7468 (_ BitVec 32)) (extraKeys!2805 (_ BitVec 32)) (zeroValue!2907 V!3683) (minValue!2907 V!3683) (_size!673 (_ BitVec 32)) (_keys!4837 array!5105) (_values!3047 array!5107) (_vacant!673 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1030 0))(
  ( (Cell!1031 (v!3419 LongMapFixedSize!1248)) )
))
(declare-datatypes ((LongMap!1030 0))(
  ( (LongMap!1031 (underlying!526 Cell!1030)) )
))
(declare-fun thiss!992 () LongMap!1030)

(declare-fun mapDefault!5171 () ValueCell!1170)

(assert (=> b!154035 (= condMapEmpty!5171 (= (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1170)) mapDefault!5171)))))

(declare-fun mapNonEmpty!5171 () Bool)

(declare-fun mapRes!5172 () Bool)

(declare-fun tp!12183 () Bool)

(declare-fun e!100643 () Bool)

(assert (=> mapNonEmpty!5171 (= mapRes!5172 (and tp!12183 e!100643))))

(declare-fun mapValue!5172 () ValueCell!1170)

(declare-fun mapRest!5171 () (Array (_ BitVec 32) ValueCell!1170))

(declare-fun newMap!16 () LongMapFixedSize!1248)

(declare-fun mapKey!5172 () (_ BitVec 32))

(assert (=> mapNonEmpty!5171 (= (arr!2412 (_values!3047 newMap!16)) (store mapRest!5171 mapKey!5172 mapValue!5172))))

(declare-fun mapIsEmpty!5171 () Bool)

(assert (=> mapIsEmpty!5171 mapRes!5171))

(declare-fun res!72752 () Bool)

(declare-fun e!100650 () Bool)

(assert (=> start!15482 (=> (not res!72752) (not e!100650))))

(declare-fun valid!616 (LongMap!1030) Bool)

(assert (=> start!15482 (= res!72752 (valid!616 thiss!992))))

(assert (=> start!15482 e!100650))

(assert (=> start!15482 e!100647))

(assert (=> start!15482 true))

(declare-fun e!100652 () Bool)

(assert (=> start!15482 e!100652))

(declare-fun b!154036 () Bool)

(declare-fun res!72751 () Bool)

(assert (=> b!154036 (=> (not res!72751) (not e!100650))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!154036 (= res!72751 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154037 () Bool)

(declare-fun e!100654 () Bool)

(declare-fun e!100645 () Bool)

(assert (=> b!154037 (= e!100654 (and e!100645 mapRes!5172))))

(declare-fun condMapEmpty!5172 () Bool)

(declare-fun mapDefault!5172 () ValueCell!1170)

(assert (=> b!154037 (= condMapEmpty!5172 (= (arr!2412 (_values!3047 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1170)) mapDefault!5172)))))

(declare-fun tp_is_empty!3027 () Bool)

(declare-fun array_inv!1521 (array!5105) Bool)

(declare-fun array_inv!1522 (array!5107) Bool)

(assert (=> b!154038 (= e!100652 (and tp!12185 tp_is_empty!3027 (array_inv!1521 (_keys!4837 newMap!16)) (array_inv!1522 (_values!3047 newMap!16)) e!100654))))

(declare-fun e!100644 () Bool)

(assert (=> b!154039 (= e!100644 (and tp!12186 tp_is_empty!3027 (array_inv!1521 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (array_inv!1522 (_values!3047 (v!3419 (underlying!526 thiss!992)))) e!100651))))

(declare-fun b!154040 () Bool)

(assert (=> b!154040 (= e!100645 tp_is_empty!3027)))

(declare-fun mapIsEmpty!5172 () Bool)

(assert (=> mapIsEmpty!5172 mapRes!5172))

(declare-fun b!154041 () Bool)

(assert (=> b!154041 (= e!100646 e!100644)))

(declare-fun mapNonEmpty!5172 () Bool)

(declare-fun tp!12184 () Bool)

(declare-fun e!100649 () Bool)

(assert (=> mapNonEmpty!5172 (= mapRes!5171 (and tp!12184 e!100649))))

(declare-fun mapValue!5171 () ValueCell!1170)

(declare-fun mapRest!5172 () (Array (_ BitVec 32) ValueCell!1170))

(declare-fun mapKey!5171 () (_ BitVec 32))

(assert (=> mapNonEmpty!5172 (= (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (store mapRest!5172 mapKey!5171 mapValue!5171))))

(declare-fun b!154042 () Bool)

(declare-fun e!100648 () Bool)

(declare-datatypes ((tuple2!2830 0))(
  ( (tuple2!2831 (_1!1426 (_ BitVec 64)) (_2!1426 V!3683)) )
))
(declare-datatypes ((List!1807 0))(
  ( (Nil!1804) (Cons!1803 (h!2412 tuple2!2830) (t!6601 List!1807)) )
))
(declare-datatypes ((ListLongMap!1817 0))(
  ( (ListLongMap!1818 (toList!924 List!1807)) )
))
(declare-fun lt!80849 () ListLongMap!1817)

(declare-fun map!1503 (LongMapFixedSize!1248) ListLongMap!1817)

(assert (=> b!154042 (= e!100648 (not (= lt!80849 (map!1503 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun b!154043 () Bool)

(declare-fun res!72750 () Bool)

(assert (=> b!154043 (=> (not res!72750) (not e!100650))))

(declare-fun valid!617 (LongMapFixedSize!1248) Bool)

(assert (=> b!154043 (= res!72750 (valid!617 newMap!16))))

(declare-fun b!154044 () Bool)

(assert (=> b!154044 (= e!100650 e!100648)))

(declare-fun res!72753 () Bool)

(assert (=> b!154044 (=> (not res!72753) (not e!100648))))

(declare-fun lt!80850 () ListLongMap!1817)

(assert (=> b!154044 (= res!72753 (and (= lt!80850 lt!80849) (or (= (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsle from!355 #b00000000000000000000000000000000)))))

(assert (=> b!154044 (= lt!80849 (map!1503 newMap!16))))

(declare-fun getCurrentListMap!588 (array!5105 array!5107 (_ BitVec 32) (_ BitVec 32) V!3683 V!3683 (_ BitVec 32) Int) ListLongMap!1817)

(assert (=> b!154044 (= lt!80850 (getCurrentListMap!588 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun b!154045 () Bool)

(assert (=> b!154045 (= e!100655 tp_is_empty!3027)))

(declare-fun b!154046 () Bool)

(assert (=> b!154046 (= e!100643 tp_is_empty!3027)))

(declare-fun b!154047 () Bool)

(declare-fun res!72749 () Bool)

(assert (=> b!154047 (=> (not res!72749) (not e!100650))))

(assert (=> b!154047 (= res!72749 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7468 newMap!16)) (_size!673 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun b!154048 () Bool)

(assert (=> b!154048 (= e!100649 tp_is_empty!3027)))

(assert (= (and start!15482 res!72752) b!154036))

(assert (= (and b!154036 res!72751) b!154043))

(assert (= (and b!154043 res!72750) b!154047))

(assert (= (and b!154047 res!72749) b!154044))

(assert (= (and b!154044 res!72753) b!154042))

(assert (= (and b!154035 condMapEmpty!5171) mapIsEmpty!5171))

(assert (= (and b!154035 (not condMapEmpty!5171)) mapNonEmpty!5172))

(get-info :version)

(assert (= (and mapNonEmpty!5172 ((_ is ValueCellFull!1170) mapValue!5171)) b!154048))

(assert (= (and b!154035 ((_ is ValueCellFull!1170) mapDefault!5171)) b!154045))

(assert (= b!154039 b!154035))

(assert (= b!154041 b!154039))

(assert (= b!154034 b!154041))

(assert (= start!15482 b!154034))

(assert (= (and b!154037 condMapEmpty!5172) mapIsEmpty!5172))

(assert (= (and b!154037 (not condMapEmpty!5172)) mapNonEmpty!5171))

(assert (= (and mapNonEmpty!5171 ((_ is ValueCellFull!1170) mapValue!5172)) b!154046))

(assert (= (and b!154037 ((_ is ValueCellFull!1170) mapDefault!5172)) b!154040))

(assert (= b!154038 b!154037))

(assert (= start!15482 b!154038))

(declare-fun m!187779 () Bool)

(assert (=> b!154044 m!187779))

(declare-fun m!187781 () Bool)

(assert (=> b!154044 m!187781))

(declare-fun m!187783 () Bool)

(assert (=> b!154044 m!187783))

(declare-fun m!187785 () Bool)

(assert (=> mapNonEmpty!5172 m!187785))

(declare-fun m!187787 () Bool)

(assert (=> start!15482 m!187787))

(declare-fun m!187789 () Bool)

(assert (=> b!154038 m!187789))

(declare-fun m!187791 () Bool)

(assert (=> b!154038 m!187791))

(declare-fun m!187793 () Bool)

(assert (=> b!154043 m!187793))

(declare-fun m!187795 () Bool)

(assert (=> b!154042 m!187795))

(declare-fun m!187797 () Bool)

(assert (=> mapNonEmpty!5171 m!187797))

(declare-fun m!187799 () Bool)

(assert (=> b!154039 m!187799))

(declare-fun m!187801 () Bool)

(assert (=> b!154039 m!187801))

(check-sat (not start!15482) b_and!9593 (not b!154043) (not b_next!3221) (not mapNonEmpty!5172) (not b!154042) (not b!154038) tp_is_empty!3027 b_and!9591 (not b!154039) (not mapNonEmpty!5171) (not b!154044) (not b_next!3223))
(check-sat b_and!9591 b_and!9593 (not b_next!3221) (not b_next!3223))
(get-model)

(declare-fun d!50579 () Bool)

(declare-fun res!72775 () Bool)

(declare-fun e!100700 () Bool)

(assert (=> d!50579 (=> (not res!72775) (not e!100700))))

(declare-fun simpleValid!104 (LongMapFixedSize!1248) Bool)

(assert (=> d!50579 (= res!72775 (simpleValid!104 newMap!16))))

(assert (=> d!50579 (= (valid!617 newMap!16) e!100700)))

(declare-fun b!154100 () Bool)

(declare-fun res!72776 () Bool)

(assert (=> b!154100 (=> (not res!72776) (not e!100700))))

(declare-fun arrayCountValidKeys!0 (array!5105 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!154100 (= res!72776 (= (arrayCountValidKeys!0 (_keys!4837 newMap!16) #b00000000000000000000000000000000 (size!2688 (_keys!4837 newMap!16))) (_size!673 newMap!16)))))

(declare-fun b!154101 () Bool)

(declare-fun res!72777 () Bool)

(assert (=> b!154101 (=> (not res!72777) (not e!100700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5105 (_ BitVec 32)) Bool)

(assert (=> b!154101 (= res!72777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4837 newMap!16) (mask!7468 newMap!16)))))

(declare-fun b!154102 () Bool)

(declare-datatypes ((List!1808 0))(
  ( (Nil!1805) (Cons!1804 (h!2413 (_ BitVec 64)) (t!6606 List!1808)) )
))
(declare-fun arrayNoDuplicates!0 (array!5105 (_ BitVec 32) List!1808) Bool)

(assert (=> b!154102 (= e!100700 (arrayNoDuplicates!0 (_keys!4837 newMap!16) #b00000000000000000000000000000000 Nil!1805))))

(assert (= (and d!50579 res!72775) b!154100))

(assert (= (and b!154100 res!72776) b!154101))

(assert (= (and b!154101 res!72777) b!154102))

(declare-fun m!187827 () Bool)

(assert (=> d!50579 m!187827))

(declare-fun m!187829 () Bool)

(assert (=> b!154100 m!187829))

(declare-fun m!187831 () Bool)

(assert (=> b!154101 m!187831))

(declare-fun m!187833 () Bool)

(assert (=> b!154102 m!187833))

(assert (=> b!154043 d!50579))

(declare-fun d!50581 () Bool)

(assert (=> d!50581 (= (valid!616 thiss!992) (valid!617 (v!3419 (underlying!526 thiss!992))))))

(declare-fun bs!6514 () Bool)

(assert (= bs!6514 d!50581))

(declare-fun m!187835 () Bool)

(assert (=> bs!6514 m!187835))

(assert (=> start!15482 d!50581))

(declare-fun d!50583 () Bool)

(assert (=> d!50583 (= (map!1503 newMap!16) (getCurrentListMap!588 (_keys!4837 newMap!16) (_values!3047 newMap!16) (mask!7468 newMap!16) (extraKeys!2805 newMap!16) (zeroValue!2907 newMap!16) (minValue!2907 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3064 newMap!16)))))

(declare-fun bs!6515 () Bool)

(assert (= bs!6515 d!50583))

(declare-fun m!187837 () Bool)

(assert (=> bs!6515 m!187837))

(assert (=> b!154044 d!50583))

(declare-fun b!154145 () Bool)

(declare-fun res!72802 () Bool)

(declare-fun e!100735 () Bool)

(assert (=> b!154145 (=> (not res!72802) (not e!100735))))

(declare-fun e!100727 () Bool)

(assert (=> b!154145 (= res!72802 e!100727)))

(declare-fun c!29511 () Bool)

(assert (=> b!154145 (= c!29511 (not (= (bvand (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!154146 () Bool)

(declare-fun e!100731 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!154146 (= e!100731 (validKeyInArray!0 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!154147 () Bool)

(declare-fun e!100729 () Bool)

(declare-fun lt!80911 () ListLongMap!1817)

(declare-fun apply!128 (ListLongMap!1817 (_ BitVec 64)) V!3683)

(assert (=> b!154147 (= e!100729 (= (apply!128 lt!80911 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun b!154148 () Bool)

(declare-fun e!100732 () ListLongMap!1817)

(declare-fun e!100733 () ListLongMap!1817)

(assert (=> b!154148 (= e!100732 e!100733)))

(declare-fun c!29509 () Bool)

(assert (=> b!154148 (= c!29509 (and (not (= (bvand (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17147 () Bool)

(declare-fun call!17151 () ListLongMap!1817)

(declare-fun call!17156 () ListLongMap!1817)

(assert (=> bm!17147 (= call!17151 call!17156)))

(declare-fun b!154150 () Bool)

(declare-fun e!100736 () Bool)

(assert (=> b!154150 (= e!100736 (validKeyInArray!0 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!154151 () Bool)

(declare-fun call!17152 () ListLongMap!1817)

(assert (=> b!154151 (= e!100733 call!17152)))

(declare-fun b!154152 () Bool)

(declare-fun res!72799 () Bool)

(assert (=> b!154152 (=> (not res!72799) (not e!100735))))

(declare-fun e!100728 () Bool)

(assert (=> b!154152 (= res!72799 e!100728)))

(declare-fun res!72803 () Bool)

(assert (=> b!154152 (=> res!72803 e!100728)))

(assert (=> b!154152 (= res!72803 (not e!100736))))

(declare-fun res!72796 () Bool)

(assert (=> b!154152 (=> (not res!72796) (not e!100736))))

(assert (=> b!154152 (= res!72796 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun b!154153 () Bool)

(declare-fun call!17154 () Bool)

(assert (=> b!154153 (= e!100727 (not call!17154))))

(declare-fun d!50585 () Bool)

(assert (=> d!50585 e!100735))

(declare-fun res!72798 () Bool)

(assert (=> d!50585 (=> (not res!72798) (not e!100735))))

(assert (=> d!50585 (= res!72798 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun lt!80914 () ListLongMap!1817)

(assert (=> d!50585 (= lt!80911 lt!80914)))

(declare-datatypes ((Unit!4899 0))(
  ( (Unit!4900) )
))
(declare-fun lt!80901 () Unit!4899)

(declare-fun e!100730 () Unit!4899)

(assert (=> d!50585 (= lt!80901 e!100730)))

(declare-fun c!29513 () Bool)

(assert (=> d!50585 (= c!29513 e!100731)))

(declare-fun res!72801 () Bool)

(assert (=> d!50585 (=> (not res!72801) (not e!100731))))

(assert (=> d!50585 (= res!72801 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(assert (=> d!50585 (= lt!80914 e!100732)))

(declare-fun c!29510 () Bool)

(assert (=> d!50585 (= c!29510 (and (not (= (bvand (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!50585 (validMask!0 (mask!7468 (v!3419 (underlying!526 thiss!992))))))

(assert (=> d!50585 (= (getCurrentListMap!588 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))) lt!80911)))

(declare-fun b!154149 () Bool)

(declare-fun e!100737 () ListLongMap!1817)

(assert (=> b!154149 (= e!100737 call!17152)))

(declare-fun b!154154 () Bool)

(declare-fun Unit!4901 () Unit!4899)

(assert (=> b!154154 (= e!100730 Unit!4901)))

(declare-fun b!154155 () Bool)

(declare-fun e!100734 () Bool)

(assert (=> b!154155 (= e!100727 e!100734)))

(declare-fun res!72800 () Bool)

(assert (=> b!154155 (= res!72800 call!17154)))

(assert (=> b!154155 (=> (not res!72800) (not e!100734))))

(declare-fun b!154156 () Bool)

(declare-fun e!100738 () Bool)

(assert (=> b!154156 (= e!100735 e!100738)))

(declare-fun c!29514 () Bool)

(assert (=> b!154156 (= c!29514 (not (= (bvand (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!154157 () Bool)

(assert (=> b!154157 (= e!100734 (= (apply!128 lt!80911 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun bm!17148 () Bool)

(declare-fun call!17153 () ListLongMap!1817)

(assert (=> bm!17148 (= call!17156 call!17153)))

(declare-fun b!154158 () Bool)

(assert (=> b!154158 (= e!100738 e!100729)))

(declare-fun res!72797 () Bool)

(declare-fun call!17155 () Bool)

(assert (=> b!154158 (= res!72797 call!17155)))

(assert (=> b!154158 (=> (not res!72797) (not e!100729))))

(declare-fun bm!17149 () Bool)

(declare-fun contains!968 (ListLongMap!1817 (_ BitVec 64)) Bool)

(assert (=> bm!17149 (= call!17155 (contains!968 lt!80911 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154159 () Bool)

(declare-fun e!100739 () Bool)

(assert (=> b!154159 (= e!100728 e!100739)))

(declare-fun res!72804 () Bool)

(assert (=> b!154159 (=> (not res!72804) (not e!100739))))

(assert (=> b!154159 (= res!72804 (contains!968 lt!80911 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!154159 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun b!154160 () Bool)

(declare-fun lt!80905 () Unit!4899)

(assert (=> b!154160 (= e!100730 lt!80905)))

(declare-fun lt!80904 () ListLongMap!1817)

(declare-fun getCurrentListMapNoExtraKeys!161 (array!5105 array!5107 (_ BitVec 32) (_ BitVec 32) V!3683 V!3683 (_ BitVec 32) Int) ListLongMap!1817)

(assert (=> b!154160 (= lt!80904 (getCurrentListMapNoExtraKeys!161 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun lt!80906 () (_ BitVec 64))

(assert (=> b!154160 (= lt!80906 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80916 () (_ BitVec 64))

(assert (=> b!154160 (= lt!80916 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!80910 () Unit!4899)

(declare-fun addStillContains!104 (ListLongMap!1817 (_ BitVec 64) V!3683 (_ BitVec 64)) Unit!4899)

(assert (=> b!154160 (= lt!80910 (addStillContains!104 lt!80904 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80916))))

(declare-fun +!192 (ListLongMap!1817 tuple2!2830) ListLongMap!1817)

(assert (=> b!154160 (contains!968 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80916)))

(declare-fun lt!80902 () Unit!4899)

(assert (=> b!154160 (= lt!80902 lt!80910)))

(declare-fun lt!80919 () ListLongMap!1817)

(assert (=> b!154160 (= lt!80919 (getCurrentListMapNoExtraKeys!161 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun lt!80922 () (_ BitVec 64))

(assert (=> b!154160 (= lt!80922 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80915 () (_ BitVec 64))

(assert (=> b!154160 (= lt!80915 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!80908 () Unit!4899)

(declare-fun addApplyDifferent!104 (ListLongMap!1817 (_ BitVec 64) V!3683 (_ BitVec 64)) Unit!4899)

(assert (=> b!154160 (= lt!80908 (addApplyDifferent!104 lt!80919 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80915))))

(assert (=> b!154160 (= (apply!128 (+!192 lt!80919 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80915) (apply!128 lt!80919 lt!80915))))

(declare-fun lt!80920 () Unit!4899)

(assert (=> b!154160 (= lt!80920 lt!80908)))

(declare-fun lt!80912 () ListLongMap!1817)

(assert (=> b!154160 (= lt!80912 (getCurrentListMapNoExtraKeys!161 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun lt!80907 () (_ BitVec 64))

(assert (=> b!154160 (= lt!80907 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80921 () (_ BitVec 64))

(assert (=> b!154160 (= lt!80921 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!80913 () Unit!4899)

(assert (=> b!154160 (= lt!80913 (addApplyDifferent!104 lt!80912 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80921))))

(assert (=> b!154160 (= (apply!128 (+!192 lt!80912 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80921) (apply!128 lt!80912 lt!80921))))

(declare-fun lt!80918 () Unit!4899)

(assert (=> b!154160 (= lt!80918 lt!80913)))

(declare-fun lt!80917 () ListLongMap!1817)

(assert (=> b!154160 (= lt!80917 (getCurrentListMapNoExtraKeys!161 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun lt!80909 () (_ BitVec 64))

(assert (=> b!154160 (= lt!80909 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80903 () (_ BitVec 64))

(assert (=> b!154160 (= lt!80903 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!154160 (= lt!80905 (addApplyDifferent!104 lt!80917 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80903))))

(assert (=> b!154160 (= (apply!128 (+!192 lt!80917 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80903) (apply!128 lt!80917 lt!80903))))

(declare-fun b!154161 () Bool)

(assert (=> b!154161 (= e!100738 (not call!17155))))

(declare-fun call!17150 () ListLongMap!1817)

(declare-fun bm!17150 () Bool)

(assert (=> bm!17150 (= call!17150 (+!192 (ite c!29510 call!17153 (ite c!29509 call!17156 call!17151)) (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154162 () Bool)

(declare-fun get!1608 (ValueCell!1170 V!3683) V!3683)

(declare-fun dynLambda!471 (Int (_ BitVec 64)) V!3683)

(assert (=> b!154162 (= e!100739 (= (apply!128 lt!80911 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!154162 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2689 (_values!3047 (v!3419 (underlying!526 thiss!992))))))))

(assert (=> b!154162 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun bm!17151 () Bool)

(assert (=> bm!17151 (= call!17152 call!17150)))

(declare-fun b!154163 () Bool)

(assert (=> b!154163 (= e!100737 call!17151)))

(declare-fun bm!17152 () Bool)

(assert (=> bm!17152 (= call!17154 (contains!968 lt!80911 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154164 () Bool)

(assert (=> b!154164 (= e!100732 (+!192 call!17150 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun bm!17153 () Bool)

(assert (=> bm!17153 (= call!17153 (getCurrentListMapNoExtraKeys!161 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun b!154165 () Bool)

(declare-fun c!29512 () Bool)

(assert (=> b!154165 (= c!29512 (and (not (= (bvand (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!154165 (= e!100733 e!100737)))

(assert (= (and d!50585 c!29510) b!154164))

(assert (= (and d!50585 (not c!29510)) b!154148))

(assert (= (and b!154148 c!29509) b!154151))

(assert (= (and b!154148 (not c!29509)) b!154165))

(assert (= (and b!154165 c!29512) b!154149))

(assert (= (and b!154165 (not c!29512)) b!154163))

(assert (= (or b!154149 b!154163) bm!17147))

(assert (= (or b!154151 bm!17147) bm!17148))

(assert (= (or b!154151 b!154149) bm!17151))

(assert (= (or b!154164 bm!17148) bm!17153))

(assert (= (or b!154164 bm!17151) bm!17150))

(assert (= (and d!50585 res!72801) b!154146))

(assert (= (and d!50585 c!29513) b!154160))

(assert (= (and d!50585 (not c!29513)) b!154154))

(assert (= (and d!50585 res!72798) b!154152))

(assert (= (and b!154152 res!72796) b!154150))

(assert (= (and b!154152 (not res!72803)) b!154159))

(assert (= (and b!154159 res!72804) b!154162))

(assert (= (and b!154152 res!72799) b!154145))

(assert (= (and b!154145 c!29511) b!154155))

(assert (= (and b!154145 (not c!29511)) b!154153))

(assert (= (and b!154155 res!72800) b!154157))

(assert (= (or b!154155 b!154153) bm!17152))

(assert (= (and b!154145 res!72802) b!154156))

(assert (= (and b!154156 c!29514) b!154158))

(assert (= (and b!154156 (not c!29514)) b!154161))

(assert (= (and b!154158 res!72797) b!154147))

(assert (= (or b!154158 b!154161) bm!17149))

(declare-fun b_lambda!6843 () Bool)

(assert (=> (not b_lambda!6843) (not b!154162)))

(declare-fun t!6603 () Bool)

(declare-fun tb!2757 () Bool)

(assert (=> (and b!154039 (= (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))) t!6603) tb!2757))

(declare-fun result!4489 () Bool)

(assert (=> tb!2757 (= result!4489 tp_is_empty!3027)))

(assert (=> b!154162 t!6603))

(declare-fun b_and!9599 () Bool)

(assert (= b_and!9591 (and (=> t!6603 result!4489) b_and!9599)))

(declare-fun t!6605 () Bool)

(declare-fun tb!2759 () Bool)

(assert (=> (and b!154038 (= (defaultEntry!3064 newMap!16) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))) t!6605) tb!2759))

(declare-fun result!4493 () Bool)

(assert (= result!4493 result!4489))

(assert (=> b!154162 t!6605))

(declare-fun b_and!9601 () Bool)

(assert (= b_and!9593 (and (=> t!6605 result!4493) b_and!9601)))

(declare-fun m!187839 () Bool)

(assert (=> b!154162 m!187839))

(declare-fun m!187841 () Bool)

(assert (=> b!154162 m!187841))

(declare-fun m!187843 () Bool)

(assert (=> b!154162 m!187843))

(declare-fun m!187845 () Bool)

(assert (=> b!154162 m!187845))

(assert (=> b!154162 m!187839))

(declare-fun m!187847 () Bool)

(assert (=> b!154162 m!187847))

(assert (=> b!154162 m!187845))

(assert (=> b!154162 m!187841))

(assert (=> b!154159 m!187841))

(assert (=> b!154159 m!187841))

(declare-fun m!187849 () Bool)

(assert (=> b!154159 m!187849))

(declare-fun m!187851 () Bool)

(assert (=> bm!17152 m!187851))

(declare-fun m!187853 () Bool)

(assert (=> bm!17150 m!187853))

(declare-fun m!187855 () Bool)

(assert (=> b!154160 m!187855))

(declare-fun m!187857 () Bool)

(assert (=> b!154160 m!187857))

(declare-fun m!187859 () Bool)

(assert (=> b!154160 m!187859))

(declare-fun m!187861 () Bool)

(assert (=> b!154160 m!187861))

(declare-fun m!187863 () Bool)

(assert (=> b!154160 m!187863))

(declare-fun m!187865 () Bool)

(assert (=> b!154160 m!187865))

(assert (=> b!154160 m!187865))

(declare-fun m!187867 () Bool)

(assert (=> b!154160 m!187867))

(declare-fun m!187869 () Bool)

(assert (=> b!154160 m!187869))

(declare-fun m!187871 () Bool)

(assert (=> b!154160 m!187871))

(declare-fun m!187873 () Bool)

(assert (=> b!154160 m!187873))

(assert (=> b!154160 m!187841))

(declare-fun m!187875 () Bool)

(assert (=> b!154160 m!187875))

(assert (=> b!154160 m!187857))

(assert (=> b!154160 m!187861))

(declare-fun m!187877 () Bool)

(assert (=> b!154160 m!187877))

(declare-fun m!187879 () Bool)

(assert (=> b!154160 m!187879))

(declare-fun m!187881 () Bool)

(assert (=> b!154160 m!187881))

(declare-fun m!187883 () Bool)

(assert (=> b!154160 m!187883))

(assert (=> b!154160 m!187871))

(declare-fun m!187885 () Bool)

(assert (=> b!154160 m!187885))

(declare-fun m!187887 () Bool)

(assert (=> b!154157 m!187887))

(assert (=> bm!17153 m!187879))

(declare-fun m!187889 () Bool)

(assert (=> b!154164 m!187889))

(assert (=> b!154146 m!187841))

(assert (=> b!154146 m!187841))

(declare-fun m!187891 () Bool)

(assert (=> b!154146 m!187891))

(declare-fun m!187893 () Bool)

(assert (=> d!50585 m!187893))

(declare-fun m!187895 () Bool)

(assert (=> bm!17149 m!187895))

(assert (=> b!154150 m!187841))

(assert (=> b!154150 m!187841))

(assert (=> b!154150 m!187891))

(declare-fun m!187897 () Bool)

(assert (=> b!154147 m!187897))

(assert (=> b!154044 d!50585))

(declare-fun d!50587 () Bool)

(assert (=> d!50587 (= (array_inv!1521 (_keys!4837 newMap!16)) (bvsge (size!2688 (_keys!4837 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!154038 d!50587))

(declare-fun d!50589 () Bool)

(assert (=> d!50589 (= (array_inv!1522 (_values!3047 newMap!16)) (bvsge (size!2689 (_values!3047 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!154038 d!50589))

(declare-fun d!50591 () Bool)

(assert (=> d!50591 (= (array_inv!1521 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvsge (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!154039 d!50591))

(declare-fun d!50593 () Bool)

(assert (=> d!50593 (= (array_inv!1522 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvsge (size!2689 (_values!3047 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!154039 d!50593))

(declare-fun d!50595 () Bool)

(assert (=> d!50595 (= (map!1503 (v!3419 (underlying!526 thiss!992))) (getCurrentListMap!588 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun bs!6516 () Bool)

(assert (= bs!6516 d!50595))

(declare-fun m!187899 () Bool)

(assert (=> bs!6516 m!187899))

(assert (=> b!154042 d!50595))

(declare-fun condMapEmpty!5181 () Bool)

(declare-fun mapDefault!5181 () ValueCell!1170)

(assert (=> mapNonEmpty!5171 (= condMapEmpty!5181 (= mapRest!5171 ((as const (Array (_ BitVec 32) ValueCell!1170)) mapDefault!5181)))))

(declare-fun e!100745 () Bool)

(declare-fun mapRes!5181 () Bool)

(assert (=> mapNonEmpty!5171 (= tp!12183 (and e!100745 mapRes!5181))))

(declare-fun mapIsEmpty!5181 () Bool)

(assert (=> mapIsEmpty!5181 mapRes!5181))

(declare-fun b!154174 () Bool)

(declare-fun e!100744 () Bool)

(assert (=> b!154174 (= e!100744 tp_is_empty!3027)))

(declare-fun mapNonEmpty!5181 () Bool)

(declare-fun tp!12201 () Bool)

(assert (=> mapNonEmpty!5181 (= mapRes!5181 (and tp!12201 e!100744))))

(declare-fun mapRest!5181 () (Array (_ BitVec 32) ValueCell!1170))

(declare-fun mapValue!5181 () ValueCell!1170)

(declare-fun mapKey!5181 () (_ BitVec 32))

(assert (=> mapNonEmpty!5181 (= mapRest!5171 (store mapRest!5181 mapKey!5181 mapValue!5181))))

(declare-fun b!154175 () Bool)

(assert (=> b!154175 (= e!100745 tp_is_empty!3027)))

(assert (= (and mapNonEmpty!5171 condMapEmpty!5181) mapIsEmpty!5181))

(assert (= (and mapNonEmpty!5171 (not condMapEmpty!5181)) mapNonEmpty!5181))

(assert (= (and mapNonEmpty!5181 ((_ is ValueCellFull!1170) mapValue!5181)) b!154174))

(assert (= (and mapNonEmpty!5171 ((_ is ValueCellFull!1170) mapDefault!5181)) b!154175))

(declare-fun m!187901 () Bool)

(assert (=> mapNonEmpty!5181 m!187901))

(declare-fun condMapEmpty!5182 () Bool)

(declare-fun mapDefault!5182 () ValueCell!1170)

(assert (=> mapNonEmpty!5172 (= condMapEmpty!5182 (= mapRest!5172 ((as const (Array (_ BitVec 32) ValueCell!1170)) mapDefault!5182)))))

(declare-fun e!100747 () Bool)

(declare-fun mapRes!5182 () Bool)

(assert (=> mapNonEmpty!5172 (= tp!12184 (and e!100747 mapRes!5182))))

(declare-fun mapIsEmpty!5182 () Bool)

(assert (=> mapIsEmpty!5182 mapRes!5182))

(declare-fun b!154176 () Bool)

(declare-fun e!100746 () Bool)

(assert (=> b!154176 (= e!100746 tp_is_empty!3027)))

(declare-fun mapNonEmpty!5182 () Bool)

(declare-fun tp!12202 () Bool)

(assert (=> mapNonEmpty!5182 (= mapRes!5182 (and tp!12202 e!100746))))

(declare-fun mapRest!5182 () (Array (_ BitVec 32) ValueCell!1170))

(declare-fun mapKey!5182 () (_ BitVec 32))

(declare-fun mapValue!5182 () ValueCell!1170)

(assert (=> mapNonEmpty!5182 (= mapRest!5172 (store mapRest!5182 mapKey!5182 mapValue!5182))))

(declare-fun b!154177 () Bool)

(assert (=> b!154177 (= e!100747 tp_is_empty!3027)))

(assert (= (and mapNonEmpty!5172 condMapEmpty!5182) mapIsEmpty!5182))

(assert (= (and mapNonEmpty!5172 (not condMapEmpty!5182)) mapNonEmpty!5182))

(assert (= (and mapNonEmpty!5182 ((_ is ValueCellFull!1170) mapValue!5182)) b!154176))

(assert (= (and mapNonEmpty!5172 ((_ is ValueCellFull!1170) mapDefault!5182)) b!154177))

(declare-fun m!187903 () Bool)

(assert (=> mapNonEmpty!5182 m!187903))

(declare-fun b_lambda!6845 () Bool)

(assert (= b_lambda!6843 (or (and b!154039 b_free!3221) (and b!154038 b_free!3223 (= (defaultEntry!3064 newMap!16) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))))) b_lambda!6845)))

(check-sat (not b!154146) (not b!154162) (not b!154150) b_and!9599 (not mapNonEmpty!5182) (not bm!17152) (not b!154164) (not d!50579) b_and!9601 (not b!154100) (not d!50583) (not bm!17153) (not b!154159) (not mapNonEmpty!5181) (not b!154102) (not b!154147) (not d!50585) (not b_next!3221) (not b!154101) (not b_next!3223) (not b!154160) (not bm!17149) (not bm!17150) (not d!50581) (not b!154157) (not d!50595) (not b_lambda!6845) tp_is_empty!3027)
(check-sat b_and!9599 b_and!9601 (not b_next!3221) (not b_next!3223))
(get-model)

(declare-fun bm!17156 () Bool)

(declare-fun call!17159 () ListLongMap!1817)

(assert (=> bm!17156 (= call!17159 (getCurrentListMapNoExtraKeys!161 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun d!50597 () Bool)

(declare-fun e!100762 () Bool)

(assert (=> d!50597 e!100762))

(declare-fun res!72814 () Bool)

(assert (=> d!50597 (=> (not res!72814) (not e!100762))))

(declare-fun lt!80941 () ListLongMap!1817)

(assert (=> d!50597 (= res!72814 (not (contains!968 lt!80941 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!100764 () ListLongMap!1817)

(assert (=> d!50597 (= lt!80941 e!100764)))

(declare-fun c!29525 () Bool)

(assert (=> d!50597 (= c!29525 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(assert (=> d!50597 (validMask!0 (mask!7468 (v!3419 (underlying!526 thiss!992))))))

(assert (=> d!50597 (= (getCurrentListMapNoExtraKeys!161 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))) lt!80941)))

(declare-fun b!154202 () Bool)

(declare-fun e!100763 () Bool)

(declare-fun e!100765 () Bool)

(assert (=> b!154202 (= e!100763 e!100765)))

(declare-fun c!29524 () Bool)

(assert (=> b!154202 (= c!29524 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun b!154203 () Bool)

(declare-fun e!100766 () ListLongMap!1817)

(assert (=> b!154203 (= e!100764 e!100766)))

(declare-fun c!29526 () Bool)

(assert (=> b!154203 (= c!29526 (validKeyInArray!0 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!154204 () Bool)

(declare-fun e!100768 () Bool)

(assert (=> b!154204 (= e!100763 e!100768)))

(assert (=> b!154204 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun res!72815 () Bool)

(assert (=> b!154204 (= res!72815 (contains!968 lt!80941 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!154204 (=> (not res!72815) (not e!100768))))

(declare-fun b!154205 () Bool)

(assert (=> b!154205 (= e!100765 (= lt!80941 (getCurrentListMapNoExtraKeys!161 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun b!154206 () Bool)

(assert (=> b!154206 (= e!100764 (ListLongMap!1818 Nil!1804))))

(declare-fun b!154207 () Bool)

(declare-fun isEmpty!430 (ListLongMap!1817) Bool)

(assert (=> b!154207 (= e!100765 (isEmpty!430 lt!80941))))

(declare-fun b!154208 () Bool)

(assert (=> b!154208 (= e!100762 e!100763)))

(declare-fun c!29523 () Bool)

(declare-fun e!100767 () Bool)

(assert (=> b!154208 (= c!29523 e!100767)))

(declare-fun res!72816 () Bool)

(assert (=> b!154208 (=> (not res!72816) (not e!100767))))

(assert (=> b!154208 (= res!72816 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun b!154209 () Bool)

(assert (=> b!154209 (= e!100767 (validKeyInArray!0 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!154209 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!154210 () Bool)

(declare-fun lt!80943 () Unit!4899)

(declare-fun lt!80939 () Unit!4899)

(assert (=> b!154210 (= lt!80943 lt!80939)))

(declare-fun lt!80938 () (_ BitVec 64))

(declare-fun lt!80937 () (_ BitVec 64))

(declare-fun lt!80942 () V!3683)

(declare-fun lt!80940 () ListLongMap!1817)

(assert (=> b!154210 (not (contains!968 (+!192 lt!80940 (tuple2!2831 lt!80937 lt!80942)) lt!80938))))

(declare-fun addStillNotContains!70 (ListLongMap!1817 (_ BitVec 64) V!3683 (_ BitVec 64)) Unit!4899)

(assert (=> b!154210 (= lt!80939 (addStillNotContains!70 lt!80940 lt!80937 lt!80942 lt!80938))))

(assert (=> b!154210 (= lt!80938 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!154210 (= lt!80942 (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!154210 (= lt!80937 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!154210 (= lt!80940 call!17159)))

(assert (=> b!154210 (= e!100766 (+!192 call!17159 (tuple2!2831 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!154211 () Bool)

(declare-fun res!72813 () Bool)

(assert (=> b!154211 (=> (not res!72813) (not e!100762))))

(assert (=> b!154211 (= res!72813 (not (contains!968 lt!80941 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154212 () Bool)

(assert (=> b!154212 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(assert (=> b!154212 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2689 (_values!3047 (v!3419 (underlying!526 thiss!992))))))))

(assert (=> b!154212 (= e!100768 (= (apply!128 lt!80941 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!154213 () Bool)

(assert (=> b!154213 (= e!100766 call!17159)))

(assert (= (and d!50597 c!29525) b!154206))

(assert (= (and d!50597 (not c!29525)) b!154203))

(assert (= (and b!154203 c!29526) b!154210))

(assert (= (and b!154203 (not c!29526)) b!154213))

(assert (= (or b!154210 b!154213) bm!17156))

(assert (= (and d!50597 res!72814) b!154211))

(assert (= (and b!154211 res!72813) b!154208))

(assert (= (and b!154208 res!72816) b!154209))

(assert (= (and b!154208 c!29523) b!154204))

(assert (= (and b!154208 (not c!29523)) b!154202))

(assert (= (and b!154204 res!72815) b!154212))

(assert (= (and b!154202 c!29524) b!154205))

(assert (= (and b!154202 (not c!29524)) b!154207))

(declare-fun b_lambda!6847 () Bool)

(assert (=> (not b_lambda!6847) (not b!154210)))

(assert (=> b!154210 t!6603))

(declare-fun b_and!9603 () Bool)

(assert (= b_and!9599 (and (=> t!6603 result!4489) b_and!9603)))

(assert (=> b!154210 t!6605))

(declare-fun b_and!9605 () Bool)

(assert (= b_and!9601 (and (=> t!6605 result!4493) b_and!9605)))

(declare-fun b_lambda!6849 () Bool)

(assert (=> (not b_lambda!6849) (not b!154212)))

(assert (=> b!154212 t!6603))

(declare-fun b_and!9607 () Bool)

(assert (= b_and!9603 (and (=> t!6603 result!4489) b_and!9607)))

(assert (=> b!154212 t!6605))

(declare-fun b_and!9609 () Bool)

(assert (= b_and!9605 (and (=> t!6605 result!4493) b_and!9609)))

(assert (=> b!154203 m!187841))

(assert (=> b!154203 m!187841))

(assert (=> b!154203 m!187891))

(declare-fun m!187905 () Bool)

(assert (=> b!154207 m!187905))

(assert (=> b!154212 m!187839))

(assert (=> b!154212 m!187841))

(declare-fun m!187907 () Bool)

(assert (=> b!154212 m!187907))

(assert (=> b!154212 m!187841))

(assert (=> b!154212 m!187845))

(assert (=> b!154212 m!187839))

(assert (=> b!154212 m!187847))

(assert (=> b!154212 m!187845))

(declare-fun m!187909 () Bool)

(assert (=> b!154211 m!187909))

(assert (=> b!154209 m!187841))

(assert (=> b!154209 m!187841))

(assert (=> b!154209 m!187891))

(assert (=> b!154204 m!187841))

(assert (=> b!154204 m!187841))

(declare-fun m!187911 () Bool)

(assert (=> b!154204 m!187911))

(declare-fun m!187913 () Bool)

(assert (=> d!50597 m!187913))

(assert (=> d!50597 m!187893))

(declare-fun m!187915 () Bool)

(assert (=> bm!17156 m!187915))

(assert (=> b!154205 m!187915))

(declare-fun m!187917 () Bool)

(assert (=> b!154210 m!187917))

(assert (=> b!154210 m!187839))

(assert (=> b!154210 m!187845))

(assert (=> b!154210 m!187839))

(assert (=> b!154210 m!187847))

(assert (=> b!154210 m!187845))

(assert (=> b!154210 m!187917))

(declare-fun m!187919 () Bool)

(assert (=> b!154210 m!187919))

(assert (=> b!154210 m!187841))

(declare-fun m!187921 () Bool)

(assert (=> b!154210 m!187921))

(declare-fun m!187923 () Bool)

(assert (=> b!154210 m!187923))

(assert (=> bm!17153 d!50597))

(declare-fun d!50599 () Bool)

(declare-fun e!100773 () Bool)

(assert (=> d!50599 e!100773))

(declare-fun res!72819 () Bool)

(assert (=> d!50599 (=> res!72819 e!100773)))

(declare-fun lt!80952 () Bool)

(assert (=> d!50599 (= res!72819 (not lt!80952))))

(declare-fun lt!80955 () Bool)

(assert (=> d!50599 (= lt!80952 lt!80955)))

(declare-fun lt!80954 () Unit!4899)

(declare-fun e!100774 () Unit!4899)

(assert (=> d!50599 (= lt!80954 e!100774)))

(declare-fun c!29529 () Bool)

(assert (=> d!50599 (= c!29529 lt!80955)))

(declare-fun containsKey!187 (List!1807 (_ BitVec 64)) Bool)

(assert (=> d!50599 (= lt!80955 (containsKey!187 (toList!924 lt!80911) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50599 (= (contains!968 lt!80911 #b1000000000000000000000000000000000000000000000000000000000000000) lt!80952)))

(declare-fun b!154220 () Bool)

(declare-fun lt!80953 () Unit!4899)

(assert (=> b!154220 (= e!100774 lt!80953)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!135 (List!1807 (_ BitVec 64)) Unit!4899)

(assert (=> b!154220 (= lt!80953 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!80911) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!189 0))(
  ( (Some!188 (v!3422 V!3683)) (None!187) )
))
(declare-fun isDefined!136 (Option!189) Bool)

(declare-fun getValueByKey!183 (List!1807 (_ BitVec 64)) Option!189)

(assert (=> b!154220 (isDefined!136 (getValueByKey!183 (toList!924 lt!80911) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154221 () Bool)

(declare-fun Unit!4902 () Unit!4899)

(assert (=> b!154221 (= e!100774 Unit!4902)))

(declare-fun b!154222 () Bool)

(assert (=> b!154222 (= e!100773 (isDefined!136 (getValueByKey!183 (toList!924 lt!80911) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50599 c!29529) b!154220))

(assert (= (and d!50599 (not c!29529)) b!154221))

(assert (= (and d!50599 (not res!72819)) b!154222))

(declare-fun m!187925 () Bool)

(assert (=> d!50599 m!187925))

(declare-fun m!187927 () Bool)

(assert (=> b!154220 m!187927))

(declare-fun m!187929 () Bool)

(assert (=> b!154220 m!187929))

(assert (=> b!154220 m!187929))

(declare-fun m!187931 () Bool)

(assert (=> b!154220 m!187931))

(assert (=> b!154222 m!187929))

(assert (=> b!154222 m!187929))

(assert (=> b!154222 m!187931))

(assert (=> bm!17149 d!50599))

(declare-fun d!50601 () Bool)

(declare-fun e!100775 () Bool)

(assert (=> d!50601 e!100775))

(declare-fun res!72820 () Bool)

(assert (=> d!50601 (=> res!72820 e!100775)))

(declare-fun lt!80956 () Bool)

(assert (=> d!50601 (= res!72820 (not lt!80956))))

(declare-fun lt!80959 () Bool)

(assert (=> d!50601 (= lt!80956 lt!80959)))

(declare-fun lt!80958 () Unit!4899)

(declare-fun e!100776 () Unit!4899)

(assert (=> d!50601 (= lt!80958 e!100776)))

(declare-fun c!29530 () Bool)

(assert (=> d!50601 (= c!29530 lt!80959)))

(assert (=> d!50601 (= lt!80959 (containsKey!187 (toList!924 lt!80911) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!50601 (= (contains!968 lt!80911 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!80956)))

(declare-fun b!154223 () Bool)

(declare-fun lt!80957 () Unit!4899)

(assert (=> b!154223 (= e!100776 lt!80957)))

(assert (=> b!154223 (= lt!80957 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!80911) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!154223 (isDefined!136 (getValueByKey!183 (toList!924 lt!80911) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!154224 () Bool)

(declare-fun Unit!4903 () Unit!4899)

(assert (=> b!154224 (= e!100776 Unit!4903)))

(declare-fun b!154225 () Bool)

(assert (=> b!154225 (= e!100775 (isDefined!136 (getValueByKey!183 (toList!924 lt!80911) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!50601 c!29530) b!154223))

(assert (= (and d!50601 (not c!29530)) b!154224))

(assert (= (and d!50601 (not res!72820)) b!154225))

(assert (=> d!50601 m!187841))

(declare-fun m!187933 () Bool)

(assert (=> d!50601 m!187933))

(assert (=> b!154223 m!187841))

(declare-fun m!187935 () Bool)

(assert (=> b!154223 m!187935))

(assert (=> b!154223 m!187841))

(declare-fun m!187937 () Bool)

(assert (=> b!154223 m!187937))

(assert (=> b!154223 m!187937))

(declare-fun m!187939 () Bool)

(assert (=> b!154223 m!187939))

(assert (=> b!154225 m!187841))

(assert (=> b!154225 m!187937))

(assert (=> b!154225 m!187937))

(assert (=> b!154225 m!187939))

(assert (=> b!154159 d!50601))

(declare-fun d!50603 () Bool)

(assert (=> d!50603 (= (validKeyInArray!0 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!154150 d!50603))

(declare-fun b!154234 () Bool)

(declare-fun e!100785 () Bool)

(declare-fun e!100784 () Bool)

(assert (=> b!154234 (= e!100785 e!100784)))

(declare-fun c!29533 () Bool)

(assert (=> b!154234 (= c!29533 (validKeyInArray!0 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154235 () Bool)

(declare-fun e!100783 () Bool)

(assert (=> b!154235 (= e!100784 e!100783)))

(declare-fun lt!80966 () (_ BitVec 64))

(assert (=> b!154235 (= lt!80966 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!80967 () Unit!4899)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5105 (_ BitVec 64) (_ BitVec 32)) Unit!4899)

(assert (=> b!154235 (= lt!80967 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4837 newMap!16) lt!80966 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!154235 (arrayContainsKey!0 (_keys!4837 newMap!16) lt!80966 #b00000000000000000000000000000000)))

(declare-fun lt!80968 () Unit!4899)

(assert (=> b!154235 (= lt!80968 lt!80967)))

(declare-fun res!72826 () Bool)

(declare-datatypes ((SeekEntryResult!286 0))(
  ( (MissingZero!286 (index!3312 (_ BitVec 32))) (Found!286 (index!3313 (_ BitVec 32))) (Intermediate!286 (undefined!1098 Bool) (index!3314 (_ BitVec 32)) (x!17022 (_ BitVec 32))) (Undefined!286) (MissingVacant!286 (index!3315 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5105 (_ BitVec 32)) SeekEntryResult!286)

(assert (=> b!154235 (= res!72826 (= (seekEntryOrOpen!0 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000) (_keys!4837 newMap!16) (mask!7468 newMap!16)) (Found!286 #b00000000000000000000000000000000)))))

(assert (=> b!154235 (=> (not res!72826) (not e!100783))))

(declare-fun b!154236 () Bool)

(declare-fun call!17162 () Bool)

(assert (=> b!154236 (= e!100783 call!17162)))

(declare-fun b!154237 () Bool)

(assert (=> b!154237 (= e!100784 call!17162)))

(declare-fun d!50605 () Bool)

(declare-fun res!72825 () Bool)

(assert (=> d!50605 (=> res!72825 e!100785)))

(assert (=> d!50605 (= res!72825 (bvsge #b00000000000000000000000000000000 (size!2688 (_keys!4837 newMap!16))))))

(assert (=> d!50605 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4837 newMap!16) (mask!7468 newMap!16)) e!100785)))

(declare-fun bm!17159 () Bool)

(assert (=> bm!17159 (= call!17162 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4837 newMap!16) (mask!7468 newMap!16)))))

(assert (= (and d!50605 (not res!72825)) b!154234))

(assert (= (and b!154234 c!29533) b!154235))

(assert (= (and b!154234 (not c!29533)) b!154237))

(assert (= (and b!154235 res!72826) b!154236))

(assert (= (or b!154236 b!154237) bm!17159))

(declare-fun m!187941 () Bool)

(assert (=> b!154234 m!187941))

(assert (=> b!154234 m!187941))

(declare-fun m!187943 () Bool)

(assert (=> b!154234 m!187943))

(assert (=> b!154235 m!187941))

(declare-fun m!187945 () Bool)

(assert (=> b!154235 m!187945))

(declare-fun m!187947 () Bool)

(assert (=> b!154235 m!187947))

(assert (=> b!154235 m!187941))

(declare-fun m!187949 () Bool)

(assert (=> b!154235 m!187949))

(declare-fun m!187951 () Bool)

(assert (=> bm!17159 m!187951))

(assert (=> b!154101 d!50605))

(declare-fun d!50607 () Bool)

(declare-fun get!1609 (Option!189) V!3683)

(assert (=> d!50607 (= (apply!128 lt!80911 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1609 (getValueByKey!183 (toList!924 lt!80911) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6517 () Bool)

(assert (= bs!6517 d!50607))

(declare-fun m!187953 () Bool)

(assert (=> bs!6517 m!187953))

(assert (=> bs!6517 m!187953))

(declare-fun m!187955 () Bool)

(assert (=> bs!6517 m!187955))

(assert (=> b!154157 d!50607))

(declare-fun d!50609 () Bool)

(assert (=> d!50609 (= (apply!128 lt!80911 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1609 (getValueByKey!183 (toList!924 lt!80911) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6518 () Bool)

(assert (= bs!6518 d!50609))

(assert (=> bs!6518 m!187929))

(assert (=> bs!6518 m!187929))

(declare-fun m!187957 () Bool)

(assert (=> bs!6518 m!187957))

(assert (=> b!154147 d!50609))

(declare-fun d!50611 () Bool)

(declare-fun res!72827 () Bool)

(declare-fun e!100786 () Bool)

(assert (=> d!50611 (=> (not res!72827) (not e!100786))))

(assert (=> d!50611 (= res!72827 (simpleValid!104 (v!3419 (underlying!526 thiss!992))))))

(assert (=> d!50611 (= (valid!617 (v!3419 (underlying!526 thiss!992))) e!100786)))

(declare-fun b!154238 () Bool)

(declare-fun res!72828 () Bool)

(assert (=> b!154238 (=> (not res!72828) (not e!100786))))

(assert (=> b!154238 (= res!72828 (= (arrayCountValidKeys!0 (_keys!4837 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000000 (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))) (_size!673 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun b!154239 () Bool)

(declare-fun res!72829 () Bool)

(assert (=> b!154239 (=> (not res!72829) (not e!100786))))

(assert (=> b!154239 (= res!72829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun b!154240 () Bool)

(assert (=> b!154240 (= e!100786 (arrayNoDuplicates!0 (_keys!4837 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000000 Nil!1805))))

(assert (= (and d!50611 res!72827) b!154238))

(assert (= (and b!154238 res!72828) b!154239))

(assert (= (and b!154239 res!72829) b!154240))

(declare-fun m!187959 () Bool)

(assert (=> d!50611 m!187959))

(declare-fun m!187961 () Bool)

(assert (=> b!154238 m!187961))

(declare-fun m!187963 () Bool)

(assert (=> b!154239 m!187963))

(declare-fun m!187965 () Bool)

(assert (=> b!154240 m!187965))

(assert (=> d!50581 d!50611))

(declare-fun d!50613 () Bool)

(declare-fun e!100787 () Bool)

(assert (=> d!50613 e!100787))

(declare-fun res!72830 () Bool)

(assert (=> d!50613 (=> res!72830 e!100787)))

(declare-fun lt!80969 () Bool)

(assert (=> d!50613 (= res!72830 (not lt!80969))))

(declare-fun lt!80972 () Bool)

(assert (=> d!50613 (= lt!80969 lt!80972)))

(declare-fun lt!80971 () Unit!4899)

(declare-fun e!100788 () Unit!4899)

(assert (=> d!50613 (= lt!80971 e!100788)))

(declare-fun c!29534 () Bool)

(assert (=> d!50613 (= c!29534 lt!80972)))

(assert (=> d!50613 (= lt!80972 (containsKey!187 (toList!924 lt!80911) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50613 (= (contains!968 lt!80911 #b0000000000000000000000000000000000000000000000000000000000000000) lt!80969)))

(declare-fun b!154241 () Bool)

(declare-fun lt!80970 () Unit!4899)

(assert (=> b!154241 (= e!100788 lt!80970)))

(assert (=> b!154241 (= lt!80970 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!80911) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154241 (isDefined!136 (getValueByKey!183 (toList!924 lt!80911) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154242 () Bool)

(declare-fun Unit!4904 () Unit!4899)

(assert (=> b!154242 (= e!100788 Unit!4904)))

(declare-fun b!154243 () Bool)

(assert (=> b!154243 (= e!100787 (isDefined!136 (getValueByKey!183 (toList!924 lt!80911) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50613 c!29534) b!154241))

(assert (= (and d!50613 (not c!29534)) b!154242))

(assert (= (and d!50613 (not res!72830)) b!154243))

(declare-fun m!187967 () Bool)

(assert (=> d!50613 m!187967))

(declare-fun m!187969 () Bool)

(assert (=> b!154241 m!187969))

(assert (=> b!154241 m!187953))

(assert (=> b!154241 m!187953))

(declare-fun m!187971 () Bool)

(assert (=> b!154241 m!187971))

(assert (=> b!154243 m!187953))

(assert (=> b!154243 m!187953))

(assert (=> b!154243 m!187971))

(assert (=> bm!17152 d!50613))

(declare-fun b!154254 () Bool)

(declare-fun e!100797 () Bool)

(declare-fun call!17165 () Bool)

(assert (=> b!154254 (= e!100797 call!17165)))

(declare-fun bm!17162 () Bool)

(declare-fun c!29537 () Bool)

(assert (=> bm!17162 (= call!17165 (arrayNoDuplicates!0 (_keys!4837 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29537 (Cons!1804 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000) Nil!1805) Nil!1805)))))

(declare-fun b!154255 () Bool)

(declare-fun e!100799 () Bool)

(assert (=> b!154255 (= e!100799 e!100797)))

(assert (=> b!154255 (= c!29537 (validKeyInArray!0 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154256 () Bool)

(declare-fun e!100800 () Bool)

(assert (=> b!154256 (= e!100800 e!100799)))

(declare-fun res!72839 () Bool)

(assert (=> b!154256 (=> (not res!72839) (not e!100799))))

(declare-fun e!100798 () Bool)

(assert (=> b!154256 (= res!72839 (not e!100798))))

(declare-fun res!72837 () Bool)

(assert (=> b!154256 (=> (not res!72837) (not e!100798))))

(assert (=> b!154256 (= res!72837 (validKeyInArray!0 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154258 () Bool)

(assert (=> b!154258 (= e!100797 call!17165)))

(declare-fun d!50615 () Bool)

(declare-fun res!72838 () Bool)

(assert (=> d!50615 (=> res!72838 e!100800)))

(assert (=> d!50615 (= res!72838 (bvsge #b00000000000000000000000000000000 (size!2688 (_keys!4837 newMap!16))))))

(assert (=> d!50615 (= (arrayNoDuplicates!0 (_keys!4837 newMap!16) #b00000000000000000000000000000000 Nil!1805) e!100800)))

(declare-fun b!154257 () Bool)

(declare-fun contains!969 (List!1808 (_ BitVec 64)) Bool)

(assert (=> b!154257 (= e!100798 (contains!969 Nil!1805 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!50615 (not res!72838)) b!154256))

(assert (= (and b!154256 res!72837) b!154257))

(assert (= (and b!154256 res!72839) b!154255))

(assert (= (and b!154255 c!29537) b!154258))

(assert (= (and b!154255 (not c!29537)) b!154254))

(assert (= (or b!154258 b!154254) bm!17162))

(assert (=> bm!17162 m!187941))

(declare-fun m!187973 () Bool)

(assert (=> bm!17162 m!187973))

(assert (=> b!154255 m!187941))

(assert (=> b!154255 m!187941))

(assert (=> b!154255 m!187943))

(assert (=> b!154256 m!187941))

(assert (=> b!154256 m!187941))

(assert (=> b!154256 m!187943))

(assert (=> b!154257 m!187941))

(assert (=> b!154257 m!187941))

(declare-fun m!187975 () Bool)

(assert (=> b!154257 m!187975))

(assert (=> b!154102 d!50615))

(declare-fun d!50617 () Bool)

(declare-fun e!100803 () Bool)

(assert (=> d!50617 e!100803))

(declare-fun res!72845 () Bool)

(assert (=> d!50617 (=> (not res!72845) (not e!100803))))

(declare-fun lt!80982 () ListLongMap!1817)

(assert (=> d!50617 (= res!72845 (contains!968 lt!80982 (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun lt!80983 () List!1807)

(assert (=> d!50617 (= lt!80982 (ListLongMap!1818 lt!80983))))

(declare-fun lt!80981 () Unit!4899)

(declare-fun lt!80984 () Unit!4899)

(assert (=> d!50617 (= lt!80981 lt!80984)))

(assert (=> d!50617 (= (getValueByKey!183 lt!80983 (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!96 (List!1807 (_ BitVec 64) V!3683) Unit!4899)

(assert (=> d!50617 (= lt!80984 (lemmaContainsTupThenGetReturnValue!96 lt!80983 (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun insertStrictlySorted!99 (List!1807 (_ BitVec 64) V!3683) List!1807)

(assert (=> d!50617 (= lt!80983 (insertStrictlySorted!99 (toList!924 call!17150) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50617 (= (+!192 call!17150 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80982)))

(declare-fun b!154263 () Bool)

(declare-fun res!72844 () Bool)

(assert (=> b!154263 (=> (not res!72844) (not e!100803))))

(assert (=> b!154263 (= res!72844 (= (getValueByKey!183 (toList!924 lt!80982) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154264 () Bool)

(declare-fun contains!970 (List!1807 tuple2!2830) Bool)

(assert (=> b!154264 (= e!100803 (contains!970 (toList!924 lt!80982) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(assert (= (and d!50617 res!72845) b!154263))

(assert (= (and b!154263 res!72844) b!154264))

(declare-fun m!187977 () Bool)

(assert (=> d!50617 m!187977))

(declare-fun m!187979 () Bool)

(assert (=> d!50617 m!187979))

(declare-fun m!187981 () Bool)

(assert (=> d!50617 m!187981))

(declare-fun m!187983 () Bool)

(assert (=> d!50617 m!187983))

(declare-fun m!187985 () Bool)

(assert (=> b!154263 m!187985))

(declare-fun m!187987 () Bool)

(assert (=> b!154264 m!187987))

(assert (=> b!154164 d!50617))

(declare-fun b!154265 () Bool)

(declare-fun res!72852 () Bool)

(declare-fun e!100812 () Bool)

(assert (=> b!154265 (=> (not res!72852) (not e!100812))))

(declare-fun e!100804 () Bool)

(assert (=> b!154265 (= res!72852 e!100804)))

(declare-fun c!29540 () Bool)

(assert (=> b!154265 (= c!29540 (not (= (bvand (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!154266 () Bool)

(declare-fun e!100808 () Bool)

(assert (=> b!154266 (= e!100808 (validKeyInArray!0 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154267 () Bool)

(declare-fun e!100806 () Bool)

(declare-fun lt!80995 () ListLongMap!1817)

(assert (=> b!154267 (= e!100806 (= (apply!128 lt!80995 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun b!154268 () Bool)

(declare-fun e!100809 () ListLongMap!1817)

(declare-fun e!100810 () ListLongMap!1817)

(assert (=> b!154268 (= e!100809 e!100810)))

(declare-fun c!29538 () Bool)

(assert (=> b!154268 (= c!29538 (and (not (= (bvand (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17163 () Bool)

(declare-fun call!17167 () ListLongMap!1817)

(declare-fun call!17172 () ListLongMap!1817)

(assert (=> bm!17163 (= call!17167 call!17172)))

(declare-fun b!154270 () Bool)

(declare-fun e!100813 () Bool)

(assert (=> b!154270 (= e!100813 (validKeyInArray!0 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154271 () Bool)

(declare-fun call!17168 () ListLongMap!1817)

(assert (=> b!154271 (= e!100810 call!17168)))

(declare-fun b!154272 () Bool)

(declare-fun res!72849 () Bool)

(assert (=> b!154272 (=> (not res!72849) (not e!100812))))

(declare-fun e!100805 () Bool)

(assert (=> b!154272 (= res!72849 e!100805)))

(declare-fun res!72853 () Bool)

(assert (=> b!154272 (=> res!72853 e!100805)))

(assert (=> b!154272 (= res!72853 (not e!100813))))

(declare-fun res!72846 () Bool)

(assert (=> b!154272 (=> (not res!72846) (not e!100813))))

(assert (=> b!154272 (= res!72846 (bvslt #b00000000000000000000000000000000 (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun b!154273 () Bool)

(declare-fun call!17170 () Bool)

(assert (=> b!154273 (= e!100804 (not call!17170))))

(declare-fun d!50619 () Bool)

(assert (=> d!50619 e!100812))

(declare-fun res!72848 () Bool)

(assert (=> d!50619 (=> (not res!72848) (not e!100812))))

(assert (=> d!50619 (= res!72848 (or (bvsge #b00000000000000000000000000000000 (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun lt!80998 () ListLongMap!1817)

(assert (=> d!50619 (= lt!80995 lt!80998)))

(declare-fun lt!80985 () Unit!4899)

(declare-fun e!100807 () Unit!4899)

(assert (=> d!50619 (= lt!80985 e!100807)))

(declare-fun c!29542 () Bool)

(assert (=> d!50619 (= c!29542 e!100808)))

(declare-fun res!72851 () Bool)

(assert (=> d!50619 (=> (not res!72851) (not e!100808))))

(assert (=> d!50619 (= res!72851 (bvslt #b00000000000000000000000000000000 (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(assert (=> d!50619 (= lt!80998 e!100809)))

(declare-fun c!29539 () Bool)

(assert (=> d!50619 (= c!29539 (and (not (= (bvand (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!50619 (validMask!0 (mask!7468 (v!3419 (underlying!526 thiss!992))))))

(assert (=> d!50619 (= (getCurrentListMap!588 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))) lt!80995)))

(declare-fun b!154269 () Bool)

(declare-fun e!100814 () ListLongMap!1817)

(assert (=> b!154269 (= e!100814 call!17168)))

(declare-fun b!154274 () Bool)

(declare-fun Unit!4905 () Unit!4899)

(assert (=> b!154274 (= e!100807 Unit!4905)))

(declare-fun b!154275 () Bool)

(declare-fun e!100811 () Bool)

(assert (=> b!154275 (= e!100804 e!100811)))

(declare-fun res!72850 () Bool)

(assert (=> b!154275 (= res!72850 call!17170)))

(assert (=> b!154275 (=> (not res!72850) (not e!100811))))

(declare-fun b!154276 () Bool)

(declare-fun e!100815 () Bool)

(assert (=> b!154276 (= e!100812 e!100815)))

(declare-fun c!29543 () Bool)

(assert (=> b!154276 (= c!29543 (not (= (bvand (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!154277 () Bool)

(assert (=> b!154277 (= e!100811 (= (apply!128 lt!80995 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun bm!17164 () Bool)

(declare-fun call!17169 () ListLongMap!1817)

(assert (=> bm!17164 (= call!17172 call!17169)))

(declare-fun b!154278 () Bool)

(assert (=> b!154278 (= e!100815 e!100806)))

(declare-fun res!72847 () Bool)

(declare-fun call!17171 () Bool)

(assert (=> b!154278 (= res!72847 call!17171)))

(assert (=> b!154278 (=> (not res!72847) (not e!100806))))

(declare-fun bm!17165 () Bool)

(assert (=> bm!17165 (= call!17171 (contains!968 lt!80995 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154279 () Bool)

(declare-fun e!100816 () Bool)

(assert (=> b!154279 (= e!100805 e!100816)))

(declare-fun res!72854 () Bool)

(assert (=> b!154279 (=> (not res!72854) (not e!100816))))

(assert (=> b!154279 (= res!72854 (contains!968 lt!80995 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> b!154279 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun b!154280 () Bool)

(declare-fun lt!80989 () Unit!4899)

(assert (=> b!154280 (= e!100807 lt!80989)))

(declare-fun lt!80988 () ListLongMap!1817)

(assert (=> b!154280 (= lt!80988 (getCurrentListMapNoExtraKeys!161 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun lt!80990 () (_ BitVec 64))

(assert (=> b!154280 (= lt!80990 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!81000 () (_ BitVec 64))

(assert (=> b!154280 (= lt!81000 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!80994 () Unit!4899)

(assert (=> b!154280 (= lt!80994 (addStillContains!104 lt!80988 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) lt!81000))))

(assert (=> b!154280 (contains!968 (+!192 lt!80988 (tuple2!2831 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!81000)))

(declare-fun lt!80986 () Unit!4899)

(assert (=> b!154280 (= lt!80986 lt!80994)))

(declare-fun lt!81003 () ListLongMap!1817)

(assert (=> b!154280 (= lt!81003 (getCurrentListMapNoExtraKeys!161 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun lt!81006 () (_ BitVec 64))

(assert (=> b!154280 (= lt!81006 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80999 () (_ BitVec 64))

(assert (=> b!154280 (= lt!80999 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!80992 () Unit!4899)

(assert (=> b!154280 (= lt!80992 (addApplyDifferent!104 lt!81003 lt!81006 (minValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80999))))

(assert (=> b!154280 (= (apply!128 (+!192 lt!81003 (tuple2!2831 lt!81006 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80999) (apply!128 lt!81003 lt!80999))))

(declare-fun lt!81004 () Unit!4899)

(assert (=> b!154280 (= lt!81004 lt!80992)))

(declare-fun lt!80996 () ListLongMap!1817)

(assert (=> b!154280 (= lt!80996 (getCurrentListMapNoExtraKeys!161 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun lt!80991 () (_ BitVec 64))

(assert (=> b!154280 (= lt!80991 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!81005 () (_ BitVec 64))

(assert (=> b!154280 (= lt!81005 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!80997 () Unit!4899)

(assert (=> b!154280 (= lt!80997 (addApplyDifferent!104 lt!80996 lt!80991 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) lt!81005))))

(assert (=> b!154280 (= (apply!128 (+!192 lt!80996 (tuple2!2831 lt!80991 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!81005) (apply!128 lt!80996 lt!81005))))

(declare-fun lt!81002 () Unit!4899)

(assert (=> b!154280 (= lt!81002 lt!80997)))

(declare-fun lt!81001 () ListLongMap!1817)

(assert (=> b!154280 (= lt!81001 (getCurrentListMapNoExtraKeys!161 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun lt!80993 () (_ BitVec 64))

(assert (=> b!154280 (= lt!80993 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80987 () (_ BitVec 64))

(assert (=> b!154280 (= lt!80987 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!154280 (= lt!80989 (addApplyDifferent!104 lt!81001 lt!80993 (minValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80987))))

(assert (=> b!154280 (= (apply!128 (+!192 lt!81001 (tuple2!2831 lt!80993 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80987) (apply!128 lt!81001 lt!80987))))

(declare-fun b!154281 () Bool)

(assert (=> b!154281 (= e!100815 (not call!17171))))

(declare-fun bm!17166 () Bool)

(declare-fun call!17166 () ListLongMap!1817)

(assert (=> bm!17166 (= call!17166 (+!192 (ite c!29539 call!17169 (ite c!29538 call!17172 call!17167)) (ite (or c!29539 c!29538) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154282 () Bool)

(assert (=> b!154282 (= e!100816 (= (apply!128 lt!80995 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)) (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!154282 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2689 (_values!3047 (v!3419 (underlying!526 thiss!992))))))))

(assert (=> b!154282 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun bm!17167 () Bool)

(assert (=> bm!17167 (= call!17168 call!17166)))

(declare-fun b!154283 () Bool)

(assert (=> b!154283 (= e!100814 call!17167)))

(declare-fun bm!17168 () Bool)

(assert (=> bm!17168 (= call!17170 (contains!968 lt!80995 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154284 () Bool)

(assert (=> b!154284 (= e!100809 (+!192 call!17166 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun bm!17169 () Bool)

(assert (=> bm!17169 (= call!17169 (getCurrentListMapNoExtraKeys!161 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun b!154285 () Bool)

(declare-fun c!29541 () Bool)

(assert (=> b!154285 (= c!29541 (and (not (= (bvand (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!154285 (= e!100810 e!100814)))

(assert (= (and d!50619 c!29539) b!154284))

(assert (= (and d!50619 (not c!29539)) b!154268))

(assert (= (and b!154268 c!29538) b!154271))

(assert (= (and b!154268 (not c!29538)) b!154285))

(assert (= (and b!154285 c!29541) b!154269))

(assert (= (and b!154285 (not c!29541)) b!154283))

(assert (= (or b!154269 b!154283) bm!17163))

(assert (= (or b!154271 bm!17163) bm!17164))

(assert (= (or b!154271 b!154269) bm!17167))

(assert (= (or b!154284 bm!17164) bm!17169))

(assert (= (or b!154284 bm!17167) bm!17166))

(assert (= (and d!50619 res!72851) b!154266))

(assert (= (and d!50619 c!29542) b!154280))

(assert (= (and d!50619 (not c!29542)) b!154274))

(assert (= (and d!50619 res!72848) b!154272))

(assert (= (and b!154272 res!72846) b!154270))

(assert (= (and b!154272 (not res!72853)) b!154279))

(assert (= (and b!154279 res!72854) b!154282))

(assert (= (and b!154272 res!72849) b!154265))

(assert (= (and b!154265 c!29540) b!154275))

(assert (= (and b!154265 (not c!29540)) b!154273))

(assert (= (and b!154275 res!72850) b!154277))

(assert (= (or b!154275 b!154273) bm!17168))

(assert (= (and b!154265 res!72852) b!154276))

(assert (= (and b!154276 c!29543) b!154278))

(assert (= (and b!154276 (not c!29543)) b!154281))

(assert (= (and b!154278 res!72847) b!154267))

(assert (= (or b!154278 b!154281) bm!17165))

(declare-fun b_lambda!6851 () Bool)

(assert (=> (not b_lambda!6851) (not b!154282)))

(assert (=> b!154282 t!6603))

(declare-fun b_and!9611 () Bool)

(assert (= b_and!9607 (and (=> t!6603 result!4489) b_and!9611)))

(assert (=> b!154282 t!6605))

(declare-fun b_and!9613 () Bool)

(assert (= b_and!9609 (and (=> t!6605 result!4493) b_and!9613)))

(assert (=> b!154282 m!187839))

(declare-fun m!187989 () Bool)

(assert (=> b!154282 m!187989))

(declare-fun m!187991 () Bool)

(assert (=> b!154282 m!187991))

(declare-fun m!187993 () Bool)

(assert (=> b!154282 m!187993))

(assert (=> b!154282 m!187839))

(declare-fun m!187995 () Bool)

(assert (=> b!154282 m!187995))

(assert (=> b!154282 m!187993))

(assert (=> b!154282 m!187989))

(assert (=> b!154279 m!187989))

(assert (=> b!154279 m!187989))

(declare-fun m!187997 () Bool)

(assert (=> b!154279 m!187997))

(declare-fun m!187999 () Bool)

(assert (=> bm!17168 m!187999))

(declare-fun m!188001 () Bool)

(assert (=> bm!17166 m!188001))

(declare-fun m!188003 () Bool)

(assert (=> b!154280 m!188003))

(declare-fun m!188005 () Bool)

(assert (=> b!154280 m!188005))

(declare-fun m!188007 () Bool)

(assert (=> b!154280 m!188007))

(declare-fun m!188009 () Bool)

(assert (=> b!154280 m!188009))

(declare-fun m!188011 () Bool)

(assert (=> b!154280 m!188011))

(declare-fun m!188013 () Bool)

(assert (=> b!154280 m!188013))

(assert (=> b!154280 m!188013))

(declare-fun m!188015 () Bool)

(assert (=> b!154280 m!188015))

(declare-fun m!188017 () Bool)

(assert (=> b!154280 m!188017))

(declare-fun m!188019 () Bool)

(assert (=> b!154280 m!188019))

(declare-fun m!188021 () Bool)

(assert (=> b!154280 m!188021))

(assert (=> b!154280 m!187989))

(declare-fun m!188023 () Bool)

(assert (=> b!154280 m!188023))

(assert (=> b!154280 m!188005))

(assert (=> b!154280 m!188009))

(declare-fun m!188025 () Bool)

(assert (=> b!154280 m!188025))

(declare-fun m!188027 () Bool)

(assert (=> b!154280 m!188027))

(declare-fun m!188029 () Bool)

(assert (=> b!154280 m!188029))

(declare-fun m!188031 () Bool)

(assert (=> b!154280 m!188031))

(assert (=> b!154280 m!188019))

(declare-fun m!188033 () Bool)

(assert (=> b!154280 m!188033))

(declare-fun m!188035 () Bool)

(assert (=> b!154277 m!188035))

(assert (=> bm!17169 m!188027))

(declare-fun m!188037 () Bool)

(assert (=> b!154284 m!188037))

(assert (=> b!154266 m!187989))

(assert (=> b!154266 m!187989))

(declare-fun m!188039 () Bool)

(assert (=> b!154266 m!188039))

(assert (=> d!50619 m!187893))

(declare-fun m!188041 () Bool)

(assert (=> bm!17165 m!188041))

(assert (=> b!154270 m!187989))

(assert (=> b!154270 m!187989))

(assert (=> b!154270 m!188039))

(declare-fun m!188043 () Bool)

(assert (=> b!154267 m!188043))

(assert (=> d!50595 d!50619))

(declare-fun d!50621 () Bool)

(declare-fun e!100817 () Bool)

(assert (=> d!50621 e!100817))

(declare-fun res!72856 () Bool)

(assert (=> d!50621 (=> (not res!72856) (not e!100817))))

(declare-fun lt!81008 () ListLongMap!1817)

(assert (=> d!50621 (= res!72856 (contains!968 lt!81008 (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun lt!81009 () List!1807)

(assert (=> d!50621 (= lt!81008 (ListLongMap!1818 lt!81009))))

(declare-fun lt!81007 () Unit!4899)

(declare-fun lt!81010 () Unit!4899)

(assert (=> d!50621 (= lt!81007 lt!81010)))

(assert (=> d!50621 (= (getValueByKey!183 lt!81009 (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))) (Some!188 (_2!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (=> d!50621 (= lt!81010 (lemmaContainsTupThenGetReturnValue!96 lt!81009 (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (_2!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (=> d!50621 (= lt!81009 (insertStrictlySorted!99 (toList!924 (ite c!29510 call!17153 (ite c!29509 call!17156 call!17151))) (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (_2!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (=> d!50621 (= (+!192 (ite c!29510 call!17153 (ite c!29509 call!17156 call!17151)) (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81008)))

(declare-fun b!154286 () Bool)

(declare-fun res!72855 () Bool)

(assert (=> b!154286 (=> (not res!72855) (not e!100817))))

(assert (=> b!154286 (= res!72855 (= (getValueByKey!183 (toList!924 lt!81008) (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))) (Some!188 (_2!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun b!154287 () Bool)

(assert (=> b!154287 (= e!100817 (contains!970 (toList!924 lt!81008) (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (= (and d!50621 res!72856) b!154286))

(assert (= (and b!154286 res!72855) b!154287))

(declare-fun m!188045 () Bool)

(assert (=> d!50621 m!188045))

(declare-fun m!188047 () Bool)

(assert (=> d!50621 m!188047))

(declare-fun m!188049 () Bool)

(assert (=> d!50621 m!188049))

(declare-fun m!188051 () Bool)

(assert (=> d!50621 m!188051))

(declare-fun m!188053 () Bool)

(assert (=> b!154286 m!188053))

(declare-fun m!188055 () Bool)

(assert (=> b!154287 m!188055))

(assert (=> bm!17150 d!50621))

(declare-fun d!50623 () Bool)

(assert (=> d!50623 (= (apply!128 lt!80911 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1609 (getValueByKey!183 (toList!924 lt!80911) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!6519 () Bool)

(assert (= bs!6519 d!50623))

(assert (=> bs!6519 m!187841))

(assert (=> bs!6519 m!187937))

(assert (=> bs!6519 m!187937))

(declare-fun m!188057 () Bool)

(assert (=> bs!6519 m!188057))

(assert (=> b!154162 d!50623))

(declare-fun d!50625 () Bool)

(declare-fun c!29546 () Bool)

(assert (=> d!50625 (= c!29546 ((_ is ValueCellFull!1170) (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!100820 () V!3683)

(assert (=> d!50625 (= (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!100820)))

(declare-fun b!154292 () Bool)

(declare-fun get!1610 (ValueCell!1170 V!3683) V!3683)

(assert (=> b!154292 (= e!100820 (get!1610 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154293 () Bool)

(declare-fun get!1611 (ValueCell!1170 V!3683) V!3683)

(assert (=> b!154293 (= e!100820 (get!1611 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50625 c!29546) b!154292))

(assert (= (and d!50625 (not c!29546)) b!154293))

(assert (=> b!154292 m!187845))

(assert (=> b!154292 m!187839))

(declare-fun m!188059 () Bool)

(assert (=> b!154292 m!188059))

(assert (=> b!154293 m!187845))

(assert (=> b!154293 m!187839))

(declare-fun m!188061 () Bool)

(assert (=> b!154293 m!188061))

(assert (=> b!154162 d!50625))

(declare-fun b!154294 () Bool)

(declare-fun res!72863 () Bool)

(declare-fun e!100829 () Bool)

(assert (=> b!154294 (=> (not res!72863) (not e!100829))))

(declare-fun e!100821 () Bool)

(assert (=> b!154294 (= res!72863 e!100821)))

(declare-fun c!29549 () Bool)

(assert (=> b!154294 (= c!29549 (not (= (bvand (extraKeys!2805 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!154295 () Bool)

(declare-fun e!100825 () Bool)

(assert (=> b!154295 (= e!100825 (validKeyInArray!0 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154296 () Bool)

(declare-fun e!100823 () Bool)

(declare-fun lt!81021 () ListLongMap!1817)

(assert (=> b!154296 (= e!100823 (= (apply!128 lt!81021 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2907 newMap!16)))))

(declare-fun b!154297 () Bool)

(declare-fun e!100826 () ListLongMap!1817)

(declare-fun e!100827 () ListLongMap!1817)

(assert (=> b!154297 (= e!100826 e!100827)))

(declare-fun c!29547 () Bool)

(assert (=> b!154297 (= c!29547 (and (not (= (bvand (extraKeys!2805 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2805 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17170 () Bool)

(declare-fun call!17174 () ListLongMap!1817)

(declare-fun call!17179 () ListLongMap!1817)

(assert (=> bm!17170 (= call!17174 call!17179)))

(declare-fun b!154299 () Bool)

(declare-fun e!100830 () Bool)

(assert (=> b!154299 (= e!100830 (validKeyInArray!0 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154300 () Bool)

(declare-fun call!17175 () ListLongMap!1817)

(assert (=> b!154300 (= e!100827 call!17175)))

(declare-fun b!154301 () Bool)

(declare-fun res!72860 () Bool)

(assert (=> b!154301 (=> (not res!72860) (not e!100829))))

(declare-fun e!100822 () Bool)

(assert (=> b!154301 (= res!72860 e!100822)))

(declare-fun res!72864 () Bool)

(assert (=> b!154301 (=> res!72864 e!100822)))

(assert (=> b!154301 (= res!72864 (not e!100830))))

(declare-fun res!72857 () Bool)

(assert (=> b!154301 (=> (not res!72857) (not e!100830))))

(assert (=> b!154301 (= res!72857 (bvslt #b00000000000000000000000000000000 (size!2688 (_keys!4837 newMap!16))))))

(declare-fun b!154302 () Bool)

(declare-fun call!17177 () Bool)

(assert (=> b!154302 (= e!100821 (not call!17177))))

(declare-fun d!50627 () Bool)

(assert (=> d!50627 e!100829))

(declare-fun res!72859 () Bool)

(assert (=> d!50627 (=> (not res!72859) (not e!100829))))

(assert (=> d!50627 (= res!72859 (or (bvsge #b00000000000000000000000000000000 (size!2688 (_keys!4837 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2688 (_keys!4837 newMap!16))))))))

(declare-fun lt!81024 () ListLongMap!1817)

(assert (=> d!50627 (= lt!81021 lt!81024)))

(declare-fun lt!81011 () Unit!4899)

(declare-fun e!100824 () Unit!4899)

(assert (=> d!50627 (= lt!81011 e!100824)))

(declare-fun c!29551 () Bool)

(assert (=> d!50627 (= c!29551 e!100825)))

(declare-fun res!72862 () Bool)

(assert (=> d!50627 (=> (not res!72862) (not e!100825))))

(assert (=> d!50627 (= res!72862 (bvslt #b00000000000000000000000000000000 (size!2688 (_keys!4837 newMap!16))))))

(assert (=> d!50627 (= lt!81024 e!100826)))

(declare-fun c!29548 () Bool)

(assert (=> d!50627 (= c!29548 (and (not (= (bvand (extraKeys!2805 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2805 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!50627 (validMask!0 (mask!7468 newMap!16))))

(assert (=> d!50627 (= (getCurrentListMap!588 (_keys!4837 newMap!16) (_values!3047 newMap!16) (mask!7468 newMap!16) (extraKeys!2805 newMap!16) (zeroValue!2907 newMap!16) (minValue!2907 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3064 newMap!16)) lt!81021)))

(declare-fun b!154298 () Bool)

(declare-fun e!100831 () ListLongMap!1817)

(assert (=> b!154298 (= e!100831 call!17175)))

(declare-fun b!154303 () Bool)

(declare-fun Unit!4906 () Unit!4899)

(assert (=> b!154303 (= e!100824 Unit!4906)))

(declare-fun b!154304 () Bool)

(declare-fun e!100828 () Bool)

(assert (=> b!154304 (= e!100821 e!100828)))

(declare-fun res!72861 () Bool)

(assert (=> b!154304 (= res!72861 call!17177)))

(assert (=> b!154304 (=> (not res!72861) (not e!100828))))

(declare-fun b!154305 () Bool)

(declare-fun e!100832 () Bool)

(assert (=> b!154305 (= e!100829 e!100832)))

(declare-fun c!29552 () Bool)

(assert (=> b!154305 (= c!29552 (not (= (bvand (extraKeys!2805 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!154306 () Bool)

(assert (=> b!154306 (= e!100828 (= (apply!128 lt!81021 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2907 newMap!16)))))

(declare-fun bm!17171 () Bool)

(declare-fun call!17176 () ListLongMap!1817)

(assert (=> bm!17171 (= call!17179 call!17176)))

(declare-fun b!154307 () Bool)

(assert (=> b!154307 (= e!100832 e!100823)))

(declare-fun res!72858 () Bool)

(declare-fun call!17178 () Bool)

(assert (=> b!154307 (= res!72858 call!17178)))

(assert (=> b!154307 (=> (not res!72858) (not e!100823))))

(declare-fun bm!17172 () Bool)

(assert (=> bm!17172 (= call!17178 (contains!968 lt!81021 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154308 () Bool)

(declare-fun e!100833 () Bool)

(assert (=> b!154308 (= e!100822 e!100833)))

(declare-fun res!72865 () Bool)

(assert (=> b!154308 (=> (not res!72865) (not e!100833))))

(assert (=> b!154308 (= res!72865 (contains!968 lt!81021 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!154308 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2688 (_keys!4837 newMap!16))))))

(declare-fun b!154309 () Bool)

(declare-fun lt!81015 () Unit!4899)

(assert (=> b!154309 (= e!100824 lt!81015)))

(declare-fun lt!81014 () ListLongMap!1817)

(assert (=> b!154309 (= lt!81014 (getCurrentListMapNoExtraKeys!161 (_keys!4837 newMap!16) (_values!3047 newMap!16) (mask!7468 newMap!16) (extraKeys!2805 newMap!16) (zeroValue!2907 newMap!16) (minValue!2907 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3064 newMap!16)))))

(declare-fun lt!81016 () (_ BitVec 64))

(assert (=> b!154309 (= lt!81016 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!81026 () (_ BitVec 64))

(assert (=> b!154309 (= lt!81026 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!81020 () Unit!4899)

(assert (=> b!154309 (= lt!81020 (addStillContains!104 lt!81014 lt!81016 (zeroValue!2907 newMap!16) lt!81026))))

(assert (=> b!154309 (contains!968 (+!192 lt!81014 (tuple2!2831 lt!81016 (zeroValue!2907 newMap!16))) lt!81026)))

(declare-fun lt!81012 () Unit!4899)

(assert (=> b!154309 (= lt!81012 lt!81020)))

(declare-fun lt!81029 () ListLongMap!1817)

(assert (=> b!154309 (= lt!81029 (getCurrentListMapNoExtraKeys!161 (_keys!4837 newMap!16) (_values!3047 newMap!16) (mask!7468 newMap!16) (extraKeys!2805 newMap!16) (zeroValue!2907 newMap!16) (minValue!2907 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3064 newMap!16)))))

(declare-fun lt!81032 () (_ BitVec 64))

(assert (=> b!154309 (= lt!81032 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!81025 () (_ BitVec 64))

(assert (=> b!154309 (= lt!81025 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!81018 () Unit!4899)

(assert (=> b!154309 (= lt!81018 (addApplyDifferent!104 lt!81029 lt!81032 (minValue!2907 newMap!16) lt!81025))))

(assert (=> b!154309 (= (apply!128 (+!192 lt!81029 (tuple2!2831 lt!81032 (minValue!2907 newMap!16))) lt!81025) (apply!128 lt!81029 lt!81025))))

(declare-fun lt!81030 () Unit!4899)

(assert (=> b!154309 (= lt!81030 lt!81018)))

(declare-fun lt!81022 () ListLongMap!1817)

(assert (=> b!154309 (= lt!81022 (getCurrentListMapNoExtraKeys!161 (_keys!4837 newMap!16) (_values!3047 newMap!16) (mask!7468 newMap!16) (extraKeys!2805 newMap!16) (zeroValue!2907 newMap!16) (minValue!2907 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3064 newMap!16)))))

(declare-fun lt!81017 () (_ BitVec 64))

(assert (=> b!154309 (= lt!81017 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!81031 () (_ BitVec 64))

(assert (=> b!154309 (= lt!81031 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!81023 () Unit!4899)

(assert (=> b!154309 (= lt!81023 (addApplyDifferent!104 lt!81022 lt!81017 (zeroValue!2907 newMap!16) lt!81031))))

(assert (=> b!154309 (= (apply!128 (+!192 lt!81022 (tuple2!2831 lt!81017 (zeroValue!2907 newMap!16))) lt!81031) (apply!128 lt!81022 lt!81031))))

(declare-fun lt!81028 () Unit!4899)

(assert (=> b!154309 (= lt!81028 lt!81023)))

(declare-fun lt!81027 () ListLongMap!1817)

(assert (=> b!154309 (= lt!81027 (getCurrentListMapNoExtraKeys!161 (_keys!4837 newMap!16) (_values!3047 newMap!16) (mask!7468 newMap!16) (extraKeys!2805 newMap!16) (zeroValue!2907 newMap!16) (minValue!2907 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3064 newMap!16)))))

(declare-fun lt!81019 () (_ BitVec 64))

(assert (=> b!154309 (= lt!81019 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!81013 () (_ BitVec 64))

(assert (=> b!154309 (= lt!81013 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!154309 (= lt!81015 (addApplyDifferent!104 lt!81027 lt!81019 (minValue!2907 newMap!16) lt!81013))))

(assert (=> b!154309 (= (apply!128 (+!192 lt!81027 (tuple2!2831 lt!81019 (minValue!2907 newMap!16))) lt!81013) (apply!128 lt!81027 lt!81013))))

(declare-fun b!154310 () Bool)

(assert (=> b!154310 (= e!100832 (not call!17178))))

(declare-fun bm!17173 () Bool)

(declare-fun call!17173 () ListLongMap!1817)

(assert (=> bm!17173 (= call!17173 (+!192 (ite c!29548 call!17176 (ite c!29547 call!17179 call!17174)) (ite (or c!29548 c!29547) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 newMap!16)) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16)))))))

(declare-fun b!154311 () Bool)

(assert (=> b!154311 (= e!100833 (= (apply!128 lt!81021 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)) (get!1608 (select (arr!2412 (_values!3047 newMap!16)) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3064 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!154311 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2689 (_values!3047 newMap!16))))))

(assert (=> b!154311 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2688 (_keys!4837 newMap!16))))))

(declare-fun bm!17174 () Bool)

(assert (=> bm!17174 (= call!17175 call!17173)))

(declare-fun b!154312 () Bool)

(assert (=> b!154312 (= e!100831 call!17174)))

(declare-fun bm!17175 () Bool)

(assert (=> bm!17175 (= call!17177 (contains!968 lt!81021 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154313 () Bool)

(assert (=> b!154313 (= e!100826 (+!192 call!17173 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16))))))

(declare-fun bm!17176 () Bool)

(assert (=> bm!17176 (= call!17176 (getCurrentListMapNoExtraKeys!161 (_keys!4837 newMap!16) (_values!3047 newMap!16) (mask!7468 newMap!16) (extraKeys!2805 newMap!16) (zeroValue!2907 newMap!16) (minValue!2907 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3064 newMap!16)))))

(declare-fun b!154314 () Bool)

(declare-fun c!29550 () Bool)

(assert (=> b!154314 (= c!29550 (and (not (= (bvand (extraKeys!2805 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2805 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!154314 (= e!100827 e!100831)))

(assert (= (and d!50627 c!29548) b!154313))

(assert (= (and d!50627 (not c!29548)) b!154297))

(assert (= (and b!154297 c!29547) b!154300))

(assert (= (and b!154297 (not c!29547)) b!154314))

(assert (= (and b!154314 c!29550) b!154298))

(assert (= (and b!154314 (not c!29550)) b!154312))

(assert (= (or b!154298 b!154312) bm!17170))

(assert (= (or b!154300 bm!17170) bm!17171))

(assert (= (or b!154300 b!154298) bm!17174))

(assert (= (or b!154313 bm!17171) bm!17176))

(assert (= (or b!154313 bm!17174) bm!17173))

(assert (= (and d!50627 res!72862) b!154295))

(assert (= (and d!50627 c!29551) b!154309))

(assert (= (and d!50627 (not c!29551)) b!154303))

(assert (= (and d!50627 res!72859) b!154301))

(assert (= (and b!154301 res!72857) b!154299))

(assert (= (and b!154301 (not res!72864)) b!154308))

(assert (= (and b!154308 res!72865) b!154311))

(assert (= (and b!154301 res!72860) b!154294))

(assert (= (and b!154294 c!29549) b!154304))

(assert (= (and b!154294 (not c!29549)) b!154302))

(assert (= (and b!154304 res!72861) b!154306))

(assert (= (or b!154304 b!154302) bm!17175))

(assert (= (and b!154294 res!72863) b!154305))

(assert (= (and b!154305 c!29552) b!154307))

(assert (= (and b!154305 (not c!29552)) b!154310))

(assert (= (and b!154307 res!72858) b!154296))

(assert (= (or b!154307 b!154310) bm!17172))

(declare-fun b_lambda!6853 () Bool)

(assert (=> (not b_lambda!6853) (not b!154311)))

(declare-fun t!6608 () Bool)

(declare-fun tb!2761 () Bool)

(assert (=> (and b!154039 (= (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) (defaultEntry!3064 newMap!16)) t!6608) tb!2761))

(declare-fun result!4497 () Bool)

(assert (=> tb!2761 (= result!4497 tp_is_empty!3027)))

(assert (=> b!154311 t!6608))

(declare-fun b_and!9615 () Bool)

(assert (= b_and!9611 (and (=> t!6608 result!4497) b_and!9615)))

(declare-fun t!6610 () Bool)

(declare-fun tb!2763 () Bool)

(assert (=> (and b!154038 (= (defaultEntry!3064 newMap!16) (defaultEntry!3064 newMap!16)) t!6610) tb!2763))

(declare-fun result!4499 () Bool)

(assert (= result!4499 result!4497))

(assert (=> b!154311 t!6610))

(declare-fun b_and!9617 () Bool)

(assert (= b_and!9613 (and (=> t!6610 result!4499) b_and!9617)))

(declare-fun m!188063 () Bool)

(assert (=> b!154311 m!188063))

(assert (=> b!154311 m!187941))

(declare-fun m!188065 () Bool)

(assert (=> b!154311 m!188065))

(declare-fun m!188067 () Bool)

(assert (=> b!154311 m!188067))

(assert (=> b!154311 m!188063))

(declare-fun m!188069 () Bool)

(assert (=> b!154311 m!188069))

(assert (=> b!154311 m!188067))

(assert (=> b!154311 m!187941))

(assert (=> b!154308 m!187941))

(assert (=> b!154308 m!187941))

(declare-fun m!188071 () Bool)

(assert (=> b!154308 m!188071))

(declare-fun m!188073 () Bool)

(assert (=> bm!17175 m!188073))

(declare-fun m!188075 () Bool)

(assert (=> bm!17173 m!188075))

(declare-fun m!188077 () Bool)

(assert (=> b!154309 m!188077))

(declare-fun m!188079 () Bool)

(assert (=> b!154309 m!188079))

(declare-fun m!188081 () Bool)

(assert (=> b!154309 m!188081))

(declare-fun m!188083 () Bool)

(assert (=> b!154309 m!188083))

(declare-fun m!188085 () Bool)

(assert (=> b!154309 m!188085))

(declare-fun m!188087 () Bool)

(assert (=> b!154309 m!188087))

(assert (=> b!154309 m!188087))

(declare-fun m!188089 () Bool)

(assert (=> b!154309 m!188089))

(declare-fun m!188091 () Bool)

(assert (=> b!154309 m!188091))

(declare-fun m!188093 () Bool)

(assert (=> b!154309 m!188093))

(declare-fun m!188095 () Bool)

(assert (=> b!154309 m!188095))

(assert (=> b!154309 m!187941))

(declare-fun m!188097 () Bool)

(assert (=> b!154309 m!188097))

(assert (=> b!154309 m!188079))

(assert (=> b!154309 m!188083))

(declare-fun m!188099 () Bool)

(assert (=> b!154309 m!188099))

(declare-fun m!188101 () Bool)

(assert (=> b!154309 m!188101))

(declare-fun m!188103 () Bool)

(assert (=> b!154309 m!188103))

(declare-fun m!188105 () Bool)

(assert (=> b!154309 m!188105))

(assert (=> b!154309 m!188093))

(declare-fun m!188107 () Bool)

(assert (=> b!154309 m!188107))

(declare-fun m!188109 () Bool)

(assert (=> b!154306 m!188109))

(assert (=> bm!17176 m!188101))

(declare-fun m!188111 () Bool)

(assert (=> b!154313 m!188111))

(assert (=> b!154295 m!187941))

(assert (=> b!154295 m!187941))

(assert (=> b!154295 m!187943))

(declare-fun m!188113 () Bool)

(assert (=> d!50627 m!188113))

(declare-fun m!188115 () Bool)

(assert (=> bm!17172 m!188115))

(assert (=> b!154299 m!187941))

(assert (=> b!154299 m!187941))

(assert (=> b!154299 m!187943))

(declare-fun m!188117 () Bool)

(assert (=> b!154296 m!188117))

(assert (=> d!50583 d!50627))

(declare-fun b!154323 () Bool)

(declare-fun res!72876 () Bool)

(declare-fun e!100836 () Bool)

(assert (=> b!154323 (=> (not res!72876) (not e!100836))))

(assert (=> b!154323 (= res!72876 (and (= (size!2689 (_values!3047 newMap!16)) (bvadd (mask!7468 newMap!16) #b00000000000000000000000000000001)) (= (size!2688 (_keys!4837 newMap!16)) (size!2689 (_values!3047 newMap!16))) (bvsge (_size!673 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!673 newMap!16) (bvadd (mask!7468 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!154324 () Bool)

(declare-fun res!72874 () Bool)

(assert (=> b!154324 (=> (not res!72874) (not e!100836))))

(declare-fun size!2692 (LongMapFixedSize!1248) (_ BitVec 32))

(assert (=> b!154324 (= res!72874 (bvsge (size!2692 newMap!16) (_size!673 newMap!16)))))

(declare-fun b!154326 () Bool)

(assert (=> b!154326 (= e!100836 (and (bvsge (extraKeys!2805 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2805 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!673 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!154325 () Bool)

(declare-fun res!72875 () Bool)

(assert (=> b!154325 (=> (not res!72875) (not e!100836))))

(assert (=> b!154325 (= res!72875 (= (size!2692 newMap!16) (bvadd (_size!673 newMap!16) (bvsdiv (bvadd (extraKeys!2805 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!50629 () Bool)

(declare-fun res!72877 () Bool)

(assert (=> d!50629 (=> (not res!72877) (not e!100836))))

(assert (=> d!50629 (= res!72877 (validMask!0 (mask!7468 newMap!16)))))

(assert (=> d!50629 (= (simpleValid!104 newMap!16) e!100836)))

(assert (= (and d!50629 res!72877) b!154323))

(assert (= (and b!154323 res!72876) b!154324))

(assert (= (and b!154324 res!72874) b!154325))

(assert (= (and b!154325 res!72875) b!154326))

(declare-fun m!188119 () Bool)

(assert (=> b!154324 m!188119))

(assert (=> b!154325 m!188119))

(assert (=> d!50629 m!188113))

(assert (=> d!50579 d!50629))

(assert (=> b!154146 d!50603))

(declare-fun b!154335 () Bool)

(declare-fun e!100842 () (_ BitVec 32))

(declare-fun e!100841 () (_ BitVec 32))

(assert (=> b!154335 (= e!100842 e!100841)))

(declare-fun c!29558 () Bool)

(assert (=> b!154335 (= c!29558 (validKeyInArray!0 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154336 () Bool)

(declare-fun call!17182 () (_ BitVec 32))

(assert (=> b!154336 (= e!100841 (bvadd #b00000000000000000000000000000001 call!17182))))

(declare-fun b!154337 () Bool)

(assert (=> b!154337 (= e!100842 #b00000000000000000000000000000000)))

(declare-fun d!50631 () Bool)

(declare-fun lt!81035 () (_ BitVec 32))

(assert (=> d!50631 (and (bvsge lt!81035 #b00000000000000000000000000000000) (bvsle lt!81035 (bvsub (size!2688 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!50631 (= lt!81035 e!100842)))

(declare-fun c!29557 () Bool)

(assert (=> d!50631 (= c!29557 (bvsge #b00000000000000000000000000000000 (size!2688 (_keys!4837 newMap!16))))))

(assert (=> d!50631 (and (bvsle #b00000000000000000000000000000000 (size!2688 (_keys!4837 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2688 (_keys!4837 newMap!16)) (size!2688 (_keys!4837 newMap!16))))))

(assert (=> d!50631 (= (arrayCountValidKeys!0 (_keys!4837 newMap!16) #b00000000000000000000000000000000 (size!2688 (_keys!4837 newMap!16))) lt!81035)))

(declare-fun b!154338 () Bool)

(assert (=> b!154338 (= e!100841 call!17182)))

(declare-fun bm!17179 () Bool)

(assert (=> bm!17179 (= call!17182 (arrayCountValidKeys!0 (_keys!4837 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2688 (_keys!4837 newMap!16))))))

(assert (= (and d!50631 c!29557) b!154337))

(assert (= (and d!50631 (not c!29557)) b!154335))

(assert (= (and b!154335 c!29558) b!154336))

(assert (= (and b!154335 (not c!29558)) b!154338))

(assert (= (or b!154336 b!154338) bm!17179))

(assert (=> b!154335 m!187941))

(assert (=> b!154335 m!187941))

(assert (=> b!154335 m!187943))

(declare-fun m!188121 () Bool)

(assert (=> bm!17179 m!188121))

(assert (=> b!154100 d!50631))

(declare-fun d!50633 () Bool)

(assert (=> d!50633 (= (apply!128 (+!192 lt!80917 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80903) (apply!128 lt!80917 lt!80903))))

(declare-fun lt!81038 () Unit!4899)

(declare-fun choose!917 (ListLongMap!1817 (_ BitVec 64) V!3683 (_ BitVec 64)) Unit!4899)

(assert (=> d!50633 (= lt!81038 (choose!917 lt!80917 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80903))))

(declare-fun e!100845 () Bool)

(assert (=> d!50633 e!100845))

(declare-fun res!72880 () Bool)

(assert (=> d!50633 (=> (not res!72880) (not e!100845))))

(assert (=> d!50633 (= res!72880 (contains!968 lt!80917 lt!80903))))

(assert (=> d!50633 (= (addApplyDifferent!104 lt!80917 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80903) lt!81038)))

(declare-fun b!154342 () Bool)

(assert (=> b!154342 (= e!100845 (not (= lt!80903 lt!80909)))))

(assert (= (and d!50633 res!72880) b!154342))

(assert (=> d!50633 m!187865))

(declare-fun m!188123 () Bool)

(assert (=> d!50633 m!188123))

(declare-fun m!188125 () Bool)

(assert (=> d!50633 m!188125))

(assert (=> d!50633 m!187865))

(assert (=> d!50633 m!187867))

(assert (=> d!50633 m!187881))

(assert (=> b!154160 d!50633))

(declare-fun d!50635 () Bool)

(assert (=> d!50635 (contains!968 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80916)))

(declare-fun lt!81041 () Unit!4899)

(declare-fun choose!918 (ListLongMap!1817 (_ BitVec 64) V!3683 (_ BitVec 64)) Unit!4899)

(assert (=> d!50635 (= lt!81041 (choose!918 lt!80904 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80916))))

(assert (=> d!50635 (contains!968 lt!80904 lt!80916)))

(assert (=> d!50635 (= (addStillContains!104 lt!80904 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80916) lt!81041)))

(declare-fun bs!6520 () Bool)

(assert (= bs!6520 d!50635))

(assert (=> bs!6520 m!187857))

(assert (=> bs!6520 m!187857))

(assert (=> bs!6520 m!187859))

(declare-fun m!188127 () Bool)

(assert (=> bs!6520 m!188127))

(declare-fun m!188129 () Bool)

(assert (=> bs!6520 m!188129))

(assert (=> b!154160 d!50635))

(declare-fun d!50637 () Bool)

(declare-fun e!100846 () Bool)

(assert (=> d!50637 e!100846))

(declare-fun res!72882 () Bool)

(assert (=> d!50637 (=> (not res!72882) (not e!100846))))

(declare-fun lt!81043 () ListLongMap!1817)

(assert (=> d!50637 (= res!72882 (contains!968 lt!81043 (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun lt!81044 () List!1807)

(assert (=> d!50637 (= lt!81043 (ListLongMap!1818 lt!81044))))

(declare-fun lt!81042 () Unit!4899)

(declare-fun lt!81045 () Unit!4899)

(assert (=> d!50637 (= lt!81042 lt!81045)))

(assert (=> d!50637 (= (getValueByKey!183 lt!81044 (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50637 (= lt!81045 (lemmaContainsTupThenGetReturnValue!96 lt!81044 (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50637 (= lt!81044 (insertStrictlySorted!99 (toList!924 lt!80917) (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50637 (= (+!192 lt!80917 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!81043)))

(declare-fun b!154344 () Bool)

(declare-fun res!72881 () Bool)

(assert (=> b!154344 (=> (not res!72881) (not e!100846))))

(assert (=> b!154344 (= res!72881 (= (getValueByKey!183 (toList!924 lt!81043) (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154345 () Bool)

(assert (=> b!154345 (= e!100846 (contains!970 (toList!924 lt!81043) (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(assert (= (and d!50637 res!72882) b!154344))

(assert (= (and b!154344 res!72881) b!154345))

(declare-fun m!188131 () Bool)

(assert (=> d!50637 m!188131))

(declare-fun m!188133 () Bool)

(assert (=> d!50637 m!188133))

(declare-fun m!188135 () Bool)

(assert (=> d!50637 m!188135))

(declare-fun m!188137 () Bool)

(assert (=> d!50637 m!188137))

(declare-fun m!188139 () Bool)

(assert (=> b!154344 m!188139))

(declare-fun m!188141 () Bool)

(assert (=> b!154345 m!188141))

(assert (=> b!154160 d!50637))

(assert (=> b!154160 d!50597))

(declare-fun d!50639 () Bool)

(declare-fun e!100847 () Bool)

(assert (=> d!50639 e!100847))

(declare-fun res!72883 () Bool)

(assert (=> d!50639 (=> res!72883 e!100847)))

(declare-fun lt!81046 () Bool)

(assert (=> d!50639 (= res!72883 (not lt!81046))))

(declare-fun lt!81049 () Bool)

(assert (=> d!50639 (= lt!81046 lt!81049)))

(declare-fun lt!81048 () Unit!4899)

(declare-fun e!100848 () Unit!4899)

(assert (=> d!50639 (= lt!81048 e!100848)))

(declare-fun c!29559 () Bool)

(assert (=> d!50639 (= c!29559 lt!81049)))

(assert (=> d!50639 (= lt!81049 (containsKey!187 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80916))))

(assert (=> d!50639 (= (contains!968 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80916) lt!81046)))

(declare-fun b!154346 () Bool)

(declare-fun lt!81047 () Unit!4899)

(assert (=> b!154346 (= e!100848 lt!81047)))

(assert (=> b!154346 (= lt!81047 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80916))))

(assert (=> b!154346 (isDefined!136 (getValueByKey!183 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80916))))

(declare-fun b!154347 () Bool)

(declare-fun Unit!4907 () Unit!4899)

(assert (=> b!154347 (= e!100848 Unit!4907)))

(declare-fun b!154348 () Bool)

(assert (=> b!154348 (= e!100847 (isDefined!136 (getValueByKey!183 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80916)))))

(assert (= (and d!50639 c!29559) b!154346))

(assert (= (and d!50639 (not c!29559)) b!154347))

(assert (= (and d!50639 (not res!72883)) b!154348))

(declare-fun m!188143 () Bool)

(assert (=> d!50639 m!188143))

(declare-fun m!188145 () Bool)

(assert (=> b!154346 m!188145))

(declare-fun m!188147 () Bool)

(assert (=> b!154346 m!188147))

(assert (=> b!154346 m!188147))

(declare-fun m!188149 () Bool)

(assert (=> b!154346 m!188149))

(assert (=> b!154348 m!188147))

(assert (=> b!154348 m!188147))

(assert (=> b!154348 m!188149))

(assert (=> b!154160 d!50639))

(declare-fun d!50641 () Bool)

(assert (=> d!50641 (= (apply!128 (+!192 lt!80919 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80915) (apply!128 lt!80919 lt!80915))))

(declare-fun lt!81050 () Unit!4899)

(assert (=> d!50641 (= lt!81050 (choose!917 lt!80919 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80915))))

(declare-fun e!100849 () Bool)

(assert (=> d!50641 e!100849))

(declare-fun res!72884 () Bool)

(assert (=> d!50641 (=> (not res!72884) (not e!100849))))

(assert (=> d!50641 (= res!72884 (contains!968 lt!80919 lt!80915))))

(assert (=> d!50641 (= (addApplyDifferent!104 lt!80919 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80915) lt!81050)))

(declare-fun b!154349 () Bool)

(assert (=> b!154349 (= e!100849 (not (= lt!80915 lt!80922)))))

(assert (= (and d!50641 res!72884) b!154349))

(assert (=> d!50641 m!187861))

(declare-fun m!188151 () Bool)

(assert (=> d!50641 m!188151))

(declare-fun m!188153 () Bool)

(assert (=> d!50641 m!188153))

(assert (=> d!50641 m!187861))

(assert (=> d!50641 m!187863))

(assert (=> d!50641 m!187877))

(assert (=> b!154160 d!50641))

(declare-fun d!50643 () Bool)

(assert (=> d!50643 (= (apply!128 lt!80919 lt!80915) (get!1609 (getValueByKey!183 (toList!924 lt!80919) lt!80915)))))

(declare-fun bs!6521 () Bool)

(assert (= bs!6521 d!50643))

(declare-fun m!188155 () Bool)

(assert (=> bs!6521 m!188155))

(assert (=> bs!6521 m!188155))

(declare-fun m!188157 () Bool)

(assert (=> bs!6521 m!188157))

(assert (=> b!154160 d!50643))

(declare-fun d!50645 () Bool)

(declare-fun e!100850 () Bool)

(assert (=> d!50645 e!100850))

(declare-fun res!72886 () Bool)

(assert (=> d!50645 (=> (not res!72886) (not e!100850))))

(declare-fun lt!81052 () ListLongMap!1817)

(assert (=> d!50645 (= res!72886 (contains!968 lt!81052 (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun lt!81053 () List!1807)

(assert (=> d!50645 (= lt!81052 (ListLongMap!1818 lt!81053))))

(declare-fun lt!81051 () Unit!4899)

(declare-fun lt!81054 () Unit!4899)

(assert (=> d!50645 (= lt!81051 lt!81054)))

(assert (=> d!50645 (= (getValueByKey!183 lt!81053 (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50645 (= lt!81054 (lemmaContainsTupThenGetReturnValue!96 lt!81053 (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50645 (= lt!81053 (insertStrictlySorted!99 (toList!924 lt!80919) (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50645 (= (+!192 lt!80919 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!81052)))

(declare-fun b!154350 () Bool)

(declare-fun res!72885 () Bool)

(assert (=> b!154350 (=> (not res!72885) (not e!100850))))

(assert (=> b!154350 (= res!72885 (= (getValueByKey!183 (toList!924 lt!81052) (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154351 () Bool)

(assert (=> b!154351 (= e!100850 (contains!970 (toList!924 lt!81052) (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(assert (= (and d!50645 res!72886) b!154350))

(assert (= (and b!154350 res!72885) b!154351))

(declare-fun m!188159 () Bool)

(assert (=> d!50645 m!188159))

(declare-fun m!188161 () Bool)

(assert (=> d!50645 m!188161))

(declare-fun m!188163 () Bool)

(assert (=> d!50645 m!188163))

(declare-fun m!188165 () Bool)

(assert (=> d!50645 m!188165))

(declare-fun m!188167 () Bool)

(assert (=> b!154350 m!188167))

(declare-fun m!188169 () Bool)

(assert (=> b!154351 m!188169))

(assert (=> b!154160 d!50645))

(declare-fun d!50647 () Bool)

(declare-fun e!100851 () Bool)

(assert (=> d!50647 e!100851))

(declare-fun res!72888 () Bool)

(assert (=> d!50647 (=> (not res!72888) (not e!100851))))

(declare-fun lt!81056 () ListLongMap!1817)

(assert (=> d!50647 (= res!72888 (contains!968 lt!81056 (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun lt!81057 () List!1807)

(assert (=> d!50647 (= lt!81056 (ListLongMap!1818 lt!81057))))

(declare-fun lt!81055 () Unit!4899)

(declare-fun lt!81058 () Unit!4899)

(assert (=> d!50647 (= lt!81055 lt!81058)))

(assert (=> d!50647 (= (getValueByKey!183 lt!81057 (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50647 (= lt!81058 (lemmaContainsTupThenGetReturnValue!96 lt!81057 (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50647 (= lt!81057 (insertStrictlySorted!99 (toList!924 lt!80912) (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50647 (= (+!192 lt!80912 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!81056)))

(declare-fun b!154352 () Bool)

(declare-fun res!72887 () Bool)

(assert (=> b!154352 (=> (not res!72887) (not e!100851))))

(assert (=> b!154352 (= res!72887 (= (getValueByKey!183 (toList!924 lt!81056) (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154353 () Bool)

(assert (=> b!154353 (= e!100851 (contains!970 (toList!924 lt!81056) (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(assert (= (and d!50647 res!72888) b!154352))

(assert (= (and b!154352 res!72887) b!154353))

(declare-fun m!188171 () Bool)

(assert (=> d!50647 m!188171))

(declare-fun m!188173 () Bool)

(assert (=> d!50647 m!188173))

(declare-fun m!188175 () Bool)

(assert (=> d!50647 m!188175))

(declare-fun m!188177 () Bool)

(assert (=> d!50647 m!188177))

(declare-fun m!188179 () Bool)

(assert (=> b!154352 m!188179))

(declare-fun m!188181 () Bool)

(assert (=> b!154353 m!188181))

(assert (=> b!154160 d!50647))

(declare-fun d!50649 () Bool)

(assert (=> d!50649 (= (apply!128 (+!192 lt!80919 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80915) (get!1609 (getValueByKey!183 (toList!924 (+!192 lt!80919 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80915)))))

(declare-fun bs!6522 () Bool)

(assert (= bs!6522 d!50649))

(declare-fun m!188183 () Bool)

(assert (=> bs!6522 m!188183))

(assert (=> bs!6522 m!188183))

(declare-fun m!188185 () Bool)

(assert (=> bs!6522 m!188185))

(assert (=> b!154160 d!50649))

(declare-fun d!50651 () Bool)

(assert (=> d!50651 (= (apply!128 lt!80912 lt!80921) (get!1609 (getValueByKey!183 (toList!924 lt!80912) lt!80921)))))

(declare-fun bs!6523 () Bool)

(assert (= bs!6523 d!50651))

(declare-fun m!188187 () Bool)

(assert (=> bs!6523 m!188187))

(assert (=> bs!6523 m!188187))

(declare-fun m!188189 () Bool)

(assert (=> bs!6523 m!188189))

(assert (=> b!154160 d!50651))

(declare-fun d!50653 () Bool)

(declare-fun e!100852 () Bool)

(assert (=> d!50653 e!100852))

(declare-fun res!72890 () Bool)

(assert (=> d!50653 (=> (not res!72890) (not e!100852))))

(declare-fun lt!81060 () ListLongMap!1817)

(assert (=> d!50653 (= res!72890 (contains!968 lt!81060 (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun lt!81061 () List!1807)

(assert (=> d!50653 (= lt!81060 (ListLongMap!1818 lt!81061))))

(declare-fun lt!81059 () Unit!4899)

(declare-fun lt!81062 () Unit!4899)

(assert (=> d!50653 (= lt!81059 lt!81062)))

(assert (=> d!50653 (= (getValueByKey!183 lt!81061 (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50653 (= lt!81062 (lemmaContainsTupThenGetReturnValue!96 lt!81061 (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50653 (= lt!81061 (insertStrictlySorted!99 (toList!924 lt!80904) (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50653 (= (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!81060)))

(declare-fun b!154354 () Bool)

(declare-fun res!72889 () Bool)

(assert (=> b!154354 (=> (not res!72889) (not e!100852))))

(assert (=> b!154354 (= res!72889 (= (getValueByKey!183 (toList!924 lt!81060) (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154355 () Bool)

(assert (=> b!154355 (= e!100852 (contains!970 (toList!924 lt!81060) (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(assert (= (and d!50653 res!72890) b!154354))

(assert (= (and b!154354 res!72889) b!154355))

(declare-fun m!188191 () Bool)

(assert (=> d!50653 m!188191))

(declare-fun m!188193 () Bool)

(assert (=> d!50653 m!188193))

(declare-fun m!188195 () Bool)

(assert (=> d!50653 m!188195))

(declare-fun m!188197 () Bool)

(assert (=> d!50653 m!188197))

(declare-fun m!188199 () Bool)

(assert (=> b!154354 m!188199))

(declare-fun m!188201 () Bool)

(assert (=> b!154355 m!188201))

(assert (=> b!154160 d!50653))

(declare-fun d!50655 () Bool)

(assert (=> d!50655 (= (apply!128 lt!80917 lt!80903) (get!1609 (getValueByKey!183 (toList!924 lt!80917) lt!80903)))))

(declare-fun bs!6524 () Bool)

(assert (= bs!6524 d!50655))

(declare-fun m!188203 () Bool)

(assert (=> bs!6524 m!188203))

(assert (=> bs!6524 m!188203))

(declare-fun m!188205 () Bool)

(assert (=> bs!6524 m!188205))

(assert (=> b!154160 d!50655))

(declare-fun d!50657 () Bool)

(assert (=> d!50657 (= (apply!128 (+!192 lt!80912 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80921) (get!1609 (getValueByKey!183 (toList!924 (+!192 lt!80912 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80921)))))

(declare-fun bs!6525 () Bool)

(assert (= bs!6525 d!50657))

(declare-fun m!188207 () Bool)

(assert (=> bs!6525 m!188207))

(assert (=> bs!6525 m!188207))

(declare-fun m!188209 () Bool)

(assert (=> bs!6525 m!188209))

(assert (=> b!154160 d!50657))

(declare-fun d!50659 () Bool)

(assert (=> d!50659 (= (apply!128 (+!192 lt!80917 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80903) (get!1609 (getValueByKey!183 (toList!924 (+!192 lt!80917 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80903)))))

(declare-fun bs!6526 () Bool)

(assert (= bs!6526 d!50659))

(declare-fun m!188211 () Bool)

(assert (=> bs!6526 m!188211))

(assert (=> bs!6526 m!188211))

(declare-fun m!188213 () Bool)

(assert (=> bs!6526 m!188213))

(assert (=> b!154160 d!50659))

(declare-fun d!50661 () Bool)

(assert (=> d!50661 (= (apply!128 (+!192 lt!80912 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80921) (apply!128 lt!80912 lt!80921))))

(declare-fun lt!81063 () Unit!4899)

(assert (=> d!50661 (= lt!81063 (choose!917 lt!80912 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80921))))

(declare-fun e!100853 () Bool)

(assert (=> d!50661 e!100853))

(declare-fun res!72891 () Bool)

(assert (=> d!50661 (=> (not res!72891) (not e!100853))))

(assert (=> d!50661 (= res!72891 (contains!968 lt!80912 lt!80921))))

(assert (=> d!50661 (= (addApplyDifferent!104 lt!80912 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80921) lt!81063)))

(declare-fun b!154356 () Bool)

(assert (=> b!154356 (= e!100853 (not (= lt!80921 lt!80907)))))

(assert (= (and d!50661 res!72891) b!154356))

(assert (=> d!50661 m!187871))

(declare-fun m!188215 () Bool)

(assert (=> d!50661 m!188215))

(declare-fun m!188217 () Bool)

(assert (=> d!50661 m!188217))

(assert (=> d!50661 m!187871))

(assert (=> d!50661 m!187885))

(assert (=> d!50661 m!187855))

(assert (=> b!154160 d!50661))

(declare-fun d!50663 () Bool)

(assert (=> d!50663 (= (validMask!0 (mask!7468 (v!3419 (underlying!526 thiss!992)))) (and (or (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000001111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000011111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000001111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000011111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000001111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000011111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000111111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000000000001111111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000000000011111111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000000000111111111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000000001111111111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000000011111111111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000000111111111111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000001111111111111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000011111111111111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000111111111111111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000001111111111111111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000011111111111111111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000111111111111111111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000001111111111111111111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000011111111111111111111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000111111111111111111111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00001111111111111111111111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00011111111111111111111111111111) (= (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!50585 d!50663))

(declare-fun condMapEmpty!5183 () Bool)

(declare-fun mapDefault!5183 () ValueCell!1170)

(assert (=> mapNonEmpty!5182 (= condMapEmpty!5183 (= mapRest!5182 ((as const (Array (_ BitVec 32) ValueCell!1170)) mapDefault!5183)))))

(declare-fun e!100855 () Bool)

(declare-fun mapRes!5183 () Bool)

(assert (=> mapNonEmpty!5182 (= tp!12202 (and e!100855 mapRes!5183))))

(declare-fun mapIsEmpty!5183 () Bool)

(assert (=> mapIsEmpty!5183 mapRes!5183))

(declare-fun b!154357 () Bool)

(declare-fun e!100854 () Bool)

(assert (=> b!154357 (= e!100854 tp_is_empty!3027)))

(declare-fun mapNonEmpty!5183 () Bool)

(declare-fun tp!12203 () Bool)

(assert (=> mapNonEmpty!5183 (= mapRes!5183 (and tp!12203 e!100854))))

(declare-fun mapValue!5183 () ValueCell!1170)

(declare-fun mapKey!5183 () (_ BitVec 32))

(declare-fun mapRest!5183 () (Array (_ BitVec 32) ValueCell!1170))

(assert (=> mapNonEmpty!5183 (= mapRest!5182 (store mapRest!5183 mapKey!5183 mapValue!5183))))

(declare-fun b!154358 () Bool)

(assert (=> b!154358 (= e!100855 tp_is_empty!3027)))

(assert (= (and mapNonEmpty!5182 condMapEmpty!5183) mapIsEmpty!5183))

(assert (= (and mapNonEmpty!5182 (not condMapEmpty!5183)) mapNonEmpty!5183))

(assert (= (and mapNonEmpty!5183 ((_ is ValueCellFull!1170) mapValue!5183)) b!154357))

(assert (= (and mapNonEmpty!5182 ((_ is ValueCellFull!1170) mapDefault!5183)) b!154358))

(declare-fun m!188219 () Bool)

(assert (=> mapNonEmpty!5183 m!188219))

(declare-fun condMapEmpty!5184 () Bool)

(declare-fun mapDefault!5184 () ValueCell!1170)

(assert (=> mapNonEmpty!5181 (= condMapEmpty!5184 (= mapRest!5181 ((as const (Array (_ BitVec 32) ValueCell!1170)) mapDefault!5184)))))

(declare-fun e!100857 () Bool)

(declare-fun mapRes!5184 () Bool)

(assert (=> mapNonEmpty!5181 (= tp!12201 (and e!100857 mapRes!5184))))

(declare-fun mapIsEmpty!5184 () Bool)

(assert (=> mapIsEmpty!5184 mapRes!5184))

(declare-fun b!154359 () Bool)

(declare-fun e!100856 () Bool)

(assert (=> b!154359 (= e!100856 tp_is_empty!3027)))

(declare-fun mapNonEmpty!5184 () Bool)

(declare-fun tp!12204 () Bool)

(assert (=> mapNonEmpty!5184 (= mapRes!5184 (and tp!12204 e!100856))))

(declare-fun mapRest!5184 () (Array (_ BitVec 32) ValueCell!1170))

(declare-fun mapKey!5184 () (_ BitVec 32))

(declare-fun mapValue!5184 () ValueCell!1170)

(assert (=> mapNonEmpty!5184 (= mapRest!5181 (store mapRest!5184 mapKey!5184 mapValue!5184))))

(declare-fun b!154360 () Bool)

(assert (=> b!154360 (= e!100857 tp_is_empty!3027)))

(assert (= (and mapNonEmpty!5181 condMapEmpty!5184) mapIsEmpty!5184))

(assert (= (and mapNonEmpty!5181 (not condMapEmpty!5184)) mapNonEmpty!5184))

(assert (= (and mapNonEmpty!5184 ((_ is ValueCellFull!1170) mapValue!5184)) b!154359))

(assert (= (and mapNonEmpty!5181 ((_ is ValueCellFull!1170) mapDefault!5184)) b!154360))

(declare-fun m!188221 () Bool)

(assert (=> mapNonEmpty!5184 m!188221))

(declare-fun b_lambda!6855 () Bool)

(assert (= b_lambda!6849 (or (and b!154039 b_free!3221) (and b!154038 b_free!3223 (= (defaultEntry!3064 newMap!16) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))))) b_lambda!6855)))

(declare-fun b_lambda!6857 () Bool)

(assert (= b_lambda!6851 (or (and b!154039 b_free!3221) (and b!154038 b_free!3223 (= (defaultEntry!3064 newMap!16) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))))) b_lambda!6857)))

(declare-fun b_lambda!6859 () Bool)

(assert (= b_lambda!6853 (or (and b!154039 b_free!3221 (= (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) (defaultEntry!3064 newMap!16))) (and b!154038 b_free!3223) b_lambda!6859)))

(declare-fun b_lambda!6861 () Bool)

(assert (= b_lambda!6847 (or (and b!154039 b_free!3221) (and b!154038 b_free!3223 (= (defaultEntry!3064 newMap!16) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))))) b_lambda!6861)))

(check-sat (not b!154296) (not d!50639) (not d!50653) (not b!154207) (not b!154266) b_and!9617 (not bm!17159) (not b!154204) (not b!154223) (not b!154308) (not b!154287) (not d!50617) (not b!154282) (not mapNonEmpty!5184) (not b!154351) (not d!50647) (not b!154222) (not b!154353) (not b!154225) (not d!50607) (not d!50623) (not d!50649) (not b!154355) (not d!50597) (not b!154256) (not b!154279) (not b!154311) (not b!154239) (not b!154280) (not b!154209) (not b!154284) (not b_lambda!6859) (not b!154350) (not b!154267) (not d!50619) (not bm!17156) (not b!154234) (not d!50611) (not b!154235) (not b!154346) (not b!154335) (not b!154324) (not b!154210) (not b!154352) (not b!154299) b_and!9615 (not b!154255) (not b!154264) (not b!154325) (not bm!17165) (not d!50635) (not bm!17175) (not bm!17162) (not b_next!3221) (not d!50599) (not bm!17168) (not b_lambda!6855) (not d!50609) (not b!154345) (not d!50651) (not d!50645) (not d!50637) (not b_lambda!6861) (not b!154211) (not b!154270) (not b_next!3223) (not b!154306) (not b!154205) (not b!154292) (not b!154203) (not b!154277) (not b_lambda!6857) (not d!50661) (not d!50613) (not bm!17172) (not b!154212) (not b!154257) (not b!154286) (not b!154295) (not b!154348) (not d!50643) (not d!50621) (not d!50601) (not d!50657) (not mapNonEmpty!5183) (not bm!17179) (not d!50629) (not bm!17173) (not b!154293) (not d!50655) (not bm!17176) (not b!154238) (not d!50627) (not bm!17169) (not b!154263) (not b!154241) (not d!50659) (not b!154240) (not d!50641) (not b!154344) (not bm!17166) (not b!154354) (not b!154220) (not d!50633) tp_is_empty!3027 (not b!154243) (not b!154309) (not b_lambda!6845) (not b!154313))
(check-sat b_and!9615 b_and!9617 (not b_next!3221) (not b_next!3223))
(get-model)

(declare-fun d!50665 () Bool)

(assert (=> d!50665 (= (validKeyInArray!0 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!154295 d!50665))

(declare-fun d!50667 () Bool)

(assert (=> d!50667 (= (size!2692 newMap!16) (bvadd (_size!673 newMap!16) (bvsdiv (bvadd (extraKeys!2805 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!154324 d!50667))

(declare-fun d!50669 () Bool)

(declare-fun e!100858 () Bool)

(assert (=> d!50669 e!100858))

(declare-fun res!72892 () Bool)

(assert (=> d!50669 (=> res!72892 e!100858)))

(declare-fun lt!81064 () Bool)

(assert (=> d!50669 (= res!72892 (not lt!81064))))

(declare-fun lt!81067 () Bool)

(assert (=> d!50669 (= lt!81064 lt!81067)))

(declare-fun lt!81066 () Unit!4899)

(declare-fun e!100859 () Unit!4899)

(assert (=> d!50669 (= lt!81066 e!100859)))

(declare-fun c!29560 () Bool)

(assert (=> d!50669 (= c!29560 lt!81067)))

(assert (=> d!50669 (= lt!81067 (containsKey!187 (toList!924 lt!81008) (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (=> d!50669 (= (contains!968 lt!81008 (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))) lt!81064)))

(declare-fun b!154361 () Bool)

(declare-fun lt!81065 () Unit!4899)

(assert (=> b!154361 (= e!100859 lt!81065)))

(assert (=> b!154361 (= lt!81065 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!81008) (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (=> b!154361 (isDefined!136 (getValueByKey!183 (toList!924 lt!81008) (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154362 () Bool)

(declare-fun Unit!4908 () Unit!4899)

(assert (=> b!154362 (= e!100859 Unit!4908)))

(declare-fun b!154363 () Bool)

(assert (=> b!154363 (= e!100858 (isDefined!136 (getValueByKey!183 (toList!924 lt!81008) (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(assert (= (and d!50669 c!29560) b!154361))

(assert (= (and d!50669 (not c!29560)) b!154362))

(assert (= (and d!50669 (not res!72892)) b!154363))

(declare-fun m!188223 () Bool)

(assert (=> d!50669 m!188223))

(declare-fun m!188225 () Bool)

(assert (=> b!154361 m!188225))

(assert (=> b!154361 m!188053))

(assert (=> b!154361 m!188053))

(declare-fun m!188227 () Bool)

(assert (=> b!154361 m!188227))

(assert (=> b!154363 m!188053))

(assert (=> b!154363 m!188053))

(assert (=> b!154363 m!188227))

(assert (=> d!50621 d!50669))

(declare-fun d!50671 () Bool)

(declare-fun c!29565 () Bool)

(assert (=> d!50671 (= c!29565 (and ((_ is Cons!1803) lt!81009) (= (_1!1426 (h!2412 lt!81009)) (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun e!100864 () Option!189)

(assert (=> d!50671 (= (getValueByKey!183 lt!81009 (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))) e!100864)))

(declare-fun b!154373 () Bool)

(declare-fun e!100865 () Option!189)

(assert (=> b!154373 (= e!100864 e!100865)))

(declare-fun c!29566 () Bool)

(assert (=> b!154373 (= c!29566 (and ((_ is Cons!1803) lt!81009) (not (= (_1!1426 (h!2412 lt!81009)) (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))))

(declare-fun b!154374 () Bool)

(assert (=> b!154374 (= e!100865 (getValueByKey!183 (t!6601 lt!81009) (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154372 () Bool)

(assert (=> b!154372 (= e!100864 (Some!188 (_2!1426 (h!2412 lt!81009))))))

(declare-fun b!154375 () Bool)

(assert (=> b!154375 (= e!100865 None!187)))

(assert (= (and d!50671 c!29565) b!154372))

(assert (= (and d!50671 (not c!29565)) b!154373))

(assert (= (and b!154373 c!29566) b!154374))

(assert (= (and b!154373 (not c!29566)) b!154375))

(declare-fun m!188229 () Bool)

(assert (=> b!154374 m!188229))

(assert (=> d!50621 d!50671))

(declare-fun d!50673 () Bool)

(assert (=> d!50673 (= (getValueByKey!183 lt!81009 (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))) (Some!188 (_2!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun lt!81070 () Unit!4899)

(declare-fun choose!919 (List!1807 (_ BitVec 64) V!3683) Unit!4899)

(assert (=> d!50673 (= lt!81070 (choose!919 lt!81009 (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (_2!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun e!100868 () Bool)

(assert (=> d!50673 e!100868))

(declare-fun res!72897 () Bool)

(assert (=> d!50673 (=> (not res!72897) (not e!100868))))

(declare-fun isStrictlySorted!330 (List!1807) Bool)

(assert (=> d!50673 (= res!72897 (isStrictlySorted!330 lt!81009))))

(assert (=> d!50673 (= (lemmaContainsTupThenGetReturnValue!96 lt!81009 (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (_2!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))) lt!81070)))

(declare-fun b!154380 () Bool)

(declare-fun res!72898 () Bool)

(assert (=> b!154380 (=> (not res!72898) (not e!100868))))

(assert (=> b!154380 (= res!72898 (containsKey!187 lt!81009 (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154381 () Bool)

(assert (=> b!154381 (= e!100868 (contains!970 lt!81009 (tuple2!2831 (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (_2!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(assert (= (and d!50673 res!72897) b!154380))

(assert (= (and b!154380 res!72898) b!154381))

(assert (=> d!50673 m!188047))

(declare-fun m!188231 () Bool)

(assert (=> d!50673 m!188231))

(declare-fun m!188233 () Bool)

(assert (=> d!50673 m!188233))

(declare-fun m!188235 () Bool)

(assert (=> b!154380 m!188235))

(declare-fun m!188237 () Bool)

(assert (=> b!154381 m!188237))

(assert (=> d!50621 d!50673))

(declare-fun d!50675 () Bool)

(declare-fun e!100882 () Bool)

(assert (=> d!50675 e!100882))

(declare-fun res!72904 () Bool)

(assert (=> d!50675 (=> (not res!72904) (not e!100882))))

(declare-fun lt!81073 () List!1807)

(assert (=> d!50675 (= res!72904 (isStrictlySorted!330 lt!81073))))

(declare-fun e!100883 () List!1807)

(assert (=> d!50675 (= lt!81073 e!100883)))

(declare-fun c!29578 () Bool)

(assert (=> d!50675 (= c!29578 (and ((_ is Cons!1803) (toList!924 (ite c!29510 call!17153 (ite c!29509 call!17156 call!17151)))) (bvslt (_1!1426 (h!2412 (toList!924 (ite c!29510 call!17153 (ite c!29509 call!17156 call!17151))))) (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(assert (=> d!50675 (isStrictlySorted!330 (toList!924 (ite c!29510 call!17153 (ite c!29509 call!17156 call!17151))))))

(assert (=> d!50675 (= (insertStrictlySorted!99 (toList!924 (ite c!29510 call!17153 (ite c!29509 call!17156 call!17151))) (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (_2!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))) lt!81073)))

(declare-fun b!154402 () Bool)

(declare-fun e!100880 () List!1807)

(declare-fun call!17189 () List!1807)

(assert (=> b!154402 (= e!100880 call!17189)))

(declare-fun b!154403 () Bool)

(declare-fun e!100881 () List!1807)

(assert (=> b!154403 (= e!100883 e!100881)))

(declare-fun c!29575 () Bool)

(assert (=> b!154403 (= c!29575 (and ((_ is Cons!1803) (toList!924 (ite c!29510 call!17153 (ite c!29509 call!17156 call!17151)))) (= (_1!1426 (h!2412 (toList!924 (ite c!29510 call!17153 (ite c!29509 call!17156 call!17151))))) (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun e!100879 () List!1807)

(declare-fun b!154404 () Bool)

(declare-fun c!29577 () Bool)

(assert (=> b!154404 (= e!100879 (ite c!29575 (t!6601 (toList!924 (ite c!29510 call!17153 (ite c!29509 call!17156 call!17151)))) (ite c!29577 (Cons!1803 (h!2412 (toList!924 (ite c!29510 call!17153 (ite c!29509 call!17156 call!17151)))) (t!6601 (toList!924 (ite c!29510 call!17153 (ite c!29509 call!17156 call!17151))))) Nil!1804)))))

(declare-fun bm!17186 () Bool)

(declare-fun call!17191 () List!1807)

(declare-fun $colon$colon!96 (List!1807 tuple2!2830) List!1807)

(assert (=> bm!17186 (= call!17191 ($colon$colon!96 e!100879 (ite c!29578 (h!2412 (toList!924 (ite c!29510 call!17153 (ite c!29509 call!17156 call!17151)))) (tuple2!2831 (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (_2!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))))

(declare-fun c!29576 () Bool)

(assert (=> bm!17186 (= c!29576 c!29578)))

(declare-fun b!154405 () Bool)

(assert (=> b!154405 (= e!100883 call!17191)))

(declare-fun bm!17187 () Bool)

(declare-fun call!17190 () List!1807)

(assert (=> bm!17187 (= call!17190 call!17191)))

(declare-fun b!154406 () Bool)

(declare-fun res!72903 () Bool)

(assert (=> b!154406 (=> (not res!72903) (not e!100882))))

(assert (=> b!154406 (= res!72903 (containsKey!187 lt!81073 (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154407 () Bool)

(assert (=> b!154407 (= e!100882 (contains!970 lt!81073 (tuple2!2831 (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (_2!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun b!154408 () Bool)

(assert (=> b!154408 (= e!100881 call!17190)))

(declare-fun bm!17188 () Bool)

(assert (=> bm!17188 (= call!17189 call!17190)))

(declare-fun b!154409 () Bool)

(assert (=> b!154409 (= c!29577 (and ((_ is Cons!1803) (toList!924 (ite c!29510 call!17153 (ite c!29509 call!17156 call!17151)))) (bvsgt (_1!1426 (h!2412 (toList!924 (ite c!29510 call!17153 (ite c!29509 call!17156 call!17151))))) (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(assert (=> b!154409 (= e!100881 e!100880)))

(declare-fun b!154410 () Bool)

(assert (=> b!154410 (= e!100879 (insertStrictlySorted!99 (t!6601 (toList!924 (ite c!29510 call!17153 (ite c!29509 call!17156 call!17151)))) (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (_2!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154411 () Bool)

(assert (=> b!154411 (= e!100880 call!17189)))

(assert (= (and d!50675 c!29578) b!154405))

(assert (= (and d!50675 (not c!29578)) b!154403))

(assert (= (and b!154403 c!29575) b!154408))

(assert (= (and b!154403 (not c!29575)) b!154409))

(assert (= (and b!154409 c!29577) b!154411))

(assert (= (and b!154409 (not c!29577)) b!154402))

(assert (= (or b!154411 b!154402) bm!17188))

(assert (= (or b!154408 bm!17188) bm!17187))

(assert (= (or b!154405 bm!17187) bm!17186))

(assert (= (and bm!17186 c!29576) b!154410))

(assert (= (and bm!17186 (not c!29576)) b!154404))

(assert (= (and d!50675 res!72904) b!154406))

(assert (= (and b!154406 res!72903) b!154407))

(declare-fun m!188239 () Bool)

(assert (=> b!154410 m!188239))

(declare-fun m!188241 () Bool)

(assert (=> d!50675 m!188241))

(declare-fun m!188243 () Bool)

(assert (=> d!50675 m!188243))

(declare-fun m!188245 () Bool)

(assert (=> b!154407 m!188245))

(declare-fun m!188247 () Bool)

(assert (=> b!154406 m!188247))

(declare-fun m!188249 () Bool)

(assert (=> bm!17186 m!188249))

(assert (=> d!50621 d!50675))

(declare-fun b!154412 () Bool)

(declare-fun e!100886 () Bool)

(declare-fun e!100885 () Bool)

(assert (=> b!154412 (= e!100886 e!100885)))

(declare-fun c!29579 () Bool)

(assert (=> b!154412 (= c!29579 (validKeyInArray!0 (select (arr!2411 (_keys!4837 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!154413 () Bool)

(declare-fun e!100884 () Bool)

(assert (=> b!154413 (= e!100885 e!100884)))

(declare-fun lt!81074 () (_ BitVec 64))

(assert (=> b!154413 (= lt!81074 (select (arr!2411 (_keys!4837 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!81075 () Unit!4899)

(assert (=> b!154413 (= lt!81075 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4837 newMap!16) lt!81074 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!154413 (arrayContainsKey!0 (_keys!4837 newMap!16) lt!81074 #b00000000000000000000000000000000)))

(declare-fun lt!81076 () Unit!4899)

(assert (=> b!154413 (= lt!81076 lt!81075)))

(declare-fun res!72906 () Bool)

(assert (=> b!154413 (= res!72906 (= (seekEntryOrOpen!0 (select (arr!2411 (_keys!4837 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4837 newMap!16) (mask!7468 newMap!16)) (Found!286 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!154413 (=> (not res!72906) (not e!100884))))

(declare-fun b!154414 () Bool)

(declare-fun call!17192 () Bool)

(assert (=> b!154414 (= e!100884 call!17192)))

(declare-fun b!154415 () Bool)

(assert (=> b!154415 (= e!100885 call!17192)))

(declare-fun d!50677 () Bool)

(declare-fun res!72905 () Bool)

(assert (=> d!50677 (=> res!72905 e!100886)))

(assert (=> d!50677 (= res!72905 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2688 (_keys!4837 newMap!16))))))

(assert (=> d!50677 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4837 newMap!16) (mask!7468 newMap!16)) e!100886)))

(declare-fun bm!17189 () Bool)

(assert (=> bm!17189 (= call!17192 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4837 newMap!16) (mask!7468 newMap!16)))))

(assert (= (and d!50677 (not res!72905)) b!154412))

(assert (= (and b!154412 c!29579) b!154413))

(assert (= (and b!154412 (not c!29579)) b!154415))

(assert (= (and b!154413 res!72906) b!154414))

(assert (= (or b!154414 b!154415) bm!17189))

(declare-fun m!188251 () Bool)

(assert (=> b!154412 m!188251))

(assert (=> b!154412 m!188251))

(declare-fun m!188253 () Bool)

(assert (=> b!154412 m!188253))

(assert (=> b!154413 m!188251))

(declare-fun m!188255 () Bool)

(assert (=> b!154413 m!188255))

(declare-fun m!188257 () Bool)

(assert (=> b!154413 m!188257))

(assert (=> b!154413 m!188251))

(declare-fun m!188259 () Bool)

(assert (=> b!154413 m!188259))

(declare-fun m!188261 () Bool)

(assert (=> bm!17189 m!188261))

(assert (=> bm!17159 d!50677))

(declare-fun d!50679 () Bool)

(declare-fun e!100887 () Bool)

(assert (=> d!50679 e!100887))

(declare-fun res!72907 () Bool)

(assert (=> d!50679 (=> res!72907 e!100887)))

(declare-fun lt!81077 () Bool)

(assert (=> d!50679 (= res!72907 (not lt!81077))))

(declare-fun lt!81080 () Bool)

(assert (=> d!50679 (= lt!81077 lt!81080)))

(declare-fun lt!81079 () Unit!4899)

(declare-fun e!100888 () Unit!4899)

(assert (=> d!50679 (= lt!81079 e!100888)))

(declare-fun c!29580 () Bool)

(assert (=> d!50679 (= c!29580 lt!81080)))

(assert (=> d!50679 (= lt!81080 (containsKey!187 (toList!924 lt!80995) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50679 (= (contains!968 lt!80995 #b0000000000000000000000000000000000000000000000000000000000000000) lt!81077)))

(declare-fun b!154416 () Bool)

(declare-fun lt!81078 () Unit!4899)

(assert (=> b!154416 (= e!100888 lt!81078)))

(assert (=> b!154416 (= lt!81078 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!80995) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154416 (isDefined!136 (getValueByKey!183 (toList!924 lt!80995) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154417 () Bool)

(declare-fun Unit!4909 () Unit!4899)

(assert (=> b!154417 (= e!100888 Unit!4909)))

(declare-fun b!154418 () Bool)

(assert (=> b!154418 (= e!100887 (isDefined!136 (getValueByKey!183 (toList!924 lt!80995) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50679 c!29580) b!154416))

(assert (= (and d!50679 (not c!29580)) b!154417))

(assert (= (and d!50679 (not res!72907)) b!154418))

(declare-fun m!188263 () Bool)

(assert (=> d!50679 m!188263))

(declare-fun m!188265 () Bool)

(assert (=> b!154416 m!188265))

(declare-fun m!188267 () Bool)

(assert (=> b!154416 m!188267))

(assert (=> b!154416 m!188267))

(declare-fun m!188269 () Bool)

(assert (=> b!154416 m!188269))

(assert (=> b!154418 m!188267))

(assert (=> b!154418 m!188267))

(assert (=> b!154418 m!188269))

(assert (=> bm!17168 d!50679))

(declare-fun d!50681 () Bool)

(assert (=> d!50681 (= (apply!128 lt!81022 lt!81031) (get!1609 (getValueByKey!183 (toList!924 lt!81022) lt!81031)))))

(declare-fun bs!6527 () Bool)

(assert (= bs!6527 d!50681))

(declare-fun m!188271 () Bool)

(assert (=> bs!6527 m!188271))

(assert (=> bs!6527 m!188271))

(declare-fun m!188273 () Bool)

(assert (=> bs!6527 m!188273))

(assert (=> b!154309 d!50681))

(declare-fun d!50683 () Bool)

(declare-fun e!100889 () Bool)

(assert (=> d!50683 e!100889))

(declare-fun res!72909 () Bool)

(assert (=> d!50683 (=> (not res!72909) (not e!100889))))

(declare-fun lt!81082 () ListLongMap!1817)

(assert (=> d!50683 (= res!72909 (contains!968 lt!81082 (_1!1426 (tuple2!2831 lt!81019 (minValue!2907 newMap!16)))))))

(declare-fun lt!81083 () List!1807)

(assert (=> d!50683 (= lt!81082 (ListLongMap!1818 lt!81083))))

(declare-fun lt!81081 () Unit!4899)

(declare-fun lt!81084 () Unit!4899)

(assert (=> d!50683 (= lt!81081 lt!81084)))

(assert (=> d!50683 (= (getValueByKey!183 lt!81083 (_1!1426 (tuple2!2831 lt!81019 (minValue!2907 newMap!16)))) (Some!188 (_2!1426 (tuple2!2831 lt!81019 (minValue!2907 newMap!16)))))))

(assert (=> d!50683 (= lt!81084 (lemmaContainsTupThenGetReturnValue!96 lt!81083 (_1!1426 (tuple2!2831 lt!81019 (minValue!2907 newMap!16))) (_2!1426 (tuple2!2831 lt!81019 (minValue!2907 newMap!16)))))))

(assert (=> d!50683 (= lt!81083 (insertStrictlySorted!99 (toList!924 lt!81027) (_1!1426 (tuple2!2831 lt!81019 (minValue!2907 newMap!16))) (_2!1426 (tuple2!2831 lt!81019 (minValue!2907 newMap!16)))))))

(assert (=> d!50683 (= (+!192 lt!81027 (tuple2!2831 lt!81019 (minValue!2907 newMap!16))) lt!81082)))

(declare-fun b!154419 () Bool)

(declare-fun res!72908 () Bool)

(assert (=> b!154419 (=> (not res!72908) (not e!100889))))

(assert (=> b!154419 (= res!72908 (= (getValueByKey!183 (toList!924 lt!81082) (_1!1426 (tuple2!2831 lt!81019 (minValue!2907 newMap!16)))) (Some!188 (_2!1426 (tuple2!2831 lt!81019 (minValue!2907 newMap!16))))))))

(declare-fun b!154420 () Bool)

(assert (=> b!154420 (= e!100889 (contains!970 (toList!924 lt!81082) (tuple2!2831 lt!81019 (minValue!2907 newMap!16))))))

(assert (= (and d!50683 res!72909) b!154419))

(assert (= (and b!154419 res!72908) b!154420))

(declare-fun m!188275 () Bool)

(assert (=> d!50683 m!188275))

(declare-fun m!188277 () Bool)

(assert (=> d!50683 m!188277))

(declare-fun m!188279 () Bool)

(assert (=> d!50683 m!188279))

(declare-fun m!188281 () Bool)

(assert (=> d!50683 m!188281))

(declare-fun m!188283 () Bool)

(assert (=> b!154419 m!188283))

(declare-fun m!188285 () Bool)

(assert (=> b!154420 m!188285))

(assert (=> b!154309 d!50683))

(declare-fun d!50685 () Bool)

(assert (=> d!50685 (= (apply!128 (+!192 lt!81029 (tuple2!2831 lt!81032 (minValue!2907 newMap!16))) lt!81025) (get!1609 (getValueByKey!183 (toList!924 (+!192 lt!81029 (tuple2!2831 lt!81032 (minValue!2907 newMap!16)))) lt!81025)))))

(declare-fun bs!6528 () Bool)

(assert (= bs!6528 d!50685))

(declare-fun m!188287 () Bool)

(assert (=> bs!6528 m!188287))

(assert (=> bs!6528 m!188287))

(declare-fun m!188289 () Bool)

(assert (=> bs!6528 m!188289))

(assert (=> b!154309 d!50685))

(declare-fun d!50687 () Bool)

(declare-fun e!100890 () Bool)

(assert (=> d!50687 e!100890))

(declare-fun res!72911 () Bool)

(assert (=> d!50687 (=> (not res!72911) (not e!100890))))

(declare-fun lt!81086 () ListLongMap!1817)

(assert (=> d!50687 (= res!72911 (contains!968 lt!81086 (_1!1426 (tuple2!2831 lt!81032 (minValue!2907 newMap!16)))))))

(declare-fun lt!81087 () List!1807)

(assert (=> d!50687 (= lt!81086 (ListLongMap!1818 lt!81087))))

(declare-fun lt!81085 () Unit!4899)

(declare-fun lt!81088 () Unit!4899)

(assert (=> d!50687 (= lt!81085 lt!81088)))

(assert (=> d!50687 (= (getValueByKey!183 lt!81087 (_1!1426 (tuple2!2831 lt!81032 (minValue!2907 newMap!16)))) (Some!188 (_2!1426 (tuple2!2831 lt!81032 (minValue!2907 newMap!16)))))))

(assert (=> d!50687 (= lt!81088 (lemmaContainsTupThenGetReturnValue!96 lt!81087 (_1!1426 (tuple2!2831 lt!81032 (minValue!2907 newMap!16))) (_2!1426 (tuple2!2831 lt!81032 (minValue!2907 newMap!16)))))))

(assert (=> d!50687 (= lt!81087 (insertStrictlySorted!99 (toList!924 lt!81029) (_1!1426 (tuple2!2831 lt!81032 (minValue!2907 newMap!16))) (_2!1426 (tuple2!2831 lt!81032 (minValue!2907 newMap!16)))))))

(assert (=> d!50687 (= (+!192 lt!81029 (tuple2!2831 lt!81032 (minValue!2907 newMap!16))) lt!81086)))

(declare-fun b!154421 () Bool)

(declare-fun res!72910 () Bool)

(assert (=> b!154421 (=> (not res!72910) (not e!100890))))

(assert (=> b!154421 (= res!72910 (= (getValueByKey!183 (toList!924 lt!81086) (_1!1426 (tuple2!2831 lt!81032 (minValue!2907 newMap!16)))) (Some!188 (_2!1426 (tuple2!2831 lt!81032 (minValue!2907 newMap!16))))))))

(declare-fun b!154422 () Bool)

(assert (=> b!154422 (= e!100890 (contains!970 (toList!924 lt!81086) (tuple2!2831 lt!81032 (minValue!2907 newMap!16))))))

(assert (= (and d!50687 res!72911) b!154421))

(assert (= (and b!154421 res!72910) b!154422))

(declare-fun m!188291 () Bool)

(assert (=> d!50687 m!188291))

(declare-fun m!188293 () Bool)

(assert (=> d!50687 m!188293))

(declare-fun m!188295 () Bool)

(assert (=> d!50687 m!188295))

(declare-fun m!188297 () Bool)

(assert (=> d!50687 m!188297))

(declare-fun m!188299 () Bool)

(assert (=> b!154421 m!188299))

(declare-fun m!188301 () Bool)

(assert (=> b!154422 m!188301))

(assert (=> b!154309 d!50687))

(declare-fun d!50689 () Bool)

(assert (=> d!50689 (contains!968 (+!192 lt!81014 (tuple2!2831 lt!81016 (zeroValue!2907 newMap!16))) lt!81026)))

(declare-fun lt!81089 () Unit!4899)

(assert (=> d!50689 (= lt!81089 (choose!918 lt!81014 lt!81016 (zeroValue!2907 newMap!16) lt!81026))))

(assert (=> d!50689 (contains!968 lt!81014 lt!81026)))

(assert (=> d!50689 (= (addStillContains!104 lt!81014 lt!81016 (zeroValue!2907 newMap!16) lt!81026) lt!81089)))

(declare-fun bs!6529 () Bool)

(assert (= bs!6529 d!50689))

(assert (=> bs!6529 m!188079))

(assert (=> bs!6529 m!188079))

(assert (=> bs!6529 m!188081))

(declare-fun m!188303 () Bool)

(assert (=> bs!6529 m!188303))

(declare-fun m!188305 () Bool)

(assert (=> bs!6529 m!188305))

(assert (=> b!154309 d!50689))

(declare-fun d!50691 () Bool)

(assert (=> d!50691 (= (apply!128 lt!81029 lt!81025) (get!1609 (getValueByKey!183 (toList!924 lt!81029) lt!81025)))))

(declare-fun bs!6530 () Bool)

(assert (= bs!6530 d!50691))

(declare-fun m!188307 () Bool)

(assert (=> bs!6530 m!188307))

(assert (=> bs!6530 m!188307))

(declare-fun m!188309 () Bool)

(assert (=> bs!6530 m!188309))

(assert (=> b!154309 d!50691))

(declare-fun d!50693 () Bool)

(assert (=> d!50693 (= (apply!128 (+!192 lt!81022 (tuple2!2831 lt!81017 (zeroValue!2907 newMap!16))) lt!81031) (apply!128 lt!81022 lt!81031))))

(declare-fun lt!81090 () Unit!4899)

(assert (=> d!50693 (= lt!81090 (choose!917 lt!81022 lt!81017 (zeroValue!2907 newMap!16) lt!81031))))

(declare-fun e!100891 () Bool)

(assert (=> d!50693 e!100891))

(declare-fun res!72912 () Bool)

(assert (=> d!50693 (=> (not res!72912) (not e!100891))))

(assert (=> d!50693 (= res!72912 (contains!968 lt!81022 lt!81031))))

(assert (=> d!50693 (= (addApplyDifferent!104 lt!81022 lt!81017 (zeroValue!2907 newMap!16) lt!81031) lt!81090)))

(declare-fun b!154423 () Bool)

(assert (=> b!154423 (= e!100891 (not (= lt!81031 lt!81017)))))

(assert (= (and d!50693 res!72912) b!154423))

(assert (=> d!50693 m!188093))

(declare-fun m!188311 () Bool)

(assert (=> d!50693 m!188311))

(declare-fun m!188313 () Bool)

(assert (=> d!50693 m!188313))

(assert (=> d!50693 m!188093))

(assert (=> d!50693 m!188107))

(assert (=> d!50693 m!188077))

(assert (=> b!154309 d!50693))

(declare-fun d!50695 () Bool)

(assert (=> d!50695 (= (apply!128 (+!192 lt!81029 (tuple2!2831 lt!81032 (minValue!2907 newMap!16))) lt!81025) (apply!128 lt!81029 lt!81025))))

(declare-fun lt!81091 () Unit!4899)

(assert (=> d!50695 (= lt!81091 (choose!917 lt!81029 lt!81032 (minValue!2907 newMap!16) lt!81025))))

(declare-fun e!100892 () Bool)

(assert (=> d!50695 e!100892))

(declare-fun res!72913 () Bool)

(assert (=> d!50695 (=> (not res!72913) (not e!100892))))

(assert (=> d!50695 (= res!72913 (contains!968 lt!81029 lt!81025))))

(assert (=> d!50695 (= (addApplyDifferent!104 lt!81029 lt!81032 (minValue!2907 newMap!16) lt!81025) lt!81091)))

(declare-fun b!154424 () Bool)

(assert (=> b!154424 (= e!100892 (not (= lt!81025 lt!81032)))))

(assert (= (and d!50695 res!72913) b!154424))

(assert (=> d!50695 m!188083))

(declare-fun m!188315 () Bool)

(assert (=> d!50695 m!188315))

(declare-fun m!188317 () Bool)

(assert (=> d!50695 m!188317))

(assert (=> d!50695 m!188083))

(assert (=> d!50695 m!188085))

(assert (=> d!50695 m!188099))

(assert (=> b!154309 d!50695))

(declare-fun d!50697 () Bool)

(assert (=> d!50697 (= (apply!128 (+!192 lt!81027 (tuple2!2831 lt!81019 (minValue!2907 newMap!16))) lt!81013) (apply!128 lt!81027 lt!81013))))

(declare-fun lt!81092 () Unit!4899)

(assert (=> d!50697 (= lt!81092 (choose!917 lt!81027 lt!81019 (minValue!2907 newMap!16) lt!81013))))

(declare-fun e!100893 () Bool)

(assert (=> d!50697 e!100893))

(declare-fun res!72914 () Bool)

(assert (=> d!50697 (=> (not res!72914) (not e!100893))))

(assert (=> d!50697 (= res!72914 (contains!968 lt!81027 lt!81013))))

(assert (=> d!50697 (= (addApplyDifferent!104 lt!81027 lt!81019 (minValue!2907 newMap!16) lt!81013) lt!81092)))

(declare-fun b!154425 () Bool)

(assert (=> b!154425 (= e!100893 (not (= lt!81013 lt!81019)))))

(assert (= (and d!50697 res!72914) b!154425))

(assert (=> d!50697 m!188087))

(declare-fun m!188319 () Bool)

(assert (=> d!50697 m!188319))

(declare-fun m!188321 () Bool)

(assert (=> d!50697 m!188321))

(assert (=> d!50697 m!188087))

(assert (=> d!50697 m!188089))

(assert (=> d!50697 m!188103))

(assert (=> b!154309 d!50697))

(declare-fun bm!17190 () Bool)

(declare-fun call!17193 () ListLongMap!1817)

(assert (=> bm!17190 (= call!17193 (getCurrentListMapNoExtraKeys!161 (_keys!4837 newMap!16) (_values!3047 newMap!16) (mask!7468 newMap!16) (extraKeys!2805 newMap!16) (zeroValue!2907 newMap!16) (minValue!2907 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3064 newMap!16)))))

(declare-fun d!50699 () Bool)

(declare-fun e!100894 () Bool)

(assert (=> d!50699 e!100894))

(declare-fun res!72916 () Bool)

(assert (=> d!50699 (=> (not res!72916) (not e!100894))))

(declare-fun lt!81097 () ListLongMap!1817)

(assert (=> d!50699 (= res!72916 (not (contains!968 lt!81097 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!100896 () ListLongMap!1817)

(assert (=> d!50699 (= lt!81097 e!100896)))

(declare-fun c!29583 () Bool)

(assert (=> d!50699 (= c!29583 (bvsge #b00000000000000000000000000000000 (size!2688 (_keys!4837 newMap!16))))))

(assert (=> d!50699 (validMask!0 (mask!7468 newMap!16))))

(assert (=> d!50699 (= (getCurrentListMapNoExtraKeys!161 (_keys!4837 newMap!16) (_values!3047 newMap!16) (mask!7468 newMap!16) (extraKeys!2805 newMap!16) (zeroValue!2907 newMap!16) (minValue!2907 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3064 newMap!16)) lt!81097)))

(declare-fun b!154426 () Bool)

(declare-fun e!100895 () Bool)

(declare-fun e!100897 () Bool)

(assert (=> b!154426 (= e!100895 e!100897)))

(declare-fun c!29582 () Bool)

(assert (=> b!154426 (= c!29582 (bvslt #b00000000000000000000000000000000 (size!2688 (_keys!4837 newMap!16))))))

(declare-fun b!154427 () Bool)

(declare-fun e!100898 () ListLongMap!1817)

(assert (=> b!154427 (= e!100896 e!100898)))

(declare-fun c!29584 () Bool)

(assert (=> b!154427 (= c!29584 (validKeyInArray!0 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154428 () Bool)

(declare-fun e!100900 () Bool)

(assert (=> b!154428 (= e!100895 e!100900)))

(assert (=> b!154428 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2688 (_keys!4837 newMap!16))))))

(declare-fun res!72917 () Bool)

(assert (=> b!154428 (= res!72917 (contains!968 lt!81097 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!154428 (=> (not res!72917) (not e!100900))))

(declare-fun b!154429 () Bool)

(assert (=> b!154429 (= e!100897 (= lt!81097 (getCurrentListMapNoExtraKeys!161 (_keys!4837 newMap!16) (_values!3047 newMap!16) (mask!7468 newMap!16) (extraKeys!2805 newMap!16) (zeroValue!2907 newMap!16) (minValue!2907 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3064 newMap!16))))))

(declare-fun b!154430 () Bool)

(assert (=> b!154430 (= e!100896 (ListLongMap!1818 Nil!1804))))

(declare-fun b!154431 () Bool)

(assert (=> b!154431 (= e!100897 (isEmpty!430 lt!81097))))

(declare-fun b!154432 () Bool)

(assert (=> b!154432 (= e!100894 e!100895)))

(declare-fun c!29581 () Bool)

(declare-fun e!100899 () Bool)

(assert (=> b!154432 (= c!29581 e!100899)))

(declare-fun res!72918 () Bool)

(assert (=> b!154432 (=> (not res!72918) (not e!100899))))

(assert (=> b!154432 (= res!72918 (bvslt #b00000000000000000000000000000000 (size!2688 (_keys!4837 newMap!16))))))

(declare-fun b!154433 () Bool)

(assert (=> b!154433 (= e!100899 (validKeyInArray!0 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!154433 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!154434 () Bool)

(declare-fun lt!81099 () Unit!4899)

(declare-fun lt!81095 () Unit!4899)

(assert (=> b!154434 (= lt!81099 lt!81095)))

(declare-fun lt!81096 () ListLongMap!1817)

(declare-fun lt!81093 () (_ BitVec 64))

(declare-fun lt!81094 () (_ BitVec 64))

(declare-fun lt!81098 () V!3683)

(assert (=> b!154434 (not (contains!968 (+!192 lt!81096 (tuple2!2831 lt!81093 lt!81098)) lt!81094))))

(assert (=> b!154434 (= lt!81095 (addStillNotContains!70 lt!81096 lt!81093 lt!81098 lt!81094))))

(assert (=> b!154434 (= lt!81094 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!154434 (= lt!81098 (get!1608 (select (arr!2412 (_values!3047 newMap!16)) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3064 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!154434 (= lt!81093 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!154434 (= lt!81096 call!17193)))

(assert (=> b!154434 (= e!100898 (+!192 call!17193 (tuple2!2831 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000) (get!1608 (select (arr!2412 (_values!3047 newMap!16)) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3064 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!154435 () Bool)

(declare-fun res!72915 () Bool)

(assert (=> b!154435 (=> (not res!72915) (not e!100894))))

(assert (=> b!154435 (= res!72915 (not (contains!968 lt!81097 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154436 () Bool)

(assert (=> b!154436 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2688 (_keys!4837 newMap!16))))))

(assert (=> b!154436 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2689 (_values!3047 newMap!16))))))

(assert (=> b!154436 (= e!100900 (= (apply!128 lt!81097 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)) (get!1608 (select (arr!2412 (_values!3047 newMap!16)) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3064 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!154437 () Bool)

(assert (=> b!154437 (= e!100898 call!17193)))

(assert (= (and d!50699 c!29583) b!154430))

(assert (= (and d!50699 (not c!29583)) b!154427))

(assert (= (and b!154427 c!29584) b!154434))

(assert (= (and b!154427 (not c!29584)) b!154437))

(assert (= (or b!154434 b!154437) bm!17190))

(assert (= (and d!50699 res!72916) b!154435))

(assert (= (and b!154435 res!72915) b!154432))

(assert (= (and b!154432 res!72918) b!154433))

(assert (= (and b!154432 c!29581) b!154428))

(assert (= (and b!154432 (not c!29581)) b!154426))

(assert (= (and b!154428 res!72917) b!154436))

(assert (= (and b!154426 c!29582) b!154429))

(assert (= (and b!154426 (not c!29582)) b!154431))

(declare-fun b_lambda!6863 () Bool)

(assert (=> (not b_lambda!6863) (not b!154434)))

(assert (=> b!154434 t!6608))

(declare-fun b_and!9619 () Bool)

(assert (= b_and!9615 (and (=> t!6608 result!4497) b_and!9619)))

(assert (=> b!154434 t!6610))

(declare-fun b_and!9621 () Bool)

(assert (= b_and!9617 (and (=> t!6610 result!4499) b_and!9621)))

(declare-fun b_lambda!6865 () Bool)

(assert (=> (not b_lambda!6865) (not b!154436)))

(assert (=> b!154436 t!6608))

(declare-fun b_and!9623 () Bool)

(assert (= b_and!9619 (and (=> t!6608 result!4497) b_and!9623)))

(assert (=> b!154436 t!6610))

(declare-fun b_and!9625 () Bool)

(assert (= b_and!9621 (and (=> t!6610 result!4499) b_and!9625)))

(assert (=> b!154427 m!187941))

(assert (=> b!154427 m!187941))

(assert (=> b!154427 m!187943))

(declare-fun m!188323 () Bool)

(assert (=> b!154431 m!188323))

(assert (=> b!154436 m!188063))

(assert (=> b!154436 m!187941))

(declare-fun m!188325 () Bool)

(assert (=> b!154436 m!188325))

(assert (=> b!154436 m!187941))

(assert (=> b!154436 m!188067))

(assert (=> b!154436 m!188063))

(assert (=> b!154436 m!188069))

(assert (=> b!154436 m!188067))

(declare-fun m!188327 () Bool)

(assert (=> b!154435 m!188327))

(assert (=> b!154433 m!187941))

(assert (=> b!154433 m!187941))

(assert (=> b!154433 m!187943))

(assert (=> b!154428 m!187941))

(assert (=> b!154428 m!187941))

(declare-fun m!188329 () Bool)

(assert (=> b!154428 m!188329))

(declare-fun m!188331 () Bool)

(assert (=> d!50699 m!188331))

(assert (=> d!50699 m!188113))

(declare-fun m!188333 () Bool)

(assert (=> bm!17190 m!188333))

(assert (=> b!154429 m!188333))

(declare-fun m!188335 () Bool)

(assert (=> b!154434 m!188335))

(assert (=> b!154434 m!188063))

(assert (=> b!154434 m!188067))

(assert (=> b!154434 m!188063))

(assert (=> b!154434 m!188069))

(assert (=> b!154434 m!188067))

(assert (=> b!154434 m!188335))

(declare-fun m!188337 () Bool)

(assert (=> b!154434 m!188337))

(assert (=> b!154434 m!187941))

(declare-fun m!188339 () Bool)

(assert (=> b!154434 m!188339))

(declare-fun m!188341 () Bool)

(assert (=> b!154434 m!188341))

(assert (=> b!154309 d!50699))

(declare-fun d!50701 () Bool)

(assert (=> d!50701 (= (apply!128 lt!81027 lt!81013) (get!1609 (getValueByKey!183 (toList!924 lt!81027) lt!81013)))))

(declare-fun bs!6531 () Bool)

(assert (= bs!6531 d!50701))

(declare-fun m!188343 () Bool)

(assert (=> bs!6531 m!188343))

(assert (=> bs!6531 m!188343))

(declare-fun m!188345 () Bool)

(assert (=> bs!6531 m!188345))

(assert (=> b!154309 d!50701))

(declare-fun d!50703 () Bool)

(declare-fun e!100901 () Bool)

(assert (=> d!50703 e!100901))

(declare-fun res!72920 () Bool)

(assert (=> d!50703 (=> (not res!72920) (not e!100901))))

(declare-fun lt!81101 () ListLongMap!1817)

(assert (=> d!50703 (= res!72920 (contains!968 lt!81101 (_1!1426 (tuple2!2831 lt!81017 (zeroValue!2907 newMap!16)))))))

(declare-fun lt!81102 () List!1807)

(assert (=> d!50703 (= lt!81101 (ListLongMap!1818 lt!81102))))

(declare-fun lt!81100 () Unit!4899)

(declare-fun lt!81103 () Unit!4899)

(assert (=> d!50703 (= lt!81100 lt!81103)))

(assert (=> d!50703 (= (getValueByKey!183 lt!81102 (_1!1426 (tuple2!2831 lt!81017 (zeroValue!2907 newMap!16)))) (Some!188 (_2!1426 (tuple2!2831 lt!81017 (zeroValue!2907 newMap!16)))))))

(assert (=> d!50703 (= lt!81103 (lemmaContainsTupThenGetReturnValue!96 lt!81102 (_1!1426 (tuple2!2831 lt!81017 (zeroValue!2907 newMap!16))) (_2!1426 (tuple2!2831 lt!81017 (zeroValue!2907 newMap!16)))))))

(assert (=> d!50703 (= lt!81102 (insertStrictlySorted!99 (toList!924 lt!81022) (_1!1426 (tuple2!2831 lt!81017 (zeroValue!2907 newMap!16))) (_2!1426 (tuple2!2831 lt!81017 (zeroValue!2907 newMap!16)))))))

(assert (=> d!50703 (= (+!192 lt!81022 (tuple2!2831 lt!81017 (zeroValue!2907 newMap!16))) lt!81101)))

(declare-fun b!154438 () Bool)

(declare-fun res!72919 () Bool)

(assert (=> b!154438 (=> (not res!72919) (not e!100901))))

(assert (=> b!154438 (= res!72919 (= (getValueByKey!183 (toList!924 lt!81101) (_1!1426 (tuple2!2831 lt!81017 (zeroValue!2907 newMap!16)))) (Some!188 (_2!1426 (tuple2!2831 lt!81017 (zeroValue!2907 newMap!16))))))))

(declare-fun b!154439 () Bool)

(assert (=> b!154439 (= e!100901 (contains!970 (toList!924 lt!81101) (tuple2!2831 lt!81017 (zeroValue!2907 newMap!16))))))

(assert (= (and d!50703 res!72920) b!154438))

(assert (= (and b!154438 res!72919) b!154439))

(declare-fun m!188347 () Bool)

(assert (=> d!50703 m!188347))

(declare-fun m!188349 () Bool)

(assert (=> d!50703 m!188349))

(declare-fun m!188351 () Bool)

(assert (=> d!50703 m!188351))

(declare-fun m!188353 () Bool)

(assert (=> d!50703 m!188353))

(declare-fun m!188355 () Bool)

(assert (=> b!154438 m!188355))

(declare-fun m!188357 () Bool)

(assert (=> b!154439 m!188357))

(assert (=> b!154309 d!50703))

(declare-fun d!50705 () Bool)

(declare-fun e!100902 () Bool)

(assert (=> d!50705 e!100902))

(declare-fun res!72922 () Bool)

(assert (=> d!50705 (=> (not res!72922) (not e!100902))))

(declare-fun lt!81105 () ListLongMap!1817)

(assert (=> d!50705 (= res!72922 (contains!968 lt!81105 (_1!1426 (tuple2!2831 lt!81016 (zeroValue!2907 newMap!16)))))))

(declare-fun lt!81106 () List!1807)

(assert (=> d!50705 (= lt!81105 (ListLongMap!1818 lt!81106))))

(declare-fun lt!81104 () Unit!4899)

(declare-fun lt!81107 () Unit!4899)

(assert (=> d!50705 (= lt!81104 lt!81107)))

(assert (=> d!50705 (= (getValueByKey!183 lt!81106 (_1!1426 (tuple2!2831 lt!81016 (zeroValue!2907 newMap!16)))) (Some!188 (_2!1426 (tuple2!2831 lt!81016 (zeroValue!2907 newMap!16)))))))

(assert (=> d!50705 (= lt!81107 (lemmaContainsTupThenGetReturnValue!96 lt!81106 (_1!1426 (tuple2!2831 lt!81016 (zeroValue!2907 newMap!16))) (_2!1426 (tuple2!2831 lt!81016 (zeroValue!2907 newMap!16)))))))

(assert (=> d!50705 (= lt!81106 (insertStrictlySorted!99 (toList!924 lt!81014) (_1!1426 (tuple2!2831 lt!81016 (zeroValue!2907 newMap!16))) (_2!1426 (tuple2!2831 lt!81016 (zeroValue!2907 newMap!16)))))))

(assert (=> d!50705 (= (+!192 lt!81014 (tuple2!2831 lt!81016 (zeroValue!2907 newMap!16))) lt!81105)))

(declare-fun b!154440 () Bool)

(declare-fun res!72921 () Bool)

(assert (=> b!154440 (=> (not res!72921) (not e!100902))))

(assert (=> b!154440 (= res!72921 (= (getValueByKey!183 (toList!924 lt!81105) (_1!1426 (tuple2!2831 lt!81016 (zeroValue!2907 newMap!16)))) (Some!188 (_2!1426 (tuple2!2831 lt!81016 (zeroValue!2907 newMap!16))))))))

(declare-fun b!154441 () Bool)

(assert (=> b!154441 (= e!100902 (contains!970 (toList!924 lt!81105) (tuple2!2831 lt!81016 (zeroValue!2907 newMap!16))))))

(assert (= (and d!50705 res!72922) b!154440))

(assert (= (and b!154440 res!72921) b!154441))

(declare-fun m!188359 () Bool)

(assert (=> d!50705 m!188359))

(declare-fun m!188361 () Bool)

(assert (=> d!50705 m!188361))

(declare-fun m!188363 () Bool)

(assert (=> d!50705 m!188363))

(declare-fun m!188365 () Bool)

(assert (=> d!50705 m!188365))

(declare-fun m!188367 () Bool)

(assert (=> b!154440 m!188367))

(declare-fun m!188369 () Bool)

(assert (=> b!154441 m!188369))

(assert (=> b!154309 d!50705))

(declare-fun d!50707 () Bool)

(assert (=> d!50707 (= (apply!128 (+!192 lt!81022 (tuple2!2831 lt!81017 (zeroValue!2907 newMap!16))) lt!81031) (get!1609 (getValueByKey!183 (toList!924 (+!192 lt!81022 (tuple2!2831 lt!81017 (zeroValue!2907 newMap!16)))) lt!81031)))))

(declare-fun bs!6532 () Bool)

(assert (= bs!6532 d!50707))

(declare-fun m!188371 () Bool)

(assert (=> bs!6532 m!188371))

(assert (=> bs!6532 m!188371))

(declare-fun m!188373 () Bool)

(assert (=> bs!6532 m!188373))

(assert (=> b!154309 d!50707))

(declare-fun d!50709 () Bool)

(declare-fun e!100903 () Bool)

(assert (=> d!50709 e!100903))

(declare-fun res!72923 () Bool)

(assert (=> d!50709 (=> res!72923 e!100903)))

(declare-fun lt!81108 () Bool)

(assert (=> d!50709 (= res!72923 (not lt!81108))))

(declare-fun lt!81111 () Bool)

(assert (=> d!50709 (= lt!81108 lt!81111)))

(declare-fun lt!81110 () Unit!4899)

(declare-fun e!100904 () Unit!4899)

(assert (=> d!50709 (= lt!81110 e!100904)))

(declare-fun c!29585 () Bool)

(assert (=> d!50709 (= c!29585 lt!81111)))

(assert (=> d!50709 (= lt!81111 (containsKey!187 (toList!924 (+!192 lt!81014 (tuple2!2831 lt!81016 (zeroValue!2907 newMap!16)))) lt!81026))))

(assert (=> d!50709 (= (contains!968 (+!192 lt!81014 (tuple2!2831 lt!81016 (zeroValue!2907 newMap!16))) lt!81026) lt!81108)))

(declare-fun b!154442 () Bool)

(declare-fun lt!81109 () Unit!4899)

(assert (=> b!154442 (= e!100904 lt!81109)))

(assert (=> b!154442 (= lt!81109 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 (+!192 lt!81014 (tuple2!2831 lt!81016 (zeroValue!2907 newMap!16)))) lt!81026))))

(assert (=> b!154442 (isDefined!136 (getValueByKey!183 (toList!924 (+!192 lt!81014 (tuple2!2831 lt!81016 (zeroValue!2907 newMap!16)))) lt!81026))))

(declare-fun b!154443 () Bool)

(declare-fun Unit!4910 () Unit!4899)

(assert (=> b!154443 (= e!100904 Unit!4910)))

(declare-fun b!154444 () Bool)

(assert (=> b!154444 (= e!100903 (isDefined!136 (getValueByKey!183 (toList!924 (+!192 lt!81014 (tuple2!2831 lt!81016 (zeroValue!2907 newMap!16)))) lt!81026)))))

(assert (= (and d!50709 c!29585) b!154442))

(assert (= (and d!50709 (not c!29585)) b!154443))

(assert (= (and d!50709 (not res!72923)) b!154444))

(declare-fun m!188375 () Bool)

(assert (=> d!50709 m!188375))

(declare-fun m!188377 () Bool)

(assert (=> b!154442 m!188377))

(declare-fun m!188379 () Bool)

(assert (=> b!154442 m!188379))

(assert (=> b!154442 m!188379))

(declare-fun m!188381 () Bool)

(assert (=> b!154442 m!188381))

(assert (=> b!154444 m!188379))

(assert (=> b!154444 m!188379))

(assert (=> b!154444 m!188381))

(assert (=> b!154309 d!50709))

(declare-fun d!50711 () Bool)

(assert (=> d!50711 (= (apply!128 (+!192 lt!81027 (tuple2!2831 lt!81019 (minValue!2907 newMap!16))) lt!81013) (get!1609 (getValueByKey!183 (toList!924 (+!192 lt!81027 (tuple2!2831 lt!81019 (minValue!2907 newMap!16)))) lt!81013)))))

(declare-fun bs!6533 () Bool)

(assert (= bs!6533 d!50711))

(declare-fun m!188383 () Bool)

(assert (=> bs!6533 m!188383))

(assert (=> bs!6533 m!188383))

(declare-fun m!188385 () Bool)

(assert (=> bs!6533 m!188385))

(assert (=> b!154309 d!50711))

(declare-fun d!50713 () Bool)

(declare-fun isEmpty!431 (Option!189) Bool)

(assert (=> d!50713 (= (isDefined!136 (getValueByKey!183 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80916)) (not (isEmpty!431 (getValueByKey!183 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80916))))))

(declare-fun bs!6534 () Bool)

(assert (= bs!6534 d!50713))

(assert (=> bs!6534 m!188147))

(declare-fun m!188387 () Bool)

(assert (=> bs!6534 m!188387))

(assert (=> b!154348 d!50713))

(declare-fun d!50715 () Bool)

(declare-fun c!29586 () Bool)

(assert (=> d!50715 (= c!29586 (and ((_ is Cons!1803) (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))) (= (_1!1426 (h!2412 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))) lt!80916)))))

(declare-fun e!100905 () Option!189)

(assert (=> d!50715 (= (getValueByKey!183 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80916) e!100905)))

(declare-fun b!154446 () Bool)

(declare-fun e!100906 () Option!189)

(assert (=> b!154446 (= e!100905 e!100906)))

(declare-fun c!29587 () Bool)

(assert (=> b!154446 (= c!29587 (and ((_ is Cons!1803) (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))) (not (= (_1!1426 (h!2412 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))) lt!80916))))))

(declare-fun b!154447 () Bool)

(assert (=> b!154447 (= e!100906 (getValueByKey!183 (t!6601 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))) lt!80916))))

(declare-fun b!154445 () Bool)

(assert (=> b!154445 (= e!100905 (Some!188 (_2!1426 (h!2412 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))))

(declare-fun b!154448 () Bool)

(assert (=> b!154448 (= e!100906 None!187)))

(assert (= (and d!50715 c!29586) b!154445))

(assert (= (and d!50715 (not c!29586)) b!154446))

(assert (= (and b!154446 c!29587) b!154447))

(assert (= (and b!154446 (not c!29587)) b!154448))

(declare-fun m!188389 () Bool)

(assert (=> b!154447 m!188389))

(assert (=> b!154348 d!50715))

(declare-fun d!50717 () Bool)

(declare-fun lt!81114 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!145 (List!1807) (InoxSet tuple2!2830))

(assert (=> d!50717 (= lt!81114 (select (content!145 (toList!924 lt!81043)) (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun e!100912 () Bool)

(assert (=> d!50717 (= lt!81114 e!100912)))

(declare-fun res!72929 () Bool)

(assert (=> d!50717 (=> (not res!72929) (not e!100912))))

(assert (=> d!50717 (= res!72929 ((_ is Cons!1803) (toList!924 lt!81043)))))

(assert (=> d!50717 (= (contains!970 (toList!924 lt!81043) (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!81114)))

(declare-fun b!154453 () Bool)

(declare-fun e!100911 () Bool)

(assert (=> b!154453 (= e!100912 e!100911)))

(declare-fun res!72928 () Bool)

(assert (=> b!154453 (=> res!72928 e!100911)))

(assert (=> b!154453 (= res!72928 (= (h!2412 (toList!924 lt!81043)) (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun b!154454 () Bool)

(assert (=> b!154454 (= e!100911 (contains!970 (t!6601 (toList!924 lt!81043)) (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(assert (= (and d!50717 res!72929) b!154453))

(assert (= (and b!154453 (not res!72928)) b!154454))

(declare-fun m!188391 () Bool)

(assert (=> d!50717 m!188391))

(declare-fun m!188393 () Bool)

(assert (=> d!50717 m!188393))

(declare-fun m!188395 () Bool)

(assert (=> b!154454 m!188395))

(assert (=> b!154345 d!50717))

(declare-fun d!50719 () Bool)

(assert (=> d!50719 (= (apply!128 lt!80941 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1609 (getValueByKey!183 (toList!924 lt!80941) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!6535 () Bool)

(assert (= bs!6535 d!50719))

(assert (=> bs!6535 m!187841))

(declare-fun m!188397 () Bool)

(assert (=> bs!6535 m!188397))

(assert (=> bs!6535 m!188397))

(declare-fun m!188399 () Bool)

(assert (=> bs!6535 m!188399))

(assert (=> b!154212 d!50719))

(assert (=> b!154212 d!50625))

(declare-fun d!50721 () Bool)

(assert (=> d!50721 (isDefined!136 (getValueByKey!183 (toList!924 lt!80911) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!81117 () Unit!4899)

(declare-fun choose!920 (List!1807 (_ BitVec 64)) Unit!4899)

(assert (=> d!50721 (= lt!81117 (choose!920 (toList!924 lt!80911) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!100915 () Bool)

(assert (=> d!50721 e!100915))

(declare-fun res!72932 () Bool)

(assert (=> d!50721 (=> (not res!72932) (not e!100915))))

(assert (=> d!50721 (= res!72932 (isStrictlySorted!330 (toList!924 lt!80911)))))

(assert (=> d!50721 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!80911) #b0000000000000000000000000000000000000000000000000000000000000000) lt!81117)))

(declare-fun b!154457 () Bool)

(assert (=> b!154457 (= e!100915 (containsKey!187 (toList!924 lt!80911) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!50721 res!72932) b!154457))

(assert (=> d!50721 m!187953))

(assert (=> d!50721 m!187953))

(assert (=> d!50721 m!187971))

(declare-fun m!188401 () Bool)

(assert (=> d!50721 m!188401))

(declare-fun m!188403 () Bool)

(assert (=> d!50721 m!188403))

(assert (=> b!154457 m!187967))

(assert (=> b!154241 d!50721))

(declare-fun d!50723 () Bool)

(assert (=> d!50723 (= (isDefined!136 (getValueByKey!183 (toList!924 lt!80911) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!431 (getValueByKey!183 (toList!924 lt!80911) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!6536 () Bool)

(assert (= bs!6536 d!50723))

(assert (=> bs!6536 m!187953))

(declare-fun m!188405 () Bool)

(assert (=> bs!6536 m!188405))

(assert (=> b!154241 d!50723))

(declare-fun d!50725 () Bool)

(declare-fun c!29588 () Bool)

(assert (=> d!50725 (= c!29588 (and ((_ is Cons!1803) (toList!924 lt!80911)) (= (_1!1426 (h!2412 (toList!924 lt!80911))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!100916 () Option!189)

(assert (=> d!50725 (= (getValueByKey!183 (toList!924 lt!80911) #b0000000000000000000000000000000000000000000000000000000000000000) e!100916)))

(declare-fun b!154459 () Bool)

(declare-fun e!100917 () Option!189)

(assert (=> b!154459 (= e!100916 e!100917)))

(declare-fun c!29589 () Bool)

(assert (=> b!154459 (= c!29589 (and ((_ is Cons!1803) (toList!924 lt!80911)) (not (= (_1!1426 (h!2412 (toList!924 lt!80911))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!154460 () Bool)

(assert (=> b!154460 (= e!100917 (getValueByKey!183 (t!6601 (toList!924 lt!80911)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154458 () Bool)

(assert (=> b!154458 (= e!100916 (Some!188 (_2!1426 (h!2412 (toList!924 lt!80911)))))))

(declare-fun b!154461 () Bool)

(assert (=> b!154461 (= e!100917 None!187)))

(assert (= (and d!50725 c!29588) b!154458))

(assert (= (and d!50725 (not c!29588)) b!154459))

(assert (= (and b!154459 c!29589) b!154460))

(assert (= (and b!154459 (not c!29589)) b!154461))

(declare-fun m!188407 () Bool)

(assert (=> b!154460 m!188407))

(assert (=> b!154241 d!50725))

(declare-fun b!154462 () Bool)

(declare-fun e!100919 () (_ BitVec 32))

(declare-fun e!100918 () (_ BitVec 32))

(assert (=> b!154462 (= e!100919 e!100918)))

(declare-fun c!29591 () Bool)

(assert (=> b!154462 (= c!29591 (validKeyInArray!0 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154463 () Bool)

(declare-fun call!17194 () (_ BitVec 32))

(assert (=> b!154463 (= e!100918 (bvadd #b00000000000000000000000000000001 call!17194))))

(declare-fun b!154464 () Bool)

(assert (=> b!154464 (= e!100919 #b00000000000000000000000000000000)))

(declare-fun d!50727 () Bool)

(declare-fun lt!81118 () (_ BitVec 32))

(assert (=> d!50727 (and (bvsge lt!81118 #b00000000000000000000000000000000) (bvsle lt!81118 (bvsub (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!50727 (= lt!81118 e!100919)))

(declare-fun c!29590 () Bool)

(assert (=> d!50727 (= c!29590 (bvsge #b00000000000000000000000000000000 (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(assert (=> d!50727 (and (bvsle #b00000000000000000000000000000000 (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(assert (=> d!50727 (= (arrayCountValidKeys!0 (_keys!4837 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000000 (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))) lt!81118)))

(declare-fun b!154465 () Bool)

(assert (=> b!154465 (= e!100918 call!17194)))

(declare-fun bm!17191 () Bool)

(assert (=> bm!17191 (= call!17194 (arrayCountValidKeys!0 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(assert (= (and d!50727 c!29590) b!154464))

(assert (= (and d!50727 (not c!29590)) b!154462))

(assert (= (and b!154462 c!29591) b!154463))

(assert (= (and b!154462 (not c!29591)) b!154465))

(assert (= (or b!154463 b!154465) bm!17191))

(assert (=> b!154462 m!187989))

(assert (=> b!154462 m!187989))

(assert (=> b!154462 m!188039))

(declare-fun m!188409 () Bool)

(assert (=> bm!17191 m!188409))

(assert (=> b!154238 d!50727))

(declare-fun d!50729 () Bool)

(assert (=> d!50729 (= (get!1609 (getValueByKey!183 (toList!924 lt!80911) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3422 (getValueByKey!183 (toList!924 lt!80911) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50607 d!50729))

(assert (=> d!50607 d!50725))

(declare-fun c!29592 () Bool)

(declare-fun d!50731 () Bool)

(assert (=> d!50731 (= c!29592 (and ((_ is Cons!1803) (toList!924 lt!81056)) (= (_1!1426 (h!2412 (toList!924 lt!81056))) (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun e!100920 () Option!189)

(assert (=> d!50731 (= (getValueByKey!183 (toList!924 lt!81056) (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) e!100920)))

(declare-fun b!154467 () Bool)

(declare-fun e!100921 () Option!189)

(assert (=> b!154467 (= e!100920 e!100921)))

(declare-fun c!29593 () Bool)

(assert (=> b!154467 (= c!29593 (and ((_ is Cons!1803) (toList!924 lt!81056)) (not (= (_1!1426 (h!2412 (toList!924 lt!81056))) (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun b!154468 () Bool)

(assert (=> b!154468 (= e!100921 (getValueByKey!183 (t!6601 (toList!924 lt!81056)) (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154466 () Bool)

(assert (=> b!154466 (= e!100920 (Some!188 (_2!1426 (h!2412 (toList!924 lt!81056)))))))

(declare-fun b!154469 () Bool)

(assert (=> b!154469 (= e!100921 None!187)))

(assert (= (and d!50731 c!29592) b!154466))

(assert (= (and d!50731 (not c!29592)) b!154467))

(assert (= (and b!154467 c!29593) b!154468))

(assert (= (and b!154467 (not c!29593)) b!154469))

(declare-fun m!188411 () Bool)

(assert (=> b!154468 m!188411))

(assert (=> b!154352 d!50731))

(declare-fun d!50733 () Bool)

(assert (=> d!50733 (= (apply!128 lt!81021 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1609 (getValueByKey!183 (toList!924 lt!81021) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6537 () Bool)

(assert (= bs!6537 d!50733))

(declare-fun m!188413 () Bool)

(assert (=> bs!6537 m!188413))

(assert (=> bs!6537 m!188413))

(declare-fun m!188415 () Bool)

(assert (=> bs!6537 m!188415))

(assert (=> b!154306 d!50733))

(declare-fun c!29594 () Bool)

(declare-fun d!50735 () Bool)

(assert (=> d!50735 (= c!29594 (and ((_ is Cons!1803) (toList!924 lt!81043)) (= (_1!1426 (h!2412 (toList!924 lt!81043))) (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun e!100922 () Option!189)

(assert (=> d!50735 (= (getValueByKey!183 (toList!924 lt!81043) (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) e!100922)))

(declare-fun b!154471 () Bool)

(declare-fun e!100923 () Option!189)

(assert (=> b!154471 (= e!100922 e!100923)))

(declare-fun c!29595 () Bool)

(assert (=> b!154471 (= c!29595 (and ((_ is Cons!1803) (toList!924 lt!81043)) (not (= (_1!1426 (h!2412 (toList!924 lt!81043))) (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun b!154472 () Bool)

(assert (=> b!154472 (= e!100923 (getValueByKey!183 (t!6601 (toList!924 lt!81043)) (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154470 () Bool)

(assert (=> b!154470 (= e!100922 (Some!188 (_2!1426 (h!2412 (toList!924 lt!81043)))))))

(declare-fun b!154473 () Bool)

(assert (=> b!154473 (= e!100923 None!187)))

(assert (= (and d!50735 c!29594) b!154470))

(assert (= (and d!50735 (not c!29594)) b!154471))

(assert (= (and b!154471 c!29595) b!154472))

(assert (= (and b!154471 (not c!29595)) b!154473))

(declare-fun m!188417 () Bool)

(assert (=> b!154472 m!188417))

(assert (=> b!154344 d!50735))

(assert (=> b!154256 d!50665))

(declare-fun d!50737 () Bool)

(declare-fun isEmpty!432 (List!1807) Bool)

(assert (=> d!50737 (= (isEmpty!430 lt!80941) (isEmpty!432 (toList!924 lt!80941)))))

(declare-fun bs!6538 () Bool)

(assert (= bs!6538 d!50737))

(declare-fun m!188419 () Bool)

(assert (=> bs!6538 m!188419))

(assert (=> b!154207 d!50737))

(declare-fun b!154474 () Bool)

(declare-fun res!72935 () Bool)

(declare-fun e!100924 () Bool)

(assert (=> b!154474 (=> (not res!72935) (not e!100924))))

(assert (=> b!154474 (= res!72935 (and (= (size!2689 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000001)) (= (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (size!2689 (_values!3047 (v!3419 (underlying!526 thiss!992))))) (bvsge (_size!673 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!673 (v!3419 (underlying!526 thiss!992))) (bvadd (mask!7468 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!154475 () Bool)

(declare-fun res!72933 () Bool)

(assert (=> b!154475 (=> (not res!72933) (not e!100924))))

(assert (=> b!154475 (= res!72933 (bvsge (size!2692 (v!3419 (underlying!526 thiss!992))) (_size!673 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun b!154477 () Bool)

(assert (=> b!154477 (= e!100924 (and (bvsge (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!673 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!154476 () Bool)

(declare-fun res!72934 () Bool)

(assert (=> b!154476 (=> (not res!72934) (not e!100924))))

(assert (=> b!154476 (= res!72934 (= (size!2692 (v!3419 (underlying!526 thiss!992))) (bvadd (_size!673 (v!3419 (underlying!526 thiss!992))) (bvsdiv (bvadd (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!50739 () Bool)

(declare-fun res!72936 () Bool)

(assert (=> d!50739 (=> (not res!72936) (not e!100924))))

(assert (=> d!50739 (= res!72936 (validMask!0 (mask!7468 (v!3419 (underlying!526 thiss!992)))))))

(assert (=> d!50739 (= (simpleValid!104 (v!3419 (underlying!526 thiss!992))) e!100924)))

(assert (= (and d!50739 res!72936) b!154474))

(assert (= (and b!154474 res!72935) b!154475))

(assert (= (and b!154475 res!72933) b!154476))

(assert (= (and b!154476 res!72934) b!154477))

(declare-fun m!188421 () Bool)

(assert (=> b!154475 m!188421))

(assert (=> b!154476 m!188421))

(assert (=> d!50739 m!187893))

(assert (=> d!50611 d!50739))

(assert (=> b!154203 d!50603))

(declare-fun c!29596 () Bool)

(declare-fun d!50741 () Bool)

(assert (=> d!50741 (= c!29596 (and ((_ is Cons!1803) (toList!924 lt!81008)) (= (_1!1426 (h!2412 (toList!924 lt!81008))) (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun e!100925 () Option!189)

(assert (=> d!50741 (= (getValueByKey!183 (toList!924 lt!81008) (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))) e!100925)))

(declare-fun b!154479 () Bool)

(declare-fun e!100926 () Option!189)

(assert (=> b!154479 (= e!100925 e!100926)))

(declare-fun c!29597 () Bool)

(assert (=> b!154479 (= c!29597 (and ((_ is Cons!1803) (toList!924 lt!81008)) (not (= (_1!1426 (h!2412 (toList!924 lt!81008))) (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))))

(declare-fun b!154480 () Bool)

(assert (=> b!154480 (= e!100926 (getValueByKey!183 (t!6601 (toList!924 lt!81008)) (_1!1426 (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154478 () Bool)

(assert (=> b!154478 (= e!100925 (Some!188 (_2!1426 (h!2412 (toList!924 lt!81008)))))))

(declare-fun b!154481 () Bool)

(assert (=> b!154481 (= e!100926 None!187)))

(assert (= (and d!50741 c!29596) b!154478))

(assert (= (and d!50741 (not c!29596)) b!154479))

(assert (= (and b!154479 c!29597) b!154480))

(assert (= (and b!154479 (not c!29597)) b!154481))

(declare-fun m!188423 () Bool)

(assert (=> b!154480 m!188423))

(assert (=> b!154286 d!50741))

(declare-fun d!50743 () Bool)

(declare-fun res!72941 () Bool)

(declare-fun e!100931 () Bool)

(assert (=> d!50743 (=> res!72941 e!100931)))

(assert (=> d!50743 (= res!72941 (and ((_ is Cons!1803) (toList!924 lt!80911)) (= (_1!1426 (h!2412 (toList!924 lt!80911))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50743 (= (containsKey!187 (toList!924 lt!80911) #b0000000000000000000000000000000000000000000000000000000000000000) e!100931)))

(declare-fun b!154486 () Bool)

(declare-fun e!100932 () Bool)

(assert (=> b!154486 (= e!100931 e!100932)))

(declare-fun res!72942 () Bool)

(assert (=> b!154486 (=> (not res!72942) (not e!100932))))

(assert (=> b!154486 (= res!72942 (and (or (not ((_ is Cons!1803) (toList!924 lt!80911))) (bvsle (_1!1426 (h!2412 (toList!924 lt!80911))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1803) (toList!924 lt!80911)) (bvslt (_1!1426 (h!2412 (toList!924 lt!80911))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154487 () Bool)

(assert (=> b!154487 (= e!100932 (containsKey!187 (t!6601 (toList!924 lt!80911)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!50743 (not res!72941)) b!154486))

(assert (= (and b!154486 res!72942) b!154487))

(declare-fun m!188425 () Bool)

(assert (=> b!154487 m!188425))

(assert (=> d!50613 d!50743))

(declare-fun d!50745 () Bool)

(declare-fun e!100933 () Bool)

(assert (=> d!50745 e!100933))

(declare-fun res!72943 () Bool)

(assert (=> d!50745 (=> res!72943 e!100933)))

(declare-fun lt!81119 () Bool)

(assert (=> d!50745 (= res!72943 (not lt!81119))))

(declare-fun lt!81122 () Bool)

(assert (=> d!50745 (= lt!81119 lt!81122)))

(declare-fun lt!81121 () Unit!4899)

(declare-fun e!100934 () Unit!4899)

(assert (=> d!50745 (= lt!81121 e!100934)))

(declare-fun c!29598 () Bool)

(assert (=> d!50745 (= c!29598 lt!81122)))

(assert (=> d!50745 (= lt!81122 (containsKey!187 (toList!924 lt!80941) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50745 (= (contains!968 lt!80941 #b0000000000000000000000000000000000000000000000000000000000000000) lt!81119)))

(declare-fun b!154488 () Bool)

(declare-fun lt!81120 () Unit!4899)

(assert (=> b!154488 (= e!100934 lt!81120)))

(assert (=> b!154488 (= lt!81120 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!80941) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154488 (isDefined!136 (getValueByKey!183 (toList!924 lt!80941) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154489 () Bool)

(declare-fun Unit!4911 () Unit!4899)

(assert (=> b!154489 (= e!100934 Unit!4911)))

(declare-fun b!154490 () Bool)

(assert (=> b!154490 (= e!100933 (isDefined!136 (getValueByKey!183 (toList!924 lt!80941) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50745 c!29598) b!154488))

(assert (= (and d!50745 (not c!29598)) b!154489))

(assert (= (and d!50745 (not res!72943)) b!154490))

(declare-fun m!188427 () Bool)

(assert (=> d!50745 m!188427))

(declare-fun m!188429 () Bool)

(assert (=> b!154488 m!188429))

(declare-fun m!188431 () Bool)

(assert (=> b!154488 m!188431))

(assert (=> b!154488 m!188431))

(declare-fun m!188433 () Bool)

(assert (=> b!154488 m!188433))

(assert (=> b!154490 m!188431))

(assert (=> b!154490 m!188431))

(assert (=> b!154490 m!188433))

(assert (=> d!50597 d!50745))

(assert (=> d!50597 d!50663))

(declare-fun d!50747 () Bool)

(declare-fun e!100935 () Bool)

(assert (=> d!50747 e!100935))

(declare-fun res!72944 () Bool)

(assert (=> d!50747 (=> res!72944 e!100935)))

(declare-fun lt!81123 () Bool)

(assert (=> d!50747 (= res!72944 (not lt!81123))))

(declare-fun lt!81126 () Bool)

(assert (=> d!50747 (= lt!81123 lt!81126)))

(declare-fun lt!81125 () Unit!4899)

(declare-fun e!100936 () Unit!4899)

(assert (=> d!50747 (= lt!81125 e!100936)))

(declare-fun c!29599 () Bool)

(assert (=> d!50747 (= c!29599 lt!81126)))

(assert (=> d!50747 (= lt!81126 (containsKey!187 (toList!924 lt!81056) (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50747 (= (contains!968 lt!81056 (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81123)))

(declare-fun b!154491 () Bool)

(declare-fun lt!81124 () Unit!4899)

(assert (=> b!154491 (= e!100936 lt!81124)))

(assert (=> b!154491 (= lt!81124 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!81056) (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> b!154491 (isDefined!136 (getValueByKey!183 (toList!924 lt!81056) (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154492 () Bool)

(declare-fun Unit!4912 () Unit!4899)

(assert (=> b!154492 (= e!100936 Unit!4912)))

(declare-fun b!154493 () Bool)

(assert (=> b!154493 (= e!100935 (isDefined!136 (getValueByKey!183 (toList!924 lt!81056) (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (= (and d!50747 c!29599) b!154491))

(assert (= (and d!50747 (not c!29599)) b!154492))

(assert (= (and d!50747 (not res!72944)) b!154493))

(declare-fun m!188435 () Bool)

(assert (=> d!50747 m!188435))

(declare-fun m!188437 () Bool)

(assert (=> b!154491 m!188437))

(assert (=> b!154491 m!188179))

(assert (=> b!154491 m!188179))

(declare-fun m!188439 () Bool)

(assert (=> b!154491 m!188439))

(assert (=> b!154493 m!188179))

(assert (=> b!154493 m!188179))

(assert (=> b!154493 m!188439))

(assert (=> d!50647 d!50747))

(declare-fun c!29600 () Bool)

(declare-fun d!50749 () Bool)

(assert (=> d!50749 (= c!29600 (and ((_ is Cons!1803) lt!81057) (= (_1!1426 (h!2412 lt!81057)) (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun e!100937 () Option!189)

(assert (=> d!50749 (= (getValueByKey!183 lt!81057 (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) e!100937)))

(declare-fun b!154495 () Bool)

(declare-fun e!100938 () Option!189)

(assert (=> b!154495 (= e!100937 e!100938)))

(declare-fun c!29601 () Bool)

(assert (=> b!154495 (= c!29601 (and ((_ is Cons!1803) lt!81057) (not (= (_1!1426 (h!2412 lt!81057)) (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun b!154496 () Bool)

(assert (=> b!154496 (= e!100938 (getValueByKey!183 (t!6601 lt!81057) (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154494 () Bool)

(assert (=> b!154494 (= e!100937 (Some!188 (_2!1426 (h!2412 lt!81057))))))

(declare-fun b!154497 () Bool)

(assert (=> b!154497 (= e!100938 None!187)))

(assert (= (and d!50749 c!29600) b!154494))

(assert (= (and d!50749 (not c!29600)) b!154495))

(assert (= (and b!154495 c!29601) b!154496))

(assert (= (and b!154495 (not c!29601)) b!154497))

(declare-fun m!188441 () Bool)

(assert (=> b!154496 m!188441))

(assert (=> d!50647 d!50749))

(declare-fun d!50751 () Bool)

(assert (=> d!50751 (= (getValueByKey!183 lt!81057 (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun lt!81127 () Unit!4899)

(assert (=> d!50751 (= lt!81127 (choose!919 lt!81057 (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun e!100939 () Bool)

(assert (=> d!50751 e!100939))

(declare-fun res!72945 () Bool)

(assert (=> d!50751 (=> (not res!72945) (not e!100939))))

(assert (=> d!50751 (= res!72945 (isStrictlySorted!330 lt!81057))))

(assert (=> d!50751 (= (lemmaContainsTupThenGetReturnValue!96 lt!81057 (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81127)))

(declare-fun b!154498 () Bool)

(declare-fun res!72946 () Bool)

(assert (=> b!154498 (=> (not res!72946) (not e!100939))))

(assert (=> b!154498 (= res!72946 (containsKey!187 lt!81057 (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154499 () Bool)

(assert (=> b!154499 (= e!100939 (contains!970 lt!81057 (tuple2!2831 (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (= (and d!50751 res!72945) b!154498))

(assert (= (and b!154498 res!72946) b!154499))

(assert (=> d!50751 m!188173))

(declare-fun m!188443 () Bool)

(assert (=> d!50751 m!188443))

(declare-fun m!188445 () Bool)

(assert (=> d!50751 m!188445))

(declare-fun m!188447 () Bool)

(assert (=> b!154498 m!188447))

(declare-fun m!188449 () Bool)

(assert (=> b!154499 m!188449))

(assert (=> d!50647 d!50751))

(declare-fun d!50753 () Bool)

(declare-fun e!100943 () Bool)

(assert (=> d!50753 e!100943))

(declare-fun res!72948 () Bool)

(assert (=> d!50753 (=> (not res!72948) (not e!100943))))

(declare-fun lt!81128 () List!1807)

(assert (=> d!50753 (= res!72948 (isStrictlySorted!330 lt!81128))))

(declare-fun e!100944 () List!1807)

(assert (=> d!50753 (= lt!81128 e!100944)))

(declare-fun c!29605 () Bool)

(assert (=> d!50753 (= c!29605 (and ((_ is Cons!1803) (toList!924 lt!80912)) (bvslt (_1!1426 (h!2412 (toList!924 lt!80912))) (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (=> d!50753 (isStrictlySorted!330 (toList!924 lt!80912))))

(assert (=> d!50753 (= (insertStrictlySorted!99 (toList!924 lt!80912) (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81128)))

(declare-fun b!154500 () Bool)

(declare-fun e!100941 () List!1807)

(declare-fun call!17195 () List!1807)

(assert (=> b!154500 (= e!100941 call!17195)))

(declare-fun b!154501 () Bool)

(declare-fun e!100942 () List!1807)

(assert (=> b!154501 (= e!100944 e!100942)))

(declare-fun c!29602 () Bool)

(assert (=> b!154501 (= c!29602 (and ((_ is Cons!1803) (toList!924 lt!80912)) (= (_1!1426 (h!2412 (toList!924 lt!80912))) (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun c!29604 () Bool)

(declare-fun e!100940 () List!1807)

(declare-fun b!154502 () Bool)

(assert (=> b!154502 (= e!100940 (ite c!29602 (t!6601 (toList!924 lt!80912)) (ite c!29604 (Cons!1803 (h!2412 (toList!924 lt!80912)) (t!6601 (toList!924 lt!80912))) Nil!1804)))))

(declare-fun call!17197 () List!1807)

(declare-fun bm!17192 () Bool)

(assert (=> bm!17192 (= call!17197 ($colon$colon!96 e!100940 (ite c!29605 (h!2412 (toList!924 lt!80912)) (tuple2!2831 (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun c!29603 () Bool)

(assert (=> bm!17192 (= c!29603 c!29605)))

(declare-fun b!154503 () Bool)

(assert (=> b!154503 (= e!100944 call!17197)))

(declare-fun bm!17193 () Bool)

(declare-fun call!17196 () List!1807)

(assert (=> bm!17193 (= call!17196 call!17197)))

(declare-fun b!154504 () Bool)

(declare-fun res!72947 () Bool)

(assert (=> b!154504 (=> (not res!72947) (not e!100943))))

(assert (=> b!154504 (= res!72947 (containsKey!187 lt!81128 (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154505 () Bool)

(assert (=> b!154505 (= e!100943 (contains!970 lt!81128 (tuple2!2831 (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154506 () Bool)

(assert (=> b!154506 (= e!100942 call!17196)))

(declare-fun bm!17194 () Bool)

(assert (=> bm!17194 (= call!17195 call!17196)))

(declare-fun b!154507 () Bool)

(assert (=> b!154507 (= c!29604 (and ((_ is Cons!1803) (toList!924 lt!80912)) (bvsgt (_1!1426 (h!2412 (toList!924 lt!80912))) (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (=> b!154507 (= e!100942 e!100941)))

(declare-fun b!154508 () Bool)

(assert (=> b!154508 (= e!100940 (insertStrictlySorted!99 (t!6601 (toList!924 lt!80912)) (_1!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154509 () Bool)

(assert (=> b!154509 (= e!100941 call!17195)))

(assert (= (and d!50753 c!29605) b!154503))

(assert (= (and d!50753 (not c!29605)) b!154501))

(assert (= (and b!154501 c!29602) b!154506))

(assert (= (and b!154501 (not c!29602)) b!154507))

(assert (= (and b!154507 c!29604) b!154509))

(assert (= (and b!154507 (not c!29604)) b!154500))

(assert (= (or b!154509 b!154500) bm!17194))

(assert (= (or b!154506 bm!17194) bm!17193))

(assert (= (or b!154503 bm!17193) bm!17192))

(assert (= (and bm!17192 c!29603) b!154508))

(assert (= (and bm!17192 (not c!29603)) b!154502))

(assert (= (and d!50753 res!72948) b!154504))

(assert (= (and b!154504 res!72947) b!154505))

(declare-fun m!188451 () Bool)

(assert (=> b!154508 m!188451))

(declare-fun m!188453 () Bool)

(assert (=> d!50753 m!188453))

(declare-fun m!188455 () Bool)

(assert (=> d!50753 m!188455))

(declare-fun m!188457 () Bool)

(assert (=> b!154505 m!188457))

(declare-fun m!188459 () Bool)

(assert (=> b!154504 m!188459))

(declare-fun m!188461 () Bool)

(assert (=> bm!17192 m!188461))

(assert (=> d!50647 d!50753))

(assert (=> bm!17176 d!50699))

(declare-fun d!50755 () Bool)

(declare-fun lt!81129 () Bool)

(assert (=> d!50755 (= lt!81129 (select (content!145 (toList!924 lt!81060)) (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun e!100946 () Bool)

(assert (=> d!50755 (= lt!81129 e!100946)))

(declare-fun res!72950 () Bool)

(assert (=> d!50755 (=> (not res!72950) (not e!100946))))

(assert (=> d!50755 (= res!72950 ((_ is Cons!1803) (toList!924 lt!81060)))))

(assert (=> d!50755 (= (contains!970 (toList!924 lt!81060) (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!81129)))

(declare-fun b!154510 () Bool)

(declare-fun e!100945 () Bool)

(assert (=> b!154510 (= e!100946 e!100945)))

(declare-fun res!72949 () Bool)

(assert (=> b!154510 (=> res!72949 e!100945)))

(assert (=> b!154510 (= res!72949 (= (h!2412 (toList!924 lt!81060)) (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun b!154511 () Bool)

(assert (=> b!154511 (= e!100945 (contains!970 (t!6601 (toList!924 lt!81060)) (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(assert (= (and d!50755 res!72950) b!154510))

(assert (= (and b!154510 (not res!72949)) b!154511))

(declare-fun m!188463 () Bool)

(assert (=> d!50755 m!188463))

(declare-fun m!188465 () Bool)

(assert (=> d!50755 m!188465))

(declare-fun m!188467 () Bool)

(assert (=> b!154511 m!188467))

(assert (=> b!154355 d!50755))

(declare-fun d!50757 () Bool)

(assert (=> d!50757 (= (get!1609 (getValueByKey!183 (toList!924 (+!192 lt!80912 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80921)) (v!3422 (getValueByKey!183 (toList!924 (+!192 lt!80912 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80921)))))

(assert (=> d!50657 d!50757))

(declare-fun d!50759 () Bool)

(declare-fun c!29606 () Bool)

(assert (=> d!50759 (= c!29606 (and ((_ is Cons!1803) (toList!924 (+!192 lt!80912 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))) (= (_1!1426 (h!2412 (toList!924 (+!192 lt!80912 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))) lt!80921)))))

(declare-fun e!100947 () Option!189)

(assert (=> d!50759 (= (getValueByKey!183 (toList!924 (+!192 lt!80912 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80921) e!100947)))

(declare-fun b!154513 () Bool)

(declare-fun e!100948 () Option!189)

(assert (=> b!154513 (= e!100947 e!100948)))

(declare-fun c!29607 () Bool)

(assert (=> b!154513 (= c!29607 (and ((_ is Cons!1803) (toList!924 (+!192 lt!80912 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))) (not (= (_1!1426 (h!2412 (toList!924 (+!192 lt!80912 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))) lt!80921))))))

(declare-fun b!154514 () Bool)

(assert (=> b!154514 (= e!100948 (getValueByKey!183 (t!6601 (toList!924 (+!192 lt!80912 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))) lt!80921))))

(declare-fun b!154512 () Bool)

(assert (=> b!154512 (= e!100947 (Some!188 (_2!1426 (h!2412 (toList!924 (+!192 lt!80912 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))))

(declare-fun b!154515 () Bool)

(assert (=> b!154515 (= e!100948 None!187)))

(assert (= (and d!50759 c!29606) b!154512))

(assert (= (and d!50759 (not c!29606)) b!154513))

(assert (= (and b!154513 c!29607) b!154514))

(assert (= (and b!154513 (not c!29607)) b!154515))

(declare-fun m!188469 () Bool)

(assert (=> b!154514 m!188469))

(assert (=> d!50657 d!50759))

(declare-fun d!50761 () Bool)

(declare-fun c!29608 () Bool)

(assert (=> d!50761 (= c!29608 (and ((_ is Cons!1803) (toList!924 lt!80982)) (= (_1!1426 (h!2412 (toList!924 lt!80982))) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun e!100949 () Option!189)

(assert (=> d!50761 (= (getValueByKey!183 (toList!924 lt!80982) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) e!100949)))

(declare-fun b!154517 () Bool)

(declare-fun e!100950 () Option!189)

(assert (=> b!154517 (= e!100949 e!100950)))

(declare-fun c!29609 () Bool)

(assert (=> b!154517 (= c!29609 (and ((_ is Cons!1803) (toList!924 lt!80982)) (not (= (_1!1426 (h!2412 (toList!924 lt!80982))) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun b!154518 () Bool)

(assert (=> b!154518 (= e!100950 (getValueByKey!183 (t!6601 (toList!924 lt!80982)) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154516 () Bool)

(assert (=> b!154516 (= e!100949 (Some!188 (_2!1426 (h!2412 (toList!924 lt!80982)))))))

(declare-fun b!154519 () Bool)

(assert (=> b!154519 (= e!100950 None!187)))

(assert (= (and d!50761 c!29608) b!154516))

(assert (= (and d!50761 (not c!29608)) b!154517))

(assert (= (and b!154517 c!29609) b!154518))

(assert (= (and b!154517 (not c!29609)) b!154519))

(declare-fun m!188471 () Bool)

(assert (=> b!154518 m!188471))

(assert (=> b!154263 d!50761))

(declare-fun d!50763 () Bool)

(declare-fun e!100951 () Bool)

(assert (=> d!50763 e!100951))

(declare-fun res!72951 () Bool)

(assert (=> d!50763 (=> res!72951 e!100951)))

(declare-fun lt!81130 () Bool)

(assert (=> d!50763 (= res!72951 (not lt!81130))))

(declare-fun lt!81133 () Bool)

(assert (=> d!50763 (= lt!81130 lt!81133)))

(declare-fun lt!81132 () Unit!4899)

(declare-fun e!100952 () Unit!4899)

(assert (=> d!50763 (= lt!81132 e!100952)))

(declare-fun c!29610 () Bool)

(assert (=> d!50763 (= c!29610 lt!81133)))

(assert (=> d!50763 (= lt!81133 (containsKey!187 (toList!924 lt!81043) (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50763 (= (contains!968 lt!81043 (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81130)))

(declare-fun b!154520 () Bool)

(declare-fun lt!81131 () Unit!4899)

(assert (=> b!154520 (= e!100952 lt!81131)))

(assert (=> b!154520 (= lt!81131 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!81043) (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> b!154520 (isDefined!136 (getValueByKey!183 (toList!924 lt!81043) (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154521 () Bool)

(declare-fun Unit!4913 () Unit!4899)

(assert (=> b!154521 (= e!100952 Unit!4913)))

(declare-fun b!154522 () Bool)

(assert (=> b!154522 (= e!100951 (isDefined!136 (getValueByKey!183 (toList!924 lt!81043) (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (= (and d!50763 c!29610) b!154520))

(assert (= (and d!50763 (not c!29610)) b!154521))

(assert (= (and d!50763 (not res!72951)) b!154522))

(declare-fun m!188473 () Bool)

(assert (=> d!50763 m!188473))

(declare-fun m!188475 () Bool)

(assert (=> b!154520 m!188475))

(assert (=> b!154520 m!188139))

(assert (=> b!154520 m!188139))

(declare-fun m!188477 () Bool)

(assert (=> b!154520 m!188477))

(assert (=> b!154522 m!188139))

(assert (=> b!154522 m!188139))

(assert (=> b!154522 m!188477))

(assert (=> d!50637 d!50763))

(declare-fun c!29611 () Bool)

(declare-fun d!50765 () Bool)

(assert (=> d!50765 (= c!29611 (and ((_ is Cons!1803) lt!81044) (= (_1!1426 (h!2412 lt!81044)) (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun e!100953 () Option!189)

(assert (=> d!50765 (= (getValueByKey!183 lt!81044 (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) e!100953)))

(declare-fun b!154524 () Bool)

(declare-fun e!100954 () Option!189)

(assert (=> b!154524 (= e!100953 e!100954)))

(declare-fun c!29612 () Bool)

(assert (=> b!154524 (= c!29612 (and ((_ is Cons!1803) lt!81044) (not (= (_1!1426 (h!2412 lt!81044)) (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun b!154525 () Bool)

(assert (=> b!154525 (= e!100954 (getValueByKey!183 (t!6601 lt!81044) (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154523 () Bool)

(assert (=> b!154523 (= e!100953 (Some!188 (_2!1426 (h!2412 lt!81044))))))

(declare-fun b!154526 () Bool)

(assert (=> b!154526 (= e!100954 None!187)))

(assert (= (and d!50765 c!29611) b!154523))

(assert (= (and d!50765 (not c!29611)) b!154524))

(assert (= (and b!154524 c!29612) b!154525))

(assert (= (and b!154524 (not c!29612)) b!154526))

(declare-fun m!188479 () Bool)

(assert (=> b!154525 m!188479))

(assert (=> d!50637 d!50765))

(declare-fun d!50767 () Bool)

(assert (=> d!50767 (= (getValueByKey!183 lt!81044 (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun lt!81134 () Unit!4899)

(assert (=> d!50767 (= lt!81134 (choose!919 lt!81044 (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun e!100955 () Bool)

(assert (=> d!50767 e!100955))

(declare-fun res!72952 () Bool)

(assert (=> d!50767 (=> (not res!72952) (not e!100955))))

(assert (=> d!50767 (= res!72952 (isStrictlySorted!330 lt!81044))))

(assert (=> d!50767 (= (lemmaContainsTupThenGetReturnValue!96 lt!81044 (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81134)))

(declare-fun b!154527 () Bool)

(declare-fun res!72953 () Bool)

(assert (=> b!154527 (=> (not res!72953) (not e!100955))))

(assert (=> b!154527 (= res!72953 (containsKey!187 lt!81044 (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154528 () Bool)

(assert (=> b!154528 (= e!100955 (contains!970 lt!81044 (tuple2!2831 (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (= (and d!50767 res!72952) b!154527))

(assert (= (and b!154527 res!72953) b!154528))

(assert (=> d!50767 m!188133))

(declare-fun m!188481 () Bool)

(assert (=> d!50767 m!188481))

(declare-fun m!188483 () Bool)

(assert (=> d!50767 m!188483))

(declare-fun m!188485 () Bool)

(assert (=> b!154527 m!188485))

(declare-fun m!188487 () Bool)

(assert (=> b!154528 m!188487))

(assert (=> d!50637 d!50767))

(declare-fun d!50769 () Bool)

(declare-fun e!100959 () Bool)

(assert (=> d!50769 e!100959))

(declare-fun res!72955 () Bool)

(assert (=> d!50769 (=> (not res!72955) (not e!100959))))

(declare-fun lt!81135 () List!1807)

(assert (=> d!50769 (= res!72955 (isStrictlySorted!330 lt!81135))))

(declare-fun e!100960 () List!1807)

(assert (=> d!50769 (= lt!81135 e!100960)))

(declare-fun c!29616 () Bool)

(assert (=> d!50769 (= c!29616 (and ((_ is Cons!1803) (toList!924 lt!80917)) (bvslt (_1!1426 (h!2412 (toList!924 lt!80917))) (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (=> d!50769 (isStrictlySorted!330 (toList!924 lt!80917))))

(assert (=> d!50769 (= (insertStrictlySorted!99 (toList!924 lt!80917) (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81135)))

(declare-fun b!154529 () Bool)

(declare-fun e!100957 () List!1807)

(declare-fun call!17198 () List!1807)

(assert (=> b!154529 (= e!100957 call!17198)))

(declare-fun b!154530 () Bool)

(declare-fun e!100958 () List!1807)

(assert (=> b!154530 (= e!100960 e!100958)))

(declare-fun c!29613 () Bool)

(assert (=> b!154530 (= c!29613 (and ((_ is Cons!1803) (toList!924 lt!80917)) (= (_1!1426 (h!2412 (toList!924 lt!80917))) (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun c!29615 () Bool)

(declare-fun e!100956 () List!1807)

(declare-fun b!154531 () Bool)

(assert (=> b!154531 (= e!100956 (ite c!29613 (t!6601 (toList!924 lt!80917)) (ite c!29615 (Cons!1803 (h!2412 (toList!924 lt!80917)) (t!6601 (toList!924 lt!80917))) Nil!1804)))))

(declare-fun bm!17195 () Bool)

(declare-fun call!17200 () List!1807)

(assert (=> bm!17195 (= call!17200 ($colon$colon!96 e!100956 (ite c!29616 (h!2412 (toList!924 lt!80917)) (tuple2!2831 (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun c!29614 () Bool)

(assert (=> bm!17195 (= c!29614 c!29616)))

(declare-fun b!154532 () Bool)

(assert (=> b!154532 (= e!100960 call!17200)))

(declare-fun bm!17196 () Bool)

(declare-fun call!17199 () List!1807)

(assert (=> bm!17196 (= call!17199 call!17200)))

(declare-fun b!154533 () Bool)

(declare-fun res!72954 () Bool)

(assert (=> b!154533 (=> (not res!72954) (not e!100959))))

(assert (=> b!154533 (= res!72954 (containsKey!187 lt!81135 (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154534 () Bool)

(assert (=> b!154534 (= e!100959 (contains!970 lt!81135 (tuple2!2831 (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154535 () Bool)

(assert (=> b!154535 (= e!100958 call!17199)))

(declare-fun bm!17197 () Bool)

(assert (=> bm!17197 (= call!17198 call!17199)))

(declare-fun b!154536 () Bool)

(assert (=> b!154536 (= c!29615 (and ((_ is Cons!1803) (toList!924 lt!80917)) (bvsgt (_1!1426 (h!2412 (toList!924 lt!80917))) (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (=> b!154536 (= e!100958 e!100957)))

(declare-fun b!154537 () Bool)

(assert (=> b!154537 (= e!100956 (insertStrictlySorted!99 (t!6601 (toList!924 lt!80917)) (_1!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154538 () Bool)

(assert (=> b!154538 (= e!100957 call!17198)))

(assert (= (and d!50769 c!29616) b!154532))

(assert (= (and d!50769 (not c!29616)) b!154530))

(assert (= (and b!154530 c!29613) b!154535))

(assert (= (and b!154530 (not c!29613)) b!154536))

(assert (= (and b!154536 c!29615) b!154538))

(assert (= (and b!154536 (not c!29615)) b!154529))

(assert (= (or b!154538 b!154529) bm!17197))

(assert (= (or b!154535 bm!17197) bm!17196))

(assert (= (or b!154532 bm!17196) bm!17195))

(assert (= (and bm!17195 c!29614) b!154537))

(assert (= (and bm!17195 (not c!29614)) b!154531))

(assert (= (and d!50769 res!72955) b!154533))

(assert (= (and b!154533 res!72954) b!154534))

(declare-fun m!188489 () Bool)

(assert (=> b!154537 m!188489))

(declare-fun m!188491 () Bool)

(assert (=> d!50769 m!188491))

(declare-fun m!188493 () Bool)

(assert (=> d!50769 m!188493))

(declare-fun m!188495 () Bool)

(assert (=> b!154534 m!188495))

(declare-fun m!188497 () Bool)

(assert (=> b!154533 m!188497))

(declare-fun m!188499 () Bool)

(assert (=> bm!17195 m!188499))

(assert (=> d!50637 d!50769))

(declare-fun d!50771 () Bool)

(assert (=> d!50771 (= (validMask!0 (mask!7468 newMap!16)) (and (or (= (mask!7468 newMap!16) #b00000000000000000000000000000111) (= (mask!7468 newMap!16) #b00000000000000000000000000001111) (= (mask!7468 newMap!16) #b00000000000000000000000000011111) (= (mask!7468 newMap!16) #b00000000000000000000000000111111) (= (mask!7468 newMap!16) #b00000000000000000000000001111111) (= (mask!7468 newMap!16) #b00000000000000000000000011111111) (= (mask!7468 newMap!16) #b00000000000000000000000111111111) (= (mask!7468 newMap!16) #b00000000000000000000001111111111) (= (mask!7468 newMap!16) #b00000000000000000000011111111111) (= (mask!7468 newMap!16) #b00000000000000000000111111111111) (= (mask!7468 newMap!16) #b00000000000000000001111111111111) (= (mask!7468 newMap!16) #b00000000000000000011111111111111) (= (mask!7468 newMap!16) #b00000000000000000111111111111111) (= (mask!7468 newMap!16) #b00000000000000001111111111111111) (= (mask!7468 newMap!16) #b00000000000000011111111111111111) (= (mask!7468 newMap!16) #b00000000000000111111111111111111) (= (mask!7468 newMap!16) #b00000000000001111111111111111111) (= (mask!7468 newMap!16) #b00000000000011111111111111111111) (= (mask!7468 newMap!16) #b00000000000111111111111111111111) (= (mask!7468 newMap!16) #b00000000001111111111111111111111) (= (mask!7468 newMap!16) #b00000000011111111111111111111111) (= (mask!7468 newMap!16) #b00000000111111111111111111111111) (= (mask!7468 newMap!16) #b00000001111111111111111111111111) (= (mask!7468 newMap!16) #b00000011111111111111111111111111) (= (mask!7468 newMap!16) #b00000111111111111111111111111111) (= (mask!7468 newMap!16) #b00001111111111111111111111111111) (= (mask!7468 newMap!16) #b00011111111111111111111111111111) (= (mask!7468 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!7468 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!50627 d!50771))

(declare-fun d!50773 () Bool)

(declare-fun e!100961 () Bool)

(assert (=> d!50773 e!100961))

(declare-fun res!72956 () Bool)

(assert (=> d!50773 (=> res!72956 e!100961)))

(declare-fun lt!81136 () Bool)

(assert (=> d!50773 (= res!72956 (not lt!81136))))

(declare-fun lt!81139 () Bool)

(assert (=> d!50773 (= lt!81136 lt!81139)))

(declare-fun lt!81138 () Unit!4899)

(declare-fun e!100962 () Unit!4899)

(assert (=> d!50773 (= lt!81138 e!100962)))

(declare-fun c!29617 () Bool)

(assert (=> d!50773 (= c!29617 lt!81139)))

(assert (=> d!50773 (= lt!81139 (containsKey!187 (toList!924 lt!81060) (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50773 (= (contains!968 lt!81060 (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81136)))

(declare-fun b!154539 () Bool)

(declare-fun lt!81137 () Unit!4899)

(assert (=> b!154539 (= e!100962 lt!81137)))

(assert (=> b!154539 (= lt!81137 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!81060) (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> b!154539 (isDefined!136 (getValueByKey!183 (toList!924 lt!81060) (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154540 () Bool)

(declare-fun Unit!4914 () Unit!4899)

(assert (=> b!154540 (= e!100962 Unit!4914)))

(declare-fun b!154541 () Bool)

(assert (=> b!154541 (= e!100961 (isDefined!136 (getValueByKey!183 (toList!924 lt!81060) (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (= (and d!50773 c!29617) b!154539))

(assert (= (and d!50773 (not c!29617)) b!154540))

(assert (= (and d!50773 (not res!72956)) b!154541))

(declare-fun m!188501 () Bool)

(assert (=> d!50773 m!188501))

(declare-fun m!188503 () Bool)

(assert (=> b!154539 m!188503))

(assert (=> b!154539 m!188199))

(assert (=> b!154539 m!188199))

(declare-fun m!188505 () Bool)

(assert (=> b!154539 m!188505))

(assert (=> b!154541 m!188199))

(assert (=> b!154541 m!188199))

(assert (=> b!154541 m!188505))

(assert (=> d!50653 d!50773))

(declare-fun d!50775 () Bool)

(declare-fun c!29618 () Bool)

(assert (=> d!50775 (= c!29618 (and ((_ is Cons!1803) lt!81061) (= (_1!1426 (h!2412 lt!81061)) (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun e!100963 () Option!189)

(assert (=> d!50775 (= (getValueByKey!183 lt!81061 (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) e!100963)))

(declare-fun b!154543 () Bool)

(declare-fun e!100964 () Option!189)

(assert (=> b!154543 (= e!100963 e!100964)))

(declare-fun c!29619 () Bool)

(assert (=> b!154543 (= c!29619 (and ((_ is Cons!1803) lt!81061) (not (= (_1!1426 (h!2412 lt!81061)) (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun b!154544 () Bool)

(assert (=> b!154544 (= e!100964 (getValueByKey!183 (t!6601 lt!81061) (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154542 () Bool)

(assert (=> b!154542 (= e!100963 (Some!188 (_2!1426 (h!2412 lt!81061))))))

(declare-fun b!154545 () Bool)

(assert (=> b!154545 (= e!100964 None!187)))

(assert (= (and d!50775 c!29618) b!154542))

(assert (= (and d!50775 (not c!29618)) b!154543))

(assert (= (and b!154543 c!29619) b!154544))

(assert (= (and b!154543 (not c!29619)) b!154545))

(declare-fun m!188507 () Bool)

(assert (=> b!154544 m!188507))

(assert (=> d!50653 d!50775))

(declare-fun d!50777 () Bool)

(assert (=> d!50777 (= (getValueByKey!183 lt!81061 (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun lt!81140 () Unit!4899)

(assert (=> d!50777 (= lt!81140 (choose!919 lt!81061 (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun e!100965 () Bool)

(assert (=> d!50777 e!100965))

(declare-fun res!72957 () Bool)

(assert (=> d!50777 (=> (not res!72957) (not e!100965))))

(assert (=> d!50777 (= res!72957 (isStrictlySorted!330 lt!81061))))

(assert (=> d!50777 (= (lemmaContainsTupThenGetReturnValue!96 lt!81061 (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81140)))

(declare-fun b!154546 () Bool)

(declare-fun res!72958 () Bool)

(assert (=> b!154546 (=> (not res!72958) (not e!100965))))

(assert (=> b!154546 (= res!72958 (containsKey!187 lt!81061 (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154547 () Bool)

(assert (=> b!154547 (= e!100965 (contains!970 lt!81061 (tuple2!2831 (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (= (and d!50777 res!72957) b!154546))

(assert (= (and b!154546 res!72958) b!154547))

(assert (=> d!50777 m!188193))

(declare-fun m!188509 () Bool)

(assert (=> d!50777 m!188509))

(declare-fun m!188511 () Bool)

(assert (=> d!50777 m!188511))

(declare-fun m!188513 () Bool)

(assert (=> b!154546 m!188513))

(declare-fun m!188515 () Bool)

(assert (=> b!154547 m!188515))

(assert (=> d!50653 d!50777))

(declare-fun d!50779 () Bool)

(declare-fun e!100969 () Bool)

(assert (=> d!50779 e!100969))

(declare-fun res!72960 () Bool)

(assert (=> d!50779 (=> (not res!72960) (not e!100969))))

(declare-fun lt!81141 () List!1807)

(assert (=> d!50779 (= res!72960 (isStrictlySorted!330 lt!81141))))

(declare-fun e!100970 () List!1807)

(assert (=> d!50779 (= lt!81141 e!100970)))

(declare-fun c!29623 () Bool)

(assert (=> d!50779 (= c!29623 (and ((_ is Cons!1803) (toList!924 lt!80904)) (bvslt (_1!1426 (h!2412 (toList!924 lt!80904))) (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (=> d!50779 (isStrictlySorted!330 (toList!924 lt!80904))))

(assert (=> d!50779 (= (insertStrictlySorted!99 (toList!924 lt!80904) (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81141)))

(declare-fun b!154548 () Bool)

(declare-fun e!100967 () List!1807)

(declare-fun call!17201 () List!1807)

(assert (=> b!154548 (= e!100967 call!17201)))

(declare-fun b!154549 () Bool)

(declare-fun e!100968 () List!1807)

(assert (=> b!154549 (= e!100970 e!100968)))

(declare-fun c!29620 () Bool)

(assert (=> b!154549 (= c!29620 (and ((_ is Cons!1803) (toList!924 lt!80904)) (= (_1!1426 (h!2412 (toList!924 lt!80904))) (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun c!29622 () Bool)

(declare-fun b!154550 () Bool)

(declare-fun e!100966 () List!1807)

(assert (=> b!154550 (= e!100966 (ite c!29620 (t!6601 (toList!924 lt!80904)) (ite c!29622 (Cons!1803 (h!2412 (toList!924 lt!80904)) (t!6601 (toList!924 lt!80904))) Nil!1804)))))

(declare-fun call!17203 () List!1807)

(declare-fun bm!17198 () Bool)

(assert (=> bm!17198 (= call!17203 ($colon$colon!96 e!100966 (ite c!29623 (h!2412 (toList!924 lt!80904)) (tuple2!2831 (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun c!29621 () Bool)

(assert (=> bm!17198 (= c!29621 c!29623)))

(declare-fun b!154551 () Bool)

(assert (=> b!154551 (= e!100970 call!17203)))

(declare-fun bm!17199 () Bool)

(declare-fun call!17202 () List!1807)

(assert (=> bm!17199 (= call!17202 call!17203)))

(declare-fun b!154552 () Bool)

(declare-fun res!72959 () Bool)

(assert (=> b!154552 (=> (not res!72959) (not e!100969))))

(assert (=> b!154552 (= res!72959 (containsKey!187 lt!81141 (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154553 () Bool)

(assert (=> b!154553 (= e!100969 (contains!970 lt!81141 (tuple2!2831 (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154554 () Bool)

(assert (=> b!154554 (= e!100968 call!17202)))

(declare-fun bm!17200 () Bool)

(assert (=> bm!17200 (= call!17201 call!17202)))

(declare-fun b!154555 () Bool)

(assert (=> b!154555 (= c!29622 (and ((_ is Cons!1803) (toList!924 lt!80904)) (bvsgt (_1!1426 (h!2412 (toList!924 lt!80904))) (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (=> b!154555 (= e!100968 e!100967)))

(declare-fun b!154556 () Bool)

(assert (=> b!154556 (= e!100966 (insertStrictlySorted!99 (t!6601 (toList!924 lt!80904)) (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154557 () Bool)

(assert (=> b!154557 (= e!100967 call!17201)))

(assert (= (and d!50779 c!29623) b!154551))

(assert (= (and d!50779 (not c!29623)) b!154549))

(assert (= (and b!154549 c!29620) b!154554))

(assert (= (and b!154549 (not c!29620)) b!154555))

(assert (= (and b!154555 c!29622) b!154557))

(assert (= (and b!154555 (not c!29622)) b!154548))

(assert (= (or b!154557 b!154548) bm!17200))

(assert (= (or b!154554 bm!17200) bm!17199))

(assert (= (or b!154551 bm!17199) bm!17198))

(assert (= (and bm!17198 c!29621) b!154556))

(assert (= (and bm!17198 (not c!29621)) b!154550))

(assert (= (and d!50779 res!72960) b!154552))

(assert (= (and b!154552 res!72959) b!154553))

(declare-fun m!188517 () Bool)

(assert (=> b!154556 m!188517))

(declare-fun m!188519 () Bool)

(assert (=> d!50779 m!188519))

(declare-fun m!188521 () Bool)

(assert (=> d!50779 m!188521))

(declare-fun m!188523 () Bool)

(assert (=> b!154553 m!188523))

(declare-fun m!188525 () Bool)

(assert (=> b!154552 m!188525))

(declare-fun m!188527 () Bool)

(assert (=> bm!17198 m!188527))

(assert (=> d!50653 d!50779))

(assert (=> b!154234 d!50665))

(declare-fun d!50781 () Bool)

(assert (=> d!50781 (= (validKeyInArray!0 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!154270 d!50781))

(declare-fun d!50783 () Bool)

(assert (=> d!50783 (= (apply!128 lt!81021 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)) (get!1609 (getValueByKey!183 (toList!924 lt!81021) (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!6539 () Bool)

(assert (= bs!6539 d!50783))

(assert (=> bs!6539 m!187941))

(declare-fun m!188529 () Bool)

(assert (=> bs!6539 m!188529))

(assert (=> bs!6539 m!188529))

(declare-fun m!188531 () Bool)

(assert (=> bs!6539 m!188531))

(assert (=> b!154311 d!50783))

(declare-fun d!50785 () Bool)

(declare-fun c!29624 () Bool)

(assert (=> d!50785 (= c!29624 ((_ is ValueCellFull!1170) (select (arr!2412 (_values!3047 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!100971 () V!3683)

(assert (=> d!50785 (= (get!1608 (select (arr!2412 (_values!3047 newMap!16)) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3064 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!100971)))

(declare-fun b!154558 () Bool)

(assert (=> b!154558 (= e!100971 (get!1610 (select (arr!2412 (_values!3047 newMap!16)) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3064 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154559 () Bool)

(assert (=> b!154559 (= e!100971 (get!1611 (select (arr!2412 (_values!3047 newMap!16)) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3064 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50785 c!29624) b!154558))

(assert (= (and d!50785 (not c!29624)) b!154559))

(assert (=> b!154558 m!188067))

(assert (=> b!154558 m!188063))

(declare-fun m!188533 () Bool)

(assert (=> b!154558 m!188533))

(assert (=> b!154559 m!188067))

(assert (=> b!154559 m!188063))

(declare-fun m!188535 () Bool)

(assert (=> b!154559 m!188535))

(assert (=> b!154311 d!50785))

(declare-fun d!50787 () Bool)

(assert (=> d!50787 (isDefined!136 (getValueByKey!183 (toList!924 lt!80911) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!81142 () Unit!4899)

(assert (=> d!50787 (= lt!81142 (choose!920 (toList!924 lt!80911) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!100972 () Bool)

(assert (=> d!50787 e!100972))

(declare-fun res!72961 () Bool)

(assert (=> d!50787 (=> (not res!72961) (not e!100972))))

(assert (=> d!50787 (= res!72961 (isStrictlySorted!330 (toList!924 lt!80911)))))

(assert (=> d!50787 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!80911) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!81142)))

(declare-fun b!154560 () Bool)

(assert (=> b!154560 (= e!100972 (containsKey!187 (toList!924 lt!80911) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!50787 res!72961) b!154560))

(assert (=> d!50787 m!187841))

(assert (=> d!50787 m!187937))

(assert (=> d!50787 m!187937))

(assert (=> d!50787 m!187939))

(assert (=> d!50787 m!187841))

(declare-fun m!188537 () Bool)

(assert (=> d!50787 m!188537))

(assert (=> d!50787 m!188403))

(assert (=> b!154560 m!187841))

(assert (=> b!154560 m!187933))

(assert (=> b!154223 d!50787))

(declare-fun d!50789 () Bool)

(assert (=> d!50789 (= (isDefined!136 (getValueByKey!183 (toList!924 lt!80911) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (not (isEmpty!431 (getValueByKey!183 (toList!924 lt!80911) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun bs!6540 () Bool)

(assert (= bs!6540 d!50789))

(assert (=> bs!6540 m!187937))

(declare-fun m!188539 () Bool)

(assert (=> bs!6540 m!188539))

(assert (=> b!154223 d!50789))

(declare-fun d!50791 () Bool)

(declare-fun c!29625 () Bool)

(assert (=> d!50791 (= c!29625 (and ((_ is Cons!1803) (toList!924 lt!80911)) (= (_1!1426 (h!2412 (toList!924 lt!80911))) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun e!100973 () Option!189)

(assert (=> d!50791 (= (getValueByKey!183 (toList!924 lt!80911) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!100973)))

(declare-fun b!154562 () Bool)

(declare-fun e!100974 () Option!189)

(assert (=> b!154562 (= e!100973 e!100974)))

(declare-fun c!29626 () Bool)

(assert (=> b!154562 (= c!29626 (and ((_ is Cons!1803) (toList!924 lt!80911)) (not (= (_1!1426 (h!2412 (toList!924 lt!80911))) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun b!154563 () Bool)

(assert (=> b!154563 (= e!100974 (getValueByKey!183 (t!6601 (toList!924 lt!80911)) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!154561 () Bool)

(assert (=> b!154561 (= e!100973 (Some!188 (_2!1426 (h!2412 (toList!924 lt!80911)))))))

(declare-fun b!154564 () Bool)

(assert (=> b!154564 (= e!100974 None!187)))

(assert (= (and d!50791 c!29625) b!154561))

(assert (= (and d!50791 (not c!29625)) b!154562))

(assert (= (and b!154562 c!29626) b!154563))

(assert (= (and b!154562 (not c!29626)) b!154564))

(assert (=> b!154563 m!187841))

(declare-fun m!188541 () Bool)

(assert (=> b!154563 m!188541))

(assert (=> b!154223 d!50791))

(declare-fun d!50793 () Bool)

(assert (=> d!50793 (isDefined!136 (getValueByKey!183 (toList!924 lt!80911) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!81143 () Unit!4899)

(assert (=> d!50793 (= lt!81143 (choose!920 (toList!924 lt!80911) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!100975 () Bool)

(assert (=> d!50793 e!100975))

(declare-fun res!72962 () Bool)

(assert (=> d!50793 (=> (not res!72962) (not e!100975))))

(assert (=> d!50793 (= res!72962 (isStrictlySorted!330 (toList!924 lt!80911)))))

(assert (=> d!50793 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!80911) #b1000000000000000000000000000000000000000000000000000000000000000) lt!81143)))

(declare-fun b!154565 () Bool)

(assert (=> b!154565 (= e!100975 (containsKey!187 (toList!924 lt!80911) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!50793 res!72962) b!154565))

(assert (=> d!50793 m!187929))

(assert (=> d!50793 m!187929))

(assert (=> d!50793 m!187931))

(declare-fun m!188543 () Bool)

(assert (=> d!50793 m!188543))

(assert (=> d!50793 m!188403))

(assert (=> b!154565 m!187925))

(assert (=> b!154220 d!50793))

(declare-fun d!50795 () Bool)

(assert (=> d!50795 (= (isDefined!136 (getValueByKey!183 (toList!924 lt!80911) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!431 (getValueByKey!183 (toList!924 lt!80911) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!6541 () Bool)

(assert (= bs!6541 d!50795))

(assert (=> bs!6541 m!187929))

(declare-fun m!188545 () Bool)

(assert (=> bs!6541 m!188545))

(assert (=> b!154220 d!50795))

(declare-fun d!50797 () Bool)

(declare-fun c!29627 () Bool)

(assert (=> d!50797 (= c!29627 (and ((_ is Cons!1803) (toList!924 lt!80911)) (= (_1!1426 (h!2412 (toList!924 lt!80911))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!100976 () Option!189)

(assert (=> d!50797 (= (getValueByKey!183 (toList!924 lt!80911) #b1000000000000000000000000000000000000000000000000000000000000000) e!100976)))

(declare-fun b!154567 () Bool)

(declare-fun e!100977 () Option!189)

(assert (=> b!154567 (= e!100976 e!100977)))

(declare-fun c!29628 () Bool)

(assert (=> b!154567 (= c!29628 (and ((_ is Cons!1803) (toList!924 lt!80911)) (not (= (_1!1426 (h!2412 (toList!924 lt!80911))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!154568 () Bool)

(assert (=> b!154568 (= e!100977 (getValueByKey!183 (t!6601 (toList!924 lt!80911)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154566 () Bool)

(assert (=> b!154566 (= e!100976 (Some!188 (_2!1426 (h!2412 (toList!924 lt!80911)))))))

(declare-fun b!154569 () Bool)

(assert (=> b!154569 (= e!100977 None!187)))

(assert (= (and d!50797 c!29627) b!154566))

(assert (= (and d!50797 (not c!29627)) b!154567))

(assert (= (and b!154567 c!29628) b!154568))

(assert (= (and b!154567 (not c!29628)) b!154569))

(declare-fun m!188547 () Bool)

(assert (=> b!154568 m!188547))

(assert (=> b!154220 d!50797))

(declare-fun d!50799 () Bool)

(assert (=> d!50799 (= (get!1609 (getValueByKey!183 (toList!924 lt!80919) lt!80915)) (v!3422 (getValueByKey!183 (toList!924 lt!80919) lt!80915)))))

(assert (=> d!50643 d!50799))

(declare-fun d!50801 () Bool)

(declare-fun c!29629 () Bool)

(assert (=> d!50801 (= c!29629 (and ((_ is Cons!1803) (toList!924 lt!80919)) (= (_1!1426 (h!2412 (toList!924 lt!80919))) lt!80915)))))

(declare-fun e!100978 () Option!189)

(assert (=> d!50801 (= (getValueByKey!183 (toList!924 lt!80919) lt!80915) e!100978)))

(declare-fun b!154571 () Bool)

(declare-fun e!100979 () Option!189)

(assert (=> b!154571 (= e!100978 e!100979)))

(declare-fun c!29630 () Bool)

(assert (=> b!154571 (= c!29630 (and ((_ is Cons!1803) (toList!924 lt!80919)) (not (= (_1!1426 (h!2412 (toList!924 lt!80919))) lt!80915))))))

(declare-fun b!154572 () Bool)

(assert (=> b!154572 (= e!100979 (getValueByKey!183 (t!6601 (toList!924 lt!80919)) lt!80915))))

(declare-fun b!154570 () Bool)

(assert (=> b!154570 (= e!100978 (Some!188 (_2!1426 (h!2412 (toList!924 lt!80919)))))))

(declare-fun b!154573 () Bool)

(assert (=> b!154573 (= e!100979 None!187)))

(assert (= (and d!50801 c!29629) b!154570))

(assert (= (and d!50801 (not c!29629)) b!154571))

(assert (= (and b!154571 c!29630) b!154572))

(assert (= (and b!154571 (not c!29630)) b!154573))

(declare-fun m!188549 () Bool)

(assert (=> b!154572 m!188549))

(assert (=> d!50643 d!50801))

(declare-fun d!50803 () Bool)

(declare-fun e!100980 () Bool)

(assert (=> d!50803 e!100980))

(declare-fun res!72963 () Bool)

(assert (=> d!50803 (=> res!72963 e!100980)))

(declare-fun lt!81144 () Bool)

(assert (=> d!50803 (= res!72963 (not lt!81144))))

(declare-fun lt!81147 () Bool)

(assert (=> d!50803 (= lt!81144 lt!81147)))

(declare-fun lt!81146 () Unit!4899)

(declare-fun e!100981 () Unit!4899)

(assert (=> d!50803 (= lt!81146 e!100981)))

(declare-fun c!29631 () Bool)

(assert (=> d!50803 (= c!29631 lt!81147)))

(assert (=> d!50803 (= lt!81147 (containsKey!187 (toList!924 lt!81021) (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!50803 (= (contains!968 lt!81021 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)) lt!81144)))

(declare-fun b!154574 () Bool)

(declare-fun lt!81145 () Unit!4899)

(assert (=> b!154574 (= e!100981 lt!81145)))

(assert (=> b!154574 (= lt!81145 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!81021) (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!154574 (isDefined!136 (getValueByKey!183 (toList!924 lt!81021) (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154575 () Bool)

(declare-fun Unit!4915 () Unit!4899)

(assert (=> b!154575 (= e!100981 Unit!4915)))

(declare-fun b!154576 () Bool)

(assert (=> b!154576 (= e!100980 (isDefined!136 (getValueByKey!183 (toList!924 lt!81021) (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!50803 c!29631) b!154574))

(assert (= (and d!50803 (not c!29631)) b!154575))

(assert (= (and d!50803 (not res!72963)) b!154576))

(assert (=> d!50803 m!187941))

(declare-fun m!188551 () Bool)

(assert (=> d!50803 m!188551))

(assert (=> b!154574 m!187941))

(declare-fun m!188553 () Bool)

(assert (=> b!154574 m!188553))

(assert (=> b!154574 m!187941))

(assert (=> b!154574 m!188529))

(assert (=> b!154574 m!188529))

(declare-fun m!188555 () Bool)

(assert (=> b!154574 m!188555))

(assert (=> b!154576 m!187941))

(assert (=> b!154576 m!188529))

(assert (=> b!154576 m!188529))

(assert (=> b!154576 m!188555))

(assert (=> b!154308 d!50803))

(declare-fun d!50805 () Bool)

(declare-fun e!100982 () Bool)

(assert (=> d!50805 e!100982))

(declare-fun res!72964 () Bool)

(assert (=> d!50805 (=> res!72964 e!100982)))

(declare-fun lt!81148 () Bool)

(assert (=> d!50805 (= res!72964 (not lt!81148))))

(declare-fun lt!81151 () Bool)

(assert (=> d!50805 (= lt!81148 lt!81151)))

(declare-fun lt!81150 () Unit!4899)

(declare-fun e!100983 () Unit!4899)

(assert (=> d!50805 (= lt!81150 e!100983)))

(declare-fun c!29632 () Bool)

(assert (=> d!50805 (= c!29632 lt!81151)))

(assert (=> d!50805 (= lt!81151 (containsKey!187 (toList!924 lt!80982) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50805 (= (contains!968 lt!80982 (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81148)))

(declare-fun b!154577 () Bool)

(declare-fun lt!81149 () Unit!4899)

(assert (=> b!154577 (= e!100983 lt!81149)))

(assert (=> b!154577 (= lt!81149 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!80982) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> b!154577 (isDefined!136 (getValueByKey!183 (toList!924 lt!80982) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154578 () Bool)

(declare-fun Unit!4916 () Unit!4899)

(assert (=> b!154578 (= e!100983 Unit!4916)))

(declare-fun b!154579 () Bool)

(assert (=> b!154579 (= e!100982 (isDefined!136 (getValueByKey!183 (toList!924 lt!80982) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (= (and d!50805 c!29632) b!154577))

(assert (= (and d!50805 (not c!29632)) b!154578))

(assert (= (and d!50805 (not res!72964)) b!154579))

(declare-fun m!188557 () Bool)

(assert (=> d!50805 m!188557))

(declare-fun m!188559 () Bool)

(assert (=> b!154577 m!188559))

(assert (=> b!154577 m!187985))

(assert (=> b!154577 m!187985))

(declare-fun m!188561 () Bool)

(assert (=> b!154577 m!188561))

(assert (=> b!154579 m!187985))

(assert (=> b!154579 m!187985))

(assert (=> b!154579 m!188561))

(assert (=> d!50617 d!50805))

(declare-fun d!50807 () Bool)

(declare-fun c!29633 () Bool)

(assert (=> d!50807 (= c!29633 (and ((_ is Cons!1803) lt!80983) (= (_1!1426 (h!2412 lt!80983)) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun e!100984 () Option!189)

(assert (=> d!50807 (= (getValueByKey!183 lt!80983 (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) e!100984)))

(declare-fun b!154581 () Bool)

(declare-fun e!100985 () Option!189)

(assert (=> b!154581 (= e!100984 e!100985)))

(declare-fun c!29634 () Bool)

(assert (=> b!154581 (= c!29634 (and ((_ is Cons!1803) lt!80983) (not (= (_1!1426 (h!2412 lt!80983)) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun b!154582 () Bool)

(assert (=> b!154582 (= e!100985 (getValueByKey!183 (t!6601 lt!80983) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154580 () Bool)

(assert (=> b!154580 (= e!100984 (Some!188 (_2!1426 (h!2412 lt!80983))))))

(declare-fun b!154583 () Bool)

(assert (=> b!154583 (= e!100985 None!187)))

(assert (= (and d!50807 c!29633) b!154580))

(assert (= (and d!50807 (not c!29633)) b!154581))

(assert (= (and b!154581 c!29634) b!154582))

(assert (= (and b!154581 (not c!29634)) b!154583))

(declare-fun m!188563 () Bool)

(assert (=> b!154582 m!188563))

(assert (=> d!50617 d!50807))

(declare-fun d!50809 () Bool)

(assert (=> d!50809 (= (getValueByKey!183 lt!80983 (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun lt!81152 () Unit!4899)

(assert (=> d!50809 (= lt!81152 (choose!919 lt!80983 (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun e!100986 () Bool)

(assert (=> d!50809 e!100986))

(declare-fun res!72965 () Bool)

(assert (=> d!50809 (=> (not res!72965) (not e!100986))))

(assert (=> d!50809 (= res!72965 (isStrictlySorted!330 lt!80983))))

(assert (=> d!50809 (= (lemmaContainsTupThenGetReturnValue!96 lt!80983 (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81152)))

(declare-fun b!154584 () Bool)

(declare-fun res!72966 () Bool)

(assert (=> b!154584 (=> (not res!72966) (not e!100986))))

(assert (=> b!154584 (= res!72966 (containsKey!187 lt!80983 (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154585 () Bool)

(assert (=> b!154585 (= e!100986 (contains!970 lt!80983 (tuple2!2831 (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (= (and d!50809 res!72965) b!154584))

(assert (= (and b!154584 res!72966) b!154585))

(assert (=> d!50809 m!187979))

(declare-fun m!188565 () Bool)

(assert (=> d!50809 m!188565))

(declare-fun m!188567 () Bool)

(assert (=> d!50809 m!188567))

(declare-fun m!188569 () Bool)

(assert (=> b!154584 m!188569))

(declare-fun m!188571 () Bool)

(assert (=> b!154585 m!188571))

(assert (=> d!50617 d!50809))

(declare-fun d!50811 () Bool)

(declare-fun e!100990 () Bool)

(assert (=> d!50811 e!100990))

(declare-fun res!72968 () Bool)

(assert (=> d!50811 (=> (not res!72968) (not e!100990))))

(declare-fun lt!81153 () List!1807)

(assert (=> d!50811 (= res!72968 (isStrictlySorted!330 lt!81153))))

(declare-fun e!100991 () List!1807)

(assert (=> d!50811 (= lt!81153 e!100991)))

(declare-fun c!29638 () Bool)

(assert (=> d!50811 (= c!29638 (and ((_ is Cons!1803) (toList!924 call!17150)) (bvslt (_1!1426 (h!2412 (toList!924 call!17150))) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (=> d!50811 (isStrictlySorted!330 (toList!924 call!17150))))

(assert (=> d!50811 (= (insertStrictlySorted!99 (toList!924 call!17150) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81153)))

(declare-fun b!154586 () Bool)

(declare-fun e!100988 () List!1807)

(declare-fun call!17204 () List!1807)

(assert (=> b!154586 (= e!100988 call!17204)))

(declare-fun b!154587 () Bool)

(declare-fun e!100989 () List!1807)

(assert (=> b!154587 (= e!100991 e!100989)))

(declare-fun c!29635 () Bool)

(assert (=> b!154587 (= c!29635 (and ((_ is Cons!1803) (toList!924 call!17150)) (= (_1!1426 (h!2412 (toList!924 call!17150))) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun c!29637 () Bool)

(declare-fun b!154588 () Bool)

(declare-fun e!100987 () List!1807)

(assert (=> b!154588 (= e!100987 (ite c!29635 (t!6601 (toList!924 call!17150)) (ite c!29637 (Cons!1803 (h!2412 (toList!924 call!17150)) (t!6601 (toList!924 call!17150))) Nil!1804)))))

(declare-fun bm!17201 () Bool)

(declare-fun call!17206 () List!1807)

(assert (=> bm!17201 (= call!17206 ($colon$colon!96 e!100987 (ite c!29638 (h!2412 (toList!924 call!17150)) (tuple2!2831 (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun c!29636 () Bool)

(assert (=> bm!17201 (= c!29636 c!29638)))

(declare-fun b!154589 () Bool)

(assert (=> b!154589 (= e!100991 call!17206)))

(declare-fun bm!17202 () Bool)

(declare-fun call!17205 () List!1807)

(assert (=> bm!17202 (= call!17205 call!17206)))

(declare-fun b!154590 () Bool)

(declare-fun res!72967 () Bool)

(assert (=> b!154590 (=> (not res!72967) (not e!100990))))

(assert (=> b!154590 (= res!72967 (containsKey!187 lt!81153 (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154591 () Bool)

(assert (=> b!154591 (= e!100990 (contains!970 lt!81153 (tuple2!2831 (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154592 () Bool)

(assert (=> b!154592 (= e!100989 call!17205)))

(declare-fun bm!17203 () Bool)

(assert (=> bm!17203 (= call!17204 call!17205)))

(declare-fun b!154593 () Bool)

(assert (=> b!154593 (= c!29637 (and ((_ is Cons!1803) (toList!924 call!17150)) (bvsgt (_1!1426 (h!2412 (toList!924 call!17150))) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (=> b!154593 (= e!100989 e!100988)))

(declare-fun b!154594 () Bool)

(assert (=> b!154594 (= e!100987 (insertStrictlySorted!99 (t!6601 (toList!924 call!17150)) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154595 () Bool)

(assert (=> b!154595 (= e!100988 call!17204)))

(assert (= (and d!50811 c!29638) b!154589))

(assert (= (and d!50811 (not c!29638)) b!154587))

(assert (= (and b!154587 c!29635) b!154592))

(assert (= (and b!154587 (not c!29635)) b!154593))

(assert (= (and b!154593 c!29637) b!154595))

(assert (= (and b!154593 (not c!29637)) b!154586))

(assert (= (or b!154595 b!154586) bm!17203))

(assert (= (or b!154592 bm!17203) bm!17202))

(assert (= (or b!154589 bm!17202) bm!17201))

(assert (= (and bm!17201 c!29636) b!154594))

(assert (= (and bm!17201 (not c!29636)) b!154588))

(assert (= (and d!50811 res!72968) b!154590))

(assert (= (and b!154590 res!72967) b!154591))

(declare-fun m!188573 () Bool)

(assert (=> b!154594 m!188573))

(declare-fun m!188575 () Bool)

(assert (=> d!50811 m!188575))

(declare-fun m!188577 () Bool)

(assert (=> d!50811 m!188577))

(declare-fun m!188579 () Bool)

(assert (=> b!154591 m!188579))

(declare-fun m!188581 () Bool)

(assert (=> b!154590 m!188581))

(declare-fun m!188583 () Bool)

(assert (=> bm!17201 m!188583))

(assert (=> d!50617 d!50811))

(declare-fun d!50813 () Bool)

(declare-fun e!100992 () Bool)

(assert (=> d!50813 e!100992))

(declare-fun res!72969 () Bool)

(assert (=> d!50813 (=> res!72969 e!100992)))

(declare-fun lt!81154 () Bool)

(assert (=> d!50813 (= res!72969 (not lt!81154))))

(declare-fun lt!81157 () Bool)

(assert (=> d!50813 (= lt!81154 lt!81157)))

(declare-fun lt!81156 () Unit!4899)

(declare-fun e!100993 () Unit!4899)

(assert (=> d!50813 (= lt!81156 e!100993)))

(declare-fun c!29639 () Bool)

(assert (=> d!50813 (= c!29639 lt!81157)))

(assert (=> d!50813 (= lt!81157 (containsKey!187 (toList!924 lt!80941) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50813 (= (contains!968 lt!80941 #b1000000000000000000000000000000000000000000000000000000000000000) lt!81154)))

(declare-fun b!154596 () Bool)

(declare-fun lt!81155 () Unit!4899)

(assert (=> b!154596 (= e!100993 lt!81155)))

(assert (=> b!154596 (= lt!81155 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!80941) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154596 (isDefined!136 (getValueByKey!183 (toList!924 lt!80941) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154597 () Bool)

(declare-fun Unit!4917 () Unit!4899)

(assert (=> b!154597 (= e!100993 Unit!4917)))

(declare-fun b!154598 () Bool)

(assert (=> b!154598 (= e!100992 (isDefined!136 (getValueByKey!183 (toList!924 lt!80941) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50813 c!29639) b!154596))

(assert (= (and d!50813 (not c!29639)) b!154597))

(assert (= (and d!50813 (not res!72969)) b!154598))

(declare-fun m!188585 () Bool)

(assert (=> d!50813 m!188585))

(declare-fun m!188587 () Bool)

(assert (=> b!154596 m!188587))

(declare-fun m!188589 () Bool)

(assert (=> b!154596 m!188589))

(assert (=> b!154596 m!188589))

(declare-fun m!188591 () Bool)

(assert (=> b!154596 m!188591))

(assert (=> b!154598 m!188589))

(assert (=> b!154598 m!188589))

(assert (=> b!154598 m!188591))

(assert (=> b!154211 d!50813))

(declare-fun d!50815 () Bool)

(assert (=> d!50815 (= (apply!128 lt!80995 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1609 (getValueByKey!183 (toList!924 lt!80995) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6542 () Bool)

(assert (= bs!6542 d!50815))

(declare-fun m!188593 () Bool)

(assert (=> bs!6542 m!188593))

(assert (=> bs!6542 m!188593))

(declare-fun m!188595 () Bool)

(assert (=> bs!6542 m!188595))

(assert (=> b!154267 d!50815))

(declare-fun d!50817 () Bool)

(declare-fun lt!81158 () Bool)

(assert (=> d!50817 (= lt!81158 (select (content!145 (toList!924 lt!81052)) (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun e!100995 () Bool)

(assert (=> d!50817 (= lt!81158 e!100995)))

(declare-fun res!72971 () Bool)

(assert (=> d!50817 (=> (not res!72971) (not e!100995))))

(assert (=> d!50817 (= res!72971 ((_ is Cons!1803) (toList!924 lt!81052)))))

(assert (=> d!50817 (= (contains!970 (toList!924 lt!81052) (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!81158)))

(declare-fun b!154599 () Bool)

(declare-fun e!100994 () Bool)

(assert (=> b!154599 (= e!100995 e!100994)))

(declare-fun res!72970 () Bool)

(assert (=> b!154599 (=> res!72970 e!100994)))

(assert (=> b!154599 (= res!72970 (= (h!2412 (toList!924 lt!81052)) (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun b!154600 () Bool)

(assert (=> b!154600 (= e!100994 (contains!970 (t!6601 (toList!924 lt!81052)) (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(assert (= (and d!50817 res!72971) b!154599))

(assert (= (and b!154599 (not res!72970)) b!154600))

(declare-fun m!188597 () Bool)

(assert (=> d!50817 m!188597))

(declare-fun m!188599 () Bool)

(assert (=> d!50817 m!188599))

(declare-fun m!188601 () Bool)

(assert (=> b!154600 m!188601))

(assert (=> b!154351 d!50817))

(declare-fun d!50819 () Bool)

(declare-fun res!72972 () Bool)

(declare-fun e!100996 () Bool)

(assert (=> d!50819 (=> res!72972 e!100996)))

(assert (=> d!50819 (= res!72972 (and ((_ is Cons!1803) (toList!924 lt!80911)) (= (_1!1426 (h!2412 (toList!924 lt!80911))) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!50819 (= (containsKey!187 (toList!924 lt!80911) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!100996)))

(declare-fun b!154601 () Bool)

(declare-fun e!100997 () Bool)

(assert (=> b!154601 (= e!100996 e!100997)))

(declare-fun res!72973 () Bool)

(assert (=> b!154601 (=> (not res!72973) (not e!100997))))

(assert (=> b!154601 (= res!72973 (and (or (not ((_ is Cons!1803) (toList!924 lt!80911))) (bvsle (_1!1426 (h!2412 (toList!924 lt!80911))) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) ((_ is Cons!1803) (toList!924 lt!80911)) (bvslt (_1!1426 (h!2412 (toList!924 lt!80911))) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun b!154602 () Bool)

(assert (=> b!154602 (= e!100997 (containsKey!187 (t!6601 (toList!924 lt!80911)) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!50819 (not res!72972)) b!154601))

(assert (= (and b!154601 res!72973) b!154602))

(assert (=> b!154602 m!187841))

(declare-fun m!188603 () Bool)

(assert (=> b!154602 m!188603))

(assert (=> d!50601 d!50819))

(assert (=> b!154210 d!50625))

(declare-fun d!50821 () Bool)

(assert (=> d!50821 (not (contains!968 (+!192 lt!80940 (tuple2!2831 lt!80937 lt!80942)) lt!80938))))

(declare-fun lt!81161 () Unit!4899)

(declare-fun choose!921 (ListLongMap!1817 (_ BitVec 64) V!3683 (_ BitVec 64)) Unit!4899)

(assert (=> d!50821 (= lt!81161 (choose!921 lt!80940 lt!80937 lt!80942 lt!80938))))

(declare-fun e!101000 () Bool)

(assert (=> d!50821 e!101000))

(declare-fun res!72976 () Bool)

(assert (=> d!50821 (=> (not res!72976) (not e!101000))))

(assert (=> d!50821 (= res!72976 (not (contains!968 lt!80940 lt!80938)))))

(assert (=> d!50821 (= (addStillNotContains!70 lt!80940 lt!80937 lt!80942 lt!80938) lt!81161)))

(declare-fun b!154606 () Bool)

(assert (=> b!154606 (= e!101000 (not (= lt!80937 lt!80938)))))

(assert (= (and d!50821 res!72976) b!154606))

(assert (=> d!50821 m!187917))

(assert (=> d!50821 m!187917))

(assert (=> d!50821 m!187919))

(declare-fun m!188605 () Bool)

(assert (=> d!50821 m!188605))

(declare-fun m!188607 () Bool)

(assert (=> d!50821 m!188607))

(assert (=> b!154210 d!50821))

(declare-fun d!50823 () Bool)

(declare-fun e!101001 () Bool)

(assert (=> d!50823 e!101001))

(declare-fun res!72977 () Bool)

(assert (=> d!50823 (=> res!72977 e!101001)))

(declare-fun lt!81162 () Bool)

(assert (=> d!50823 (= res!72977 (not lt!81162))))

(declare-fun lt!81165 () Bool)

(assert (=> d!50823 (= lt!81162 lt!81165)))

(declare-fun lt!81164 () Unit!4899)

(declare-fun e!101002 () Unit!4899)

(assert (=> d!50823 (= lt!81164 e!101002)))

(declare-fun c!29640 () Bool)

(assert (=> d!50823 (= c!29640 lt!81165)))

(assert (=> d!50823 (= lt!81165 (containsKey!187 (toList!924 (+!192 lt!80940 (tuple2!2831 lt!80937 lt!80942))) lt!80938))))

(assert (=> d!50823 (= (contains!968 (+!192 lt!80940 (tuple2!2831 lt!80937 lt!80942)) lt!80938) lt!81162)))

(declare-fun b!154607 () Bool)

(declare-fun lt!81163 () Unit!4899)

(assert (=> b!154607 (= e!101002 lt!81163)))

(assert (=> b!154607 (= lt!81163 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 (+!192 lt!80940 (tuple2!2831 lt!80937 lt!80942))) lt!80938))))

(assert (=> b!154607 (isDefined!136 (getValueByKey!183 (toList!924 (+!192 lt!80940 (tuple2!2831 lt!80937 lt!80942))) lt!80938))))

(declare-fun b!154608 () Bool)

(declare-fun Unit!4918 () Unit!4899)

(assert (=> b!154608 (= e!101002 Unit!4918)))

(declare-fun b!154609 () Bool)

(assert (=> b!154609 (= e!101001 (isDefined!136 (getValueByKey!183 (toList!924 (+!192 lt!80940 (tuple2!2831 lt!80937 lt!80942))) lt!80938)))))

(assert (= (and d!50823 c!29640) b!154607))

(assert (= (and d!50823 (not c!29640)) b!154608))

(assert (= (and d!50823 (not res!72977)) b!154609))

(declare-fun m!188609 () Bool)

(assert (=> d!50823 m!188609))

(declare-fun m!188611 () Bool)

(assert (=> b!154607 m!188611))

(declare-fun m!188613 () Bool)

(assert (=> b!154607 m!188613))

(assert (=> b!154607 m!188613))

(declare-fun m!188615 () Bool)

(assert (=> b!154607 m!188615))

(assert (=> b!154609 m!188613))

(assert (=> b!154609 m!188613))

(assert (=> b!154609 m!188615))

(assert (=> b!154210 d!50823))

(declare-fun d!50825 () Bool)

(declare-fun e!101003 () Bool)

(assert (=> d!50825 e!101003))

(declare-fun res!72979 () Bool)

(assert (=> d!50825 (=> (not res!72979) (not e!101003))))

(declare-fun lt!81167 () ListLongMap!1817)

(assert (=> d!50825 (= res!72979 (contains!968 lt!81167 (_1!1426 (tuple2!2831 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!81168 () List!1807)

(assert (=> d!50825 (= lt!81167 (ListLongMap!1818 lt!81168))))

(declare-fun lt!81166 () Unit!4899)

(declare-fun lt!81169 () Unit!4899)

(assert (=> d!50825 (= lt!81166 lt!81169)))

(assert (=> d!50825 (= (getValueByKey!183 lt!81168 (_1!1426 (tuple2!2831 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!188 (_2!1426 (tuple2!2831 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!50825 (= lt!81169 (lemmaContainsTupThenGetReturnValue!96 lt!81168 (_1!1426 (tuple2!2831 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1426 (tuple2!2831 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!50825 (= lt!81168 (insertStrictlySorted!99 (toList!924 call!17159) (_1!1426 (tuple2!2831 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1426 (tuple2!2831 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!50825 (= (+!192 call!17159 (tuple2!2831 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!81167)))

(declare-fun b!154610 () Bool)

(declare-fun res!72978 () Bool)

(assert (=> b!154610 (=> (not res!72978) (not e!101003))))

(assert (=> b!154610 (= res!72978 (= (getValueByKey!183 (toList!924 lt!81167) (_1!1426 (tuple2!2831 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!188 (_2!1426 (tuple2!2831 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!154611 () Bool)

(assert (=> b!154611 (= e!101003 (contains!970 (toList!924 lt!81167) (tuple2!2831 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!50825 res!72979) b!154610))

(assert (= (and b!154610 res!72978) b!154611))

(declare-fun m!188617 () Bool)

(assert (=> d!50825 m!188617))

(declare-fun m!188619 () Bool)

(assert (=> d!50825 m!188619))

(declare-fun m!188621 () Bool)

(assert (=> d!50825 m!188621))

(declare-fun m!188623 () Bool)

(assert (=> d!50825 m!188623))

(declare-fun m!188625 () Bool)

(assert (=> b!154610 m!188625))

(declare-fun m!188627 () Bool)

(assert (=> b!154611 m!188627))

(assert (=> b!154210 d!50825))

(declare-fun d!50827 () Bool)

(declare-fun e!101004 () Bool)

(assert (=> d!50827 e!101004))

(declare-fun res!72981 () Bool)

(assert (=> d!50827 (=> (not res!72981) (not e!101004))))

(declare-fun lt!81171 () ListLongMap!1817)

(assert (=> d!50827 (= res!72981 (contains!968 lt!81171 (_1!1426 (tuple2!2831 lt!80937 lt!80942))))))

(declare-fun lt!81172 () List!1807)

(assert (=> d!50827 (= lt!81171 (ListLongMap!1818 lt!81172))))

(declare-fun lt!81170 () Unit!4899)

(declare-fun lt!81173 () Unit!4899)

(assert (=> d!50827 (= lt!81170 lt!81173)))

(assert (=> d!50827 (= (getValueByKey!183 lt!81172 (_1!1426 (tuple2!2831 lt!80937 lt!80942))) (Some!188 (_2!1426 (tuple2!2831 lt!80937 lt!80942))))))

(assert (=> d!50827 (= lt!81173 (lemmaContainsTupThenGetReturnValue!96 lt!81172 (_1!1426 (tuple2!2831 lt!80937 lt!80942)) (_2!1426 (tuple2!2831 lt!80937 lt!80942))))))

(assert (=> d!50827 (= lt!81172 (insertStrictlySorted!99 (toList!924 lt!80940) (_1!1426 (tuple2!2831 lt!80937 lt!80942)) (_2!1426 (tuple2!2831 lt!80937 lt!80942))))))

(assert (=> d!50827 (= (+!192 lt!80940 (tuple2!2831 lt!80937 lt!80942)) lt!81171)))

(declare-fun b!154612 () Bool)

(declare-fun res!72980 () Bool)

(assert (=> b!154612 (=> (not res!72980) (not e!101004))))

(assert (=> b!154612 (= res!72980 (= (getValueByKey!183 (toList!924 lt!81171) (_1!1426 (tuple2!2831 lt!80937 lt!80942))) (Some!188 (_2!1426 (tuple2!2831 lt!80937 lt!80942)))))))

(declare-fun b!154613 () Bool)

(assert (=> b!154613 (= e!101004 (contains!970 (toList!924 lt!81171) (tuple2!2831 lt!80937 lt!80942)))))

(assert (= (and d!50827 res!72981) b!154612))

(assert (= (and b!154612 res!72980) b!154613))

(declare-fun m!188629 () Bool)

(assert (=> d!50827 m!188629))

(declare-fun m!188631 () Bool)

(assert (=> d!50827 m!188631))

(declare-fun m!188633 () Bool)

(assert (=> d!50827 m!188633))

(declare-fun m!188635 () Bool)

(assert (=> d!50827 m!188635))

(declare-fun m!188637 () Bool)

(assert (=> b!154612 m!188637))

(declare-fun m!188639 () Bool)

(assert (=> b!154613 m!188639))

(assert (=> b!154210 d!50827))

(assert (=> b!154255 d!50665))

(declare-fun d!50829 () Bool)

(assert (=> d!50829 (= (apply!128 lt!81001 lt!80987) (get!1609 (getValueByKey!183 (toList!924 lt!81001) lt!80987)))))

(declare-fun bs!6543 () Bool)

(assert (= bs!6543 d!50829))

(declare-fun m!188641 () Bool)

(assert (=> bs!6543 m!188641))

(assert (=> bs!6543 m!188641))

(declare-fun m!188643 () Bool)

(assert (=> bs!6543 m!188643))

(assert (=> b!154280 d!50829))

(declare-fun d!50831 () Bool)

(declare-fun e!101005 () Bool)

(assert (=> d!50831 e!101005))

(declare-fun res!72983 () Bool)

(assert (=> d!50831 (=> (not res!72983) (not e!101005))))

(declare-fun lt!81175 () ListLongMap!1817)

(assert (=> d!50831 (= res!72983 (contains!968 lt!81175 (_1!1426 (tuple2!2831 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun lt!81176 () List!1807)

(assert (=> d!50831 (= lt!81175 (ListLongMap!1818 lt!81176))))

(declare-fun lt!81174 () Unit!4899)

(declare-fun lt!81177 () Unit!4899)

(assert (=> d!50831 (= lt!81174 lt!81177)))

(assert (=> d!50831 (= (getValueByKey!183 lt!81176 (_1!1426 (tuple2!2831 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50831 (= lt!81177 (lemmaContainsTupThenGetReturnValue!96 lt!81176 (_1!1426 (tuple2!2831 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50831 (= lt!81176 (insertStrictlySorted!99 (toList!924 lt!80988) (_1!1426 (tuple2!2831 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50831 (= (+!192 lt!80988 (tuple2!2831 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!81175)))

(declare-fun b!154614 () Bool)

(declare-fun res!72982 () Bool)

(assert (=> b!154614 (=> (not res!72982) (not e!101005))))

(assert (=> b!154614 (= res!72982 (= (getValueByKey!183 (toList!924 lt!81175) (_1!1426 (tuple2!2831 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154615 () Bool)

(assert (=> b!154615 (= e!101005 (contains!970 (toList!924 lt!81175) (tuple2!2831 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(assert (= (and d!50831 res!72983) b!154614))

(assert (= (and b!154614 res!72982) b!154615))

(declare-fun m!188645 () Bool)

(assert (=> d!50831 m!188645))

(declare-fun m!188647 () Bool)

(assert (=> d!50831 m!188647))

(declare-fun m!188649 () Bool)

(assert (=> d!50831 m!188649))

(declare-fun m!188651 () Bool)

(assert (=> d!50831 m!188651))

(declare-fun m!188653 () Bool)

(assert (=> b!154614 m!188653))

(declare-fun m!188655 () Bool)

(assert (=> b!154615 m!188655))

(assert (=> b!154280 d!50831))

(declare-fun d!50833 () Bool)

(assert (=> d!50833 (= (apply!128 (+!192 lt!80996 (tuple2!2831 lt!80991 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!81005) (apply!128 lt!80996 lt!81005))))

(declare-fun lt!81178 () Unit!4899)

(assert (=> d!50833 (= lt!81178 (choose!917 lt!80996 lt!80991 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) lt!81005))))

(declare-fun e!101006 () Bool)

(assert (=> d!50833 e!101006))

(declare-fun res!72984 () Bool)

(assert (=> d!50833 (=> (not res!72984) (not e!101006))))

(assert (=> d!50833 (= res!72984 (contains!968 lt!80996 lt!81005))))

(assert (=> d!50833 (= (addApplyDifferent!104 lt!80996 lt!80991 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) lt!81005) lt!81178)))

(declare-fun b!154616 () Bool)

(assert (=> b!154616 (= e!101006 (not (= lt!81005 lt!80991)))))

(assert (= (and d!50833 res!72984) b!154616))

(assert (=> d!50833 m!188019))

(declare-fun m!188657 () Bool)

(assert (=> d!50833 m!188657))

(declare-fun m!188659 () Bool)

(assert (=> d!50833 m!188659))

(assert (=> d!50833 m!188019))

(assert (=> d!50833 m!188033))

(assert (=> d!50833 m!188003))

(assert (=> b!154280 d!50833))

(declare-fun d!50835 () Bool)

(assert (=> d!50835 (= (apply!128 (+!192 lt!81001 (tuple2!2831 lt!80993 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80987) (get!1609 (getValueByKey!183 (toList!924 (+!192 lt!81001 (tuple2!2831 lt!80993 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80987)))))

(declare-fun bs!6544 () Bool)

(assert (= bs!6544 d!50835))

(declare-fun m!188661 () Bool)

(assert (=> bs!6544 m!188661))

(assert (=> bs!6544 m!188661))

(declare-fun m!188663 () Bool)

(assert (=> bs!6544 m!188663))

(assert (=> b!154280 d!50835))

(declare-fun d!50837 () Bool)

(assert (=> d!50837 (= (apply!128 (+!192 lt!80996 (tuple2!2831 lt!80991 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!81005) (get!1609 (getValueByKey!183 (toList!924 (+!192 lt!80996 (tuple2!2831 lt!80991 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81005)))))

(declare-fun bs!6545 () Bool)

(assert (= bs!6545 d!50837))

(declare-fun m!188665 () Bool)

(assert (=> bs!6545 m!188665))

(assert (=> bs!6545 m!188665))

(declare-fun m!188667 () Bool)

(assert (=> bs!6545 m!188667))

(assert (=> b!154280 d!50837))

(declare-fun d!50839 () Bool)

(assert (=> d!50839 (= (apply!128 (+!192 lt!81003 (tuple2!2831 lt!81006 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80999) (apply!128 lt!81003 lt!80999))))

(declare-fun lt!81179 () Unit!4899)

(assert (=> d!50839 (= lt!81179 (choose!917 lt!81003 lt!81006 (minValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80999))))

(declare-fun e!101007 () Bool)

(assert (=> d!50839 e!101007))

(declare-fun res!72985 () Bool)

(assert (=> d!50839 (=> (not res!72985) (not e!101007))))

(assert (=> d!50839 (= res!72985 (contains!968 lt!81003 lt!80999))))

(assert (=> d!50839 (= (addApplyDifferent!104 lt!81003 lt!81006 (minValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80999) lt!81179)))

(declare-fun b!154617 () Bool)

(assert (=> b!154617 (= e!101007 (not (= lt!80999 lt!81006)))))

(assert (= (and d!50839 res!72985) b!154617))

(assert (=> d!50839 m!188009))

(declare-fun m!188669 () Bool)

(assert (=> d!50839 m!188669))

(declare-fun m!188671 () Bool)

(assert (=> d!50839 m!188671))

(assert (=> d!50839 m!188009))

(assert (=> d!50839 m!188011))

(assert (=> d!50839 m!188025))

(assert (=> b!154280 d!50839))

(declare-fun d!50841 () Bool)

(declare-fun e!101008 () Bool)

(assert (=> d!50841 e!101008))

(declare-fun res!72987 () Bool)

(assert (=> d!50841 (=> (not res!72987) (not e!101008))))

(declare-fun lt!81181 () ListLongMap!1817)

(assert (=> d!50841 (= res!72987 (contains!968 lt!81181 (_1!1426 (tuple2!2831 lt!81006 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun lt!81182 () List!1807)

(assert (=> d!50841 (= lt!81181 (ListLongMap!1818 lt!81182))))

(declare-fun lt!81180 () Unit!4899)

(declare-fun lt!81183 () Unit!4899)

(assert (=> d!50841 (= lt!81180 lt!81183)))

(assert (=> d!50841 (= (getValueByKey!183 lt!81182 (_1!1426 (tuple2!2831 lt!81006 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 lt!81006 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50841 (= lt!81183 (lemmaContainsTupThenGetReturnValue!96 lt!81182 (_1!1426 (tuple2!2831 lt!81006 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!81006 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50841 (= lt!81182 (insertStrictlySorted!99 (toList!924 lt!81003) (_1!1426 (tuple2!2831 lt!81006 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!81006 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50841 (= (+!192 lt!81003 (tuple2!2831 lt!81006 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!81181)))

(declare-fun b!154618 () Bool)

(declare-fun res!72986 () Bool)

(assert (=> b!154618 (=> (not res!72986) (not e!101008))))

(assert (=> b!154618 (= res!72986 (= (getValueByKey!183 (toList!924 lt!81181) (_1!1426 (tuple2!2831 lt!81006 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 lt!81006 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154619 () Bool)

(assert (=> b!154619 (= e!101008 (contains!970 (toList!924 lt!81181) (tuple2!2831 lt!81006 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(assert (= (and d!50841 res!72987) b!154618))

(assert (= (and b!154618 res!72986) b!154619))

(declare-fun m!188673 () Bool)

(assert (=> d!50841 m!188673))

(declare-fun m!188675 () Bool)

(assert (=> d!50841 m!188675))

(declare-fun m!188677 () Bool)

(assert (=> d!50841 m!188677))

(declare-fun m!188679 () Bool)

(assert (=> d!50841 m!188679))

(declare-fun m!188681 () Bool)

(assert (=> b!154618 m!188681))

(declare-fun m!188683 () Bool)

(assert (=> b!154619 m!188683))

(assert (=> b!154280 d!50841))

(declare-fun d!50843 () Bool)

(declare-fun e!101009 () Bool)

(assert (=> d!50843 e!101009))

(declare-fun res!72988 () Bool)

(assert (=> d!50843 (=> res!72988 e!101009)))

(declare-fun lt!81184 () Bool)

(assert (=> d!50843 (= res!72988 (not lt!81184))))

(declare-fun lt!81187 () Bool)

(assert (=> d!50843 (= lt!81184 lt!81187)))

(declare-fun lt!81186 () Unit!4899)

(declare-fun e!101010 () Unit!4899)

(assert (=> d!50843 (= lt!81186 e!101010)))

(declare-fun c!29641 () Bool)

(assert (=> d!50843 (= c!29641 lt!81187)))

(assert (=> d!50843 (= lt!81187 (containsKey!187 (toList!924 (+!192 lt!80988 (tuple2!2831 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81000))))

(assert (=> d!50843 (= (contains!968 (+!192 lt!80988 (tuple2!2831 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!81000) lt!81184)))

(declare-fun b!154620 () Bool)

(declare-fun lt!81185 () Unit!4899)

(assert (=> b!154620 (= e!101010 lt!81185)))

(assert (=> b!154620 (= lt!81185 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 (+!192 lt!80988 (tuple2!2831 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81000))))

(assert (=> b!154620 (isDefined!136 (getValueByKey!183 (toList!924 (+!192 lt!80988 (tuple2!2831 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81000))))

(declare-fun b!154621 () Bool)

(declare-fun Unit!4919 () Unit!4899)

(assert (=> b!154621 (= e!101010 Unit!4919)))

(declare-fun b!154622 () Bool)

(assert (=> b!154622 (= e!101009 (isDefined!136 (getValueByKey!183 (toList!924 (+!192 lt!80988 (tuple2!2831 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81000)))))

(assert (= (and d!50843 c!29641) b!154620))

(assert (= (and d!50843 (not c!29641)) b!154621))

(assert (= (and d!50843 (not res!72988)) b!154622))

(declare-fun m!188685 () Bool)

(assert (=> d!50843 m!188685))

(declare-fun m!188687 () Bool)

(assert (=> b!154620 m!188687))

(declare-fun m!188689 () Bool)

(assert (=> b!154620 m!188689))

(assert (=> b!154620 m!188689))

(declare-fun m!188691 () Bool)

(assert (=> b!154620 m!188691))

(assert (=> b!154622 m!188689))

(assert (=> b!154622 m!188689))

(assert (=> b!154622 m!188691))

(assert (=> b!154280 d!50843))

(declare-fun d!50845 () Bool)

(assert (=> d!50845 (contains!968 (+!192 lt!80988 (tuple2!2831 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!81000)))

(declare-fun lt!81188 () Unit!4899)

(assert (=> d!50845 (= lt!81188 (choose!918 lt!80988 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) lt!81000))))

(assert (=> d!50845 (contains!968 lt!80988 lt!81000)))

(assert (=> d!50845 (= (addStillContains!104 lt!80988 lt!80990 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) lt!81000) lt!81188)))

(declare-fun bs!6546 () Bool)

(assert (= bs!6546 d!50845))

(assert (=> bs!6546 m!188005))

(assert (=> bs!6546 m!188005))

(assert (=> bs!6546 m!188007))

(declare-fun m!188693 () Bool)

(assert (=> bs!6546 m!188693))

(declare-fun m!188695 () Bool)

(assert (=> bs!6546 m!188695))

(assert (=> b!154280 d!50845))

(declare-fun d!50847 () Bool)

(declare-fun e!101011 () Bool)

(assert (=> d!50847 e!101011))

(declare-fun res!72990 () Bool)

(assert (=> d!50847 (=> (not res!72990) (not e!101011))))

(declare-fun lt!81190 () ListLongMap!1817)

(assert (=> d!50847 (= res!72990 (contains!968 lt!81190 (_1!1426 (tuple2!2831 lt!80991 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun lt!81191 () List!1807)

(assert (=> d!50847 (= lt!81190 (ListLongMap!1818 lt!81191))))

(declare-fun lt!81189 () Unit!4899)

(declare-fun lt!81192 () Unit!4899)

(assert (=> d!50847 (= lt!81189 lt!81192)))

(assert (=> d!50847 (= (getValueByKey!183 lt!81191 (_1!1426 (tuple2!2831 lt!80991 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 lt!80991 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50847 (= lt!81192 (lemmaContainsTupThenGetReturnValue!96 lt!81191 (_1!1426 (tuple2!2831 lt!80991 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80991 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50847 (= lt!81191 (insertStrictlySorted!99 (toList!924 lt!80996) (_1!1426 (tuple2!2831 lt!80991 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80991 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50847 (= (+!192 lt!80996 (tuple2!2831 lt!80991 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!81190)))

(declare-fun b!154623 () Bool)

(declare-fun res!72989 () Bool)

(assert (=> b!154623 (=> (not res!72989) (not e!101011))))

(assert (=> b!154623 (= res!72989 (= (getValueByKey!183 (toList!924 lt!81190) (_1!1426 (tuple2!2831 lt!80991 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 lt!80991 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154624 () Bool)

(assert (=> b!154624 (= e!101011 (contains!970 (toList!924 lt!81190) (tuple2!2831 lt!80991 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(assert (= (and d!50847 res!72990) b!154623))

(assert (= (and b!154623 res!72989) b!154624))

(declare-fun m!188697 () Bool)

(assert (=> d!50847 m!188697))

(declare-fun m!188699 () Bool)

(assert (=> d!50847 m!188699))

(declare-fun m!188701 () Bool)

(assert (=> d!50847 m!188701))

(declare-fun m!188703 () Bool)

(assert (=> d!50847 m!188703))

(declare-fun m!188705 () Bool)

(assert (=> b!154623 m!188705))

(declare-fun m!188707 () Bool)

(assert (=> b!154624 m!188707))

(assert (=> b!154280 d!50847))

(declare-fun d!50849 () Bool)

(assert (=> d!50849 (= (apply!128 (+!192 lt!81003 (tuple2!2831 lt!81006 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80999) (get!1609 (getValueByKey!183 (toList!924 (+!192 lt!81003 (tuple2!2831 lt!81006 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80999)))))

(declare-fun bs!6547 () Bool)

(assert (= bs!6547 d!50849))

(declare-fun m!188709 () Bool)

(assert (=> bs!6547 m!188709))

(assert (=> bs!6547 m!188709))

(declare-fun m!188711 () Bool)

(assert (=> bs!6547 m!188711))

(assert (=> b!154280 d!50849))

(declare-fun d!50851 () Bool)

(assert (=> d!50851 (= (apply!128 (+!192 lt!81001 (tuple2!2831 lt!80993 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80987) (apply!128 lt!81001 lt!80987))))

(declare-fun lt!81193 () Unit!4899)

(assert (=> d!50851 (= lt!81193 (choose!917 lt!81001 lt!80993 (minValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80987))))

(declare-fun e!101012 () Bool)

(assert (=> d!50851 e!101012))

(declare-fun res!72991 () Bool)

(assert (=> d!50851 (=> (not res!72991) (not e!101012))))

(assert (=> d!50851 (= res!72991 (contains!968 lt!81001 lt!80987))))

(assert (=> d!50851 (= (addApplyDifferent!104 lt!81001 lt!80993 (minValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80987) lt!81193)))

(declare-fun b!154625 () Bool)

(assert (=> b!154625 (= e!101012 (not (= lt!80987 lt!80993)))))

(assert (= (and d!50851 res!72991) b!154625))

(assert (=> d!50851 m!188013))

(declare-fun m!188713 () Bool)

(assert (=> d!50851 m!188713))

(declare-fun m!188715 () Bool)

(assert (=> d!50851 m!188715))

(assert (=> d!50851 m!188013))

(assert (=> d!50851 m!188015))

(assert (=> d!50851 m!188029))

(assert (=> b!154280 d!50851))

(declare-fun d!50853 () Bool)

(assert (=> d!50853 (= (apply!128 lt!80996 lt!81005) (get!1609 (getValueByKey!183 (toList!924 lt!80996) lt!81005)))))

(declare-fun bs!6548 () Bool)

(assert (= bs!6548 d!50853))

(declare-fun m!188717 () Bool)

(assert (=> bs!6548 m!188717))

(assert (=> bs!6548 m!188717))

(declare-fun m!188719 () Bool)

(assert (=> bs!6548 m!188719))

(assert (=> b!154280 d!50853))

(declare-fun d!50855 () Bool)

(assert (=> d!50855 (= (apply!128 lt!81003 lt!80999) (get!1609 (getValueByKey!183 (toList!924 lt!81003) lt!80999)))))

(declare-fun bs!6549 () Bool)

(assert (= bs!6549 d!50855))

(declare-fun m!188721 () Bool)

(assert (=> bs!6549 m!188721))

(assert (=> bs!6549 m!188721))

(declare-fun m!188723 () Bool)

(assert (=> bs!6549 m!188723))

(assert (=> b!154280 d!50855))

(declare-fun bm!17204 () Bool)

(declare-fun call!17207 () ListLongMap!1817)

(assert (=> bm!17204 (= call!17207 (getCurrentListMapNoExtraKeys!161 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun d!50857 () Bool)

(declare-fun e!101013 () Bool)

(assert (=> d!50857 e!101013))

(declare-fun res!72993 () Bool)

(assert (=> d!50857 (=> (not res!72993) (not e!101013))))

(declare-fun lt!81198 () ListLongMap!1817)

(assert (=> d!50857 (= res!72993 (not (contains!968 lt!81198 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!101015 () ListLongMap!1817)

(assert (=> d!50857 (= lt!81198 e!101015)))

(declare-fun c!29644 () Bool)

(assert (=> d!50857 (= c!29644 (bvsge #b00000000000000000000000000000000 (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(assert (=> d!50857 (validMask!0 (mask!7468 (v!3419 (underlying!526 thiss!992))))))

(assert (=> d!50857 (= (getCurrentListMapNoExtraKeys!161 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))) lt!81198)))

(declare-fun b!154626 () Bool)

(declare-fun e!101014 () Bool)

(declare-fun e!101016 () Bool)

(assert (=> b!154626 (= e!101014 e!101016)))

(declare-fun c!29643 () Bool)

(assert (=> b!154626 (= c!29643 (bvslt #b00000000000000000000000000000000 (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun b!154627 () Bool)

(declare-fun e!101017 () ListLongMap!1817)

(assert (=> b!154627 (= e!101015 e!101017)))

(declare-fun c!29645 () Bool)

(assert (=> b!154627 (= c!29645 (validKeyInArray!0 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154628 () Bool)

(declare-fun e!101019 () Bool)

(assert (=> b!154628 (= e!101014 e!101019)))

(assert (=> b!154628 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun res!72994 () Bool)

(assert (=> b!154628 (= res!72994 (contains!968 lt!81198 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> b!154628 (=> (not res!72994) (not e!101019))))

(declare-fun b!154629 () Bool)

(assert (=> b!154629 (= e!101016 (= lt!81198 (getCurrentListMapNoExtraKeys!161 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun b!154630 () Bool)

(assert (=> b!154630 (= e!101015 (ListLongMap!1818 Nil!1804))))

(declare-fun b!154631 () Bool)

(assert (=> b!154631 (= e!101016 (isEmpty!430 lt!81198))))

(declare-fun b!154632 () Bool)

(assert (=> b!154632 (= e!101013 e!101014)))

(declare-fun c!29642 () Bool)

(declare-fun e!101018 () Bool)

(assert (=> b!154632 (= c!29642 e!101018)))

(declare-fun res!72995 () Bool)

(assert (=> b!154632 (=> (not res!72995) (not e!101018))))

(assert (=> b!154632 (= res!72995 (bvslt #b00000000000000000000000000000000 (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun b!154633 () Bool)

(assert (=> b!154633 (= e!101018 (validKeyInArray!0 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> b!154633 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!154634 () Bool)

(declare-fun lt!81200 () Unit!4899)

(declare-fun lt!81196 () Unit!4899)

(assert (=> b!154634 (= lt!81200 lt!81196)))

(declare-fun lt!81199 () V!3683)

(declare-fun lt!81195 () (_ BitVec 64))

(declare-fun lt!81197 () ListLongMap!1817)

(declare-fun lt!81194 () (_ BitVec 64))

(assert (=> b!154634 (not (contains!968 (+!192 lt!81197 (tuple2!2831 lt!81194 lt!81199)) lt!81195))))

(assert (=> b!154634 (= lt!81196 (addStillNotContains!70 lt!81197 lt!81194 lt!81199 lt!81195))))

(assert (=> b!154634 (= lt!81195 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!154634 (= lt!81199 (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!154634 (= lt!81194 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!154634 (= lt!81197 call!17207)))

(assert (=> b!154634 (= e!101017 (+!192 call!17207 (tuple2!2831 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000) (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!154635 () Bool)

(declare-fun res!72992 () Bool)

(assert (=> b!154635 (=> (not res!72992) (not e!101013))))

(assert (=> b!154635 (= res!72992 (not (contains!968 lt!81198 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154636 () Bool)

(assert (=> b!154636 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(assert (=> b!154636 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2689 (_values!3047 (v!3419 (underlying!526 thiss!992))))))))

(assert (=> b!154636 (= e!101019 (= (apply!128 lt!81198 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)) (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!154637 () Bool)

(assert (=> b!154637 (= e!101017 call!17207)))

(assert (= (and d!50857 c!29644) b!154630))

(assert (= (and d!50857 (not c!29644)) b!154627))

(assert (= (and b!154627 c!29645) b!154634))

(assert (= (and b!154627 (not c!29645)) b!154637))

(assert (= (or b!154634 b!154637) bm!17204))

(assert (= (and d!50857 res!72993) b!154635))

(assert (= (and b!154635 res!72992) b!154632))

(assert (= (and b!154632 res!72995) b!154633))

(assert (= (and b!154632 c!29642) b!154628))

(assert (= (and b!154632 (not c!29642)) b!154626))

(assert (= (and b!154628 res!72994) b!154636))

(assert (= (and b!154626 c!29643) b!154629))

(assert (= (and b!154626 (not c!29643)) b!154631))

(declare-fun b_lambda!6867 () Bool)

(assert (=> (not b_lambda!6867) (not b!154634)))

(assert (=> b!154634 t!6603))

(declare-fun b_and!9627 () Bool)

(assert (= b_and!9623 (and (=> t!6603 result!4489) b_and!9627)))

(assert (=> b!154634 t!6605))

(declare-fun b_and!9629 () Bool)

(assert (= b_and!9625 (and (=> t!6605 result!4493) b_and!9629)))

(declare-fun b_lambda!6869 () Bool)

(assert (=> (not b_lambda!6869) (not b!154636)))

(assert (=> b!154636 t!6603))

(declare-fun b_and!9631 () Bool)

(assert (= b_and!9627 (and (=> t!6603 result!4489) b_and!9631)))

(assert (=> b!154636 t!6605))

(declare-fun b_and!9633 () Bool)

(assert (= b_and!9629 (and (=> t!6605 result!4493) b_and!9633)))

(assert (=> b!154627 m!187989))

(assert (=> b!154627 m!187989))

(assert (=> b!154627 m!188039))

(declare-fun m!188725 () Bool)

(assert (=> b!154631 m!188725))

(assert (=> b!154636 m!187839))

(assert (=> b!154636 m!187989))

(declare-fun m!188727 () Bool)

(assert (=> b!154636 m!188727))

(assert (=> b!154636 m!187989))

(assert (=> b!154636 m!187993))

(assert (=> b!154636 m!187839))

(assert (=> b!154636 m!187995))

(assert (=> b!154636 m!187993))

(declare-fun m!188729 () Bool)

(assert (=> b!154635 m!188729))

(assert (=> b!154633 m!187989))

(assert (=> b!154633 m!187989))

(assert (=> b!154633 m!188039))

(assert (=> b!154628 m!187989))

(assert (=> b!154628 m!187989))

(declare-fun m!188731 () Bool)

(assert (=> b!154628 m!188731))

(declare-fun m!188733 () Bool)

(assert (=> d!50857 m!188733))

(assert (=> d!50857 m!187893))

(declare-fun m!188735 () Bool)

(assert (=> bm!17204 m!188735))

(assert (=> b!154629 m!188735))

(declare-fun m!188737 () Bool)

(assert (=> b!154634 m!188737))

(assert (=> b!154634 m!187839))

(assert (=> b!154634 m!187993))

(assert (=> b!154634 m!187839))

(assert (=> b!154634 m!187995))

(assert (=> b!154634 m!187993))

(assert (=> b!154634 m!188737))

(declare-fun m!188739 () Bool)

(assert (=> b!154634 m!188739))

(assert (=> b!154634 m!187989))

(declare-fun m!188741 () Bool)

(assert (=> b!154634 m!188741))

(declare-fun m!188743 () Bool)

(assert (=> b!154634 m!188743))

(assert (=> b!154280 d!50857))

(declare-fun d!50859 () Bool)

(declare-fun e!101020 () Bool)

(assert (=> d!50859 e!101020))

(declare-fun res!72997 () Bool)

(assert (=> d!50859 (=> (not res!72997) (not e!101020))))

(declare-fun lt!81202 () ListLongMap!1817)

(assert (=> d!50859 (= res!72997 (contains!968 lt!81202 (_1!1426 (tuple2!2831 lt!80993 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun lt!81203 () List!1807)

(assert (=> d!50859 (= lt!81202 (ListLongMap!1818 lt!81203))))

(declare-fun lt!81201 () Unit!4899)

(declare-fun lt!81204 () Unit!4899)

(assert (=> d!50859 (= lt!81201 lt!81204)))

(assert (=> d!50859 (= (getValueByKey!183 lt!81203 (_1!1426 (tuple2!2831 lt!80993 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 lt!80993 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50859 (= lt!81204 (lemmaContainsTupThenGetReturnValue!96 lt!81203 (_1!1426 (tuple2!2831 lt!80993 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80993 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50859 (= lt!81203 (insertStrictlySorted!99 (toList!924 lt!81001) (_1!1426 (tuple2!2831 lt!80993 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80993 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50859 (= (+!192 lt!81001 (tuple2!2831 lt!80993 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!81202)))

(declare-fun b!154638 () Bool)

(declare-fun res!72996 () Bool)

(assert (=> b!154638 (=> (not res!72996) (not e!101020))))

(assert (=> b!154638 (= res!72996 (= (getValueByKey!183 (toList!924 lt!81202) (_1!1426 (tuple2!2831 lt!80993 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 lt!80993 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154639 () Bool)

(assert (=> b!154639 (= e!101020 (contains!970 (toList!924 lt!81202) (tuple2!2831 lt!80993 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(assert (= (and d!50859 res!72997) b!154638))

(assert (= (and b!154638 res!72996) b!154639))

(declare-fun m!188745 () Bool)

(assert (=> d!50859 m!188745))

(declare-fun m!188747 () Bool)

(assert (=> d!50859 m!188747))

(declare-fun m!188749 () Bool)

(assert (=> d!50859 m!188749))

(declare-fun m!188751 () Bool)

(assert (=> d!50859 m!188751))

(declare-fun m!188753 () Bool)

(assert (=> b!154638 m!188753))

(declare-fun m!188755 () Bool)

(assert (=> b!154639 m!188755))

(assert (=> b!154280 d!50859))

(declare-fun d!50861 () Bool)

(assert (=> d!50861 (= (get!1609 (getValueByKey!183 (toList!924 lt!80911) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3422 (getValueByKey!183 (toList!924 lt!80911) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50609 d!50861))

(assert (=> d!50609 d!50797))

(declare-fun d!50863 () Bool)

(declare-fun e!101021 () Bool)

(assert (=> d!50863 e!101021))

(declare-fun res!72999 () Bool)

(assert (=> d!50863 (=> (not res!72999) (not e!101021))))

(declare-fun lt!81206 () ListLongMap!1817)

(assert (=> d!50863 (= res!72999 (contains!968 lt!81206 (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16)))))))

(declare-fun lt!81207 () List!1807)

(assert (=> d!50863 (= lt!81206 (ListLongMap!1818 lt!81207))))

(declare-fun lt!81205 () Unit!4899)

(declare-fun lt!81208 () Unit!4899)

(assert (=> d!50863 (= lt!81205 lt!81208)))

(assert (=> d!50863 (= (getValueByKey!183 lt!81207 (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16)))) (Some!188 (_2!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16)))))))

(assert (=> d!50863 (= lt!81208 (lemmaContainsTupThenGetReturnValue!96 lt!81207 (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16))) (_2!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16)))))))

(assert (=> d!50863 (= lt!81207 (insertStrictlySorted!99 (toList!924 call!17173) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16))) (_2!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16)))))))

(assert (=> d!50863 (= (+!192 call!17173 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16))) lt!81206)))

(declare-fun b!154640 () Bool)

(declare-fun res!72998 () Bool)

(assert (=> b!154640 (=> (not res!72998) (not e!101021))))

(assert (=> b!154640 (= res!72998 (= (getValueByKey!183 (toList!924 lt!81206) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16)))) (Some!188 (_2!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16))))))))

(declare-fun b!154641 () Bool)

(assert (=> b!154641 (= e!101021 (contains!970 (toList!924 lt!81206) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16))))))

(assert (= (and d!50863 res!72999) b!154640))

(assert (= (and b!154640 res!72998) b!154641))

(declare-fun m!188757 () Bool)

(assert (=> d!50863 m!188757))

(declare-fun m!188759 () Bool)

(assert (=> d!50863 m!188759))

(declare-fun m!188761 () Bool)

(assert (=> d!50863 m!188761))

(declare-fun m!188763 () Bool)

(assert (=> d!50863 m!188763))

(declare-fun m!188765 () Bool)

(assert (=> b!154640 m!188765))

(declare-fun m!188767 () Bool)

(assert (=> b!154641 m!188767))

(assert (=> b!154313 d!50863))

(declare-fun d!50865 () Bool)

(declare-fun c!29646 () Bool)

(assert (=> d!50865 (= c!29646 (and ((_ is Cons!1803) (toList!924 lt!81060)) (= (_1!1426 (h!2412 (toList!924 lt!81060))) (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun e!101022 () Option!189)

(assert (=> d!50865 (= (getValueByKey!183 (toList!924 lt!81060) (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) e!101022)))

(declare-fun b!154643 () Bool)

(declare-fun e!101023 () Option!189)

(assert (=> b!154643 (= e!101022 e!101023)))

(declare-fun c!29647 () Bool)

(assert (=> b!154643 (= c!29647 (and ((_ is Cons!1803) (toList!924 lt!81060)) (not (= (_1!1426 (h!2412 (toList!924 lt!81060))) (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun b!154644 () Bool)

(assert (=> b!154644 (= e!101023 (getValueByKey!183 (t!6601 (toList!924 lt!81060)) (_1!1426 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154642 () Bool)

(assert (=> b!154642 (= e!101022 (Some!188 (_2!1426 (h!2412 (toList!924 lt!81060)))))))

(declare-fun b!154645 () Bool)

(assert (=> b!154645 (= e!101023 None!187)))

(assert (= (and d!50865 c!29646) b!154642))

(assert (= (and d!50865 (not c!29646)) b!154643))

(assert (= (and b!154643 c!29647) b!154644))

(assert (= (and b!154643 (not c!29647)) b!154645))

(declare-fun m!188769 () Bool)

(assert (=> b!154644 m!188769))

(assert (=> b!154354 d!50865))

(declare-fun d!50867 () Bool)

(declare-fun e!101024 () Bool)

(assert (=> d!50867 e!101024))

(declare-fun res!73000 () Bool)

(assert (=> d!50867 (=> res!73000 e!101024)))

(declare-fun lt!81209 () Bool)

(assert (=> d!50867 (= res!73000 (not lt!81209))))

(declare-fun lt!81212 () Bool)

(assert (=> d!50867 (= lt!81209 lt!81212)))

(declare-fun lt!81211 () Unit!4899)

(declare-fun e!101025 () Unit!4899)

(assert (=> d!50867 (= lt!81211 e!101025)))

(declare-fun c!29648 () Bool)

(assert (=> d!50867 (= c!29648 lt!81212)))

(assert (=> d!50867 (= lt!81212 (containsKey!187 (toList!924 lt!81052) (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50867 (= (contains!968 lt!81052 (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81209)))

(declare-fun b!154646 () Bool)

(declare-fun lt!81210 () Unit!4899)

(assert (=> b!154646 (= e!101025 lt!81210)))

(assert (=> b!154646 (= lt!81210 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!81052) (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> b!154646 (isDefined!136 (getValueByKey!183 (toList!924 lt!81052) (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154647 () Bool)

(declare-fun Unit!4920 () Unit!4899)

(assert (=> b!154647 (= e!101025 Unit!4920)))

(declare-fun b!154648 () Bool)

(assert (=> b!154648 (= e!101024 (isDefined!136 (getValueByKey!183 (toList!924 lt!81052) (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (= (and d!50867 c!29648) b!154646))

(assert (= (and d!50867 (not c!29648)) b!154647))

(assert (= (and d!50867 (not res!73000)) b!154648))

(declare-fun m!188771 () Bool)

(assert (=> d!50867 m!188771))

(declare-fun m!188773 () Bool)

(assert (=> b!154646 m!188773))

(assert (=> b!154646 m!188167))

(assert (=> b!154646 m!188167))

(declare-fun m!188775 () Bool)

(assert (=> b!154646 m!188775))

(assert (=> b!154648 m!188167))

(assert (=> b!154648 m!188167))

(assert (=> b!154648 m!188775))

(assert (=> d!50645 d!50867))

(declare-fun c!29649 () Bool)

(declare-fun d!50869 () Bool)

(assert (=> d!50869 (= c!29649 (and ((_ is Cons!1803) lt!81053) (= (_1!1426 (h!2412 lt!81053)) (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun e!101026 () Option!189)

(assert (=> d!50869 (= (getValueByKey!183 lt!81053 (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) e!101026)))

(declare-fun b!154650 () Bool)

(declare-fun e!101027 () Option!189)

(assert (=> b!154650 (= e!101026 e!101027)))

(declare-fun c!29650 () Bool)

(assert (=> b!154650 (= c!29650 (and ((_ is Cons!1803) lt!81053) (not (= (_1!1426 (h!2412 lt!81053)) (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun b!154651 () Bool)

(assert (=> b!154651 (= e!101027 (getValueByKey!183 (t!6601 lt!81053) (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154649 () Bool)

(assert (=> b!154649 (= e!101026 (Some!188 (_2!1426 (h!2412 lt!81053))))))

(declare-fun b!154652 () Bool)

(assert (=> b!154652 (= e!101027 None!187)))

(assert (= (and d!50869 c!29649) b!154649))

(assert (= (and d!50869 (not c!29649)) b!154650))

(assert (= (and b!154650 c!29650) b!154651))

(assert (= (and b!154650 (not c!29650)) b!154652))

(declare-fun m!188777 () Bool)

(assert (=> b!154651 m!188777))

(assert (=> d!50645 d!50869))

(declare-fun d!50871 () Bool)

(assert (=> d!50871 (= (getValueByKey!183 lt!81053 (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun lt!81213 () Unit!4899)

(assert (=> d!50871 (= lt!81213 (choose!919 lt!81053 (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun e!101028 () Bool)

(assert (=> d!50871 e!101028))

(declare-fun res!73001 () Bool)

(assert (=> d!50871 (=> (not res!73001) (not e!101028))))

(assert (=> d!50871 (= res!73001 (isStrictlySorted!330 lt!81053))))

(assert (=> d!50871 (= (lemmaContainsTupThenGetReturnValue!96 lt!81053 (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81213)))

(declare-fun b!154653 () Bool)

(declare-fun res!73002 () Bool)

(assert (=> b!154653 (=> (not res!73002) (not e!101028))))

(assert (=> b!154653 (= res!73002 (containsKey!187 lt!81053 (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154654 () Bool)

(assert (=> b!154654 (= e!101028 (contains!970 lt!81053 (tuple2!2831 (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (= (and d!50871 res!73001) b!154653))

(assert (= (and b!154653 res!73002) b!154654))

(assert (=> d!50871 m!188161))

(declare-fun m!188779 () Bool)

(assert (=> d!50871 m!188779))

(declare-fun m!188781 () Bool)

(assert (=> d!50871 m!188781))

(declare-fun m!188783 () Bool)

(assert (=> b!154653 m!188783))

(declare-fun m!188785 () Bool)

(assert (=> b!154654 m!188785))

(assert (=> d!50645 d!50871))

(declare-fun d!50873 () Bool)

(declare-fun e!101032 () Bool)

(assert (=> d!50873 e!101032))

(declare-fun res!73004 () Bool)

(assert (=> d!50873 (=> (not res!73004) (not e!101032))))

(declare-fun lt!81214 () List!1807)

(assert (=> d!50873 (= res!73004 (isStrictlySorted!330 lt!81214))))

(declare-fun e!101033 () List!1807)

(assert (=> d!50873 (= lt!81214 e!101033)))

(declare-fun c!29654 () Bool)

(assert (=> d!50873 (= c!29654 (and ((_ is Cons!1803) (toList!924 lt!80919)) (bvslt (_1!1426 (h!2412 (toList!924 lt!80919))) (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (=> d!50873 (isStrictlySorted!330 (toList!924 lt!80919))))

(assert (=> d!50873 (= (insertStrictlySorted!99 (toList!924 lt!80919) (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81214)))

(declare-fun b!154655 () Bool)

(declare-fun e!101030 () List!1807)

(declare-fun call!17208 () List!1807)

(assert (=> b!154655 (= e!101030 call!17208)))

(declare-fun b!154656 () Bool)

(declare-fun e!101031 () List!1807)

(assert (=> b!154656 (= e!101033 e!101031)))

(declare-fun c!29651 () Bool)

(assert (=> b!154656 (= c!29651 (and ((_ is Cons!1803) (toList!924 lt!80919)) (= (_1!1426 (h!2412 (toList!924 lt!80919))) (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun c!29653 () Bool)

(declare-fun e!101029 () List!1807)

(declare-fun b!154657 () Bool)

(assert (=> b!154657 (= e!101029 (ite c!29651 (t!6601 (toList!924 lt!80919)) (ite c!29653 (Cons!1803 (h!2412 (toList!924 lt!80919)) (t!6601 (toList!924 lt!80919))) Nil!1804)))))

(declare-fun bm!17205 () Bool)

(declare-fun call!17210 () List!1807)

(assert (=> bm!17205 (= call!17210 ($colon$colon!96 e!101029 (ite c!29654 (h!2412 (toList!924 lt!80919)) (tuple2!2831 (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun c!29652 () Bool)

(assert (=> bm!17205 (= c!29652 c!29654)))

(declare-fun b!154658 () Bool)

(assert (=> b!154658 (= e!101033 call!17210)))

(declare-fun bm!17206 () Bool)

(declare-fun call!17209 () List!1807)

(assert (=> bm!17206 (= call!17209 call!17210)))

(declare-fun b!154659 () Bool)

(declare-fun res!73003 () Bool)

(assert (=> b!154659 (=> (not res!73003) (not e!101032))))

(assert (=> b!154659 (= res!73003 (containsKey!187 lt!81214 (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154660 () Bool)

(assert (=> b!154660 (= e!101032 (contains!970 lt!81214 (tuple2!2831 (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154661 () Bool)

(assert (=> b!154661 (= e!101031 call!17209)))

(declare-fun bm!17207 () Bool)

(assert (=> bm!17207 (= call!17208 call!17209)))

(declare-fun b!154662 () Bool)

(assert (=> b!154662 (= c!29653 (and ((_ is Cons!1803) (toList!924 lt!80919)) (bvsgt (_1!1426 (h!2412 (toList!924 lt!80919))) (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (=> b!154662 (= e!101031 e!101030)))

(declare-fun b!154663 () Bool)

(assert (=> b!154663 (= e!101029 (insertStrictlySorted!99 (t!6601 (toList!924 lt!80919)) (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154664 () Bool)

(assert (=> b!154664 (= e!101030 call!17208)))

(assert (= (and d!50873 c!29654) b!154658))

(assert (= (and d!50873 (not c!29654)) b!154656))

(assert (= (and b!154656 c!29651) b!154661))

(assert (= (and b!154656 (not c!29651)) b!154662))

(assert (= (and b!154662 c!29653) b!154664))

(assert (= (and b!154662 (not c!29653)) b!154655))

(assert (= (or b!154664 b!154655) bm!17207))

(assert (= (or b!154661 bm!17207) bm!17206))

(assert (= (or b!154658 bm!17206) bm!17205))

(assert (= (and bm!17205 c!29652) b!154663))

(assert (= (and bm!17205 (not c!29652)) b!154657))

(assert (= (and d!50873 res!73004) b!154659))

(assert (= (and b!154659 res!73003) b!154660))

(declare-fun m!188787 () Bool)

(assert (=> b!154663 m!188787))

(declare-fun m!188789 () Bool)

(assert (=> d!50873 m!188789))

(declare-fun m!188791 () Bool)

(assert (=> d!50873 m!188791))

(declare-fun m!188793 () Bool)

(assert (=> b!154660 m!188793))

(declare-fun m!188795 () Bool)

(assert (=> b!154659 m!188795))

(declare-fun m!188797 () Bool)

(assert (=> bm!17205 m!188797))

(assert (=> d!50645 d!50873))

(declare-fun d!50875 () Bool)

(declare-fun e!101034 () Bool)

(assert (=> d!50875 e!101034))

(declare-fun res!73005 () Bool)

(assert (=> d!50875 (=> res!73005 e!101034)))

(declare-fun lt!81215 () Bool)

(assert (=> d!50875 (= res!73005 (not lt!81215))))

(declare-fun lt!81218 () Bool)

(assert (=> d!50875 (= lt!81215 lt!81218)))

(declare-fun lt!81217 () Unit!4899)

(declare-fun e!101035 () Unit!4899)

(assert (=> d!50875 (= lt!81217 e!101035)))

(declare-fun c!29655 () Bool)

(assert (=> d!50875 (= c!29655 lt!81218)))

(assert (=> d!50875 (= lt!81218 (containsKey!187 (toList!924 lt!81021) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50875 (= (contains!968 lt!81021 #b0000000000000000000000000000000000000000000000000000000000000000) lt!81215)))

(declare-fun b!154665 () Bool)

(declare-fun lt!81216 () Unit!4899)

(assert (=> b!154665 (= e!101035 lt!81216)))

(assert (=> b!154665 (= lt!81216 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!81021) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154665 (isDefined!136 (getValueByKey!183 (toList!924 lt!81021) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154666 () Bool)

(declare-fun Unit!4921 () Unit!4899)

(assert (=> b!154666 (= e!101035 Unit!4921)))

(declare-fun b!154667 () Bool)

(assert (=> b!154667 (= e!101034 (isDefined!136 (getValueByKey!183 (toList!924 lt!81021) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50875 c!29655) b!154665))

(assert (= (and d!50875 (not c!29655)) b!154666))

(assert (= (and d!50875 (not res!73005)) b!154667))

(declare-fun m!188799 () Bool)

(assert (=> d!50875 m!188799))

(declare-fun m!188801 () Bool)

(assert (=> b!154665 m!188801))

(assert (=> b!154665 m!188413))

(assert (=> b!154665 m!188413))

(declare-fun m!188803 () Bool)

(assert (=> b!154665 m!188803))

(assert (=> b!154667 m!188413))

(assert (=> b!154667 m!188413))

(assert (=> b!154667 m!188803))

(assert (=> bm!17175 d!50875))

(declare-fun d!50877 () Bool)

(declare-fun e!101036 () Bool)

(assert (=> d!50877 e!101036))

(declare-fun res!73007 () Bool)

(assert (=> d!50877 (=> (not res!73007) (not e!101036))))

(declare-fun lt!81220 () ListLongMap!1817)

(assert (=> d!50877 (= res!73007 (contains!968 lt!81220 (_1!1426 (ite (or c!29548 c!29547) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 newMap!16)) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16))))))))

(declare-fun lt!81221 () List!1807)

(assert (=> d!50877 (= lt!81220 (ListLongMap!1818 lt!81221))))

(declare-fun lt!81219 () Unit!4899)

(declare-fun lt!81222 () Unit!4899)

(assert (=> d!50877 (= lt!81219 lt!81222)))

(assert (=> d!50877 (= (getValueByKey!183 lt!81221 (_1!1426 (ite (or c!29548 c!29547) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 newMap!16)) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16))))) (Some!188 (_2!1426 (ite (or c!29548 c!29547) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 newMap!16)) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16))))))))

(assert (=> d!50877 (= lt!81222 (lemmaContainsTupThenGetReturnValue!96 lt!81221 (_1!1426 (ite (or c!29548 c!29547) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 newMap!16)) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16)))) (_2!1426 (ite (or c!29548 c!29547) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 newMap!16)) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16))))))))

(assert (=> d!50877 (= lt!81221 (insertStrictlySorted!99 (toList!924 (ite c!29548 call!17176 (ite c!29547 call!17179 call!17174))) (_1!1426 (ite (or c!29548 c!29547) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 newMap!16)) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16)))) (_2!1426 (ite (or c!29548 c!29547) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 newMap!16)) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16))))))))

(assert (=> d!50877 (= (+!192 (ite c!29548 call!17176 (ite c!29547 call!17179 call!17174)) (ite (or c!29548 c!29547) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 newMap!16)) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16)))) lt!81220)))

(declare-fun b!154668 () Bool)

(declare-fun res!73006 () Bool)

(assert (=> b!154668 (=> (not res!73006) (not e!101036))))

(assert (=> b!154668 (= res!73006 (= (getValueByKey!183 (toList!924 lt!81220) (_1!1426 (ite (or c!29548 c!29547) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 newMap!16)) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16))))) (Some!188 (_2!1426 (ite (or c!29548 c!29547) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 newMap!16)) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16)))))))))

(declare-fun b!154669 () Bool)

(assert (=> b!154669 (= e!101036 (contains!970 (toList!924 lt!81220) (ite (or c!29548 c!29547) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 newMap!16)) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 newMap!16)))))))

(assert (= (and d!50877 res!73007) b!154668))

(assert (= (and b!154668 res!73006) b!154669))

(declare-fun m!188805 () Bool)

(assert (=> d!50877 m!188805))

(declare-fun m!188807 () Bool)

(assert (=> d!50877 m!188807))

(declare-fun m!188809 () Bool)

(assert (=> d!50877 m!188809))

(declare-fun m!188811 () Bool)

(assert (=> d!50877 m!188811))

(declare-fun m!188813 () Bool)

(assert (=> b!154668 m!188813))

(declare-fun m!188815 () Bool)

(assert (=> b!154669 m!188815))

(assert (=> bm!17173 d!50877))

(assert (=> d!50619 d!50663))

(declare-fun d!50879 () Bool)

(assert (=> d!50879 (= (get!1611 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154293 d!50879))

(assert (=> b!154335 d!50665))

(declare-fun d!50881 () Bool)

(assert (=> d!50881 (= (get!1609 (getValueByKey!183 (toList!924 lt!80911) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (v!3422 (getValueByKey!183 (toList!924 lt!80911) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!50623 d!50881))

(assert (=> d!50623 d!50791))

(assert (=> b!154243 d!50723))

(assert (=> b!154243 d!50725))

(declare-fun b!154670 () Bool)

(declare-fun e!101037 () Bool)

(declare-fun call!17211 () Bool)

(assert (=> b!154670 (= e!101037 call!17211)))

(declare-fun bm!17208 () Bool)

(declare-fun c!29656 () Bool)

(assert (=> bm!17208 (= call!17211 (arrayNoDuplicates!0 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29656 (Cons!1804 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000) Nil!1805) Nil!1805)))))

(declare-fun b!154671 () Bool)

(declare-fun e!101039 () Bool)

(assert (=> b!154671 (= e!101039 e!101037)))

(assert (=> b!154671 (= c!29656 (validKeyInArray!0 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154672 () Bool)

(declare-fun e!101040 () Bool)

(assert (=> b!154672 (= e!101040 e!101039)))

(declare-fun res!73010 () Bool)

(assert (=> b!154672 (=> (not res!73010) (not e!101039))))

(declare-fun e!101038 () Bool)

(assert (=> b!154672 (= res!73010 (not e!101038))))

(declare-fun res!73008 () Bool)

(assert (=> b!154672 (=> (not res!73008) (not e!101038))))

(assert (=> b!154672 (= res!73008 (validKeyInArray!0 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154674 () Bool)

(assert (=> b!154674 (= e!101037 call!17211)))

(declare-fun d!50883 () Bool)

(declare-fun res!73009 () Bool)

(assert (=> d!50883 (=> res!73009 e!101040)))

(assert (=> d!50883 (= res!73009 (bvsge #b00000000000000000000000000000000 (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(assert (=> d!50883 (= (arrayNoDuplicates!0 (_keys!4837 (v!3419 (underlying!526 thiss!992))) #b00000000000000000000000000000000 Nil!1805) e!101040)))

(declare-fun b!154673 () Bool)

(assert (=> b!154673 (= e!101038 (contains!969 Nil!1805 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!50883 (not res!73009)) b!154672))

(assert (= (and b!154672 res!73008) b!154673))

(assert (= (and b!154672 res!73010) b!154671))

(assert (= (and b!154671 c!29656) b!154674))

(assert (= (and b!154671 (not c!29656)) b!154670))

(assert (= (or b!154674 b!154670) bm!17208))

(assert (=> bm!17208 m!187989))

(declare-fun m!188817 () Bool)

(assert (=> bm!17208 m!188817))

(assert (=> b!154671 m!187989))

(assert (=> b!154671 m!187989))

(assert (=> b!154671 m!188039))

(assert (=> b!154672 m!187989))

(assert (=> b!154672 m!187989))

(assert (=> b!154672 m!188039))

(assert (=> b!154673 m!187989))

(assert (=> b!154673 m!187989))

(declare-fun m!188819 () Bool)

(assert (=> b!154673 m!188819))

(assert (=> b!154240 d!50883))

(assert (=> bm!17169 d!50857))

(declare-fun d!50885 () Bool)

(assert (=> d!50885 (= (get!1609 (getValueByKey!183 (toList!924 (+!192 lt!80917 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80903)) (v!3422 (getValueByKey!183 (toList!924 (+!192 lt!80917 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80903)))))

(assert (=> d!50659 d!50885))

(declare-fun d!50887 () Bool)

(declare-fun c!29657 () Bool)

(assert (=> d!50887 (= c!29657 (and ((_ is Cons!1803) (toList!924 (+!192 lt!80917 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))) (= (_1!1426 (h!2412 (toList!924 (+!192 lt!80917 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))) lt!80903)))))

(declare-fun e!101041 () Option!189)

(assert (=> d!50887 (= (getValueByKey!183 (toList!924 (+!192 lt!80917 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80903) e!101041)))

(declare-fun b!154676 () Bool)

(declare-fun e!101042 () Option!189)

(assert (=> b!154676 (= e!101041 e!101042)))

(declare-fun c!29658 () Bool)

(assert (=> b!154676 (= c!29658 (and ((_ is Cons!1803) (toList!924 (+!192 lt!80917 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))) (not (= (_1!1426 (h!2412 (toList!924 (+!192 lt!80917 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))) lt!80903))))))

(declare-fun b!154677 () Bool)

(assert (=> b!154677 (= e!101042 (getValueByKey!183 (t!6601 (toList!924 (+!192 lt!80917 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))) lt!80903))))

(declare-fun b!154675 () Bool)

(assert (=> b!154675 (= e!101041 (Some!188 (_2!1426 (h!2412 (toList!924 (+!192 lt!80917 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))))

(declare-fun b!154678 () Bool)

(assert (=> b!154678 (= e!101042 None!187)))

(assert (= (and d!50887 c!29657) b!154675))

(assert (= (and d!50887 (not c!29657)) b!154676))

(assert (= (and b!154676 c!29658) b!154677))

(assert (= (and b!154676 (not c!29658)) b!154678))

(declare-fun m!188821 () Bool)

(assert (=> b!154677 m!188821))

(assert (=> d!50659 d!50887))

(assert (=> b!154266 d!50781))

(declare-fun d!50889 () Bool)

(declare-fun e!101043 () Bool)

(assert (=> d!50889 e!101043))

(declare-fun res!73011 () Bool)

(assert (=> d!50889 (=> res!73011 e!101043)))

(declare-fun lt!81223 () Bool)

(assert (=> d!50889 (= res!73011 (not lt!81223))))

(declare-fun lt!81226 () Bool)

(assert (=> d!50889 (= lt!81223 lt!81226)))

(declare-fun lt!81225 () Unit!4899)

(declare-fun e!101044 () Unit!4899)

(assert (=> d!50889 (= lt!81225 e!101044)))

(declare-fun c!29659 () Bool)

(assert (=> d!50889 (= c!29659 lt!81226)))

(assert (=> d!50889 (= lt!81226 (containsKey!187 (toList!924 lt!81021) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50889 (= (contains!968 lt!81021 #b1000000000000000000000000000000000000000000000000000000000000000) lt!81223)))

(declare-fun b!154679 () Bool)

(declare-fun lt!81224 () Unit!4899)

(assert (=> b!154679 (= e!101044 lt!81224)))

(assert (=> b!154679 (= lt!81224 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!81021) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154679 (isDefined!136 (getValueByKey!183 (toList!924 lt!81021) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154680 () Bool)

(declare-fun Unit!4922 () Unit!4899)

(assert (=> b!154680 (= e!101044 Unit!4922)))

(declare-fun b!154681 () Bool)

(assert (=> b!154681 (= e!101043 (isDefined!136 (getValueByKey!183 (toList!924 lt!81021) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50889 c!29659) b!154679))

(assert (= (and d!50889 (not c!29659)) b!154680))

(assert (= (and d!50889 (not res!73011)) b!154681))

(declare-fun m!188823 () Bool)

(assert (=> d!50889 m!188823))

(declare-fun m!188825 () Bool)

(assert (=> b!154679 m!188825))

(declare-fun m!188827 () Bool)

(assert (=> b!154679 m!188827))

(assert (=> b!154679 m!188827))

(declare-fun m!188829 () Bool)

(assert (=> b!154679 m!188829))

(assert (=> b!154681 m!188827))

(assert (=> b!154681 m!188827))

(assert (=> b!154681 m!188829))

(assert (=> bm!17172 d!50889))

(declare-fun d!50891 () Bool)

(assert (=> d!50891 (isDefined!136 (getValueByKey!183 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80916))))

(declare-fun lt!81227 () Unit!4899)

(assert (=> d!50891 (= lt!81227 (choose!920 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80916))))

(declare-fun e!101045 () Bool)

(assert (=> d!50891 e!101045))

(declare-fun res!73012 () Bool)

(assert (=> d!50891 (=> (not res!73012) (not e!101045))))

(assert (=> d!50891 (= res!73012 (isStrictlySorted!330 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (=> d!50891 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80916) lt!81227)))

(declare-fun b!154682 () Bool)

(assert (=> b!154682 (= e!101045 (containsKey!187 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80916))))

(assert (= (and d!50891 res!73012) b!154682))

(assert (=> d!50891 m!188147))

(assert (=> d!50891 m!188147))

(assert (=> d!50891 m!188149))

(declare-fun m!188831 () Bool)

(assert (=> d!50891 m!188831))

(declare-fun m!188833 () Bool)

(assert (=> d!50891 m!188833))

(assert (=> b!154682 m!188143))

(assert (=> b!154346 d!50891))

(assert (=> b!154346 d!50713))

(assert (=> b!154346 d!50715))

(assert (=> b!154209 d!50603))

(declare-fun d!50893 () Bool)

(assert (=> d!50893 (= (apply!128 lt!80995 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)) (get!1609 (getValueByKey!183 (toList!924 lt!80995) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000))))))

(declare-fun bs!6550 () Bool)

(assert (= bs!6550 d!50893))

(assert (=> bs!6550 m!187989))

(declare-fun m!188835 () Bool)

(assert (=> bs!6550 m!188835))

(assert (=> bs!6550 m!188835))

(declare-fun m!188837 () Bool)

(assert (=> bs!6550 m!188837))

(assert (=> b!154282 d!50893))

(declare-fun d!50895 () Bool)

(declare-fun c!29660 () Bool)

(assert (=> d!50895 (= c!29660 ((_ is ValueCellFull!1170) (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!101046 () V!3683)

(assert (=> d!50895 (= (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!101046)))

(declare-fun b!154683 () Bool)

(assert (=> b!154683 (= e!101046 (get!1610 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154684 () Bool)

(assert (=> b!154684 (= e!101046 (get!1611 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50895 c!29660) b!154683))

(assert (= (and d!50895 (not c!29660)) b!154684))

(assert (=> b!154683 m!187993))

(assert (=> b!154683 m!187839))

(declare-fun m!188839 () Bool)

(assert (=> b!154683 m!188839))

(assert (=> b!154684 m!187993))

(assert (=> b!154684 m!187839))

(declare-fun m!188841 () Bool)

(assert (=> b!154684 m!188841))

(assert (=> b!154282 d!50895))

(declare-fun d!50897 () Bool)

(declare-fun e!101047 () Bool)

(assert (=> d!50897 e!101047))

(declare-fun res!73013 () Bool)

(assert (=> d!50897 (=> res!73013 e!101047)))

(declare-fun lt!81228 () Bool)

(assert (=> d!50897 (= res!73013 (not lt!81228))))

(declare-fun lt!81231 () Bool)

(assert (=> d!50897 (= lt!81228 lt!81231)))

(declare-fun lt!81230 () Unit!4899)

(declare-fun e!101048 () Unit!4899)

(assert (=> d!50897 (= lt!81230 e!101048)))

(declare-fun c!29661 () Bool)

(assert (=> d!50897 (= c!29661 lt!81231)))

(assert (=> d!50897 (= lt!81231 (containsKey!187 (toList!924 lt!80995) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!50897 (= (contains!968 lt!80995 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)) lt!81228)))

(declare-fun b!154685 () Bool)

(declare-fun lt!81229 () Unit!4899)

(assert (=> b!154685 (= e!101048 lt!81229)))

(assert (=> b!154685 (= lt!81229 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!80995) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> b!154685 (isDefined!136 (getValueByKey!183 (toList!924 lt!80995) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154686 () Bool)

(declare-fun Unit!4923 () Unit!4899)

(assert (=> b!154686 (= e!101048 Unit!4923)))

(declare-fun b!154687 () Bool)

(assert (=> b!154687 (= e!101047 (isDefined!136 (getValueByKey!183 (toList!924 lt!80995) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000))))))

(assert (= (and d!50897 c!29661) b!154685))

(assert (= (and d!50897 (not c!29661)) b!154686))

(assert (= (and d!50897 (not res!73013)) b!154687))

(assert (=> d!50897 m!187989))

(declare-fun m!188843 () Bool)

(assert (=> d!50897 m!188843))

(assert (=> b!154685 m!187989))

(declare-fun m!188845 () Bool)

(assert (=> b!154685 m!188845))

(assert (=> b!154685 m!187989))

(assert (=> b!154685 m!188835))

(assert (=> b!154685 m!188835))

(declare-fun m!188847 () Bool)

(assert (=> b!154685 m!188847))

(assert (=> b!154687 m!187989))

(assert (=> b!154687 m!188835))

(assert (=> b!154687 m!188835))

(assert (=> b!154687 m!188847))

(assert (=> b!154279 d!50897))

(declare-fun c!29662 () Bool)

(declare-fun d!50899 () Bool)

(assert (=> d!50899 (= c!29662 (and ((_ is Cons!1803) (toList!924 lt!81052)) (= (_1!1426 (h!2412 (toList!924 lt!81052))) (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun e!101049 () Option!189)

(assert (=> d!50899 (= (getValueByKey!183 (toList!924 lt!81052) (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) e!101049)))

(declare-fun b!154689 () Bool)

(declare-fun e!101050 () Option!189)

(assert (=> b!154689 (= e!101049 e!101050)))

(declare-fun c!29663 () Bool)

(assert (=> b!154689 (= c!29663 (and ((_ is Cons!1803) (toList!924 lt!81052)) (not (= (_1!1426 (h!2412 (toList!924 lt!81052))) (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun b!154690 () Bool)

(assert (=> b!154690 (= e!101050 (getValueByKey!183 (t!6601 (toList!924 lt!81052)) (_1!1426 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154688 () Bool)

(assert (=> b!154688 (= e!101049 (Some!188 (_2!1426 (h!2412 (toList!924 lt!81052)))))))

(declare-fun b!154691 () Bool)

(assert (=> b!154691 (= e!101050 None!187)))

(assert (= (and d!50899 c!29662) b!154688))

(assert (= (and d!50899 (not c!29662)) b!154689))

(assert (= (and b!154689 c!29663) b!154690))

(assert (= (and b!154689 (not c!29663)) b!154691))

(declare-fun m!188849 () Bool)

(assert (=> b!154690 m!188849))

(assert (=> b!154350 d!50899))

(declare-fun d!50901 () Bool)

(declare-fun e!101051 () Bool)

(assert (=> d!50901 e!101051))

(declare-fun res!73014 () Bool)

(assert (=> d!50901 (=> res!73014 e!101051)))

(declare-fun lt!81232 () Bool)

(assert (=> d!50901 (= res!73014 (not lt!81232))))

(declare-fun lt!81235 () Bool)

(assert (=> d!50901 (= lt!81232 lt!81235)))

(declare-fun lt!81234 () Unit!4899)

(declare-fun e!101052 () Unit!4899)

(assert (=> d!50901 (= lt!81234 e!101052)))

(declare-fun c!29664 () Bool)

(assert (=> d!50901 (= c!29664 lt!81235)))

(assert (=> d!50901 (= lt!81235 (containsKey!187 (toList!924 lt!80919) lt!80915))))

(assert (=> d!50901 (= (contains!968 lt!80919 lt!80915) lt!81232)))

(declare-fun b!154692 () Bool)

(declare-fun lt!81233 () Unit!4899)

(assert (=> b!154692 (= e!101052 lt!81233)))

(assert (=> b!154692 (= lt!81233 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!80919) lt!80915))))

(assert (=> b!154692 (isDefined!136 (getValueByKey!183 (toList!924 lt!80919) lt!80915))))

(declare-fun b!154693 () Bool)

(declare-fun Unit!4924 () Unit!4899)

(assert (=> b!154693 (= e!101052 Unit!4924)))

(declare-fun b!154694 () Bool)

(assert (=> b!154694 (= e!101051 (isDefined!136 (getValueByKey!183 (toList!924 lt!80919) lt!80915)))))

(assert (= (and d!50901 c!29664) b!154692))

(assert (= (and d!50901 (not c!29664)) b!154693))

(assert (= (and d!50901 (not res!73014)) b!154694))

(declare-fun m!188851 () Bool)

(assert (=> d!50901 m!188851))

(declare-fun m!188853 () Bool)

(assert (=> b!154692 m!188853))

(assert (=> b!154692 m!188155))

(assert (=> b!154692 m!188155))

(declare-fun m!188855 () Bool)

(assert (=> b!154692 m!188855))

(assert (=> b!154694 m!188155))

(assert (=> b!154694 m!188155))

(assert (=> b!154694 m!188855))

(assert (=> d!50641 d!50901))

(assert (=> d!50641 d!50643))

(declare-fun d!50903 () Bool)

(assert (=> d!50903 (= (apply!128 (+!192 lt!80919 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80915) (apply!128 lt!80919 lt!80915))))

(assert (=> d!50903 true))

(declare-fun _$34!1042 () Unit!4899)

(assert (=> d!50903 (= (choose!917 lt!80919 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80915) _$34!1042)))

(declare-fun bs!6551 () Bool)

(assert (= bs!6551 d!50903))

(assert (=> bs!6551 m!187861))

(assert (=> bs!6551 m!187861))

(assert (=> bs!6551 m!187863))

(assert (=> bs!6551 m!187877))

(assert (=> d!50641 d!50903))

(assert (=> d!50641 d!50645))

(assert (=> d!50641 d!50649))

(declare-fun d!50905 () Bool)

(declare-fun res!73015 () Bool)

(declare-fun e!101053 () Bool)

(assert (=> d!50905 (=> res!73015 e!101053)))

(assert (=> d!50905 (= res!73015 (and ((_ is Cons!1803) (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))) (= (_1!1426 (h!2412 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))) lt!80916)))))

(assert (=> d!50905 (= (containsKey!187 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80916) e!101053)))

(declare-fun b!154696 () Bool)

(declare-fun e!101054 () Bool)

(assert (=> b!154696 (= e!101053 e!101054)))

(declare-fun res!73016 () Bool)

(assert (=> b!154696 (=> (not res!73016) (not e!101054))))

(assert (=> b!154696 (= res!73016 (and (or (not ((_ is Cons!1803) (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))) (bvsle (_1!1426 (h!2412 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))) lt!80916)) ((_ is Cons!1803) (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))) (bvslt (_1!1426 (h!2412 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))))))) lt!80916)))))

(declare-fun b!154697 () Bool)

(assert (=> b!154697 (= e!101054 (containsKey!187 (t!6601 (toList!924 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))) lt!80916))))

(assert (= (and d!50905 (not res!73015)) b!154696))

(assert (= (and b!154696 res!73016) b!154697))

(declare-fun m!188857 () Bool)

(assert (=> b!154697 m!188857))

(assert (=> d!50639 d!50905))

(declare-fun d!50907 () Bool)

(declare-fun res!73017 () Bool)

(declare-fun e!101055 () Bool)

(assert (=> d!50907 (=> res!73017 e!101055)))

(assert (=> d!50907 (= res!73017 (and ((_ is Cons!1803) (toList!924 lt!80911)) (= (_1!1426 (h!2412 (toList!924 lt!80911))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50907 (= (containsKey!187 (toList!924 lt!80911) #b1000000000000000000000000000000000000000000000000000000000000000) e!101055)))

(declare-fun b!154698 () Bool)

(declare-fun e!101056 () Bool)

(assert (=> b!154698 (= e!101055 e!101056)))

(declare-fun res!73018 () Bool)

(assert (=> b!154698 (=> (not res!73018) (not e!101056))))

(assert (=> b!154698 (= res!73018 (and (or (not ((_ is Cons!1803) (toList!924 lt!80911))) (bvsle (_1!1426 (h!2412 (toList!924 lt!80911))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1803) (toList!924 lt!80911)) (bvslt (_1!1426 (h!2412 (toList!924 lt!80911))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154699 () Bool)

(assert (=> b!154699 (= e!101056 (containsKey!187 (t!6601 (toList!924 lt!80911)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!50907 (not res!73017)) b!154698))

(assert (= (and b!154698 res!73018) b!154699))

(declare-fun m!188859 () Bool)

(assert (=> b!154699 m!188859))

(assert (=> d!50599 d!50907))

(declare-fun b!154700 () Bool)

(declare-fun e!101057 () Bool)

(declare-fun call!17212 () Bool)

(assert (=> b!154700 (= e!101057 call!17212)))

(declare-fun bm!17209 () Bool)

(declare-fun c!29665 () Bool)

(assert (=> bm!17209 (= call!17212 (arrayNoDuplicates!0 (_keys!4837 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!29665 (Cons!1804 (select (arr!2411 (_keys!4837 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!29537 (Cons!1804 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000) Nil!1805) Nil!1805)) (ite c!29537 (Cons!1804 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000) Nil!1805) Nil!1805))))))

(declare-fun b!154701 () Bool)

(declare-fun e!101059 () Bool)

(assert (=> b!154701 (= e!101059 e!101057)))

(assert (=> b!154701 (= c!29665 (validKeyInArray!0 (select (arr!2411 (_keys!4837 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!154702 () Bool)

(declare-fun e!101060 () Bool)

(assert (=> b!154702 (= e!101060 e!101059)))

(declare-fun res!73021 () Bool)

(assert (=> b!154702 (=> (not res!73021) (not e!101059))))

(declare-fun e!101058 () Bool)

(assert (=> b!154702 (= res!73021 (not e!101058))))

(declare-fun res!73019 () Bool)

(assert (=> b!154702 (=> (not res!73019) (not e!101058))))

(assert (=> b!154702 (= res!73019 (validKeyInArray!0 (select (arr!2411 (_keys!4837 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!154704 () Bool)

(assert (=> b!154704 (= e!101057 call!17212)))

(declare-fun d!50909 () Bool)

(declare-fun res!73020 () Bool)

(assert (=> d!50909 (=> res!73020 e!101060)))

(assert (=> d!50909 (= res!73020 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2688 (_keys!4837 newMap!16))))))

(assert (=> d!50909 (= (arrayNoDuplicates!0 (_keys!4837 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29537 (Cons!1804 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000) Nil!1805) Nil!1805)) e!101060)))

(declare-fun b!154703 () Bool)

(assert (=> b!154703 (= e!101058 (contains!969 (ite c!29537 (Cons!1804 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000) Nil!1805) Nil!1805) (select (arr!2411 (_keys!4837 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!50909 (not res!73020)) b!154702))

(assert (= (and b!154702 res!73019) b!154703))

(assert (= (and b!154702 res!73021) b!154701))

(assert (= (and b!154701 c!29665) b!154704))

(assert (= (and b!154701 (not c!29665)) b!154700))

(assert (= (or b!154704 b!154700) bm!17209))

(assert (=> bm!17209 m!188251))

(declare-fun m!188861 () Bool)

(assert (=> bm!17209 m!188861))

(assert (=> b!154701 m!188251))

(assert (=> b!154701 m!188251))

(assert (=> b!154701 m!188253))

(assert (=> b!154702 m!188251))

(assert (=> b!154702 m!188251))

(assert (=> b!154702 m!188253))

(assert (=> b!154703 m!188251))

(assert (=> b!154703 m!188251))

(declare-fun m!188863 () Bool)

(assert (=> b!154703 m!188863))

(assert (=> bm!17162 d!50909))

(assert (=> d!50633 d!50637))

(assert (=> d!50633 d!50655))

(declare-fun d!50911 () Bool)

(declare-fun e!101061 () Bool)

(assert (=> d!50911 e!101061))

(declare-fun res!73022 () Bool)

(assert (=> d!50911 (=> res!73022 e!101061)))

(declare-fun lt!81236 () Bool)

(assert (=> d!50911 (= res!73022 (not lt!81236))))

(declare-fun lt!81239 () Bool)

(assert (=> d!50911 (= lt!81236 lt!81239)))

(declare-fun lt!81238 () Unit!4899)

(declare-fun e!101062 () Unit!4899)

(assert (=> d!50911 (= lt!81238 e!101062)))

(declare-fun c!29666 () Bool)

(assert (=> d!50911 (= c!29666 lt!81239)))

(assert (=> d!50911 (= lt!81239 (containsKey!187 (toList!924 lt!80917) lt!80903))))

(assert (=> d!50911 (= (contains!968 lt!80917 lt!80903) lt!81236)))

(declare-fun b!154705 () Bool)

(declare-fun lt!81237 () Unit!4899)

(assert (=> b!154705 (= e!101062 lt!81237)))

(assert (=> b!154705 (= lt!81237 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!80917) lt!80903))))

(assert (=> b!154705 (isDefined!136 (getValueByKey!183 (toList!924 lt!80917) lt!80903))))

(declare-fun b!154706 () Bool)

(declare-fun Unit!4925 () Unit!4899)

(assert (=> b!154706 (= e!101062 Unit!4925)))

(declare-fun b!154707 () Bool)

(assert (=> b!154707 (= e!101061 (isDefined!136 (getValueByKey!183 (toList!924 lt!80917) lt!80903)))))

(assert (= (and d!50911 c!29666) b!154705))

(assert (= (and d!50911 (not c!29666)) b!154706))

(assert (= (and d!50911 (not res!73022)) b!154707))

(declare-fun m!188865 () Bool)

(assert (=> d!50911 m!188865))

(declare-fun m!188867 () Bool)

(assert (=> b!154705 m!188867))

(assert (=> b!154705 m!188203))

(assert (=> b!154705 m!188203))

(declare-fun m!188869 () Bool)

(assert (=> b!154705 m!188869))

(assert (=> b!154707 m!188203))

(assert (=> b!154707 m!188203))

(assert (=> b!154707 m!188869))

(assert (=> d!50633 d!50911))

(assert (=> d!50633 d!50659))

(declare-fun d!50913 () Bool)

(assert (=> d!50913 (= (apply!128 (+!192 lt!80917 (tuple2!2831 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80903) (apply!128 lt!80917 lt!80903))))

(assert (=> d!50913 true))

(declare-fun _$34!1043 () Unit!4899)

(assert (=> d!50913 (= (choose!917 lt!80917 lt!80909 (minValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80903) _$34!1043)))

(declare-fun bs!6552 () Bool)

(assert (= bs!6552 d!50913))

(assert (=> bs!6552 m!187865))

(assert (=> bs!6552 m!187865))

(assert (=> bs!6552 m!187867))

(assert (=> bs!6552 m!187881))

(assert (=> d!50633 d!50913))

(declare-fun bm!17210 () Bool)

(declare-fun call!17213 () ListLongMap!1817)

(assert (=> bm!17210 (= call!17213 (getCurrentListMapNoExtraKeys!161 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))))))

(declare-fun d!50915 () Bool)

(declare-fun e!101063 () Bool)

(assert (=> d!50915 e!101063))

(declare-fun res!73024 () Bool)

(assert (=> d!50915 (=> (not res!73024) (not e!101063))))

(declare-fun lt!81244 () ListLongMap!1817)

(assert (=> d!50915 (= res!73024 (not (contains!968 lt!81244 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!101065 () ListLongMap!1817)

(assert (=> d!50915 (= lt!81244 e!101065)))

(declare-fun c!29669 () Bool)

(assert (=> d!50915 (= c!29669 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(assert (=> d!50915 (validMask!0 (mask!7468 (v!3419 (underlying!526 thiss!992))))))

(assert (=> d!50915 (= (getCurrentListMapNoExtraKeys!161 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992)))) lt!81244)))

(declare-fun b!154708 () Bool)

(declare-fun e!101064 () Bool)

(declare-fun e!101066 () Bool)

(assert (=> b!154708 (= e!101064 e!101066)))

(declare-fun c!29668 () Bool)

(assert (=> b!154708 (= c!29668 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun b!154709 () Bool)

(declare-fun e!101067 () ListLongMap!1817)

(assert (=> b!154709 (= e!101065 e!101067)))

(declare-fun c!29670 () Bool)

(assert (=> b!154709 (= c!29670 (validKeyInArray!0 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!154710 () Bool)

(declare-fun e!101069 () Bool)

(assert (=> b!154710 (= e!101064 e!101069)))

(assert (=> b!154710 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun res!73025 () Bool)

(assert (=> b!154710 (= res!73025 (contains!968 lt!81244 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!154710 (=> (not res!73025) (not e!101069))))

(declare-fun b!154711 () Bool)

(assert (=> b!154711 (= e!101066 (= lt!81244 (getCurrentListMapNoExtraKeys!161 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (_values!3047 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992))) (extraKeys!2805 (v!3419 (underlying!526 thiss!992))) (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) (minValue!2907 (v!3419 (underlying!526 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun b!154712 () Bool)

(assert (=> b!154712 (= e!101065 (ListLongMap!1818 Nil!1804))))

(declare-fun b!154713 () Bool)

(assert (=> b!154713 (= e!101066 (isEmpty!430 lt!81244))))

(declare-fun b!154714 () Bool)

(assert (=> b!154714 (= e!101063 e!101064)))

(declare-fun c!29667 () Bool)

(declare-fun e!101068 () Bool)

(assert (=> b!154714 (= c!29667 e!101068)))

(declare-fun res!73026 () Bool)

(assert (=> b!154714 (=> (not res!73026) (not e!101068))))

(assert (=> b!154714 (= res!73026 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun b!154715 () Bool)

(assert (=> b!154715 (= e!101068 (validKeyInArray!0 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!154715 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!154716 () Bool)

(declare-fun lt!81246 () Unit!4899)

(declare-fun lt!81242 () Unit!4899)

(assert (=> b!154716 (= lt!81246 lt!81242)))

(declare-fun lt!81240 () (_ BitVec 64))

(declare-fun lt!81243 () ListLongMap!1817)

(declare-fun lt!81245 () V!3683)

(declare-fun lt!81241 () (_ BitVec 64))

(assert (=> b!154716 (not (contains!968 (+!192 lt!81243 (tuple2!2831 lt!81240 lt!81245)) lt!81241))))

(assert (=> b!154716 (= lt!81242 (addStillNotContains!70 lt!81243 lt!81240 lt!81245 lt!81241))))

(assert (=> b!154716 (= lt!81241 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!154716 (= lt!81245 (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!154716 (= lt!81240 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!154716 (= lt!81243 call!17213)))

(assert (=> b!154716 (= e!101067 (+!192 call!17213 (tuple2!2831 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!154717 () Bool)

(declare-fun res!73023 () Bool)

(assert (=> b!154717 (=> (not res!73023) (not e!101063))))

(assert (=> b!154717 (= res!73023 (not (contains!968 lt!81244 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154718 () Bool)

(assert (=> b!154718 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(assert (=> b!154718 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2689 (_values!3047 (v!3419 (underlying!526 thiss!992))))))))

(assert (=> b!154718 (= e!101069 (= (apply!128 lt!81244 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1608 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!154719 () Bool)

(assert (=> b!154719 (= e!101067 call!17213)))

(assert (= (and d!50915 c!29669) b!154712))

(assert (= (and d!50915 (not c!29669)) b!154709))

(assert (= (and b!154709 c!29670) b!154716))

(assert (= (and b!154709 (not c!29670)) b!154719))

(assert (= (or b!154716 b!154719) bm!17210))

(assert (= (and d!50915 res!73024) b!154717))

(assert (= (and b!154717 res!73023) b!154714))

(assert (= (and b!154714 res!73026) b!154715))

(assert (= (and b!154714 c!29667) b!154710))

(assert (= (and b!154714 (not c!29667)) b!154708))

(assert (= (and b!154710 res!73025) b!154718))

(assert (= (and b!154708 c!29668) b!154711))

(assert (= (and b!154708 (not c!29668)) b!154713))

(declare-fun b_lambda!6871 () Bool)

(assert (=> (not b_lambda!6871) (not b!154716)))

(assert (=> b!154716 t!6603))

(declare-fun b_and!9635 () Bool)

(assert (= b_and!9631 (and (=> t!6603 result!4489) b_and!9635)))

(assert (=> b!154716 t!6605))

(declare-fun b_and!9637 () Bool)

(assert (= b_and!9633 (and (=> t!6605 result!4493) b_and!9637)))

(declare-fun b_lambda!6873 () Bool)

(assert (=> (not b_lambda!6873) (not b!154718)))

(assert (=> b!154718 t!6603))

(declare-fun b_and!9639 () Bool)

(assert (= b_and!9635 (and (=> t!6603 result!4489) b_and!9639)))

(assert (=> b!154718 t!6605))

(declare-fun b_and!9641 () Bool)

(assert (= b_and!9637 (and (=> t!6605 result!4493) b_and!9641)))

(declare-fun m!188871 () Bool)

(assert (=> b!154709 m!188871))

(assert (=> b!154709 m!188871))

(declare-fun m!188873 () Bool)

(assert (=> b!154709 m!188873))

(declare-fun m!188875 () Bool)

(assert (=> b!154713 m!188875))

(assert (=> b!154718 m!187839))

(assert (=> b!154718 m!188871))

(declare-fun m!188877 () Bool)

(assert (=> b!154718 m!188877))

(assert (=> b!154718 m!188871))

(declare-fun m!188879 () Bool)

(assert (=> b!154718 m!188879))

(assert (=> b!154718 m!187839))

(declare-fun m!188881 () Bool)

(assert (=> b!154718 m!188881))

(assert (=> b!154718 m!188879))

(declare-fun m!188883 () Bool)

(assert (=> b!154717 m!188883))

(assert (=> b!154715 m!188871))

(assert (=> b!154715 m!188871))

(assert (=> b!154715 m!188873))

(assert (=> b!154710 m!188871))

(assert (=> b!154710 m!188871))

(declare-fun m!188885 () Bool)

(assert (=> b!154710 m!188885))

(declare-fun m!188887 () Bool)

(assert (=> d!50915 m!188887))

(assert (=> d!50915 m!187893))

(declare-fun m!188889 () Bool)

(assert (=> bm!17210 m!188889))

(assert (=> b!154711 m!188889))

(declare-fun m!188891 () Bool)

(assert (=> b!154716 m!188891))

(assert (=> b!154716 m!187839))

(assert (=> b!154716 m!188879))

(assert (=> b!154716 m!187839))

(assert (=> b!154716 m!188881))

(assert (=> b!154716 m!188879))

(assert (=> b!154716 m!188891))

(declare-fun m!188893 () Bool)

(assert (=> b!154716 m!188893))

(assert (=> b!154716 m!188871))

(declare-fun m!188895 () Bool)

(assert (=> b!154716 m!188895))

(declare-fun m!188897 () Bool)

(assert (=> b!154716 m!188897))

(assert (=> b!154205 d!50915))

(declare-fun b!154720 () Bool)

(declare-fun e!101071 () (_ BitVec 32))

(declare-fun e!101070 () (_ BitVec 32))

(assert (=> b!154720 (= e!101071 e!101070)))

(declare-fun c!29672 () Bool)

(assert (=> b!154720 (= c!29672 (validKeyInArray!0 (select (arr!2411 (_keys!4837 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!154721 () Bool)

(declare-fun call!17214 () (_ BitVec 32))

(assert (=> b!154721 (= e!101070 (bvadd #b00000000000000000000000000000001 call!17214))))

(declare-fun b!154722 () Bool)

(assert (=> b!154722 (= e!101071 #b00000000000000000000000000000000)))

(declare-fun d!50917 () Bool)

(declare-fun lt!81247 () (_ BitVec 32))

(assert (=> d!50917 (and (bvsge lt!81247 #b00000000000000000000000000000000) (bvsle lt!81247 (bvsub (size!2688 (_keys!4837 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!50917 (= lt!81247 e!101071)))

(declare-fun c!29671 () Bool)

(assert (=> d!50917 (= c!29671 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2688 (_keys!4837 newMap!16))))))

(assert (=> d!50917 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2688 (_keys!4837 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!2688 (_keys!4837 newMap!16)) (size!2688 (_keys!4837 newMap!16))))))

(assert (=> d!50917 (= (arrayCountValidKeys!0 (_keys!4837 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2688 (_keys!4837 newMap!16))) lt!81247)))

(declare-fun b!154723 () Bool)

(assert (=> b!154723 (= e!101070 call!17214)))

(declare-fun bm!17211 () Bool)

(assert (=> bm!17211 (= call!17214 (arrayCountValidKeys!0 (_keys!4837 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2688 (_keys!4837 newMap!16))))))

(assert (= (and d!50917 c!29671) b!154722))

(assert (= (and d!50917 (not c!29671)) b!154720))

(assert (= (and b!154720 c!29672) b!154721))

(assert (= (and b!154720 (not c!29672)) b!154723))

(assert (= (or b!154721 b!154723) bm!17211))

(assert (=> b!154720 m!188251))

(assert (=> b!154720 m!188251))

(assert (=> b!154720 m!188253))

(declare-fun m!188899 () Bool)

(assert (=> bm!17211 m!188899))

(assert (=> bm!17179 d!50917))

(assert (=> bm!17156 d!50915))

(declare-fun d!50919 () Bool)

(assert (=> d!50919 (= (get!1609 (getValueByKey!183 (toList!924 (+!192 lt!80919 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80915)) (v!3422 (getValueByKey!183 (toList!924 (+!192 lt!80919 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80915)))))

(assert (=> d!50649 d!50919))

(declare-fun c!29673 () Bool)

(declare-fun d!50921 () Bool)

(assert (=> d!50921 (= c!29673 (and ((_ is Cons!1803) (toList!924 (+!192 lt!80919 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))) (= (_1!1426 (h!2412 (toList!924 (+!192 lt!80919 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))) lt!80915)))))

(declare-fun e!101072 () Option!189)

(assert (=> d!50921 (= (getValueByKey!183 (toList!924 (+!192 lt!80919 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!80915) e!101072)))

(declare-fun b!154725 () Bool)

(declare-fun e!101073 () Option!189)

(assert (=> b!154725 (= e!101072 e!101073)))

(declare-fun c!29674 () Bool)

(assert (=> b!154725 (= c!29674 (and ((_ is Cons!1803) (toList!924 (+!192 lt!80919 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))) (not (= (_1!1426 (h!2412 (toList!924 (+!192 lt!80919 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))) lt!80915))))))

(declare-fun b!154726 () Bool)

(assert (=> b!154726 (= e!101073 (getValueByKey!183 (t!6601 (toList!924 (+!192 lt!80919 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))) lt!80915))))

(declare-fun b!154724 () Bool)

(assert (=> b!154724 (= e!101072 (Some!188 (_2!1426 (h!2412 (toList!924 (+!192 lt!80919 (tuple2!2831 lt!80922 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))))

(declare-fun b!154727 () Bool)

(assert (=> b!154727 (= e!101073 None!187)))

(assert (= (and d!50921 c!29673) b!154724))

(assert (= (and d!50921 (not c!29673)) b!154725))

(assert (= (and b!154725 c!29674) b!154726))

(assert (= (and b!154725 (not c!29674)) b!154727))

(declare-fun m!188901 () Bool)

(assert (=> b!154726 m!188901))

(assert (=> d!50649 d!50921))

(declare-fun d!50923 () Bool)

(assert (=> d!50923 (= (apply!128 lt!80995 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1609 (getValueByKey!183 (toList!924 lt!80995) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6553 () Bool)

(assert (= bs!6553 d!50923))

(assert (=> bs!6553 m!188267))

(assert (=> bs!6553 m!188267))

(declare-fun m!188903 () Bool)

(assert (=> bs!6553 m!188903))

(assert (=> b!154277 d!50923))

(declare-fun d!50925 () Bool)

(assert (=> d!50925 (= (get!1609 (getValueByKey!183 (toList!924 lt!80917) lt!80903)) (v!3422 (getValueByKey!183 (toList!924 lt!80917) lt!80903)))))

(assert (=> d!50655 d!50925))

(declare-fun d!50927 () Bool)

(declare-fun c!29675 () Bool)

(assert (=> d!50927 (= c!29675 (and ((_ is Cons!1803) (toList!924 lt!80917)) (= (_1!1426 (h!2412 (toList!924 lt!80917))) lt!80903)))))

(declare-fun e!101074 () Option!189)

(assert (=> d!50927 (= (getValueByKey!183 (toList!924 lt!80917) lt!80903) e!101074)))

(declare-fun b!154729 () Bool)

(declare-fun e!101075 () Option!189)

(assert (=> b!154729 (= e!101074 e!101075)))

(declare-fun c!29676 () Bool)

(assert (=> b!154729 (= c!29676 (and ((_ is Cons!1803) (toList!924 lt!80917)) (not (= (_1!1426 (h!2412 (toList!924 lt!80917))) lt!80903))))))

(declare-fun b!154730 () Bool)

(assert (=> b!154730 (= e!101075 (getValueByKey!183 (t!6601 (toList!924 lt!80917)) lt!80903))))

(declare-fun b!154728 () Bool)

(assert (=> b!154728 (= e!101074 (Some!188 (_2!1426 (h!2412 (toList!924 lt!80917)))))))

(declare-fun b!154731 () Bool)

(assert (=> b!154731 (= e!101075 None!187)))

(assert (= (and d!50927 c!29675) b!154728))

(assert (= (and d!50927 (not c!29675)) b!154729))

(assert (= (and b!154729 c!29676) b!154730))

(assert (= (and b!154729 (not c!29676)) b!154731))

(declare-fun m!188905 () Bool)

(assert (=> b!154730 m!188905))

(assert (=> d!50655 d!50927))

(assert (=> b!154225 d!50789))

(assert (=> b!154225 d!50791))

(declare-fun d!50929 () Bool)

(assert (=> d!50929 (= (apply!128 (+!192 lt!80912 (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80921) (apply!128 lt!80912 lt!80921))))

(assert (=> d!50929 true))

(declare-fun _$34!1044 () Unit!4899)

(assert (=> d!50929 (= (choose!917 lt!80912 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80921) _$34!1044)))

(declare-fun bs!6554 () Bool)

(assert (= bs!6554 d!50929))

(assert (=> bs!6554 m!187871))

(assert (=> bs!6554 m!187871))

(assert (=> bs!6554 m!187885))

(assert (=> bs!6554 m!187855))

(assert (=> d!50661 d!50929))

(assert (=> d!50661 d!50651))

(assert (=> d!50661 d!50647))

(declare-fun d!50931 () Bool)

(declare-fun e!101076 () Bool)

(assert (=> d!50931 e!101076))

(declare-fun res!73027 () Bool)

(assert (=> d!50931 (=> res!73027 e!101076)))

(declare-fun lt!81248 () Bool)

(assert (=> d!50931 (= res!73027 (not lt!81248))))

(declare-fun lt!81251 () Bool)

(assert (=> d!50931 (= lt!81248 lt!81251)))

(declare-fun lt!81250 () Unit!4899)

(declare-fun e!101077 () Unit!4899)

(assert (=> d!50931 (= lt!81250 e!101077)))

(declare-fun c!29677 () Bool)

(assert (=> d!50931 (= c!29677 lt!81251)))

(assert (=> d!50931 (= lt!81251 (containsKey!187 (toList!924 lt!80912) lt!80921))))

(assert (=> d!50931 (= (contains!968 lt!80912 lt!80921) lt!81248)))

(declare-fun b!154732 () Bool)

(declare-fun lt!81249 () Unit!4899)

(assert (=> b!154732 (= e!101077 lt!81249)))

(assert (=> b!154732 (= lt!81249 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!80912) lt!80921))))

(assert (=> b!154732 (isDefined!136 (getValueByKey!183 (toList!924 lt!80912) lt!80921))))

(declare-fun b!154733 () Bool)

(declare-fun Unit!4926 () Unit!4899)

(assert (=> b!154733 (= e!101077 Unit!4926)))

(declare-fun b!154734 () Bool)

(assert (=> b!154734 (= e!101076 (isDefined!136 (getValueByKey!183 (toList!924 lt!80912) lt!80921)))))

(assert (= (and d!50931 c!29677) b!154732))

(assert (= (and d!50931 (not c!29677)) b!154733))

(assert (= (and d!50931 (not res!73027)) b!154734))

(declare-fun m!188907 () Bool)

(assert (=> d!50931 m!188907))

(declare-fun m!188909 () Bool)

(assert (=> b!154732 m!188909))

(assert (=> b!154732 m!188187))

(assert (=> b!154732 m!188187))

(declare-fun m!188911 () Bool)

(assert (=> b!154732 m!188911))

(assert (=> b!154734 m!188187))

(assert (=> b!154734 m!188187))

(assert (=> b!154734 m!188911))

(assert (=> d!50661 d!50931))

(assert (=> d!50661 d!50657))

(declare-fun d!50933 () Bool)

(assert (=> d!50933 (= (apply!128 lt!81021 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1609 (getValueByKey!183 (toList!924 lt!81021) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6555 () Bool)

(assert (= bs!6555 d!50933))

(assert (=> bs!6555 m!188827))

(assert (=> bs!6555 m!188827))

(declare-fun m!188913 () Bool)

(assert (=> bs!6555 m!188913))

(assert (=> b!154296 d!50933))

(assert (=> b!154222 d!50795))

(assert (=> b!154222 d!50797))

(declare-fun d!50935 () Bool)

(assert (=> d!50935 (= (get!1610 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3418 (select (arr!2412 (_values!3047 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!154292 d!50935))

(declare-fun d!50937 () Bool)

(assert (=> d!50937 (arrayContainsKey!0 (_keys!4837 newMap!16) lt!80966 #b00000000000000000000000000000000)))

(declare-fun lt!81254 () Unit!4899)

(declare-fun choose!13 (array!5105 (_ BitVec 64) (_ BitVec 32)) Unit!4899)

(assert (=> d!50937 (= lt!81254 (choose!13 (_keys!4837 newMap!16) lt!80966 #b00000000000000000000000000000000))))

(assert (=> d!50937 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!50937 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4837 newMap!16) lt!80966 #b00000000000000000000000000000000) lt!81254)))

(declare-fun bs!6556 () Bool)

(assert (= bs!6556 d!50937))

(assert (=> bs!6556 m!187947))

(declare-fun m!188915 () Bool)

(assert (=> bs!6556 m!188915))

(assert (=> b!154235 d!50937))

(declare-fun d!50939 () Bool)

(declare-fun res!73032 () Bool)

(declare-fun e!101082 () Bool)

(assert (=> d!50939 (=> res!73032 e!101082)))

(assert (=> d!50939 (= res!73032 (= (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000) lt!80966))))

(assert (=> d!50939 (= (arrayContainsKey!0 (_keys!4837 newMap!16) lt!80966 #b00000000000000000000000000000000) e!101082)))

(declare-fun b!154739 () Bool)

(declare-fun e!101083 () Bool)

(assert (=> b!154739 (= e!101082 e!101083)))

(declare-fun res!73033 () Bool)

(assert (=> b!154739 (=> (not res!73033) (not e!101083))))

(assert (=> b!154739 (= res!73033 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2688 (_keys!4837 newMap!16))))))

(declare-fun b!154740 () Bool)

(assert (=> b!154740 (= e!101083 (arrayContainsKey!0 (_keys!4837 newMap!16) lt!80966 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!50939 (not res!73032)) b!154739))

(assert (= (and b!154739 res!73033) b!154740))

(assert (=> d!50939 m!187941))

(declare-fun m!188917 () Bool)

(assert (=> b!154740 m!188917))

(assert (=> b!154235 d!50939))

(declare-fun b!154753 () Bool)

(declare-fun c!29685 () Bool)

(declare-fun lt!81263 () (_ BitVec 64))

(assert (=> b!154753 (= c!29685 (= lt!81263 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!101091 () SeekEntryResult!286)

(declare-fun e!101092 () SeekEntryResult!286)

(assert (=> b!154753 (= e!101091 e!101092)))

(declare-fun b!154754 () Bool)

(declare-fun e!101090 () SeekEntryResult!286)

(assert (=> b!154754 (= e!101090 Undefined!286)))

(declare-fun d!50941 () Bool)

(declare-fun lt!81261 () SeekEntryResult!286)

(assert (=> d!50941 (and (or ((_ is Undefined!286) lt!81261) (not ((_ is Found!286) lt!81261)) (and (bvsge (index!3313 lt!81261) #b00000000000000000000000000000000) (bvslt (index!3313 lt!81261) (size!2688 (_keys!4837 newMap!16))))) (or ((_ is Undefined!286) lt!81261) ((_ is Found!286) lt!81261) (not ((_ is MissingZero!286) lt!81261)) (and (bvsge (index!3312 lt!81261) #b00000000000000000000000000000000) (bvslt (index!3312 lt!81261) (size!2688 (_keys!4837 newMap!16))))) (or ((_ is Undefined!286) lt!81261) ((_ is Found!286) lt!81261) ((_ is MissingZero!286) lt!81261) (not ((_ is MissingVacant!286) lt!81261)) (and (bvsge (index!3315 lt!81261) #b00000000000000000000000000000000) (bvslt (index!3315 lt!81261) (size!2688 (_keys!4837 newMap!16))))) (or ((_ is Undefined!286) lt!81261) (ite ((_ is Found!286) lt!81261) (= (select (arr!2411 (_keys!4837 newMap!16)) (index!3313 lt!81261)) (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!286) lt!81261) (= (select (arr!2411 (_keys!4837 newMap!16)) (index!3312 lt!81261)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!286) lt!81261) (= (select (arr!2411 (_keys!4837 newMap!16)) (index!3315 lt!81261)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!50941 (= lt!81261 e!101090)))

(declare-fun c!29684 () Bool)

(declare-fun lt!81262 () SeekEntryResult!286)

(assert (=> d!50941 (= c!29684 (and ((_ is Intermediate!286) lt!81262) (undefined!1098 lt!81262)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5105 (_ BitVec 32)) SeekEntryResult!286)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!50941 (= lt!81262 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000) (mask!7468 newMap!16)) (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000) (_keys!4837 newMap!16) (mask!7468 newMap!16)))))

(assert (=> d!50941 (validMask!0 (mask!7468 newMap!16))))

(assert (=> d!50941 (= (seekEntryOrOpen!0 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000) (_keys!4837 newMap!16) (mask!7468 newMap!16)) lt!81261)))

(declare-fun b!154755 () Bool)

(assert (=> b!154755 (= e!101090 e!101091)))

(assert (=> b!154755 (= lt!81263 (select (arr!2411 (_keys!4837 newMap!16)) (index!3314 lt!81262)))))

(declare-fun c!29686 () Bool)

(assert (=> b!154755 (= c!29686 (= lt!81263 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154756 () Bool)

(assert (=> b!154756 (= e!101091 (Found!286 (index!3314 lt!81262)))))

(declare-fun b!154757 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5105 (_ BitVec 32)) SeekEntryResult!286)

(assert (=> b!154757 (= e!101092 (seekKeyOrZeroReturnVacant!0 (x!17022 lt!81262) (index!3314 lt!81262) (index!3314 lt!81262) (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000) (_keys!4837 newMap!16) (mask!7468 newMap!16)))))

(declare-fun b!154758 () Bool)

(assert (=> b!154758 (= e!101092 (MissingZero!286 (index!3314 lt!81262)))))

(assert (= (and d!50941 c!29684) b!154754))

(assert (= (and d!50941 (not c!29684)) b!154755))

(assert (= (and b!154755 c!29686) b!154756))

(assert (= (and b!154755 (not c!29686)) b!154753))

(assert (= (and b!154753 c!29685) b!154758))

(assert (= (and b!154753 (not c!29685)) b!154757))

(declare-fun m!188919 () Bool)

(assert (=> d!50941 m!188919))

(assert (=> d!50941 m!187941))

(declare-fun m!188921 () Bool)

(assert (=> d!50941 m!188921))

(declare-fun m!188923 () Bool)

(assert (=> d!50941 m!188923))

(assert (=> d!50941 m!188113))

(assert (=> d!50941 m!187941))

(assert (=> d!50941 m!188919))

(declare-fun m!188925 () Bool)

(assert (=> d!50941 m!188925))

(declare-fun m!188927 () Bool)

(assert (=> d!50941 m!188927))

(declare-fun m!188929 () Bool)

(assert (=> b!154755 m!188929))

(assert (=> b!154757 m!187941))

(declare-fun m!188931 () Bool)

(assert (=> b!154757 m!188931))

(assert (=> b!154235 d!50941))

(declare-fun b!154759 () Bool)

(declare-fun e!101095 () Bool)

(declare-fun e!101094 () Bool)

(assert (=> b!154759 (= e!101095 e!101094)))

(declare-fun c!29687 () Bool)

(assert (=> b!154759 (= c!29687 (validKeyInArray!0 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154760 () Bool)

(declare-fun e!101093 () Bool)

(assert (=> b!154760 (= e!101094 e!101093)))

(declare-fun lt!81264 () (_ BitVec 64))

(assert (=> b!154760 (= lt!81264 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!81265 () Unit!4899)

(assert (=> b!154760 (= lt!81265 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4837 (v!3419 (underlying!526 thiss!992))) lt!81264 #b00000000000000000000000000000000))))

(assert (=> b!154760 (arrayContainsKey!0 (_keys!4837 (v!3419 (underlying!526 thiss!992))) lt!81264 #b00000000000000000000000000000000)))

(declare-fun lt!81266 () Unit!4899)

(assert (=> b!154760 (= lt!81266 lt!81265)))

(declare-fun res!73035 () Bool)

(assert (=> b!154760 (= res!73035 (= (seekEntryOrOpen!0 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) #b00000000000000000000000000000000) (_keys!4837 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992)))) (Found!286 #b00000000000000000000000000000000)))))

(assert (=> b!154760 (=> (not res!73035) (not e!101093))))

(declare-fun b!154761 () Bool)

(declare-fun call!17215 () Bool)

(assert (=> b!154761 (= e!101093 call!17215)))

(declare-fun b!154762 () Bool)

(assert (=> b!154762 (= e!101094 call!17215)))

(declare-fun d!50943 () Bool)

(declare-fun res!73034 () Bool)

(assert (=> d!50943 (=> res!73034 e!101095)))

(assert (=> d!50943 (= res!73034 (bvsge #b00000000000000000000000000000000 (size!2688 (_keys!4837 (v!3419 (underlying!526 thiss!992))))))))

(assert (=> d!50943 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4837 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992)))) e!101095)))

(declare-fun bm!17212 () Bool)

(assert (=> bm!17212 (= call!17215 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4837 (v!3419 (underlying!526 thiss!992))) (mask!7468 (v!3419 (underlying!526 thiss!992)))))))

(assert (= (and d!50943 (not res!73034)) b!154759))

(assert (= (and b!154759 c!29687) b!154760))

(assert (= (and b!154759 (not c!29687)) b!154762))

(assert (= (and b!154760 res!73035) b!154761))

(assert (= (or b!154761 b!154762) bm!17212))

(assert (=> b!154759 m!187989))

(assert (=> b!154759 m!187989))

(assert (=> b!154759 m!188039))

(assert (=> b!154760 m!187989))

(declare-fun m!188933 () Bool)

(assert (=> b!154760 m!188933))

(declare-fun m!188935 () Bool)

(assert (=> b!154760 m!188935))

(assert (=> b!154760 m!187989))

(declare-fun m!188937 () Bool)

(assert (=> b!154760 m!188937))

(declare-fun m!188939 () Bool)

(assert (=> bm!17212 m!188939))

(assert (=> b!154239 d!50943))

(assert (=> d!50629 d!50771))

(declare-fun d!50945 () Bool)

(declare-fun e!101096 () Bool)

(assert (=> d!50945 e!101096))

(declare-fun res!73037 () Bool)

(assert (=> d!50945 (=> (not res!73037) (not e!101096))))

(declare-fun lt!81268 () ListLongMap!1817)

(assert (=> d!50945 (= res!73037 (contains!968 lt!81268 (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun lt!81269 () List!1807)

(assert (=> d!50945 (= lt!81268 (ListLongMap!1818 lt!81269))))

(declare-fun lt!81267 () Unit!4899)

(declare-fun lt!81270 () Unit!4899)

(assert (=> d!50945 (= lt!81267 lt!81270)))

(assert (=> d!50945 (= (getValueByKey!183 lt!81269 (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50945 (= lt!81270 (lemmaContainsTupThenGetReturnValue!96 lt!81269 (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50945 (= lt!81269 (insertStrictlySorted!99 (toList!924 call!17166) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) (_2!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (=> d!50945 (= (+!192 call!17166 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!81268)))

(declare-fun b!154763 () Bool)

(declare-fun res!73036 () Bool)

(assert (=> b!154763 (=> (not res!73036) (not e!101096))))

(assert (=> b!154763 (= res!73036 (= (getValueByKey!183 (toList!924 lt!81268) (_1!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (Some!188 (_2!1426 (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun b!154764 () Bool)

(assert (=> b!154764 (= e!101096 (contains!970 (toList!924 lt!81268) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(assert (= (and d!50945 res!73037) b!154763))

(assert (= (and b!154763 res!73036) b!154764))

(declare-fun m!188941 () Bool)

(assert (=> d!50945 m!188941))

(declare-fun m!188943 () Bool)

(assert (=> d!50945 m!188943))

(declare-fun m!188945 () Bool)

(assert (=> d!50945 m!188945))

(declare-fun m!188947 () Bool)

(assert (=> d!50945 m!188947))

(declare-fun m!188949 () Bool)

(assert (=> b!154763 m!188949))

(declare-fun m!188951 () Bool)

(assert (=> b!154764 m!188951))

(assert (=> b!154284 d!50945))

(declare-fun d!50947 () Bool)

(declare-fun e!101097 () Bool)

(assert (=> d!50947 e!101097))

(declare-fun res!73039 () Bool)

(assert (=> d!50947 (=> (not res!73039) (not e!101097))))

(declare-fun lt!81272 () ListLongMap!1817)

(assert (=> d!50947 (= res!73039 (contains!968 lt!81272 (_1!1426 (ite (or c!29539 c!29538) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(declare-fun lt!81273 () List!1807)

(assert (=> d!50947 (= lt!81272 (ListLongMap!1818 lt!81273))))

(declare-fun lt!81271 () Unit!4899)

(declare-fun lt!81274 () Unit!4899)

(assert (=> d!50947 (= lt!81271 lt!81274)))

(assert (=> d!50947 (= (getValueByKey!183 lt!81273 (_1!1426 (ite (or c!29539 c!29538) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))) (Some!188 (_2!1426 (ite (or c!29539 c!29538) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (=> d!50947 (= lt!81274 (lemmaContainsTupThenGetReturnValue!96 lt!81273 (_1!1426 (ite (or c!29539 c!29538) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (_2!1426 (ite (or c!29539 c!29538) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (=> d!50947 (= lt!81273 (insertStrictlySorted!99 (toList!924 (ite c!29539 call!17169 (ite c!29538 call!17172 call!17167))) (_1!1426 (ite (or c!29539 c!29538) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) (_2!1426 (ite (or c!29539 c!29538) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))))

(assert (=> d!50947 (= (+!192 (ite c!29539 call!17169 (ite c!29538 call!17172 call!17167)) (ite (or c!29539 c!29538) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81272)))

(declare-fun b!154765 () Bool)

(declare-fun res!73038 () Bool)

(assert (=> b!154765 (=> (not res!73038) (not e!101097))))

(assert (=> b!154765 (= res!73038 (= (getValueByKey!183 (toList!924 lt!81272) (_1!1426 (ite (or c!29539 c!29538) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))) (Some!188 (_2!1426 (ite (or c!29539 c!29538) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))))

(declare-fun b!154766 () Bool)

(assert (=> b!154766 (= e!101097 (contains!970 (toList!924 lt!81272) (ite (or c!29539 c!29538) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (= (and d!50947 res!73039) b!154765))

(assert (= (and b!154765 res!73038) b!154766))

(declare-fun m!188953 () Bool)

(assert (=> d!50947 m!188953))

(declare-fun m!188955 () Bool)

(assert (=> d!50947 m!188955))

(declare-fun m!188957 () Bool)

(assert (=> d!50947 m!188957))

(declare-fun m!188959 () Bool)

(assert (=> d!50947 m!188959))

(declare-fun m!188961 () Bool)

(assert (=> b!154765 m!188961))

(declare-fun m!188963 () Bool)

(assert (=> b!154766 m!188963))

(assert (=> bm!17166 d!50947))

(declare-fun d!50949 () Bool)

(declare-fun lt!81275 () Bool)

(assert (=> d!50949 (= lt!81275 (select (content!145 (toList!924 lt!81056)) (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun e!101099 () Bool)

(assert (=> d!50949 (= lt!81275 e!101099)))

(declare-fun res!73041 () Bool)

(assert (=> d!50949 (=> (not res!73041) (not e!101099))))

(assert (=> d!50949 (= res!73041 ((_ is Cons!1803) (toList!924 lt!81056)))))

(assert (=> d!50949 (= (contains!970 (toList!924 lt!81056) (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!81275)))

(declare-fun b!154767 () Bool)

(declare-fun e!101098 () Bool)

(assert (=> b!154767 (= e!101099 e!101098)))

(declare-fun res!73040 () Bool)

(assert (=> b!154767 (=> res!73040 e!101098)))

(assert (=> b!154767 (= res!73040 (= (h!2412 (toList!924 lt!81056)) (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun b!154768 () Bool)

(assert (=> b!154768 (= e!101098 (contains!970 (t!6601 (toList!924 lt!81056)) (tuple2!2831 lt!80907 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(assert (= (and d!50949 res!73041) b!154767))

(assert (= (and b!154767 (not res!73040)) b!154768))

(declare-fun m!188965 () Bool)

(assert (=> d!50949 m!188965))

(declare-fun m!188967 () Bool)

(assert (=> d!50949 m!188967))

(declare-fun m!188969 () Bool)

(assert (=> b!154768 m!188969))

(assert (=> b!154353 d!50949))

(declare-fun d!50951 () Bool)

(declare-fun e!101100 () Bool)

(assert (=> d!50951 e!101100))

(declare-fun res!73042 () Bool)

(assert (=> d!50951 (=> res!73042 e!101100)))

(declare-fun lt!81276 () Bool)

(assert (=> d!50951 (= res!73042 (not lt!81276))))

(declare-fun lt!81279 () Bool)

(assert (=> d!50951 (= lt!81276 lt!81279)))

(declare-fun lt!81278 () Unit!4899)

(declare-fun e!101101 () Unit!4899)

(assert (=> d!50951 (= lt!81278 e!101101)))

(declare-fun c!29688 () Bool)

(assert (=> d!50951 (= c!29688 lt!81279)))

(assert (=> d!50951 (= lt!81279 (containsKey!187 (toList!924 lt!80995) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50951 (= (contains!968 lt!80995 #b1000000000000000000000000000000000000000000000000000000000000000) lt!81276)))

(declare-fun b!154769 () Bool)

(declare-fun lt!81277 () Unit!4899)

(assert (=> b!154769 (= e!101101 lt!81277)))

(assert (=> b!154769 (= lt!81277 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!80995) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154769 (isDefined!136 (getValueByKey!183 (toList!924 lt!80995) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154770 () Bool)

(declare-fun Unit!4927 () Unit!4899)

(assert (=> b!154770 (= e!101101 Unit!4927)))

(declare-fun b!154771 () Bool)

(assert (=> b!154771 (= e!101100 (isDefined!136 (getValueByKey!183 (toList!924 lt!80995) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50951 c!29688) b!154769))

(assert (= (and d!50951 (not c!29688)) b!154770))

(assert (= (and d!50951 (not res!73042)) b!154771))

(declare-fun m!188971 () Bool)

(assert (=> d!50951 m!188971))

(declare-fun m!188973 () Bool)

(assert (=> b!154769 m!188973))

(assert (=> b!154769 m!188593))

(assert (=> b!154769 m!188593))

(declare-fun m!188975 () Bool)

(assert (=> b!154769 m!188975))

(assert (=> b!154771 m!188593))

(assert (=> b!154771 m!188593))

(assert (=> b!154771 m!188975))

(assert (=> bm!17165 d!50951))

(declare-fun d!50953 () Bool)

(assert (=> d!50953 (= (get!1609 (getValueByKey!183 (toList!924 lt!80912) lt!80921)) (v!3422 (getValueByKey!183 (toList!924 lt!80912) lt!80921)))))

(assert (=> d!50651 d!50953))

(declare-fun d!50955 () Bool)

(declare-fun c!29689 () Bool)

(assert (=> d!50955 (= c!29689 (and ((_ is Cons!1803) (toList!924 lt!80912)) (= (_1!1426 (h!2412 (toList!924 lt!80912))) lt!80921)))))

(declare-fun e!101102 () Option!189)

(assert (=> d!50955 (= (getValueByKey!183 (toList!924 lt!80912) lt!80921) e!101102)))

(declare-fun b!154773 () Bool)

(declare-fun e!101103 () Option!189)

(assert (=> b!154773 (= e!101102 e!101103)))

(declare-fun c!29690 () Bool)

(assert (=> b!154773 (= c!29690 (and ((_ is Cons!1803) (toList!924 lt!80912)) (not (= (_1!1426 (h!2412 (toList!924 lt!80912))) lt!80921))))))

(declare-fun b!154774 () Bool)

(assert (=> b!154774 (= e!101103 (getValueByKey!183 (t!6601 (toList!924 lt!80912)) lt!80921))))

(declare-fun b!154772 () Bool)

(assert (=> b!154772 (= e!101102 (Some!188 (_2!1426 (h!2412 (toList!924 lt!80912)))))))

(declare-fun b!154775 () Bool)

(assert (=> b!154775 (= e!101103 None!187)))

(assert (= (and d!50955 c!29689) b!154772))

(assert (= (and d!50955 (not c!29689)) b!154773))

(assert (= (and b!154773 c!29690) b!154774))

(assert (= (and b!154773 (not c!29690)) b!154775))

(declare-fun m!188977 () Bool)

(assert (=> b!154774 m!188977))

(assert (=> d!50651 d!50955))

(assert (=> d!50635 d!50639))

(assert (=> d!50635 d!50653))

(declare-fun d!50957 () Bool)

(assert (=> d!50957 (contains!968 (+!192 lt!80904 (tuple2!2831 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!80916)))

(assert (=> d!50957 true))

(declare-fun _$35!405 () Unit!4899)

(assert (=> d!50957 (= (choose!918 lt!80904 lt!80906 (zeroValue!2907 (v!3419 (underlying!526 thiss!992))) lt!80916) _$35!405)))

(declare-fun bs!6557 () Bool)

(assert (= bs!6557 d!50957))

(assert (=> bs!6557 m!187857))

(assert (=> bs!6557 m!187857))

(assert (=> bs!6557 m!187859))

(assert (=> d!50635 d!50957))

(declare-fun d!50959 () Bool)

(declare-fun e!101104 () Bool)

(assert (=> d!50959 e!101104))

(declare-fun res!73043 () Bool)

(assert (=> d!50959 (=> res!73043 e!101104)))

(declare-fun lt!81280 () Bool)

(assert (=> d!50959 (= res!73043 (not lt!81280))))

(declare-fun lt!81283 () Bool)

(assert (=> d!50959 (= lt!81280 lt!81283)))

(declare-fun lt!81282 () Unit!4899)

(declare-fun e!101105 () Unit!4899)

(assert (=> d!50959 (= lt!81282 e!101105)))

(declare-fun c!29691 () Bool)

(assert (=> d!50959 (= c!29691 lt!81283)))

(assert (=> d!50959 (= lt!81283 (containsKey!187 (toList!924 lt!80904) lt!80916))))

(assert (=> d!50959 (= (contains!968 lt!80904 lt!80916) lt!81280)))

(declare-fun b!154777 () Bool)

(declare-fun lt!81281 () Unit!4899)

(assert (=> b!154777 (= e!101105 lt!81281)))

(assert (=> b!154777 (= lt!81281 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!80904) lt!80916))))

(assert (=> b!154777 (isDefined!136 (getValueByKey!183 (toList!924 lt!80904) lt!80916))))

(declare-fun b!154778 () Bool)

(declare-fun Unit!4928 () Unit!4899)

(assert (=> b!154778 (= e!101105 Unit!4928)))

(declare-fun b!154779 () Bool)

(assert (=> b!154779 (= e!101104 (isDefined!136 (getValueByKey!183 (toList!924 lt!80904) lt!80916)))))

(assert (= (and d!50959 c!29691) b!154777))

(assert (= (and d!50959 (not c!29691)) b!154778))

(assert (= (and d!50959 (not res!73043)) b!154779))

(declare-fun m!188979 () Bool)

(assert (=> d!50959 m!188979))

(declare-fun m!188981 () Bool)

(assert (=> b!154777 m!188981))

(declare-fun m!188983 () Bool)

(assert (=> b!154777 m!188983))

(assert (=> b!154777 m!188983))

(declare-fun m!188985 () Bool)

(assert (=> b!154777 m!188985))

(assert (=> b!154779 m!188983))

(assert (=> b!154779 m!188983))

(assert (=> b!154779 m!188985))

(assert (=> d!50635 d!50959))

(declare-fun d!50961 () Bool)

(declare-fun lt!81286 () Bool)

(declare-fun content!146 (List!1808) (InoxSet (_ BitVec 64)))

(assert (=> d!50961 (= lt!81286 (select (content!146 Nil!1805) (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!101110 () Bool)

(assert (=> d!50961 (= lt!81286 e!101110)))

(declare-fun res!73048 () Bool)

(assert (=> d!50961 (=> (not res!73048) (not e!101110))))

(assert (=> d!50961 (= res!73048 ((_ is Cons!1804) Nil!1805))))

(assert (=> d!50961 (= (contains!969 Nil!1805 (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)) lt!81286)))

(declare-fun b!154784 () Bool)

(declare-fun e!101111 () Bool)

(assert (=> b!154784 (= e!101110 e!101111)))

(declare-fun res!73049 () Bool)

(assert (=> b!154784 (=> res!73049 e!101111)))

(assert (=> b!154784 (= res!73049 (= (h!2413 Nil!1805) (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154785 () Bool)

(assert (=> b!154785 (= e!101111 (contains!969 (t!6606 Nil!1805) (select (arr!2411 (_keys!4837 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!50961 res!73048) b!154784))

(assert (= (and b!154784 (not res!73049)) b!154785))

(declare-fun m!188987 () Bool)

(assert (=> d!50961 m!188987))

(assert (=> d!50961 m!187941))

(declare-fun m!188989 () Bool)

(assert (=> d!50961 m!188989))

(assert (=> b!154785 m!187941))

(declare-fun m!188991 () Bool)

(assert (=> b!154785 m!188991))

(assert (=> b!154257 d!50961))

(declare-fun d!50963 () Bool)

(declare-fun lt!81287 () Bool)

(assert (=> d!50963 (= lt!81287 (select (content!145 (toList!924 lt!80982)) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun e!101113 () Bool)

(assert (=> d!50963 (= lt!81287 e!101113)))

(declare-fun res!73051 () Bool)

(assert (=> d!50963 (=> (not res!73051) (not e!101113))))

(assert (=> d!50963 (= res!73051 ((_ is Cons!1803) (toList!924 lt!80982)))))

(assert (=> d!50963 (= (contains!970 (toList!924 lt!80982) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))) lt!81287)))

(declare-fun b!154786 () Bool)

(declare-fun e!101112 () Bool)

(assert (=> b!154786 (= e!101113 e!101112)))

(declare-fun res!73050 () Bool)

(assert (=> b!154786 (=> res!73050 e!101112)))

(assert (=> b!154786 (= res!73050 (= (h!2412 (toList!924 lt!80982)) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(declare-fun b!154787 () Bool)

(assert (=> b!154787 (= e!101112 (contains!970 (t!6601 (toList!924 lt!80982)) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992))))))))

(assert (= (and d!50963 res!73051) b!154786))

(assert (= (and b!154786 (not res!73050)) b!154787))

(declare-fun m!188993 () Bool)

(assert (=> d!50963 m!188993))

(declare-fun m!188995 () Bool)

(assert (=> d!50963 m!188995))

(declare-fun m!188997 () Bool)

(assert (=> b!154787 m!188997))

(assert (=> b!154264 d!50963))

(declare-fun d!50965 () Bool)

(declare-fun e!101114 () Bool)

(assert (=> d!50965 e!101114))

(declare-fun res!73052 () Bool)

(assert (=> d!50965 (=> res!73052 e!101114)))

(declare-fun lt!81288 () Bool)

(assert (=> d!50965 (= res!73052 (not lt!81288))))

(declare-fun lt!81291 () Bool)

(assert (=> d!50965 (= lt!81288 lt!81291)))

(declare-fun lt!81290 () Unit!4899)

(declare-fun e!101115 () Unit!4899)

(assert (=> d!50965 (= lt!81290 e!101115)))

(declare-fun c!29692 () Bool)

(assert (=> d!50965 (= c!29692 lt!81291)))

(assert (=> d!50965 (= lt!81291 (containsKey!187 (toList!924 lt!80941) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!50965 (= (contains!968 lt!80941 (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!81288)))

(declare-fun b!154788 () Bool)

(declare-fun lt!81289 () Unit!4899)

(assert (=> b!154788 (= e!101115 lt!81289)))

(assert (=> b!154788 (= lt!81289 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!924 lt!80941) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!154788 (isDefined!136 (getValueByKey!183 (toList!924 lt!80941) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!154789 () Bool)

(declare-fun Unit!4929 () Unit!4899)

(assert (=> b!154789 (= e!101115 Unit!4929)))

(declare-fun b!154790 () Bool)

(assert (=> b!154790 (= e!101114 (isDefined!136 (getValueByKey!183 (toList!924 lt!80941) (select (arr!2411 (_keys!4837 (v!3419 (underlying!526 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!50965 c!29692) b!154788))

(assert (= (and d!50965 (not c!29692)) b!154789))

(assert (= (and d!50965 (not res!73052)) b!154790))

(assert (=> d!50965 m!187841))

(declare-fun m!188999 () Bool)

(assert (=> d!50965 m!188999))

(assert (=> b!154788 m!187841))

(declare-fun m!189001 () Bool)

(assert (=> b!154788 m!189001))

(assert (=> b!154788 m!187841))

(assert (=> b!154788 m!188397))

(assert (=> b!154788 m!188397))

(declare-fun m!189003 () Bool)

(assert (=> b!154788 m!189003))

(assert (=> b!154790 m!187841))

(assert (=> b!154790 m!188397))

(assert (=> b!154790 m!188397))

(assert (=> b!154790 m!189003))

(assert (=> b!154204 d!50965))

(declare-fun d!50967 () Bool)

(declare-fun lt!81292 () Bool)

(assert (=> d!50967 (= lt!81292 (select (content!145 (toList!924 lt!81008)) (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun e!101117 () Bool)

(assert (=> d!50967 (= lt!81292 e!101117)))

(declare-fun res!73054 () Bool)

(assert (=> d!50967 (=> (not res!73054) (not e!101117))))

(assert (=> d!50967 (= res!73054 ((_ is Cons!1803) (toList!924 lt!81008)))))

(assert (=> d!50967 (= (contains!970 (toList!924 lt!81008) (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))) lt!81292)))

(declare-fun b!154791 () Bool)

(declare-fun e!101116 () Bool)

(assert (=> b!154791 (= e!101117 e!101116)))

(declare-fun res!73053 () Bool)

(assert (=> b!154791 (=> res!73053 e!101116)))

(assert (=> b!154791 (= res!73053 (= (h!2412 (toList!924 lt!81008)) (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(declare-fun b!154792 () Bool)

(assert (=> b!154792 (= e!101116 (contains!970 (t!6601 (toList!924 lt!81008)) (ite (or c!29510 c!29509) (tuple2!2831 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2907 (v!3419 (underlying!526 thiss!992)))) (tuple2!2831 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2907 (v!3419 (underlying!526 thiss!992)))))))))

(assert (= (and d!50967 res!73054) b!154791))

(assert (= (and b!154791 (not res!73053)) b!154792))

(declare-fun m!189005 () Bool)

(assert (=> d!50967 m!189005))

(declare-fun m!189007 () Bool)

(assert (=> d!50967 m!189007))

(declare-fun m!189009 () Bool)

(assert (=> b!154792 m!189009))

(assert (=> b!154287 d!50967))

(assert (=> b!154325 d!50667))

(assert (=> b!154299 d!50665))

(declare-fun condMapEmpty!5185 () Bool)

(declare-fun mapDefault!5185 () ValueCell!1170)

(assert (=> mapNonEmpty!5183 (= condMapEmpty!5185 (= mapRest!5183 ((as const (Array (_ BitVec 32) ValueCell!1170)) mapDefault!5185)))))

(declare-fun e!101119 () Bool)

(declare-fun mapRes!5185 () Bool)

(assert (=> mapNonEmpty!5183 (= tp!12203 (and e!101119 mapRes!5185))))

(declare-fun mapIsEmpty!5185 () Bool)

(assert (=> mapIsEmpty!5185 mapRes!5185))

(declare-fun b!154793 () Bool)

(declare-fun e!101118 () Bool)

(assert (=> b!154793 (= e!101118 tp_is_empty!3027)))

(declare-fun mapNonEmpty!5185 () Bool)

(declare-fun tp!12205 () Bool)

(assert (=> mapNonEmpty!5185 (= mapRes!5185 (and tp!12205 e!101118))))

(declare-fun mapKey!5185 () (_ BitVec 32))

(declare-fun mapValue!5185 () ValueCell!1170)

(declare-fun mapRest!5185 () (Array (_ BitVec 32) ValueCell!1170))

(assert (=> mapNonEmpty!5185 (= mapRest!5183 (store mapRest!5185 mapKey!5185 mapValue!5185))))

(declare-fun b!154794 () Bool)

(assert (=> b!154794 (= e!101119 tp_is_empty!3027)))

(assert (= (and mapNonEmpty!5183 condMapEmpty!5185) mapIsEmpty!5185))

(assert (= (and mapNonEmpty!5183 (not condMapEmpty!5185)) mapNonEmpty!5185))

(assert (= (and mapNonEmpty!5185 ((_ is ValueCellFull!1170) mapValue!5185)) b!154793))

(assert (= (and mapNonEmpty!5183 ((_ is ValueCellFull!1170) mapDefault!5185)) b!154794))

(declare-fun m!189011 () Bool)

(assert (=> mapNonEmpty!5185 m!189011))

(declare-fun condMapEmpty!5186 () Bool)

(declare-fun mapDefault!5186 () ValueCell!1170)

(assert (=> mapNonEmpty!5184 (= condMapEmpty!5186 (= mapRest!5184 ((as const (Array (_ BitVec 32) ValueCell!1170)) mapDefault!5186)))))

(declare-fun e!101121 () Bool)

(declare-fun mapRes!5186 () Bool)

(assert (=> mapNonEmpty!5184 (= tp!12204 (and e!101121 mapRes!5186))))

(declare-fun mapIsEmpty!5186 () Bool)

(assert (=> mapIsEmpty!5186 mapRes!5186))

(declare-fun b!154795 () Bool)

(declare-fun e!101120 () Bool)

(assert (=> b!154795 (= e!101120 tp_is_empty!3027)))

(declare-fun mapNonEmpty!5186 () Bool)

(declare-fun tp!12206 () Bool)

(assert (=> mapNonEmpty!5186 (= mapRes!5186 (and tp!12206 e!101120))))

(declare-fun mapRest!5186 () (Array (_ BitVec 32) ValueCell!1170))

(declare-fun mapKey!5186 () (_ BitVec 32))

(declare-fun mapValue!5186 () ValueCell!1170)

(assert (=> mapNonEmpty!5186 (= mapRest!5184 (store mapRest!5186 mapKey!5186 mapValue!5186))))

(declare-fun b!154796 () Bool)

(assert (=> b!154796 (= e!101121 tp_is_empty!3027)))

(assert (= (and mapNonEmpty!5184 condMapEmpty!5186) mapIsEmpty!5186))

(assert (= (and mapNonEmpty!5184 (not condMapEmpty!5186)) mapNonEmpty!5186))

(assert (= (and mapNonEmpty!5186 ((_ is ValueCellFull!1170) mapValue!5186)) b!154795))

(assert (= (and mapNonEmpty!5184 ((_ is ValueCellFull!1170) mapDefault!5186)) b!154796))

(declare-fun m!189013 () Bool)

(assert (=> mapNonEmpty!5186 m!189013))

(declare-fun b_lambda!6875 () Bool)

(assert (= b_lambda!6873 (or (and b!154039 b_free!3221) (and b!154038 b_free!3223 (= (defaultEntry!3064 newMap!16) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))))) b_lambda!6875)))

(declare-fun b_lambda!6877 () Bool)

(assert (= b_lambda!6867 (or (and b!154039 b_free!3221) (and b!154038 b_free!3223 (= (defaultEntry!3064 newMap!16) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))))) b_lambda!6877)))

(declare-fun b_lambda!6879 () Bool)

(assert (= b_lambda!6863 (or (and b!154039 b_free!3221 (= (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) (defaultEntry!3064 newMap!16))) (and b!154038 b_free!3223) b_lambda!6879)))

(declare-fun b_lambda!6881 () Bool)

(assert (= b_lambda!6865 (or (and b!154039 b_free!3221 (= (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))) (defaultEntry!3064 newMap!16))) (and b!154038 b_free!3223) b_lambda!6881)))

(declare-fun b_lambda!6883 () Bool)

(assert (= b_lambda!6871 (or (and b!154039 b_free!3221) (and b!154038 b_free!3223 (= (defaultEntry!3064 newMap!16) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))))) b_lambda!6883)))

(declare-fun b_lambda!6885 () Bool)

(assert (= b_lambda!6869 (or (and b!154039 b_free!3221) (and b!154038 b_free!3223 (= (defaultEntry!3064 newMap!16) (defaultEntry!3064 (v!3419 (underlying!526 thiss!992))))) b_lambda!6885)))

(check-sat (not b!154374) (not b!154525) (not d!50701) (not d!50697) (not b!154480) (not d!50945) (not b!154591) (not b!154600) (not d!50753) (not b!154560) (not b!154380) (not d!50767) (not b!154598) (not b!154713) (not b!154788) (not b!154614) (not b!154669) (not d!50783) (not d!50721) (not b!154633) (not d!50941) (not b!154406) (not b!154499) (not b!154609) (not b_lambda!6881) (not d!50857) (not b!154740) (not d!50717) (not d!50709) (not b!154710) (not bm!17198) (not b!154537) (not b_lambda!6885) (not b!154508) (not b!154769) (not d!50787) (not b!154716) (not b!154759) (not b!154619) (not b!154677) (not b!154594) (not d!50793) (not b!154622) (not b!154726) (not d!50959) (not d!50669) (not b!154363) (not d!50965) (not d!50779) (not b!154612) (not b!154634) (not d!50675) (not d!50811) (not b!154668) (not d!50835) (not b!154653) (not d!50689) (not b!154577) (not b!154694) (not b!154533) (not d!50961) (not b!154596) (not b_lambda!6879) (not b!154585) (not d!50877) (not b!154487) (not b!154547) (not d!50841) (not b!154765) (not b!154703) (not b!154590) (not b!154623) (not d!50947) (not d!50933) (not d!50745) (not b!154638) (not bm!17189) (not d!50683) (not b!154697) (not b!154683) (not b!154665) (not b_lambda!6859) (not b!154663) (not b!154734) (not d!50769) (not b!154444) (not b!154438) (not mapNonEmpty!5186) (not bm!17204) (not d!50875) (not d!50825) (not b!154476) (not b!154434) (not d!50703) (not b!154707) (not b!154779) (not d!50839) (not d!50691) (not b!154618) (not b!154541) (not b!154671) (not d!50747) (not bm!17205) (not b!154442) (not b!154439) (not b!154785) (not d!50719) (not b!154640) (not b!154763) (not bm!17191) (not b!154491) (not b!154702) (not b!154475) (not b!154715) (not b!154505) (not d!50713) (not b!154687) (not d!50913) (not b!154692) (not b!154636) (not bm!17192) (not b!154559) (not d!50829) (not b!154433) (not b!154790) (not d!50833) (not d!50963) (not d!50711) (not b!154544) (not d!50673) (not b!154673) (not b!154527) (not d!50847) (not b!154709) (not b!154460) (not b!154514) (not b!154659) (not b!154418) (not b!154419) b_and!9639 (not b!154660) (not d!50911) (not b!154579) (not d!50803) (not b!154576) (not d!50901) (not b!154711) (not b!154682) (not b!154684) (not b!154546) (not b!154639) (not b!154705) (not b!154629) (not b!154381) (not b!154641) (not b!154436) (not d!50755) (not b!154615) (not b!154472) (not d!50681) (not b!154412) (not d!50937) (not bm!17195) (not bm!17190) (not d!50863) (not d!50679) (not b!154679) (not b!154681) (not d!50823) (not d!50849) (not d!50893) (not b!154582) (not b_next!3221) (not b!154558) (not d!50855) (not b!154613) (not b!154498) (not d!50687) (not b!154520) (not d!50843) (not b!154644) (not b!154553) (not b!154441) (not d!50889) (not b_lambda!6855) (not b!154518) (not d!50871) (not b!154732) (not mapNonEmpty!5185) (not d!50845) (not b!154552) (not b!154565) (not b!154428) (not d!50695) (not b!154556) (not b!154699) (not b_lambda!6861) (not b!154468) (not b!154610) (not d!50859) (not b!154584) (not d!50705) (not d!50831) (not d!50699) (not b!154496) (not d!50685) (not b!154563) (not b!154572) (not bm!17209) (not b!154631) (not b!154490) (not d!50707) (not b!154646) (not d!50805) (not b!154457) (not d!50851) (not b_next!3223) (not b!154672) (not b!154504) (not d!50795) (not b!154454) (not d!50915) (not b!154766) (not b!154651) (not b!154627) (not d!50693) (not d!50891) (not b!154635) (not b!154422) (not d!50923) (not d!50789) (not b!154427) (not b!154620) (not d!50739) (not b!154768) (not d!50951) (not b!154574) (not b_lambda!6883) (not d!50967) (not b!154757) (not b!154628) b_and!9641 (not b!154421) (not d!50873) (not b!154774) (not b!154534) (not d!50817) (not d!50853) (not b!154440) (not b_lambda!6857) (not bm!17211) (not b!154429) (not d!50773) (not d!50733) (not d!50929) (not d!50723) (not b_lambda!6877) (not bm!17201) (not d!50737) (not d!50815) (not b!154602) (not bm!17210) (not b!154413) (not d!50777) (not b!154447) (not b!154760) (not d!50931) (not b!154528) (not d!50751) (not b!154410) (not b!154648) (not bm!17208) (not b!154416) (not d!50837) (not d!50903) (not b!154764) (not b!154493) (not b!154667) (not b!154771) (not d!50821) (not b!154787) (not d!50897) (not b!154420) (not b!154488) (not b!154792) (not d!50813) (not b!154685) (not b!154511) (not b!154568) (not b!154624) (not bm!17212) (not b!154431) (not b!154361) (not b!154717) (not b!154539) (not d!50957) (not b!154607) (not bm!17186) (not b!154435) (not b!154777) (not d!50763) (not b!154720) (not b!154611) (not b!154701) (not b!154730) (not b!154718) (not b!154654) (not b!154407) (not d!50827) (not b_lambda!6845) (not b!154690) (not b!154462) (not d!50809) (not b_lambda!6875) tp_is_empty!3027 (not d!50949) (not d!50867) (not b!154522))
(check-sat b_and!9639 b_and!9641 (not b_next!3221) (not b_next!3223))
