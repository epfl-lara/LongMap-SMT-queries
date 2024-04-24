; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15484 () Bool)

(assert start!15484)

(declare-fun b!154037 () Bool)

(declare-fun b_free!3217 () Bool)

(declare-fun b_next!3217 () Bool)

(assert (=> b!154037 (= b_free!3217 (not b_next!3217))))

(declare-fun tp!12173 () Bool)

(declare-fun b_and!9601 () Bool)

(assert (=> b!154037 (= tp!12173 b_and!9601)))

(declare-fun b!154048 () Bool)

(declare-fun b_free!3219 () Bool)

(declare-fun b_next!3219 () Bool)

(assert (=> b!154048 (= b_free!3219 (not b_next!3219))))

(declare-fun tp!12174 () Bool)

(declare-fun b_and!9603 () Bool)

(assert (=> b!154048 (= tp!12174 b_and!9603)))

(declare-fun b!154036 () Bool)

(declare-fun e!100632 () Bool)

(declare-fun tp_is_empty!3025 () Bool)

(assert (=> b!154036 (= e!100632 tp_is_empty!3025)))

(declare-fun mapIsEmpty!5165 () Bool)

(declare-fun mapRes!5166 () Bool)

(assert (=> mapIsEmpty!5165 mapRes!5166))

(declare-datatypes ((V!3681 0))(
  ( (V!3682 (val!1557 Int)) )
))
(declare-datatypes ((array!5087 0))(
  ( (array!5088 (arr!2402 (Array (_ BitVec 32) (_ BitVec 64))) (size!2679 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1169 0))(
  ( (ValueCellFull!1169 (v!3417 V!3681)) (EmptyCell!1169) )
))
(declare-datatypes ((array!5089 0))(
  ( (array!5090 (arr!2403 (Array (_ BitVec 32) ValueCell!1169)) (size!2680 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1246 0))(
  ( (LongMapFixedSize!1247 (defaultEntry!3063 Int) (mask!7467 (_ BitVec 32)) (extraKeys!2804 (_ BitVec 32)) (zeroValue!2906 V!3681) (minValue!2906 V!3681) (_size!672 (_ BitVec 32)) (_keys!4836 array!5087) (_values!3046 array!5089) (_vacant!672 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1028 0))(
  ( (Cell!1029 (v!3418 LongMapFixedSize!1246)) )
))
(declare-datatypes ((LongMap!1028 0))(
  ( (LongMap!1029 (underlying!525 Cell!1028)) )
))
(declare-fun thiss!992 () LongMap!1028)

(declare-fun e!100627 () Bool)

(declare-fun e!100630 () Bool)

(declare-fun array_inv!1515 (array!5087) Bool)

(declare-fun array_inv!1516 (array!5089) Bool)

(assert (=> b!154037 (= e!100627 (and tp!12173 tp_is_empty!3025 (array_inv!1515 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (array_inv!1516 (_values!3046 (v!3418 (underlying!525 thiss!992)))) e!100630))))

(declare-fun b!154038 () Bool)

(declare-fun e!100635 () Bool)

(assert (=> b!154038 (= e!100635 e!100627)))

(declare-fun b!154039 () Bool)

(declare-fun e!100628 () Bool)

(assert (=> b!154039 (= e!100628 tp_is_empty!3025)))

(declare-fun b!154040 () Bool)

(declare-fun res!72759 () Bool)

(declare-fun e!100626 () Bool)

(assert (=> b!154040 (=> (not res!72759) (not e!100626))))

(declare-fun newMap!16 () LongMapFixedSize!1246)

(assert (=> b!154040 (= res!72759 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7467 newMap!16)) (_size!672 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun b!154041 () Bool)

(declare-fun e!100629 () Bool)

(assert (=> b!154041 (= e!100629 (and e!100632 mapRes!5166))))

(declare-fun condMapEmpty!5166 () Bool)

(declare-fun mapDefault!5166 () ValueCell!1169)

(assert (=> b!154041 (= condMapEmpty!5166 (= (arr!2403 (_values!3046 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1169)) mapDefault!5166)))))

(declare-fun b!154042 () Bool)

(declare-fun e!100625 () Bool)

(assert (=> b!154042 (= e!100626 e!100625)))

(declare-fun res!72755 () Bool)

(assert (=> b!154042 (=> (not res!72755) (not e!100625))))

(declare-datatypes ((tuple2!2762 0))(
  ( (tuple2!2763 (_1!1392 (_ BitVec 64)) (_2!1392 V!3681)) )
))
(declare-datatypes ((List!1789 0))(
  ( (Nil!1786) (Cons!1785 (h!2394 tuple2!2762) (t!6575 List!1789)) )
))
(declare-datatypes ((ListLongMap!1761 0))(
  ( (ListLongMap!1762 (toList!896 List!1789)) )
))
(declare-fun lt!80903 () ListLongMap!1761)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!80902 () ListLongMap!1761)

(assert (=> b!154042 (= res!72755 (and (= lt!80902 lt!80903) (or (= (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun map!1496 (LongMapFixedSize!1246) ListLongMap!1761)

(assert (=> b!154042 (= lt!80903 (map!1496 newMap!16))))

(declare-fun getCurrentListMap!564 (array!5087 array!5089 (_ BitVec 32) (_ BitVec 32) V!3681 V!3681 (_ BitVec 32) Int) ListLongMap!1761)

(assert (=> b!154042 (= lt!80902 (getCurrentListMap!564 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun b!154043 () Bool)

(declare-fun res!72757 () Bool)

(assert (=> b!154043 (=> (not res!72757) (not e!100626))))

(assert (=> b!154043 (= res!72757 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154045 () Bool)

(assert (=> b!154045 (= e!100625 (not (= lt!80903 (map!1496 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun b!154046 () Bool)

(declare-fun e!100624 () Bool)

(assert (=> b!154046 (= e!100624 e!100635)))

(declare-fun mapNonEmpty!5165 () Bool)

(declare-fun mapRes!5165 () Bool)

(declare-fun tp!12172 () Bool)

(declare-fun e!100637 () Bool)

(assert (=> mapNonEmpty!5165 (= mapRes!5165 (and tp!12172 e!100637))))

(declare-fun mapRest!5165 () (Array (_ BitVec 32) ValueCell!1169))

(declare-fun mapValue!5166 () ValueCell!1169)

(declare-fun mapKey!5165 () (_ BitVec 32))

(assert (=> mapNonEmpty!5165 (= (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (store mapRest!5165 mapKey!5165 mapValue!5166))))

(declare-fun b!154047 () Bool)

(declare-fun res!72756 () Bool)

(assert (=> b!154047 (=> (not res!72756) (not e!100626))))

(declare-fun valid!631 (LongMapFixedSize!1246) Bool)

(assert (=> b!154047 (= res!72756 (valid!631 newMap!16))))

(declare-fun mapIsEmpty!5166 () Bool)

(assert (=> mapIsEmpty!5166 mapRes!5165))

(declare-fun e!100636 () Bool)

(assert (=> b!154048 (= e!100636 (and tp!12174 tp_is_empty!3025 (array_inv!1515 (_keys!4836 newMap!16)) (array_inv!1516 (_values!3046 newMap!16)) e!100629))))

(declare-fun b!154049 () Bool)

(assert (=> b!154049 (= e!100637 tp_is_empty!3025)))

(declare-fun mapNonEmpty!5166 () Bool)

(declare-fun tp!12171 () Bool)

(assert (=> mapNonEmpty!5166 (= mapRes!5166 (and tp!12171 e!100628))))

(declare-fun mapKey!5166 () (_ BitVec 32))

(declare-fun mapValue!5165 () ValueCell!1169)

(declare-fun mapRest!5166 () (Array (_ BitVec 32) ValueCell!1169))

(assert (=> mapNonEmpty!5166 (= (arr!2403 (_values!3046 newMap!16)) (store mapRest!5166 mapKey!5166 mapValue!5165))))

(declare-fun b!154050 () Bool)

(declare-fun e!100634 () Bool)

(assert (=> b!154050 (= e!100634 tp_is_empty!3025)))

(declare-fun res!72758 () Bool)

(assert (=> start!15484 (=> (not res!72758) (not e!100626))))

(declare-fun valid!632 (LongMap!1028) Bool)

(assert (=> start!15484 (= res!72758 (valid!632 thiss!992))))

(assert (=> start!15484 e!100626))

(assert (=> start!15484 e!100624))

(assert (=> start!15484 true))

(assert (=> start!15484 e!100636))

(declare-fun b!154044 () Bool)

(assert (=> b!154044 (= e!100630 (and e!100634 mapRes!5165))))

(declare-fun condMapEmpty!5165 () Bool)

(declare-fun mapDefault!5165 () ValueCell!1169)

(assert (=> b!154044 (= condMapEmpty!5165 (= (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1169)) mapDefault!5165)))))

(assert (= (and start!15484 res!72758) b!154043))

(assert (= (and b!154043 res!72757) b!154047))

(assert (= (and b!154047 res!72756) b!154040))

(assert (= (and b!154040 res!72759) b!154042))

(assert (= (and b!154042 res!72755) b!154045))

(assert (= (and b!154044 condMapEmpty!5165) mapIsEmpty!5166))

(assert (= (and b!154044 (not condMapEmpty!5165)) mapNonEmpty!5165))

(get-info :version)

(assert (= (and mapNonEmpty!5165 ((_ is ValueCellFull!1169) mapValue!5166)) b!154049))

(assert (= (and b!154044 ((_ is ValueCellFull!1169) mapDefault!5165)) b!154050))

(assert (= b!154037 b!154044))

(assert (= b!154038 b!154037))

(assert (= b!154046 b!154038))

(assert (= start!15484 b!154046))

(assert (= (and b!154041 condMapEmpty!5166) mapIsEmpty!5165))

(assert (= (and b!154041 (not condMapEmpty!5166)) mapNonEmpty!5166))

(assert (= (and mapNonEmpty!5166 ((_ is ValueCellFull!1169) mapValue!5165)) b!154039))

(assert (= (and b!154041 ((_ is ValueCellFull!1169) mapDefault!5166)) b!154036))

(assert (= b!154048 b!154041))

(assert (= start!15484 b!154048))

(declare-fun m!187937 () Bool)

(assert (=> mapNonEmpty!5165 m!187937))

(declare-fun m!187939 () Bool)

(assert (=> mapNonEmpty!5166 m!187939))

(declare-fun m!187941 () Bool)

(assert (=> b!154045 m!187941))

(declare-fun m!187943 () Bool)

(assert (=> b!154047 m!187943))

(declare-fun m!187945 () Bool)

(assert (=> b!154048 m!187945))

(declare-fun m!187947 () Bool)

(assert (=> b!154048 m!187947))

(declare-fun m!187949 () Bool)

(assert (=> b!154042 m!187949))

(declare-fun m!187951 () Bool)

(assert (=> b!154042 m!187951))

(declare-fun m!187953 () Bool)

(assert (=> b!154042 m!187953))

(declare-fun m!187955 () Bool)

(assert (=> b!154037 m!187955))

(declare-fun m!187957 () Bool)

(assert (=> b!154037 m!187957))

(declare-fun m!187959 () Bool)

(assert (=> start!15484 m!187959))

(check-sat (not b!154048) tp_is_empty!3025 (not mapNonEmpty!5166) (not b!154045) (not start!15484) (not mapNonEmpty!5165) (not b!154042) (not b!154037) b_and!9603 (not b_next!3217) b_and!9601 (not b!154047) (not b_next!3219))
(check-sat b_and!9601 b_and!9603 (not b_next!3217) (not b_next!3219))
(get-model)

(declare-fun d!50653 () Bool)

(declare-fun res!72796 () Bool)

(declare-fun e!100724 () Bool)

(assert (=> d!50653 (=> (not res!72796) (not e!100724))))

(declare-fun simpleValid!104 (LongMapFixedSize!1246) Bool)

(assert (=> d!50653 (= res!72796 (simpleValid!104 newMap!16))))

(assert (=> d!50653 (= (valid!631 newMap!16) e!100724)))

(declare-fun b!154147 () Bool)

(declare-fun res!72797 () Bool)

(assert (=> b!154147 (=> (not res!72797) (not e!100724))))

(declare-fun arrayCountValidKeys!0 (array!5087 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!154147 (= res!72797 (= (arrayCountValidKeys!0 (_keys!4836 newMap!16) #b00000000000000000000000000000000 (size!2679 (_keys!4836 newMap!16))) (_size!672 newMap!16)))))

(declare-fun b!154148 () Bool)

(declare-fun res!72798 () Bool)

(assert (=> b!154148 (=> (not res!72798) (not e!100724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5087 (_ BitVec 32)) Bool)

(assert (=> b!154148 (= res!72798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4836 newMap!16) (mask!7467 newMap!16)))))

(declare-fun b!154149 () Bool)

(declare-datatypes ((List!1790 0))(
  ( (Nil!1787) (Cons!1786 (h!2395 (_ BitVec 64)) (t!6580 List!1790)) )
))
(declare-fun arrayNoDuplicates!0 (array!5087 (_ BitVec 32) List!1790) Bool)

(assert (=> b!154149 (= e!100724 (arrayNoDuplicates!0 (_keys!4836 newMap!16) #b00000000000000000000000000000000 Nil!1787))))

(assert (= (and d!50653 res!72796) b!154147))

(assert (= (and b!154147 res!72797) b!154148))

(assert (= (and b!154148 res!72798) b!154149))

(declare-fun m!188009 () Bool)

(assert (=> d!50653 m!188009))

(declare-fun m!188011 () Bool)

(assert (=> b!154147 m!188011))

(declare-fun m!188013 () Bool)

(assert (=> b!154148 m!188013))

(declare-fun m!188015 () Bool)

(assert (=> b!154149 m!188015))

(assert (=> b!154047 d!50653))

(declare-fun d!50655 () Bool)

(assert (=> d!50655 (= (valid!632 thiss!992) (valid!631 (v!3418 (underlying!525 thiss!992))))))

(declare-fun bs!6533 () Bool)

(assert (= bs!6533 d!50655))

(declare-fun m!188017 () Bool)

(assert (=> bs!6533 m!188017))

(assert (=> start!15484 d!50655))

(declare-fun d!50657 () Bool)

(assert (=> d!50657 (= (map!1496 newMap!16) (getCurrentListMap!564 (_keys!4836 newMap!16) (_values!3046 newMap!16) (mask!7467 newMap!16) (extraKeys!2804 newMap!16) (zeroValue!2906 newMap!16) (minValue!2906 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3063 newMap!16)))))

(declare-fun bs!6534 () Bool)

(assert (= bs!6534 d!50657))

(declare-fun m!188019 () Bool)

(assert (=> bs!6534 m!188019))

(assert (=> b!154042 d!50657))

(declare-fun b!154192 () Bool)

(declare-fun e!100752 () Bool)

(declare-fun e!100755 () Bool)

(assert (=> b!154192 (= e!100752 e!100755)))

(declare-fun res!72825 () Bool)

(assert (=> b!154192 (=> (not res!72825) (not e!100755))))

(declare-fun lt!80962 () ListLongMap!1761)

(declare-fun contains!947 (ListLongMap!1761 (_ BitVec 64)) Bool)

(assert (=> b!154192 (= res!72825 (contains!947 lt!80962 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!154192 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun b!154194 () Bool)

(declare-fun e!100760 () ListLongMap!1761)

(declare-fun call!17144 () ListLongMap!1761)

(assert (=> b!154194 (= e!100760 call!17144)))

(declare-fun b!154195 () Bool)

(declare-fun e!100762 () ListLongMap!1761)

(assert (=> b!154195 (= e!100762 call!17144)))

(declare-fun b!154196 () Bool)

(declare-fun e!100751 () Bool)

(declare-fun call!17140 () Bool)

(assert (=> b!154196 (= e!100751 (not call!17140))))

(declare-fun b!154197 () Bool)

(declare-fun call!17141 () ListLongMap!1761)

(assert (=> b!154197 (= e!100762 call!17141)))

(declare-fun b!154198 () Bool)

(declare-fun e!100761 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!154198 (= e!100761 (validKeyInArray!0 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!154199 () Bool)

(declare-datatypes ((Unit!4904 0))(
  ( (Unit!4905) )
))
(declare-fun e!100759 () Unit!4904)

(declare-fun Unit!4906 () Unit!4904)

(assert (=> b!154199 (= e!100759 Unit!4906)))

(declare-fun bm!17135 () Bool)

(assert (=> bm!17135 (= call!17140 (contains!947 lt!80962 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154200 () Bool)

(declare-fun e!100753 () Bool)

(declare-fun apply!128 (ListLongMap!1761 (_ BitVec 64)) V!3681)

(assert (=> b!154200 (= e!100753 (= (apply!128 lt!80962 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun b!154201 () Bool)

(declare-fun e!100754 () Bool)

(declare-fun e!100757 () Bool)

(assert (=> b!154201 (= e!100754 e!100757)))

(declare-fun res!72822 () Bool)

(declare-fun call!17139 () Bool)

(assert (=> b!154201 (= res!72822 call!17139)))

(assert (=> b!154201 (=> (not res!72822) (not e!100757))))

(declare-fun b!154202 () Bool)

(assert (=> b!154202 (= e!100757 (= (apply!128 lt!80962 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun b!154203 () Bool)

(declare-fun e!100756 () Bool)

(assert (=> b!154203 (= e!100756 (validKeyInArray!0 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!154204 () Bool)

(declare-fun e!100758 () Bool)

(assert (=> b!154204 (= e!100758 e!100754)))

(declare-fun c!29526 () Bool)

(assert (=> b!154204 (= c!29526 (not (= (bvand (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17136 () Bool)

(declare-fun call!17143 () ListLongMap!1761)

(assert (=> bm!17136 (= call!17144 call!17143)))

(declare-fun b!154205 () Bool)

(declare-fun e!100763 () ListLongMap!1761)

(assert (=> b!154205 (= e!100763 e!100760)))

(declare-fun c!29524 () Bool)

(assert (=> b!154205 (= c!29524 (and (not (= (bvand (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!154206 () Bool)

(declare-fun res!72819 () Bool)

(assert (=> b!154206 (=> (not res!72819) (not e!100758))))

(assert (=> b!154206 (= res!72819 e!100752)))

(declare-fun res!72818 () Bool)

(assert (=> b!154206 (=> res!72818 e!100752)))

(assert (=> b!154206 (= res!72818 (not e!100756))))

(declare-fun res!72824 () Bool)

(assert (=> b!154206 (=> (not res!72824) (not e!100756))))

(assert (=> b!154206 (= res!72824 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun bm!17137 () Bool)

(declare-fun call!17142 () ListLongMap!1761)

(declare-fun call!17138 () ListLongMap!1761)

(assert (=> bm!17137 (= call!17142 call!17138)))

(declare-fun bm!17138 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!159 (array!5087 array!5089 (_ BitVec 32) (_ BitVec 32) V!3681 V!3681 (_ BitVec 32) Int) ListLongMap!1761)

(assert (=> bm!17138 (= call!17138 (getCurrentListMapNoExtraKeys!159 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun b!154207 () Bool)

(assert (=> b!154207 (= e!100751 e!100753)))

(declare-fun res!72823 () Bool)

(assert (=> b!154207 (= res!72823 call!17140)))

(assert (=> b!154207 (=> (not res!72823) (not e!100753))))

(declare-fun b!154208 () Bool)

(declare-fun c!29522 () Bool)

(assert (=> b!154208 (= c!29522 (and (not (= (bvand (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!154208 (= e!100760 e!100762)))

(declare-fun bm!17139 () Bool)

(assert (=> bm!17139 (= call!17139 (contains!947 lt!80962 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!50659 () Bool)

(assert (=> d!50659 e!100758))

(declare-fun res!72817 () Bool)

(assert (=> d!50659 (=> (not res!72817) (not e!100758))))

(assert (=> d!50659 (= res!72817 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun lt!80964 () ListLongMap!1761)

(assert (=> d!50659 (= lt!80962 lt!80964)))

(declare-fun lt!80974 () Unit!4904)

(assert (=> d!50659 (= lt!80974 e!100759)))

(declare-fun c!29523 () Bool)

(assert (=> d!50659 (= c!29523 e!100761)))

(declare-fun res!72821 () Bool)

(assert (=> d!50659 (=> (not res!72821) (not e!100761))))

(assert (=> d!50659 (= res!72821 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(assert (=> d!50659 (= lt!80964 e!100763)))

(declare-fun c!29525 () Bool)

(assert (=> d!50659 (= c!29525 (and (not (= (bvand (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!50659 (validMask!0 (mask!7467 (v!3418 (underlying!525 thiss!992))))))

(assert (=> d!50659 (= (getCurrentListMap!564 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))) lt!80962)))

(declare-fun b!154193 () Bool)

(declare-fun +!189 (ListLongMap!1761 tuple2!2762) ListLongMap!1761)

(assert (=> b!154193 (= e!100763 (+!189 call!17143 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun b!154209 () Bool)

(assert (=> b!154209 (= e!100754 (not call!17139))))

(declare-fun b!154210 () Bool)

(declare-fun get!1614 (ValueCell!1169 V!3681) V!3681)

(declare-fun dynLambda!471 (Int (_ BitVec 64)) V!3681)

(assert (=> b!154210 (= e!100755 (= (apply!128 lt!80962 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!154210 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2680 (_values!3046 (v!3418 (underlying!525 thiss!992))))))))

(assert (=> b!154210 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun bm!17140 () Bool)

(assert (=> bm!17140 (= call!17141 call!17142)))

(declare-fun bm!17141 () Bool)

(assert (=> bm!17141 (= call!17143 (+!189 (ite c!29525 call!17138 (ite c!29524 call!17142 call!17141)) (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154211 () Bool)

(declare-fun res!72820 () Bool)

(assert (=> b!154211 (=> (not res!72820) (not e!100758))))

(assert (=> b!154211 (= res!72820 e!100751)))

(declare-fun c!29527 () Bool)

(assert (=> b!154211 (= c!29527 (not (= (bvand (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!154212 () Bool)

(declare-fun lt!80980 () Unit!4904)

(assert (=> b!154212 (= e!100759 lt!80980)))

(declare-fun lt!80966 () ListLongMap!1761)

(assert (=> b!154212 (= lt!80966 (getCurrentListMapNoExtraKeys!159 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun lt!80976 () (_ BitVec 64))

(assert (=> b!154212 (= lt!80976 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80981 () (_ BitVec 64))

(assert (=> b!154212 (= lt!80981 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!80972 () Unit!4904)

(declare-fun addStillContains!104 (ListLongMap!1761 (_ BitVec 64) V!3681 (_ BitVec 64)) Unit!4904)

(assert (=> b!154212 (= lt!80972 (addStillContains!104 lt!80966 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) lt!80981))))

(assert (=> b!154212 (contains!947 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!80981)))

(declare-fun lt!80979 () Unit!4904)

(assert (=> b!154212 (= lt!80979 lt!80972)))

(declare-fun lt!80978 () ListLongMap!1761)

(assert (=> b!154212 (= lt!80978 (getCurrentListMapNoExtraKeys!159 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun lt!80969 () (_ BitVec 64))

(assert (=> b!154212 (= lt!80969 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80965 () (_ BitVec 64))

(assert (=> b!154212 (= lt!80965 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!80970 () Unit!4904)

(declare-fun addApplyDifferent!104 (ListLongMap!1761 (_ BitVec 64) V!3681 (_ BitVec 64)) Unit!4904)

(assert (=> b!154212 (= lt!80970 (addApplyDifferent!104 lt!80978 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))) lt!80965))))

(assert (=> b!154212 (= (apply!128 (+!189 lt!80978 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!80965) (apply!128 lt!80978 lt!80965))))

(declare-fun lt!80967 () Unit!4904)

(assert (=> b!154212 (= lt!80967 lt!80970)))

(declare-fun lt!80961 () ListLongMap!1761)

(assert (=> b!154212 (= lt!80961 (getCurrentListMapNoExtraKeys!159 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun lt!80971 () (_ BitVec 64))

(assert (=> b!154212 (= lt!80971 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80975 () (_ BitVec 64))

(assert (=> b!154212 (= lt!80975 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!80963 () Unit!4904)

(assert (=> b!154212 (= lt!80963 (addApplyDifferent!104 lt!80961 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) lt!80975))))

(assert (=> b!154212 (= (apply!128 (+!189 lt!80961 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!80975) (apply!128 lt!80961 lt!80975))))

(declare-fun lt!80977 () Unit!4904)

(assert (=> b!154212 (= lt!80977 lt!80963)))

(declare-fun lt!80973 () ListLongMap!1761)

(assert (=> b!154212 (= lt!80973 (getCurrentListMapNoExtraKeys!159 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun lt!80960 () (_ BitVec 64))

(assert (=> b!154212 (= lt!80960 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80968 () (_ BitVec 64))

(assert (=> b!154212 (= lt!80968 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!154212 (= lt!80980 (addApplyDifferent!104 lt!80973 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))) lt!80968))))

(assert (=> b!154212 (= (apply!128 (+!189 lt!80973 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!80968) (apply!128 lt!80973 lt!80968))))

(assert (= (and d!50659 c!29525) b!154193))

(assert (= (and d!50659 (not c!29525)) b!154205))

(assert (= (and b!154205 c!29524) b!154194))

(assert (= (and b!154205 (not c!29524)) b!154208))

(assert (= (and b!154208 c!29522) b!154195))

(assert (= (and b!154208 (not c!29522)) b!154197))

(assert (= (or b!154195 b!154197) bm!17140))

(assert (= (or b!154194 bm!17140) bm!17137))

(assert (= (or b!154194 b!154195) bm!17136))

(assert (= (or b!154193 bm!17137) bm!17138))

(assert (= (or b!154193 bm!17136) bm!17141))

(assert (= (and d!50659 res!72821) b!154198))

(assert (= (and d!50659 c!29523) b!154212))

(assert (= (and d!50659 (not c!29523)) b!154199))

(assert (= (and d!50659 res!72817) b!154206))

(assert (= (and b!154206 res!72824) b!154203))

(assert (= (and b!154206 (not res!72818)) b!154192))

(assert (= (and b!154192 res!72825) b!154210))

(assert (= (and b!154206 res!72819) b!154211))

(assert (= (and b!154211 c!29527) b!154207))

(assert (= (and b!154211 (not c!29527)) b!154196))

(assert (= (and b!154207 res!72823) b!154200))

(assert (= (or b!154207 b!154196) bm!17135))

(assert (= (and b!154211 res!72820) b!154204))

(assert (= (and b!154204 c!29526) b!154201))

(assert (= (and b!154204 (not c!29526)) b!154209))

(assert (= (and b!154201 res!72822) b!154202))

(assert (= (or b!154201 b!154209) bm!17139))

(declare-fun b_lambda!6865 () Bool)

(assert (=> (not b_lambda!6865) (not b!154210)))

(declare-fun t!6577 () Bool)

(declare-fun tb!2749 () Bool)

(assert (=> (and b!154037 (= (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))) t!6577) tb!2749))

(declare-fun result!4481 () Bool)

(assert (=> tb!2749 (= result!4481 tp_is_empty!3025)))

(assert (=> b!154210 t!6577))

(declare-fun b_and!9613 () Bool)

(assert (= b_and!9601 (and (=> t!6577 result!4481) b_and!9613)))

(declare-fun tb!2751 () Bool)

(declare-fun t!6579 () Bool)

(assert (=> (and b!154048 (= (defaultEntry!3063 newMap!16) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))) t!6579) tb!2751))

(declare-fun result!4485 () Bool)

(assert (= result!4485 result!4481))

(assert (=> b!154210 t!6579))

(declare-fun b_and!9615 () Bool)

(assert (= b_and!9603 (and (=> t!6579 result!4485) b_and!9615)))

(declare-fun m!188021 () Bool)

(assert (=> b!154198 m!188021))

(assert (=> b!154198 m!188021))

(declare-fun m!188023 () Bool)

(assert (=> b!154198 m!188023))

(declare-fun m!188025 () Bool)

(assert (=> bm!17135 m!188025))

(assert (=> b!154192 m!188021))

(assert (=> b!154192 m!188021))

(declare-fun m!188027 () Bool)

(assert (=> b!154192 m!188027))

(declare-fun m!188029 () Bool)

(assert (=> bm!17139 m!188029))

(declare-fun m!188031 () Bool)

(assert (=> b!154202 m!188031))

(declare-fun m!188033 () Bool)

(assert (=> b!154210 m!188033))

(assert (=> b!154210 m!188021))

(assert (=> b!154210 m!188021))

(declare-fun m!188035 () Bool)

(assert (=> b!154210 m!188035))

(declare-fun m!188037 () Bool)

(assert (=> b!154210 m!188037))

(assert (=> b!154210 m!188033))

(assert (=> b!154210 m!188037))

(declare-fun m!188039 () Bool)

(assert (=> b!154210 m!188039))

(declare-fun m!188041 () Bool)

(assert (=> bm!17141 m!188041))

(assert (=> b!154203 m!188021))

(assert (=> b!154203 m!188021))

(assert (=> b!154203 m!188023))

(declare-fun m!188043 () Bool)

(assert (=> d!50659 m!188043))

(declare-fun m!188045 () Bool)

(assert (=> b!154200 m!188045))

(declare-fun m!188047 () Bool)

(assert (=> b!154193 m!188047))

(declare-fun m!188049 () Bool)

(assert (=> bm!17138 m!188049))

(declare-fun m!188051 () Bool)

(assert (=> b!154212 m!188051))

(declare-fun m!188053 () Bool)

(assert (=> b!154212 m!188053))

(declare-fun m!188055 () Bool)

(assert (=> b!154212 m!188055))

(declare-fun m!188057 () Bool)

(assert (=> b!154212 m!188057))

(assert (=> b!154212 m!188021))

(declare-fun m!188059 () Bool)

(assert (=> b!154212 m!188059))

(declare-fun m!188061 () Bool)

(assert (=> b!154212 m!188061))

(declare-fun m!188063 () Bool)

(assert (=> b!154212 m!188063))

(declare-fun m!188065 () Bool)

(assert (=> b!154212 m!188065))

(declare-fun m!188067 () Bool)

(assert (=> b!154212 m!188067))

(declare-fun m!188069 () Bool)

(assert (=> b!154212 m!188069))

(declare-fun m!188071 () Bool)

(assert (=> b!154212 m!188071))

(declare-fun m!188073 () Bool)

(assert (=> b!154212 m!188073))

(assert (=> b!154212 m!188065))

(assert (=> b!154212 m!188071))

(declare-fun m!188075 () Bool)

(assert (=> b!154212 m!188075))

(assert (=> b!154212 m!188057))

(declare-fun m!188077 () Bool)

(assert (=> b!154212 m!188077))

(declare-fun m!188079 () Bool)

(assert (=> b!154212 m!188079))

(assert (=> b!154212 m!188053))

(assert (=> b!154212 m!188049))

(assert (=> b!154042 d!50659))

(declare-fun d!50661 () Bool)

(assert (=> d!50661 (= (array_inv!1515 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvsge (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!154037 d!50661))

(declare-fun d!50663 () Bool)

(assert (=> d!50663 (= (array_inv!1516 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvsge (size!2680 (_values!3046 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!154037 d!50663))

(declare-fun d!50665 () Bool)

(assert (=> d!50665 (= (array_inv!1515 (_keys!4836 newMap!16)) (bvsge (size!2679 (_keys!4836 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!154048 d!50665))

(declare-fun d!50667 () Bool)

(assert (=> d!50667 (= (array_inv!1516 (_values!3046 newMap!16)) (bvsge (size!2680 (_values!3046 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!154048 d!50667))

(declare-fun d!50669 () Bool)

(assert (=> d!50669 (= (map!1496 (v!3418 (underlying!525 thiss!992))) (getCurrentListMap!564 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun bs!6535 () Bool)

(assert (= bs!6535 d!50669))

(declare-fun m!188081 () Bool)

(assert (=> bs!6535 m!188081))

(assert (=> b!154045 d!50669))

(declare-fun mapNonEmpty!5181 () Bool)

(declare-fun mapRes!5181 () Bool)

(declare-fun tp!12201 () Bool)

(declare-fun e!100768 () Bool)

(assert (=> mapNonEmpty!5181 (= mapRes!5181 (and tp!12201 e!100768))))

(declare-fun mapRest!5181 () (Array (_ BitVec 32) ValueCell!1169))

(declare-fun mapValue!5181 () ValueCell!1169)

(declare-fun mapKey!5181 () (_ BitVec 32))

(assert (=> mapNonEmpty!5181 (= mapRest!5166 (store mapRest!5181 mapKey!5181 mapValue!5181))))

(declare-fun b!154221 () Bool)

(assert (=> b!154221 (= e!100768 tp_is_empty!3025)))

(declare-fun b!154222 () Bool)

(declare-fun e!100769 () Bool)

(assert (=> b!154222 (= e!100769 tp_is_empty!3025)))

(declare-fun condMapEmpty!5181 () Bool)

(declare-fun mapDefault!5181 () ValueCell!1169)

(assert (=> mapNonEmpty!5166 (= condMapEmpty!5181 (= mapRest!5166 ((as const (Array (_ BitVec 32) ValueCell!1169)) mapDefault!5181)))))

(assert (=> mapNonEmpty!5166 (= tp!12171 (and e!100769 mapRes!5181))))

(declare-fun mapIsEmpty!5181 () Bool)

(assert (=> mapIsEmpty!5181 mapRes!5181))

(assert (= (and mapNonEmpty!5166 condMapEmpty!5181) mapIsEmpty!5181))

(assert (= (and mapNonEmpty!5166 (not condMapEmpty!5181)) mapNonEmpty!5181))

(assert (= (and mapNonEmpty!5181 ((_ is ValueCellFull!1169) mapValue!5181)) b!154221))

(assert (= (and mapNonEmpty!5166 ((_ is ValueCellFull!1169) mapDefault!5181)) b!154222))

(declare-fun m!188083 () Bool)

(assert (=> mapNonEmpty!5181 m!188083))

(declare-fun mapNonEmpty!5182 () Bool)

(declare-fun mapRes!5182 () Bool)

(declare-fun tp!12202 () Bool)

(declare-fun e!100770 () Bool)

(assert (=> mapNonEmpty!5182 (= mapRes!5182 (and tp!12202 e!100770))))

(declare-fun mapKey!5182 () (_ BitVec 32))

(declare-fun mapValue!5182 () ValueCell!1169)

(declare-fun mapRest!5182 () (Array (_ BitVec 32) ValueCell!1169))

(assert (=> mapNonEmpty!5182 (= mapRest!5165 (store mapRest!5182 mapKey!5182 mapValue!5182))))

(declare-fun b!154223 () Bool)

(assert (=> b!154223 (= e!100770 tp_is_empty!3025)))

(declare-fun b!154224 () Bool)

(declare-fun e!100771 () Bool)

(assert (=> b!154224 (= e!100771 tp_is_empty!3025)))

(declare-fun condMapEmpty!5182 () Bool)

(declare-fun mapDefault!5182 () ValueCell!1169)

(assert (=> mapNonEmpty!5165 (= condMapEmpty!5182 (= mapRest!5165 ((as const (Array (_ BitVec 32) ValueCell!1169)) mapDefault!5182)))))

(assert (=> mapNonEmpty!5165 (= tp!12172 (and e!100771 mapRes!5182))))

(declare-fun mapIsEmpty!5182 () Bool)

(assert (=> mapIsEmpty!5182 mapRes!5182))

(assert (= (and mapNonEmpty!5165 condMapEmpty!5182) mapIsEmpty!5182))

(assert (= (and mapNonEmpty!5165 (not condMapEmpty!5182)) mapNonEmpty!5182))

(assert (= (and mapNonEmpty!5182 ((_ is ValueCellFull!1169) mapValue!5182)) b!154223))

(assert (= (and mapNonEmpty!5165 ((_ is ValueCellFull!1169) mapDefault!5182)) b!154224))

(declare-fun m!188085 () Bool)

(assert (=> mapNonEmpty!5182 m!188085))

(declare-fun b_lambda!6867 () Bool)

(assert (= b_lambda!6865 (or (and b!154037 b_free!3217) (and b!154048 b_free!3219 (= (defaultEntry!3063 newMap!16) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))))) b_lambda!6867)))

(check-sat (not d!50655) (not d!50657) (not d!50653) (not b!154193) (not b!154212) (not bm!17135) (not b!154149) (not mapNonEmpty!5182) (not d!50669) (not b!154202) (not bm!17141) (not b_next!3219) (not b!154198) (not d!50659) (not mapNonEmpty!5181) (not b_lambda!6867) (not b!154210) tp_is_empty!3025 (not b!154192) (not b!154200) (not bm!17138) (not b_next!3217) b_and!9615 (not b!154148) (not b!154147) b_and!9613 (not bm!17139) (not b!154203))
(check-sat b_and!9613 b_and!9615 (not b_next!3217) (not b_next!3219))
(get-model)

(declare-fun d!50671 () Bool)

(declare-datatypes ((Option!190 0))(
  ( (Some!189 (v!3423 V!3681)) (None!188) )
))
(declare-fun get!1615 (Option!190) V!3681)

(declare-fun getValueByKey!184 (List!1789 (_ BitVec 64)) Option!190)

(assert (=> d!50671 (= (apply!128 lt!80962 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1615 (getValueByKey!184 (toList!896 lt!80962) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6536 () Bool)

(assert (= bs!6536 d!50671))

(declare-fun m!188087 () Bool)

(assert (=> bs!6536 m!188087))

(assert (=> bs!6536 m!188087))

(declare-fun m!188089 () Bool)

(assert (=> bs!6536 m!188089))

(assert (=> b!154200 d!50671))

(declare-fun b!154225 () Bool)

(declare-fun e!100773 () Bool)

(declare-fun e!100776 () Bool)

(assert (=> b!154225 (= e!100773 e!100776)))

(declare-fun res!72834 () Bool)

(assert (=> b!154225 (=> (not res!72834) (not e!100776))))

(declare-fun lt!80984 () ListLongMap!1761)

(assert (=> b!154225 (= res!72834 (contains!947 lt!80984 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!154225 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2679 (_keys!4836 newMap!16))))))

(declare-fun b!154227 () Bool)

(declare-fun e!100781 () ListLongMap!1761)

(declare-fun call!17151 () ListLongMap!1761)

(assert (=> b!154227 (= e!100781 call!17151)))

(declare-fun b!154228 () Bool)

(declare-fun e!100783 () ListLongMap!1761)

(assert (=> b!154228 (= e!100783 call!17151)))

(declare-fun b!154229 () Bool)

(declare-fun e!100772 () Bool)

(declare-fun call!17147 () Bool)

(assert (=> b!154229 (= e!100772 (not call!17147))))

(declare-fun b!154230 () Bool)

(declare-fun call!17148 () ListLongMap!1761)

(assert (=> b!154230 (= e!100783 call!17148)))

(declare-fun b!154231 () Bool)

(declare-fun e!100782 () Bool)

(assert (=> b!154231 (= e!100782 (validKeyInArray!0 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154232 () Bool)

(declare-fun e!100780 () Unit!4904)

(declare-fun Unit!4907 () Unit!4904)

(assert (=> b!154232 (= e!100780 Unit!4907)))

(declare-fun bm!17142 () Bool)

(assert (=> bm!17142 (= call!17147 (contains!947 lt!80984 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154233 () Bool)

(declare-fun e!100774 () Bool)

(assert (=> b!154233 (= e!100774 (= (apply!128 lt!80984 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2906 newMap!16)))))

(declare-fun b!154234 () Bool)

(declare-fun e!100775 () Bool)

(declare-fun e!100778 () Bool)

(assert (=> b!154234 (= e!100775 e!100778)))

(declare-fun res!72831 () Bool)

(declare-fun call!17146 () Bool)

(assert (=> b!154234 (= res!72831 call!17146)))

(assert (=> b!154234 (=> (not res!72831) (not e!100778))))

(declare-fun b!154235 () Bool)

(assert (=> b!154235 (= e!100778 (= (apply!128 lt!80984 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2906 newMap!16)))))

(declare-fun b!154236 () Bool)

(declare-fun e!100777 () Bool)

(assert (=> b!154236 (= e!100777 (validKeyInArray!0 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154237 () Bool)

(declare-fun e!100779 () Bool)

(assert (=> b!154237 (= e!100779 e!100775)))

(declare-fun c!29532 () Bool)

(assert (=> b!154237 (= c!29532 (not (= (bvand (extraKeys!2804 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17143 () Bool)

(declare-fun call!17150 () ListLongMap!1761)

(assert (=> bm!17143 (= call!17151 call!17150)))

(declare-fun b!154238 () Bool)

(declare-fun e!100784 () ListLongMap!1761)

(assert (=> b!154238 (= e!100784 e!100781)))

(declare-fun c!29530 () Bool)

(assert (=> b!154238 (= c!29530 (and (not (= (bvand (extraKeys!2804 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2804 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!154239 () Bool)

(declare-fun res!72828 () Bool)

(assert (=> b!154239 (=> (not res!72828) (not e!100779))))

(assert (=> b!154239 (= res!72828 e!100773)))

(declare-fun res!72827 () Bool)

(assert (=> b!154239 (=> res!72827 e!100773)))

(assert (=> b!154239 (= res!72827 (not e!100777))))

(declare-fun res!72833 () Bool)

(assert (=> b!154239 (=> (not res!72833) (not e!100777))))

(assert (=> b!154239 (= res!72833 (bvslt #b00000000000000000000000000000000 (size!2679 (_keys!4836 newMap!16))))))

(declare-fun bm!17144 () Bool)

(declare-fun call!17149 () ListLongMap!1761)

(declare-fun call!17145 () ListLongMap!1761)

(assert (=> bm!17144 (= call!17149 call!17145)))

(declare-fun bm!17145 () Bool)

(assert (=> bm!17145 (= call!17145 (getCurrentListMapNoExtraKeys!159 (_keys!4836 newMap!16) (_values!3046 newMap!16) (mask!7467 newMap!16) (extraKeys!2804 newMap!16) (zeroValue!2906 newMap!16) (minValue!2906 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3063 newMap!16)))))

(declare-fun b!154240 () Bool)

(assert (=> b!154240 (= e!100772 e!100774)))

(declare-fun res!72832 () Bool)

(assert (=> b!154240 (= res!72832 call!17147)))

(assert (=> b!154240 (=> (not res!72832) (not e!100774))))

(declare-fun b!154241 () Bool)

(declare-fun c!29528 () Bool)

(assert (=> b!154241 (= c!29528 (and (not (= (bvand (extraKeys!2804 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2804 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!154241 (= e!100781 e!100783)))

(declare-fun bm!17146 () Bool)

(assert (=> bm!17146 (= call!17146 (contains!947 lt!80984 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!50673 () Bool)

(assert (=> d!50673 e!100779))

(declare-fun res!72826 () Bool)

(assert (=> d!50673 (=> (not res!72826) (not e!100779))))

(assert (=> d!50673 (= res!72826 (or (bvsge #b00000000000000000000000000000000 (size!2679 (_keys!4836 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2679 (_keys!4836 newMap!16))))))))

(declare-fun lt!80986 () ListLongMap!1761)

(assert (=> d!50673 (= lt!80984 lt!80986)))

(declare-fun lt!80996 () Unit!4904)

(assert (=> d!50673 (= lt!80996 e!100780)))

(declare-fun c!29529 () Bool)

(assert (=> d!50673 (= c!29529 e!100782)))

(declare-fun res!72830 () Bool)

(assert (=> d!50673 (=> (not res!72830) (not e!100782))))

(assert (=> d!50673 (= res!72830 (bvslt #b00000000000000000000000000000000 (size!2679 (_keys!4836 newMap!16))))))

(assert (=> d!50673 (= lt!80986 e!100784)))

(declare-fun c!29531 () Bool)

(assert (=> d!50673 (= c!29531 (and (not (= (bvand (extraKeys!2804 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2804 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!50673 (validMask!0 (mask!7467 newMap!16))))

(assert (=> d!50673 (= (getCurrentListMap!564 (_keys!4836 newMap!16) (_values!3046 newMap!16) (mask!7467 newMap!16) (extraKeys!2804 newMap!16) (zeroValue!2906 newMap!16) (minValue!2906 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3063 newMap!16)) lt!80984)))

(declare-fun b!154226 () Bool)

(assert (=> b!154226 (= e!100784 (+!189 call!17150 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))))))

(declare-fun b!154242 () Bool)

(assert (=> b!154242 (= e!100775 (not call!17146))))

(declare-fun b!154243 () Bool)

(assert (=> b!154243 (= e!100776 (= (apply!128 lt!80984 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)) (get!1614 (select (arr!2403 (_values!3046 newMap!16)) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3063 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!154243 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2680 (_values!3046 newMap!16))))))

(assert (=> b!154243 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2679 (_keys!4836 newMap!16))))))

(declare-fun bm!17147 () Bool)

(assert (=> bm!17147 (= call!17148 call!17149)))

(declare-fun bm!17148 () Bool)

(assert (=> bm!17148 (= call!17150 (+!189 (ite c!29531 call!17145 (ite c!29530 call!17149 call!17148)) (ite (or c!29531 c!29530) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))))))

(declare-fun b!154244 () Bool)

(declare-fun res!72829 () Bool)

(assert (=> b!154244 (=> (not res!72829) (not e!100779))))

(assert (=> b!154244 (= res!72829 e!100772)))

(declare-fun c!29533 () Bool)

(assert (=> b!154244 (= c!29533 (not (= (bvand (extraKeys!2804 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!154245 () Bool)

(declare-fun lt!81002 () Unit!4904)

(assert (=> b!154245 (= e!100780 lt!81002)))

(declare-fun lt!80988 () ListLongMap!1761)

(assert (=> b!154245 (= lt!80988 (getCurrentListMapNoExtraKeys!159 (_keys!4836 newMap!16) (_values!3046 newMap!16) (mask!7467 newMap!16) (extraKeys!2804 newMap!16) (zeroValue!2906 newMap!16) (minValue!2906 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3063 newMap!16)))))

(declare-fun lt!80998 () (_ BitVec 64))

(assert (=> b!154245 (= lt!80998 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!81003 () (_ BitVec 64))

(assert (=> b!154245 (= lt!81003 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!80994 () Unit!4904)

(assert (=> b!154245 (= lt!80994 (addStillContains!104 lt!80988 lt!80998 (zeroValue!2906 newMap!16) lt!81003))))

(assert (=> b!154245 (contains!947 (+!189 lt!80988 (tuple2!2763 lt!80998 (zeroValue!2906 newMap!16))) lt!81003)))

(declare-fun lt!81001 () Unit!4904)

(assert (=> b!154245 (= lt!81001 lt!80994)))

(declare-fun lt!81000 () ListLongMap!1761)

(assert (=> b!154245 (= lt!81000 (getCurrentListMapNoExtraKeys!159 (_keys!4836 newMap!16) (_values!3046 newMap!16) (mask!7467 newMap!16) (extraKeys!2804 newMap!16) (zeroValue!2906 newMap!16) (minValue!2906 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3063 newMap!16)))))

(declare-fun lt!80991 () (_ BitVec 64))

(assert (=> b!154245 (= lt!80991 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80987 () (_ BitVec 64))

(assert (=> b!154245 (= lt!80987 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!80992 () Unit!4904)

(assert (=> b!154245 (= lt!80992 (addApplyDifferent!104 lt!81000 lt!80991 (minValue!2906 newMap!16) lt!80987))))

(assert (=> b!154245 (= (apply!128 (+!189 lt!81000 (tuple2!2763 lt!80991 (minValue!2906 newMap!16))) lt!80987) (apply!128 lt!81000 lt!80987))))

(declare-fun lt!80989 () Unit!4904)

(assert (=> b!154245 (= lt!80989 lt!80992)))

(declare-fun lt!80983 () ListLongMap!1761)

(assert (=> b!154245 (= lt!80983 (getCurrentListMapNoExtraKeys!159 (_keys!4836 newMap!16) (_values!3046 newMap!16) (mask!7467 newMap!16) (extraKeys!2804 newMap!16) (zeroValue!2906 newMap!16) (minValue!2906 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3063 newMap!16)))))

(declare-fun lt!80993 () (_ BitVec 64))

(assert (=> b!154245 (= lt!80993 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80997 () (_ BitVec 64))

(assert (=> b!154245 (= lt!80997 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!80985 () Unit!4904)

(assert (=> b!154245 (= lt!80985 (addApplyDifferent!104 lt!80983 lt!80993 (zeroValue!2906 newMap!16) lt!80997))))

(assert (=> b!154245 (= (apply!128 (+!189 lt!80983 (tuple2!2763 lt!80993 (zeroValue!2906 newMap!16))) lt!80997) (apply!128 lt!80983 lt!80997))))

(declare-fun lt!80999 () Unit!4904)

(assert (=> b!154245 (= lt!80999 lt!80985)))

(declare-fun lt!80995 () ListLongMap!1761)

(assert (=> b!154245 (= lt!80995 (getCurrentListMapNoExtraKeys!159 (_keys!4836 newMap!16) (_values!3046 newMap!16) (mask!7467 newMap!16) (extraKeys!2804 newMap!16) (zeroValue!2906 newMap!16) (minValue!2906 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3063 newMap!16)))))

(declare-fun lt!80982 () (_ BitVec 64))

(assert (=> b!154245 (= lt!80982 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80990 () (_ BitVec 64))

(assert (=> b!154245 (= lt!80990 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!154245 (= lt!81002 (addApplyDifferent!104 lt!80995 lt!80982 (minValue!2906 newMap!16) lt!80990))))

(assert (=> b!154245 (= (apply!128 (+!189 lt!80995 (tuple2!2763 lt!80982 (minValue!2906 newMap!16))) lt!80990) (apply!128 lt!80995 lt!80990))))

(assert (= (and d!50673 c!29531) b!154226))

(assert (= (and d!50673 (not c!29531)) b!154238))

(assert (= (and b!154238 c!29530) b!154227))

(assert (= (and b!154238 (not c!29530)) b!154241))

(assert (= (and b!154241 c!29528) b!154228))

(assert (= (and b!154241 (not c!29528)) b!154230))

(assert (= (or b!154228 b!154230) bm!17147))

(assert (= (or b!154227 bm!17147) bm!17144))

(assert (= (or b!154227 b!154228) bm!17143))

(assert (= (or b!154226 bm!17144) bm!17145))

(assert (= (or b!154226 bm!17143) bm!17148))

(assert (= (and d!50673 res!72830) b!154231))

(assert (= (and d!50673 c!29529) b!154245))

(assert (= (and d!50673 (not c!29529)) b!154232))

(assert (= (and d!50673 res!72826) b!154239))

(assert (= (and b!154239 res!72833) b!154236))

(assert (= (and b!154239 (not res!72827)) b!154225))

(assert (= (and b!154225 res!72834) b!154243))

(assert (= (and b!154239 res!72828) b!154244))

(assert (= (and b!154244 c!29533) b!154240))

(assert (= (and b!154244 (not c!29533)) b!154229))

(assert (= (and b!154240 res!72832) b!154233))

(assert (= (or b!154240 b!154229) bm!17142))

(assert (= (and b!154244 res!72829) b!154237))

(assert (= (and b!154237 c!29532) b!154234))

(assert (= (and b!154237 (not c!29532)) b!154242))

(assert (= (and b!154234 res!72831) b!154235))

(assert (= (or b!154234 b!154242) bm!17146))

(declare-fun b_lambda!6869 () Bool)

(assert (=> (not b_lambda!6869) (not b!154243)))

(declare-fun tb!2753 () Bool)

(declare-fun t!6582 () Bool)

(assert (=> (and b!154037 (= (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) (defaultEntry!3063 newMap!16)) t!6582) tb!2753))

(declare-fun result!4489 () Bool)

(assert (=> tb!2753 (= result!4489 tp_is_empty!3025)))

(assert (=> b!154243 t!6582))

(declare-fun b_and!9617 () Bool)

(assert (= b_and!9613 (and (=> t!6582 result!4489) b_and!9617)))

(declare-fun t!6584 () Bool)

(declare-fun tb!2755 () Bool)

(assert (=> (and b!154048 (= (defaultEntry!3063 newMap!16) (defaultEntry!3063 newMap!16)) t!6584) tb!2755))

(declare-fun result!4491 () Bool)

(assert (= result!4491 result!4489))

(assert (=> b!154243 t!6584))

(declare-fun b_and!9619 () Bool)

(assert (= b_and!9615 (and (=> t!6584 result!4491) b_and!9619)))

(declare-fun m!188091 () Bool)

(assert (=> b!154231 m!188091))

(assert (=> b!154231 m!188091))

(declare-fun m!188093 () Bool)

(assert (=> b!154231 m!188093))

(declare-fun m!188095 () Bool)

(assert (=> bm!17142 m!188095))

(assert (=> b!154225 m!188091))

(assert (=> b!154225 m!188091))

(declare-fun m!188097 () Bool)

(assert (=> b!154225 m!188097))

(declare-fun m!188099 () Bool)

(assert (=> bm!17146 m!188099))

(declare-fun m!188101 () Bool)

(assert (=> b!154235 m!188101))

(declare-fun m!188103 () Bool)

(assert (=> b!154243 m!188103))

(assert (=> b!154243 m!188091))

(assert (=> b!154243 m!188091))

(declare-fun m!188105 () Bool)

(assert (=> b!154243 m!188105))

(declare-fun m!188107 () Bool)

(assert (=> b!154243 m!188107))

(assert (=> b!154243 m!188103))

(assert (=> b!154243 m!188107))

(declare-fun m!188109 () Bool)

(assert (=> b!154243 m!188109))

(declare-fun m!188111 () Bool)

(assert (=> bm!17148 m!188111))

(assert (=> b!154236 m!188091))

(assert (=> b!154236 m!188091))

(assert (=> b!154236 m!188093))

(declare-fun m!188113 () Bool)

(assert (=> d!50673 m!188113))

(declare-fun m!188115 () Bool)

(assert (=> b!154233 m!188115))

(declare-fun m!188117 () Bool)

(assert (=> b!154226 m!188117))

(declare-fun m!188119 () Bool)

(assert (=> bm!17145 m!188119))

(declare-fun m!188121 () Bool)

(assert (=> b!154245 m!188121))

(declare-fun m!188123 () Bool)

(assert (=> b!154245 m!188123))

(declare-fun m!188125 () Bool)

(assert (=> b!154245 m!188125))

(declare-fun m!188127 () Bool)

(assert (=> b!154245 m!188127))

(assert (=> b!154245 m!188091))

(declare-fun m!188129 () Bool)

(assert (=> b!154245 m!188129))

(declare-fun m!188131 () Bool)

(assert (=> b!154245 m!188131))

(declare-fun m!188133 () Bool)

(assert (=> b!154245 m!188133))

(declare-fun m!188135 () Bool)

(assert (=> b!154245 m!188135))

(declare-fun m!188137 () Bool)

(assert (=> b!154245 m!188137))

(declare-fun m!188139 () Bool)

(assert (=> b!154245 m!188139))

(declare-fun m!188141 () Bool)

(assert (=> b!154245 m!188141))

(declare-fun m!188143 () Bool)

(assert (=> b!154245 m!188143))

(assert (=> b!154245 m!188135))

(assert (=> b!154245 m!188141))

(declare-fun m!188145 () Bool)

(assert (=> b!154245 m!188145))

(assert (=> b!154245 m!188127))

(declare-fun m!188147 () Bool)

(assert (=> b!154245 m!188147))

(declare-fun m!188149 () Bool)

(assert (=> b!154245 m!188149))

(assert (=> b!154245 m!188123))

(assert (=> b!154245 m!188119))

(assert (=> d!50657 d!50673))

(declare-fun b!154246 () Bool)

(declare-fun e!100786 () Bool)

(declare-fun e!100789 () Bool)

(assert (=> b!154246 (= e!100786 e!100789)))

(declare-fun res!72843 () Bool)

(assert (=> b!154246 (=> (not res!72843) (not e!100789))))

(declare-fun lt!81006 () ListLongMap!1761)

(assert (=> b!154246 (= res!72843 (contains!947 lt!81006 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> b!154246 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun b!154248 () Bool)

(declare-fun e!100794 () ListLongMap!1761)

(declare-fun call!17158 () ListLongMap!1761)

(assert (=> b!154248 (= e!100794 call!17158)))

(declare-fun b!154249 () Bool)

(declare-fun e!100796 () ListLongMap!1761)

(assert (=> b!154249 (= e!100796 call!17158)))

(declare-fun b!154250 () Bool)

(declare-fun e!100785 () Bool)

(declare-fun call!17154 () Bool)

(assert (=> b!154250 (= e!100785 (not call!17154))))

(declare-fun b!154251 () Bool)

(declare-fun call!17155 () ListLongMap!1761)

(assert (=> b!154251 (= e!100796 call!17155)))

(declare-fun b!154252 () Bool)

(declare-fun e!100795 () Bool)

(assert (=> b!154252 (= e!100795 (validKeyInArray!0 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154253 () Bool)

(declare-fun e!100793 () Unit!4904)

(declare-fun Unit!4908 () Unit!4904)

(assert (=> b!154253 (= e!100793 Unit!4908)))

(declare-fun bm!17149 () Bool)

(assert (=> bm!17149 (= call!17154 (contains!947 lt!81006 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154254 () Bool)

(declare-fun e!100787 () Bool)

(assert (=> b!154254 (= e!100787 (= (apply!128 lt!81006 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun b!154255 () Bool)

(declare-fun e!100788 () Bool)

(declare-fun e!100791 () Bool)

(assert (=> b!154255 (= e!100788 e!100791)))

(declare-fun res!72840 () Bool)

(declare-fun call!17153 () Bool)

(assert (=> b!154255 (= res!72840 call!17153)))

(assert (=> b!154255 (=> (not res!72840) (not e!100791))))

(declare-fun b!154256 () Bool)

(assert (=> b!154256 (= e!100791 (= (apply!128 lt!81006 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun b!154257 () Bool)

(declare-fun e!100790 () Bool)

(assert (=> b!154257 (= e!100790 (validKeyInArray!0 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154258 () Bool)

(declare-fun e!100792 () Bool)

(assert (=> b!154258 (= e!100792 e!100788)))

(declare-fun c!29538 () Bool)

(assert (=> b!154258 (= c!29538 (not (= (bvand (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17150 () Bool)

(declare-fun call!17157 () ListLongMap!1761)

(assert (=> bm!17150 (= call!17158 call!17157)))

(declare-fun b!154259 () Bool)

(declare-fun e!100797 () ListLongMap!1761)

(assert (=> b!154259 (= e!100797 e!100794)))

(declare-fun c!29536 () Bool)

(assert (=> b!154259 (= c!29536 (and (not (= (bvand (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!154260 () Bool)

(declare-fun res!72837 () Bool)

(assert (=> b!154260 (=> (not res!72837) (not e!100792))))

(assert (=> b!154260 (= res!72837 e!100786)))

(declare-fun res!72836 () Bool)

(assert (=> b!154260 (=> res!72836 e!100786)))

(assert (=> b!154260 (= res!72836 (not e!100790))))

(declare-fun res!72842 () Bool)

(assert (=> b!154260 (=> (not res!72842) (not e!100790))))

(assert (=> b!154260 (= res!72842 (bvslt #b00000000000000000000000000000000 (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun bm!17151 () Bool)

(declare-fun call!17156 () ListLongMap!1761)

(declare-fun call!17152 () ListLongMap!1761)

(assert (=> bm!17151 (= call!17156 call!17152)))

(declare-fun bm!17152 () Bool)

(assert (=> bm!17152 (= call!17152 (getCurrentListMapNoExtraKeys!159 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun b!154261 () Bool)

(assert (=> b!154261 (= e!100785 e!100787)))

(declare-fun res!72841 () Bool)

(assert (=> b!154261 (= res!72841 call!17154)))

(assert (=> b!154261 (=> (not res!72841) (not e!100787))))

(declare-fun b!154262 () Bool)

(declare-fun c!29534 () Bool)

(assert (=> b!154262 (= c!29534 (and (not (= (bvand (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!154262 (= e!100794 e!100796)))

(declare-fun bm!17153 () Bool)

(assert (=> bm!17153 (= call!17153 (contains!947 lt!81006 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!50675 () Bool)

(assert (=> d!50675 e!100792))

(declare-fun res!72835 () Bool)

(assert (=> d!50675 (=> (not res!72835) (not e!100792))))

(assert (=> d!50675 (= res!72835 (or (bvsge #b00000000000000000000000000000000 (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun lt!81008 () ListLongMap!1761)

(assert (=> d!50675 (= lt!81006 lt!81008)))

(declare-fun lt!81018 () Unit!4904)

(assert (=> d!50675 (= lt!81018 e!100793)))

(declare-fun c!29535 () Bool)

(assert (=> d!50675 (= c!29535 e!100795)))

(declare-fun res!72839 () Bool)

(assert (=> d!50675 (=> (not res!72839) (not e!100795))))

(assert (=> d!50675 (= res!72839 (bvslt #b00000000000000000000000000000000 (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(assert (=> d!50675 (= lt!81008 e!100797)))

(declare-fun c!29537 () Bool)

(assert (=> d!50675 (= c!29537 (and (not (= (bvand (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!50675 (validMask!0 (mask!7467 (v!3418 (underlying!525 thiss!992))))))

(assert (=> d!50675 (= (getCurrentListMap!564 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))) lt!81006)))

(declare-fun b!154247 () Bool)

(assert (=> b!154247 (= e!100797 (+!189 call!17157 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun b!154263 () Bool)

(assert (=> b!154263 (= e!100788 (not call!17153))))

(declare-fun b!154264 () Bool)

(assert (=> b!154264 (= e!100789 (= (apply!128 lt!81006 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)) (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!154264 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2680 (_values!3046 (v!3418 (underlying!525 thiss!992))))))))

(assert (=> b!154264 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun bm!17154 () Bool)

(assert (=> bm!17154 (= call!17155 call!17156)))

(declare-fun bm!17155 () Bool)

(assert (=> bm!17155 (= call!17157 (+!189 (ite c!29537 call!17152 (ite c!29536 call!17156 call!17155)) (ite (or c!29537 c!29536) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154265 () Bool)

(declare-fun res!72838 () Bool)

(assert (=> b!154265 (=> (not res!72838) (not e!100792))))

(assert (=> b!154265 (= res!72838 e!100785)))

(declare-fun c!29539 () Bool)

(assert (=> b!154265 (= c!29539 (not (= (bvand (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!154266 () Bool)

(declare-fun lt!81024 () Unit!4904)

(assert (=> b!154266 (= e!100793 lt!81024)))

(declare-fun lt!81010 () ListLongMap!1761)

(assert (=> b!154266 (= lt!81010 (getCurrentListMapNoExtraKeys!159 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun lt!81020 () (_ BitVec 64))

(assert (=> b!154266 (= lt!81020 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!81025 () (_ BitVec 64))

(assert (=> b!154266 (= lt!81025 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!81016 () Unit!4904)

(assert (=> b!154266 (= lt!81016 (addStillContains!104 lt!81010 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) lt!81025))))

(assert (=> b!154266 (contains!947 (+!189 lt!81010 (tuple2!2763 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81025)))

(declare-fun lt!81023 () Unit!4904)

(assert (=> b!154266 (= lt!81023 lt!81016)))

(declare-fun lt!81022 () ListLongMap!1761)

(assert (=> b!154266 (= lt!81022 (getCurrentListMapNoExtraKeys!159 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun lt!81013 () (_ BitVec 64))

(assert (=> b!154266 (= lt!81013 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!81009 () (_ BitVec 64))

(assert (=> b!154266 (= lt!81009 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!81014 () Unit!4904)

(assert (=> b!154266 (= lt!81014 (addApplyDifferent!104 lt!81022 lt!81013 (minValue!2906 (v!3418 (underlying!525 thiss!992))) lt!81009))))

(assert (=> b!154266 (= (apply!128 (+!189 lt!81022 (tuple2!2763 lt!81013 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81009) (apply!128 lt!81022 lt!81009))))

(declare-fun lt!81011 () Unit!4904)

(assert (=> b!154266 (= lt!81011 lt!81014)))

(declare-fun lt!81005 () ListLongMap!1761)

(assert (=> b!154266 (= lt!81005 (getCurrentListMapNoExtraKeys!159 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun lt!81015 () (_ BitVec 64))

(assert (=> b!154266 (= lt!81015 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!81019 () (_ BitVec 64))

(assert (=> b!154266 (= lt!81019 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!81007 () Unit!4904)

(assert (=> b!154266 (= lt!81007 (addApplyDifferent!104 lt!81005 lt!81015 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) lt!81019))))

(assert (=> b!154266 (= (apply!128 (+!189 lt!81005 (tuple2!2763 lt!81015 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81019) (apply!128 lt!81005 lt!81019))))

(declare-fun lt!81021 () Unit!4904)

(assert (=> b!154266 (= lt!81021 lt!81007)))

(declare-fun lt!81017 () ListLongMap!1761)

(assert (=> b!154266 (= lt!81017 (getCurrentListMapNoExtraKeys!159 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun lt!81004 () (_ BitVec 64))

(assert (=> b!154266 (= lt!81004 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!81012 () (_ BitVec 64))

(assert (=> b!154266 (= lt!81012 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!154266 (= lt!81024 (addApplyDifferent!104 lt!81017 lt!81004 (minValue!2906 (v!3418 (underlying!525 thiss!992))) lt!81012))))

(assert (=> b!154266 (= (apply!128 (+!189 lt!81017 (tuple2!2763 lt!81004 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81012) (apply!128 lt!81017 lt!81012))))

(assert (= (and d!50675 c!29537) b!154247))

(assert (= (and d!50675 (not c!29537)) b!154259))

(assert (= (and b!154259 c!29536) b!154248))

(assert (= (and b!154259 (not c!29536)) b!154262))

(assert (= (and b!154262 c!29534) b!154249))

(assert (= (and b!154262 (not c!29534)) b!154251))

(assert (= (or b!154249 b!154251) bm!17154))

(assert (= (or b!154248 bm!17154) bm!17151))

(assert (= (or b!154248 b!154249) bm!17150))

(assert (= (or b!154247 bm!17151) bm!17152))

(assert (= (or b!154247 bm!17150) bm!17155))

(assert (= (and d!50675 res!72839) b!154252))

(assert (= (and d!50675 c!29535) b!154266))

(assert (= (and d!50675 (not c!29535)) b!154253))

(assert (= (and d!50675 res!72835) b!154260))

(assert (= (and b!154260 res!72842) b!154257))

(assert (= (and b!154260 (not res!72836)) b!154246))

(assert (= (and b!154246 res!72843) b!154264))

(assert (= (and b!154260 res!72837) b!154265))

(assert (= (and b!154265 c!29539) b!154261))

(assert (= (and b!154265 (not c!29539)) b!154250))

(assert (= (and b!154261 res!72841) b!154254))

(assert (= (or b!154261 b!154250) bm!17149))

(assert (= (and b!154265 res!72838) b!154258))

(assert (= (and b!154258 c!29538) b!154255))

(assert (= (and b!154258 (not c!29538)) b!154263))

(assert (= (and b!154255 res!72840) b!154256))

(assert (= (or b!154255 b!154263) bm!17153))

(declare-fun b_lambda!6871 () Bool)

(assert (=> (not b_lambda!6871) (not b!154264)))

(assert (=> b!154264 t!6577))

(declare-fun b_and!9621 () Bool)

(assert (= b_and!9617 (and (=> t!6577 result!4481) b_and!9621)))

(assert (=> b!154264 t!6579))

(declare-fun b_and!9623 () Bool)

(assert (= b_and!9619 (and (=> t!6579 result!4485) b_and!9623)))

(declare-fun m!188151 () Bool)

(assert (=> b!154252 m!188151))

(assert (=> b!154252 m!188151))

(declare-fun m!188153 () Bool)

(assert (=> b!154252 m!188153))

(declare-fun m!188155 () Bool)

(assert (=> bm!17149 m!188155))

(assert (=> b!154246 m!188151))

(assert (=> b!154246 m!188151))

(declare-fun m!188157 () Bool)

(assert (=> b!154246 m!188157))

(declare-fun m!188159 () Bool)

(assert (=> bm!17153 m!188159))

(declare-fun m!188161 () Bool)

(assert (=> b!154256 m!188161))

(declare-fun m!188163 () Bool)

(assert (=> b!154264 m!188163))

(assert (=> b!154264 m!188151))

(assert (=> b!154264 m!188151))

(declare-fun m!188165 () Bool)

(assert (=> b!154264 m!188165))

(assert (=> b!154264 m!188037))

(assert (=> b!154264 m!188163))

(assert (=> b!154264 m!188037))

(declare-fun m!188167 () Bool)

(assert (=> b!154264 m!188167))

(declare-fun m!188169 () Bool)

(assert (=> bm!17155 m!188169))

(assert (=> b!154257 m!188151))

(assert (=> b!154257 m!188151))

(assert (=> b!154257 m!188153))

(assert (=> d!50675 m!188043))

(declare-fun m!188171 () Bool)

(assert (=> b!154254 m!188171))

(declare-fun m!188173 () Bool)

(assert (=> b!154247 m!188173))

(declare-fun m!188175 () Bool)

(assert (=> bm!17152 m!188175))

(declare-fun m!188177 () Bool)

(assert (=> b!154266 m!188177))

(declare-fun m!188179 () Bool)

(assert (=> b!154266 m!188179))

(declare-fun m!188181 () Bool)

(assert (=> b!154266 m!188181))

(declare-fun m!188183 () Bool)

(assert (=> b!154266 m!188183))

(assert (=> b!154266 m!188151))

(declare-fun m!188185 () Bool)

(assert (=> b!154266 m!188185))

(declare-fun m!188187 () Bool)

(assert (=> b!154266 m!188187))

(declare-fun m!188189 () Bool)

(assert (=> b!154266 m!188189))

(declare-fun m!188191 () Bool)

(assert (=> b!154266 m!188191))

(declare-fun m!188193 () Bool)

(assert (=> b!154266 m!188193))

(declare-fun m!188195 () Bool)

(assert (=> b!154266 m!188195))

(declare-fun m!188197 () Bool)

(assert (=> b!154266 m!188197))

(declare-fun m!188199 () Bool)

(assert (=> b!154266 m!188199))

(assert (=> b!154266 m!188191))

(assert (=> b!154266 m!188197))

(declare-fun m!188201 () Bool)

(assert (=> b!154266 m!188201))

(assert (=> b!154266 m!188183))

(declare-fun m!188203 () Bool)

(assert (=> b!154266 m!188203))

(declare-fun m!188205 () Bool)

(assert (=> b!154266 m!188205))

(assert (=> b!154266 m!188179))

(assert (=> b!154266 m!188175))

(assert (=> d!50669 d!50675))

(declare-fun d!50677 () Bool)

(declare-fun e!100803 () Bool)

(assert (=> d!50677 e!100803))

(declare-fun res!72846 () Bool)

(assert (=> d!50677 (=> res!72846 e!100803)))

(declare-fun lt!81034 () Bool)

(assert (=> d!50677 (= res!72846 (not lt!81034))))

(declare-fun lt!81037 () Bool)

(assert (=> d!50677 (= lt!81034 lt!81037)))

(declare-fun lt!81035 () Unit!4904)

(declare-fun e!100802 () Unit!4904)

(assert (=> d!50677 (= lt!81035 e!100802)))

(declare-fun c!29542 () Bool)

(assert (=> d!50677 (= c!29542 lt!81037)))

(declare-fun containsKey!187 (List!1789 (_ BitVec 64)) Bool)

(assert (=> d!50677 (= lt!81037 (containsKey!187 (toList!896 lt!80962) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!50677 (= (contains!947 lt!80962 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!81034)))

(declare-fun b!154273 () Bool)

(declare-fun lt!81036 () Unit!4904)

(assert (=> b!154273 (= e!100802 lt!81036)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!135 (List!1789 (_ BitVec 64)) Unit!4904)

(assert (=> b!154273 (= lt!81036 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!80962) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun isDefined!136 (Option!190) Bool)

(assert (=> b!154273 (isDefined!136 (getValueByKey!184 (toList!896 lt!80962) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!154274 () Bool)

(declare-fun Unit!4909 () Unit!4904)

(assert (=> b!154274 (= e!100802 Unit!4909)))

(declare-fun b!154275 () Bool)

(assert (=> b!154275 (= e!100803 (isDefined!136 (getValueByKey!184 (toList!896 lt!80962) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!50677 c!29542) b!154273))

(assert (= (and d!50677 (not c!29542)) b!154274))

(assert (= (and d!50677 (not res!72846)) b!154275))

(assert (=> d!50677 m!188021))

(declare-fun m!188207 () Bool)

(assert (=> d!50677 m!188207))

(assert (=> b!154273 m!188021))

(declare-fun m!188209 () Bool)

(assert (=> b!154273 m!188209))

(assert (=> b!154273 m!188021))

(declare-fun m!188211 () Bool)

(assert (=> b!154273 m!188211))

(assert (=> b!154273 m!188211))

(declare-fun m!188213 () Bool)

(assert (=> b!154273 m!188213))

(assert (=> b!154275 m!188021))

(assert (=> b!154275 m!188211))

(assert (=> b!154275 m!188211))

(assert (=> b!154275 m!188213))

(assert (=> b!154192 d!50677))

(declare-fun b!154285 () Bool)

(declare-fun res!72856 () Bool)

(declare-fun e!100806 () Bool)

(assert (=> b!154285 (=> (not res!72856) (not e!100806))))

(declare-fun size!2685 (LongMapFixedSize!1246) (_ BitVec 32))

(assert (=> b!154285 (= res!72856 (bvsge (size!2685 newMap!16) (_size!672 newMap!16)))))

(declare-fun d!50679 () Bool)

(declare-fun res!72855 () Bool)

(assert (=> d!50679 (=> (not res!72855) (not e!100806))))

(assert (=> d!50679 (= res!72855 (validMask!0 (mask!7467 newMap!16)))))

(assert (=> d!50679 (= (simpleValid!104 newMap!16) e!100806)))

(declare-fun b!154286 () Bool)

(declare-fun res!72858 () Bool)

(assert (=> b!154286 (=> (not res!72858) (not e!100806))))

(assert (=> b!154286 (= res!72858 (= (size!2685 newMap!16) (bvadd (_size!672 newMap!16) (bvsdiv (bvadd (extraKeys!2804 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!154287 () Bool)

(assert (=> b!154287 (= e!100806 (and (bvsge (extraKeys!2804 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2804 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!672 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!154284 () Bool)

(declare-fun res!72857 () Bool)

(assert (=> b!154284 (=> (not res!72857) (not e!100806))))

(assert (=> b!154284 (= res!72857 (and (= (size!2680 (_values!3046 newMap!16)) (bvadd (mask!7467 newMap!16) #b00000000000000000000000000000001)) (= (size!2679 (_keys!4836 newMap!16)) (size!2680 (_values!3046 newMap!16))) (bvsge (_size!672 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!672 newMap!16) (bvadd (mask!7467 newMap!16) #b00000000000000000000000000000001))))))

(assert (= (and d!50679 res!72855) b!154284))

(assert (= (and b!154284 res!72857) b!154285))

(assert (= (and b!154285 res!72856) b!154286))

(assert (= (and b!154286 res!72858) b!154287))

(declare-fun m!188215 () Bool)

(assert (=> b!154285 m!188215))

(assert (=> d!50679 m!188113))

(assert (=> b!154286 m!188215))

(assert (=> d!50653 d!50679))

(declare-fun d!50681 () Bool)

(declare-fun e!100808 () Bool)

(assert (=> d!50681 e!100808))

(declare-fun res!72859 () Bool)

(assert (=> d!50681 (=> res!72859 e!100808)))

(declare-fun lt!81038 () Bool)

(assert (=> d!50681 (= res!72859 (not lt!81038))))

(declare-fun lt!81041 () Bool)

(assert (=> d!50681 (= lt!81038 lt!81041)))

(declare-fun lt!81039 () Unit!4904)

(declare-fun e!100807 () Unit!4904)

(assert (=> d!50681 (= lt!81039 e!100807)))

(declare-fun c!29543 () Bool)

(assert (=> d!50681 (= c!29543 lt!81041)))

(assert (=> d!50681 (= lt!81041 (containsKey!187 (toList!896 lt!80962) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50681 (= (contains!947 lt!80962 #b1000000000000000000000000000000000000000000000000000000000000000) lt!81038)))

(declare-fun b!154288 () Bool)

(declare-fun lt!81040 () Unit!4904)

(assert (=> b!154288 (= e!100807 lt!81040)))

(assert (=> b!154288 (= lt!81040 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!80962) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154288 (isDefined!136 (getValueByKey!184 (toList!896 lt!80962) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154289 () Bool)

(declare-fun Unit!4910 () Unit!4904)

(assert (=> b!154289 (= e!100807 Unit!4910)))

(declare-fun b!154290 () Bool)

(assert (=> b!154290 (= e!100808 (isDefined!136 (getValueByKey!184 (toList!896 lt!80962) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50681 c!29543) b!154288))

(assert (= (and d!50681 (not c!29543)) b!154289))

(assert (= (and d!50681 (not res!72859)) b!154290))

(declare-fun m!188217 () Bool)

(assert (=> d!50681 m!188217))

(declare-fun m!188219 () Bool)

(assert (=> b!154288 m!188219))

(declare-fun m!188221 () Bool)

(assert (=> b!154288 m!188221))

(assert (=> b!154288 m!188221))

(declare-fun m!188223 () Bool)

(assert (=> b!154288 m!188223))

(assert (=> b!154290 m!188221))

(assert (=> b!154290 m!188221))

(assert (=> b!154290 m!188223))

(assert (=> bm!17139 d!50681))

(declare-fun b!154299 () Bool)

(declare-fun e!100813 () (_ BitVec 32))

(declare-fun e!100814 () (_ BitVec 32))

(assert (=> b!154299 (= e!100813 e!100814)))

(declare-fun c!29548 () Bool)

(assert (=> b!154299 (= c!29548 (validKeyInArray!0 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154300 () Bool)

(assert (=> b!154300 (= e!100813 #b00000000000000000000000000000000)))

(declare-fun b!154301 () Bool)

(declare-fun call!17161 () (_ BitVec 32))

(assert (=> b!154301 (= e!100814 (bvadd #b00000000000000000000000000000001 call!17161))))

(declare-fun d!50683 () Bool)

(declare-fun lt!81044 () (_ BitVec 32))

(assert (=> d!50683 (and (bvsge lt!81044 #b00000000000000000000000000000000) (bvsle lt!81044 (bvsub (size!2679 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!50683 (= lt!81044 e!100813)))

(declare-fun c!29549 () Bool)

(assert (=> d!50683 (= c!29549 (bvsge #b00000000000000000000000000000000 (size!2679 (_keys!4836 newMap!16))))))

(assert (=> d!50683 (and (bvsle #b00000000000000000000000000000000 (size!2679 (_keys!4836 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2679 (_keys!4836 newMap!16)) (size!2679 (_keys!4836 newMap!16))))))

(assert (=> d!50683 (= (arrayCountValidKeys!0 (_keys!4836 newMap!16) #b00000000000000000000000000000000 (size!2679 (_keys!4836 newMap!16))) lt!81044)))

(declare-fun b!154302 () Bool)

(assert (=> b!154302 (= e!100814 call!17161)))

(declare-fun bm!17158 () Bool)

(assert (=> bm!17158 (= call!17161 (arrayCountValidKeys!0 (_keys!4836 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2679 (_keys!4836 newMap!16))))))

(assert (= (and d!50683 c!29549) b!154300))

(assert (= (and d!50683 (not c!29549)) b!154299))

(assert (= (and b!154299 c!29548) b!154301))

(assert (= (and b!154299 (not c!29548)) b!154302))

(assert (= (or b!154301 b!154302) bm!17158))

(assert (=> b!154299 m!188091))

(assert (=> b!154299 m!188091))

(assert (=> b!154299 m!188093))

(declare-fun m!188225 () Bool)

(assert (=> bm!17158 m!188225))

(assert (=> b!154147 d!50683))

(declare-fun d!50685 () Bool)

(assert (=> d!50685 (= (apply!128 lt!80962 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1615 (getValueByKey!184 (toList!896 lt!80962) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6537 () Bool)

(assert (= bs!6537 d!50685))

(assert (=> bs!6537 m!188221))

(assert (=> bs!6537 m!188221))

(declare-fun m!188227 () Bool)

(assert (=> bs!6537 m!188227))

(assert (=> b!154202 d!50685))

(declare-fun b!154327 () Bool)

(declare-fun e!100831 () Bool)

(declare-fun e!100835 () Bool)

(assert (=> b!154327 (= e!100831 e!100835)))

(declare-fun c!29561 () Bool)

(declare-fun e!100834 () Bool)

(assert (=> b!154327 (= c!29561 e!100834)))

(declare-fun res!72870 () Bool)

(assert (=> b!154327 (=> (not res!72870) (not e!100834))))

(assert (=> b!154327 (= res!72870 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun b!154328 () Bool)

(declare-fun e!100830 () ListLongMap!1761)

(assert (=> b!154328 (= e!100830 (ListLongMap!1762 Nil!1786))))

(declare-fun b!154329 () Bool)

(declare-fun e!100833 () Bool)

(declare-fun lt!81061 () ListLongMap!1761)

(declare-fun isEmpty!436 (ListLongMap!1761) Bool)

(assert (=> b!154329 (= e!100833 (isEmpty!436 lt!81061))))

(declare-fun b!154330 () Bool)

(assert (=> b!154330 (= e!100835 e!100833)))

(declare-fun c!29559 () Bool)

(assert (=> b!154330 (= c!29559 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun b!154331 () Bool)

(declare-fun lt!81063 () Unit!4904)

(declare-fun lt!81059 () Unit!4904)

(assert (=> b!154331 (= lt!81063 lt!81059)))

(declare-fun lt!81060 () (_ BitVec 64))

(declare-fun lt!81065 () V!3681)

(declare-fun lt!81064 () (_ BitVec 64))

(declare-fun lt!81062 () ListLongMap!1761)

(assert (=> b!154331 (not (contains!947 (+!189 lt!81062 (tuple2!2763 lt!81064 lt!81065)) lt!81060))))

(declare-fun addStillNotContains!72 (ListLongMap!1761 (_ BitVec 64) V!3681 (_ BitVec 64)) Unit!4904)

(assert (=> b!154331 (= lt!81059 (addStillNotContains!72 lt!81062 lt!81064 lt!81065 lt!81060))))

(assert (=> b!154331 (= lt!81060 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!154331 (= lt!81065 (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!154331 (= lt!81064 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!17164 () ListLongMap!1761)

(assert (=> b!154331 (= lt!81062 call!17164)))

(declare-fun e!100829 () ListLongMap!1761)

(assert (=> b!154331 (= e!100829 (+!189 call!17164 (tuple2!2763 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!154332 () Bool)

(assert (=> b!154332 (= e!100830 e!100829)))

(declare-fun c!29560 () Bool)

(assert (=> b!154332 (= c!29560 (validKeyInArray!0 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!154333 () Bool)

(assert (=> b!154333 (= e!100833 (= lt!81061 (getCurrentListMapNoExtraKeys!159 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun bm!17161 () Bool)

(assert (=> bm!17161 (= call!17164 (getCurrentListMapNoExtraKeys!159 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun b!154334 () Bool)

(assert (=> b!154334 (= e!100829 call!17164)))

(declare-fun d!50687 () Bool)

(assert (=> d!50687 e!100831))

(declare-fun res!72871 () Bool)

(assert (=> d!50687 (=> (not res!72871) (not e!100831))))

(assert (=> d!50687 (= res!72871 (not (contains!947 lt!81061 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50687 (= lt!81061 e!100830)))

(declare-fun c!29558 () Bool)

(assert (=> d!50687 (= c!29558 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(assert (=> d!50687 (validMask!0 (mask!7467 (v!3418 (underlying!525 thiss!992))))))

(assert (=> d!50687 (= (getCurrentListMapNoExtraKeys!159 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))) lt!81061)))

(declare-fun b!154335 () Bool)

(assert (=> b!154335 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(assert (=> b!154335 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2680 (_values!3046 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun e!100832 () Bool)

(assert (=> b!154335 (= e!100832 (= (apply!128 lt!81061 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!154336 () Bool)

(assert (=> b!154336 (= e!100834 (validKeyInArray!0 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!154336 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!154337 () Bool)

(assert (=> b!154337 (= e!100835 e!100832)))

(assert (=> b!154337 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun res!72869 () Bool)

(assert (=> b!154337 (= res!72869 (contains!947 lt!81061 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!154337 (=> (not res!72869) (not e!100832))))

(declare-fun b!154338 () Bool)

(declare-fun res!72868 () Bool)

(assert (=> b!154338 (=> (not res!72868) (not e!100831))))

(assert (=> b!154338 (= res!72868 (not (contains!947 lt!81061 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50687 c!29558) b!154328))

(assert (= (and d!50687 (not c!29558)) b!154332))

(assert (= (and b!154332 c!29560) b!154331))

(assert (= (and b!154332 (not c!29560)) b!154334))

(assert (= (or b!154331 b!154334) bm!17161))

(assert (= (and d!50687 res!72871) b!154338))

(assert (= (and b!154338 res!72868) b!154327))

(assert (= (and b!154327 res!72870) b!154336))

(assert (= (and b!154327 c!29561) b!154337))

(assert (= (and b!154327 (not c!29561)) b!154330))

(assert (= (and b!154337 res!72869) b!154335))

(assert (= (and b!154330 c!29559) b!154333))

(assert (= (and b!154330 (not c!29559)) b!154329))

(declare-fun b_lambda!6873 () Bool)

(assert (=> (not b_lambda!6873) (not b!154331)))

(assert (=> b!154331 t!6577))

(declare-fun b_and!9625 () Bool)

(assert (= b_and!9621 (and (=> t!6577 result!4481) b_and!9625)))

(assert (=> b!154331 t!6579))

(declare-fun b_and!9627 () Bool)

(assert (= b_and!9623 (and (=> t!6579 result!4485) b_and!9627)))

(declare-fun b_lambda!6875 () Bool)

(assert (=> (not b_lambda!6875) (not b!154335)))

(assert (=> b!154335 t!6577))

(declare-fun b_and!9629 () Bool)

(assert (= b_and!9625 (and (=> t!6577 result!4481) b_and!9629)))

(assert (=> b!154335 t!6579))

(declare-fun b_and!9631 () Bool)

(assert (= b_and!9627 (and (=> t!6579 result!4485) b_and!9631)))

(declare-fun m!188229 () Bool)

(assert (=> b!154338 m!188229))

(assert (=> b!154336 m!188021))

(assert (=> b!154336 m!188021))

(assert (=> b!154336 m!188023))

(declare-fun m!188231 () Bool)

(assert (=> b!154329 m!188231))

(assert (=> b!154331 m!188021))

(assert (=> b!154331 m!188037))

(declare-fun m!188233 () Bool)

(assert (=> b!154331 m!188233))

(assert (=> b!154331 m!188033))

(declare-fun m!188235 () Bool)

(assert (=> b!154331 m!188235))

(declare-fun m!188237 () Bool)

(assert (=> b!154331 m!188237))

(assert (=> b!154331 m!188033))

(assert (=> b!154331 m!188037))

(assert (=> b!154331 m!188039))

(assert (=> b!154331 m!188233))

(declare-fun m!188239 () Bool)

(assert (=> b!154331 m!188239))

(assert (=> b!154332 m!188021))

(assert (=> b!154332 m!188021))

(assert (=> b!154332 m!188023))

(declare-fun m!188241 () Bool)

(assert (=> bm!17161 m!188241))

(assert (=> b!154333 m!188241))

(assert (=> b!154337 m!188021))

(assert (=> b!154337 m!188021))

(declare-fun m!188243 () Bool)

(assert (=> b!154337 m!188243))

(declare-fun m!188245 () Bool)

(assert (=> d!50687 m!188245))

(assert (=> d!50687 m!188043))

(assert (=> b!154335 m!188021))

(assert (=> b!154335 m!188021))

(declare-fun m!188247 () Bool)

(assert (=> b!154335 m!188247))

(assert (=> b!154335 m!188033))

(assert (=> b!154335 m!188037))

(assert (=> b!154335 m!188039))

(assert (=> b!154335 m!188037))

(assert (=> b!154335 m!188033))

(assert (=> bm!17138 d!50687))

(declare-fun d!50689 () Bool)

(assert (=> d!50689 (= (validMask!0 (mask!7467 (v!3418 (underlying!525 thiss!992)))) (and (or (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000001111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000011111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000001111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000011111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000001111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000011111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000111111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000000000001111111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000000000011111111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000000000111111111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000000001111111111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000000011111111111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000000111111111111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000001111111111111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000011111111111111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000111111111111111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000001111111111111111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000011111111111111111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000111111111111111111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000001111111111111111111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000011111111111111111111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000111111111111111111111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00001111111111111111111111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00011111111111111111111111111111) (= (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!50659 d!50689))

(declare-fun d!50691 () Bool)

(declare-fun e!100837 () Bool)

(assert (=> d!50691 e!100837))

(declare-fun res!72872 () Bool)

(assert (=> d!50691 (=> res!72872 e!100837)))

(declare-fun lt!81066 () Bool)

(assert (=> d!50691 (= res!72872 (not lt!81066))))

(declare-fun lt!81069 () Bool)

(assert (=> d!50691 (= lt!81066 lt!81069)))

(declare-fun lt!81067 () Unit!4904)

(declare-fun e!100836 () Unit!4904)

(assert (=> d!50691 (= lt!81067 e!100836)))

(declare-fun c!29562 () Bool)

(assert (=> d!50691 (= c!29562 lt!81069)))

(assert (=> d!50691 (= lt!81069 (containsKey!187 (toList!896 lt!80962) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50691 (= (contains!947 lt!80962 #b0000000000000000000000000000000000000000000000000000000000000000) lt!81066)))

(declare-fun b!154339 () Bool)

(declare-fun lt!81068 () Unit!4904)

(assert (=> b!154339 (= e!100836 lt!81068)))

(assert (=> b!154339 (= lt!81068 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!80962) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154339 (isDefined!136 (getValueByKey!184 (toList!896 lt!80962) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154340 () Bool)

(declare-fun Unit!4911 () Unit!4904)

(assert (=> b!154340 (= e!100836 Unit!4911)))

(declare-fun b!154341 () Bool)

(assert (=> b!154341 (= e!100837 (isDefined!136 (getValueByKey!184 (toList!896 lt!80962) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50691 c!29562) b!154339))

(assert (= (and d!50691 (not c!29562)) b!154340))

(assert (= (and d!50691 (not res!72872)) b!154341))

(declare-fun m!188249 () Bool)

(assert (=> d!50691 m!188249))

(declare-fun m!188251 () Bool)

(assert (=> b!154339 m!188251))

(assert (=> b!154339 m!188087))

(assert (=> b!154339 m!188087))

(declare-fun m!188253 () Bool)

(assert (=> b!154339 m!188253))

(assert (=> b!154341 m!188087))

(assert (=> b!154341 m!188087))

(assert (=> b!154341 m!188253))

(assert (=> bm!17135 d!50691))

(declare-fun d!50693 () Bool)

(declare-fun e!100840 () Bool)

(assert (=> d!50693 e!100840))

(declare-fun res!72878 () Bool)

(assert (=> d!50693 (=> (not res!72878) (not e!100840))))

(declare-fun lt!81078 () ListLongMap!1761)

(assert (=> d!50693 (= res!72878 (contains!947 lt!81078 (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun lt!81079 () List!1789)

(assert (=> d!50693 (= lt!81078 (ListLongMap!1762 lt!81079))))

(declare-fun lt!81081 () Unit!4904)

(declare-fun lt!81080 () Unit!4904)

(assert (=> d!50693 (= lt!81081 lt!81080)))

(assert (=> d!50693 (= (getValueByKey!184 lt!81079 (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))) (Some!189 (_2!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!97 (List!1789 (_ BitVec 64) V!3681) Unit!4904)

(assert (=> d!50693 (= lt!81080 (lemmaContainsTupThenGetReturnValue!97 lt!81079 (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (_2!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun insertStrictlySorted!100 (List!1789 (_ BitVec 64) V!3681) List!1789)

(assert (=> d!50693 (= lt!81079 (insertStrictlySorted!100 (toList!896 (ite c!29525 call!17138 (ite c!29524 call!17142 call!17141))) (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (_2!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!50693 (= (+!189 (ite c!29525 call!17138 (ite c!29524 call!17142 call!17141)) (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81078)))

(declare-fun b!154346 () Bool)

(declare-fun res!72877 () Bool)

(assert (=> b!154346 (=> (not res!72877) (not e!100840))))

(assert (=> b!154346 (= res!72877 (= (getValueByKey!184 (toList!896 lt!81078) (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))) (Some!189 (_2!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(declare-fun b!154347 () Bool)

(declare-fun contains!948 (List!1789 tuple2!2762) Bool)

(assert (=> b!154347 (= e!100840 (contains!948 (toList!896 lt!81078) (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (= (and d!50693 res!72878) b!154346))

(assert (= (and b!154346 res!72877) b!154347))

(declare-fun m!188255 () Bool)

(assert (=> d!50693 m!188255))

(declare-fun m!188257 () Bool)

(assert (=> d!50693 m!188257))

(declare-fun m!188259 () Bool)

(assert (=> d!50693 m!188259))

(declare-fun m!188261 () Bool)

(assert (=> d!50693 m!188261))

(declare-fun m!188263 () Bool)

(assert (=> b!154346 m!188263))

(declare-fun m!188265 () Bool)

(assert (=> b!154347 m!188265))

(assert (=> bm!17141 d!50693))

(declare-fun d!50695 () Bool)

(assert (=> d!50695 (= (validKeyInArray!0 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!154198 d!50695))

(declare-fun d!50697 () Bool)

(declare-fun e!100841 () Bool)

(assert (=> d!50697 e!100841))

(declare-fun res!72880 () Bool)

(assert (=> d!50697 (=> (not res!72880) (not e!100841))))

(declare-fun lt!81082 () ListLongMap!1761)

(assert (=> d!50697 (= res!72880 (contains!947 lt!81082 (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun lt!81083 () List!1789)

(assert (=> d!50697 (= lt!81082 (ListLongMap!1762 lt!81083))))

(declare-fun lt!81085 () Unit!4904)

(declare-fun lt!81084 () Unit!4904)

(assert (=> d!50697 (= lt!81085 lt!81084)))

(assert (=> d!50697 (= (getValueByKey!184 lt!81083 (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50697 (= lt!81084 (lemmaContainsTupThenGetReturnValue!97 lt!81083 (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50697 (= lt!81083 (insertStrictlySorted!100 (toList!896 lt!80961) (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50697 (= (+!189 lt!80961 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81082)))

(declare-fun b!154348 () Bool)

(declare-fun res!72879 () Bool)

(assert (=> b!154348 (=> (not res!72879) (not e!100841))))

(assert (=> b!154348 (= res!72879 (= (getValueByKey!184 (toList!896 lt!81082) (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154349 () Bool)

(assert (=> b!154349 (= e!100841 (contains!948 (toList!896 lt!81082) (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(assert (= (and d!50697 res!72880) b!154348))

(assert (= (and b!154348 res!72879) b!154349))

(declare-fun m!188267 () Bool)

(assert (=> d!50697 m!188267))

(declare-fun m!188269 () Bool)

(assert (=> d!50697 m!188269))

(declare-fun m!188271 () Bool)

(assert (=> d!50697 m!188271))

(declare-fun m!188273 () Bool)

(assert (=> d!50697 m!188273))

(declare-fun m!188275 () Bool)

(assert (=> b!154348 m!188275))

(declare-fun m!188277 () Bool)

(assert (=> b!154349 m!188277))

(assert (=> b!154212 d!50697))

(declare-fun d!50699 () Bool)

(assert (=> d!50699 (= (apply!128 lt!80973 lt!80968) (get!1615 (getValueByKey!184 (toList!896 lt!80973) lt!80968)))))

(declare-fun bs!6538 () Bool)

(assert (= bs!6538 d!50699))

(declare-fun m!188279 () Bool)

(assert (=> bs!6538 m!188279))

(assert (=> bs!6538 m!188279))

(declare-fun m!188281 () Bool)

(assert (=> bs!6538 m!188281))

(assert (=> b!154212 d!50699))

(declare-fun d!50701 () Bool)

(assert (=> d!50701 (= (apply!128 (+!189 lt!80973 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!80968) (apply!128 lt!80973 lt!80968))))

(declare-fun lt!81088 () Unit!4904)

(declare-fun choose!924 (ListLongMap!1761 (_ BitVec 64) V!3681 (_ BitVec 64)) Unit!4904)

(assert (=> d!50701 (= lt!81088 (choose!924 lt!80973 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))) lt!80968))))

(declare-fun e!100844 () Bool)

(assert (=> d!50701 e!100844))

(declare-fun res!72883 () Bool)

(assert (=> d!50701 (=> (not res!72883) (not e!100844))))

(assert (=> d!50701 (= res!72883 (contains!947 lt!80973 lt!80968))))

(assert (=> d!50701 (= (addApplyDifferent!104 lt!80973 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))) lt!80968) lt!81088)))

(declare-fun b!154353 () Bool)

(assert (=> b!154353 (= e!100844 (not (= lt!80968 lt!80960)))))

(assert (= (and d!50701 res!72883) b!154353))

(assert (=> d!50701 m!188053))

(assert (=> d!50701 m!188055))

(declare-fun m!188283 () Bool)

(assert (=> d!50701 m!188283))

(assert (=> d!50701 m!188079))

(assert (=> d!50701 m!188053))

(declare-fun m!188285 () Bool)

(assert (=> d!50701 m!188285))

(assert (=> b!154212 d!50701))

(assert (=> b!154212 d!50687))

(declare-fun d!50703 () Bool)

(assert (=> d!50703 (= (apply!128 lt!80961 lt!80975) (get!1615 (getValueByKey!184 (toList!896 lt!80961) lt!80975)))))

(declare-fun bs!6539 () Bool)

(assert (= bs!6539 d!50703))

(declare-fun m!188287 () Bool)

(assert (=> bs!6539 m!188287))

(assert (=> bs!6539 m!188287))

(declare-fun m!188289 () Bool)

(assert (=> bs!6539 m!188289))

(assert (=> b!154212 d!50703))

(declare-fun d!50705 () Bool)

(assert (=> d!50705 (contains!947 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!80981)))

(declare-fun lt!81091 () Unit!4904)

(declare-fun choose!925 (ListLongMap!1761 (_ BitVec 64) V!3681 (_ BitVec 64)) Unit!4904)

(assert (=> d!50705 (= lt!81091 (choose!925 lt!80966 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) lt!80981))))

(assert (=> d!50705 (contains!947 lt!80966 lt!80981)))

(assert (=> d!50705 (= (addStillContains!104 lt!80966 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) lt!80981) lt!81091)))

(declare-fun bs!6540 () Bool)

(assert (= bs!6540 d!50705))

(assert (=> bs!6540 m!188065))

(assert (=> bs!6540 m!188065))

(assert (=> bs!6540 m!188067))

(declare-fun m!188291 () Bool)

(assert (=> bs!6540 m!188291))

(declare-fun m!188293 () Bool)

(assert (=> bs!6540 m!188293))

(assert (=> b!154212 d!50705))

(declare-fun d!50707 () Bool)

(assert (=> d!50707 (= (apply!128 (+!189 lt!80978 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!80965) (get!1615 (getValueByKey!184 (toList!896 (+!189 lt!80978 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80965)))))

(declare-fun bs!6541 () Bool)

(assert (= bs!6541 d!50707))

(declare-fun m!188295 () Bool)

(assert (=> bs!6541 m!188295))

(assert (=> bs!6541 m!188295))

(declare-fun m!188297 () Bool)

(assert (=> bs!6541 m!188297))

(assert (=> b!154212 d!50707))

(declare-fun d!50709 () Bool)

(declare-fun e!100845 () Bool)

(assert (=> d!50709 e!100845))

(declare-fun res!72885 () Bool)

(assert (=> d!50709 (=> (not res!72885) (not e!100845))))

(declare-fun lt!81092 () ListLongMap!1761)

(assert (=> d!50709 (= res!72885 (contains!947 lt!81092 (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun lt!81093 () List!1789)

(assert (=> d!50709 (= lt!81092 (ListLongMap!1762 lt!81093))))

(declare-fun lt!81095 () Unit!4904)

(declare-fun lt!81094 () Unit!4904)

(assert (=> d!50709 (= lt!81095 lt!81094)))

(assert (=> d!50709 (= (getValueByKey!184 lt!81093 (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50709 (= lt!81094 (lemmaContainsTupThenGetReturnValue!97 lt!81093 (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50709 (= lt!81093 (insertStrictlySorted!100 (toList!896 lt!80973) (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50709 (= (+!189 lt!80973 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81092)))

(declare-fun b!154355 () Bool)

(declare-fun res!72884 () Bool)

(assert (=> b!154355 (=> (not res!72884) (not e!100845))))

(assert (=> b!154355 (= res!72884 (= (getValueByKey!184 (toList!896 lt!81092) (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154356 () Bool)

(assert (=> b!154356 (= e!100845 (contains!948 (toList!896 lt!81092) (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(assert (= (and d!50709 res!72885) b!154355))

(assert (= (and b!154355 res!72884) b!154356))

(declare-fun m!188299 () Bool)

(assert (=> d!50709 m!188299))

(declare-fun m!188301 () Bool)

(assert (=> d!50709 m!188301))

(declare-fun m!188303 () Bool)

(assert (=> d!50709 m!188303))

(declare-fun m!188305 () Bool)

(assert (=> d!50709 m!188305))

(declare-fun m!188307 () Bool)

(assert (=> b!154355 m!188307))

(declare-fun m!188309 () Bool)

(assert (=> b!154356 m!188309))

(assert (=> b!154212 d!50709))

(declare-fun d!50711 () Bool)

(assert (=> d!50711 (= (apply!128 (+!189 lt!80961 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!80975) (apply!128 lt!80961 lt!80975))))

(declare-fun lt!81096 () Unit!4904)

(assert (=> d!50711 (= lt!81096 (choose!924 lt!80961 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) lt!80975))))

(declare-fun e!100846 () Bool)

(assert (=> d!50711 e!100846))

(declare-fun res!72886 () Bool)

(assert (=> d!50711 (=> (not res!72886) (not e!100846))))

(assert (=> d!50711 (= res!72886 (contains!947 lt!80961 lt!80975))))

(assert (=> d!50711 (= (addApplyDifferent!104 lt!80961 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) lt!80975) lt!81096)))

(declare-fun b!154357 () Bool)

(assert (=> b!154357 (= e!100846 (not (= lt!80975 lt!80971)))))

(assert (= (and d!50711 res!72886) b!154357))

(assert (=> d!50711 m!188057))

(assert (=> d!50711 m!188077))

(declare-fun m!188311 () Bool)

(assert (=> d!50711 m!188311))

(assert (=> d!50711 m!188059))

(assert (=> d!50711 m!188057))

(declare-fun m!188313 () Bool)

(assert (=> d!50711 m!188313))

(assert (=> b!154212 d!50711))

(declare-fun d!50713 () Bool)

(assert (=> d!50713 (= (apply!128 lt!80978 lt!80965) (get!1615 (getValueByKey!184 (toList!896 lt!80978) lt!80965)))))

(declare-fun bs!6542 () Bool)

(assert (= bs!6542 d!50713))

(declare-fun m!188315 () Bool)

(assert (=> bs!6542 m!188315))

(assert (=> bs!6542 m!188315))

(declare-fun m!188317 () Bool)

(assert (=> bs!6542 m!188317))

(assert (=> b!154212 d!50713))

(declare-fun d!50715 () Bool)

(declare-fun e!100847 () Bool)

(assert (=> d!50715 e!100847))

(declare-fun res!72888 () Bool)

(assert (=> d!50715 (=> (not res!72888) (not e!100847))))

(declare-fun lt!81097 () ListLongMap!1761)

(assert (=> d!50715 (= res!72888 (contains!947 lt!81097 (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun lt!81098 () List!1789)

(assert (=> d!50715 (= lt!81097 (ListLongMap!1762 lt!81098))))

(declare-fun lt!81100 () Unit!4904)

(declare-fun lt!81099 () Unit!4904)

(assert (=> d!50715 (= lt!81100 lt!81099)))

(assert (=> d!50715 (= (getValueByKey!184 lt!81098 (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50715 (= lt!81099 (lemmaContainsTupThenGetReturnValue!97 lt!81098 (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50715 (= lt!81098 (insertStrictlySorted!100 (toList!896 lt!80978) (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50715 (= (+!189 lt!80978 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81097)))

(declare-fun b!154358 () Bool)

(declare-fun res!72887 () Bool)

(assert (=> b!154358 (=> (not res!72887) (not e!100847))))

(assert (=> b!154358 (= res!72887 (= (getValueByKey!184 (toList!896 lt!81097) (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154359 () Bool)

(assert (=> b!154359 (= e!100847 (contains!948 (toList!896 lt!81097) (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(assert (= (and d!50715 res!72888) b!154358))

(assert (= (and b!154358 res!72887) b!154359))

(declare-fun m!188319 () Bool)

(assert (=> d!50715 m!188319))

(declare-fun m!188321 () Bool)

(assert (=> d!50715 m!188321))

(declare-fun m!188323 () Bool)

(assert (=> d!50715 m!188323))

(declare-fun m!188325 () Bool)

(assert (=> d!50715 m!188325))

(declare-fun m!188327 () Bool)

(assert (=> b!154358 m!188327))

(declare-fun m!188329 () Bool)

(assert (=> b!154359 m!188329))

(assert (=> b!154212 d!50715))

(declare-fun d!50717 () Bool)

(declare-fun e!100849 () Bool)

(assert (=> d!50717 e!100849))

(declare-fun res!72889 () Bool)

(assert (=> d!50717 (=> res!72889 e!100849)))

(declare-fun lt!81101 () Bool)

(assert (=> d!50717 (= res!72889 (not lt!81101))))

(declare-fun lt!81104 () Bool)

(assert (=> d!50717 (= lt!81101 lt!81104)))

(declare-fun lt!81102 () Unit!4904)

(declare-fun e!100848 () Unit!4904)

(assert (=> d!50717 (= lt!81102 e!100848)))

(declare-fun c!29563 () Bool)

(assert (=> d!50717 (= c!29563 lt!81104)))

(assert (=> d!50717 (= lt!81104 (containsKey!187 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80981))))

(assert (=> d!50717 (= (contains!947 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!80981) lt!81101)))

(declare-fun b!154360 () Bool)

(declare-fun lt!81103 () Unit!4904)

(assert (=> b!154360 (= e!100848 lt!81103)))

(assert (=> b!154360 (= lt!81103 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80981))))

(assert (=> b!154360 (isDefined!136 (getValueByKey!184 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80981))))

(declare-fun b!154361 () Bool)

(declare-fun Unit!4912 () Unit!4904)

(assert (=> b!154361 (= e!100848 Unit!4912)))

(declare-fun b!154362 () Bool)

(assert (=> b!154362 (= e!100849 (isDefined!136 (getValueByKey!184 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80981)))))

(assert (= (and d!50717 c!29563) b!154360))

(assert (= (and d!50717 (not c!29563)) b!154361))

(assert (= (and d!50717 (not res!72889)) b!154362))

(declare-fun m!188331 () Bool)

(assert (=> d!50717 m!188331))

(declare-fun m!188333 () Bool)

(assert (=> b!154360 m!188333))

(declare-fun m!188335 () Bool)

(assert (=> b!154360 m!188335))

(assert (=> b!154360 m!188335))

(declare-fun m!188337 () Bool)

(assert (=> b!154360 m!188337))

(assert (=> b!154362 m!188335))

(assert (=> b!154362 m!188335))

(assert (=> b!154362 m!188337))

(assert (=> b!154212 d!50717))

(declare-fun d!50719 () Bool)

(declare-fun e!100850 () Bool)

(assert (=> d!50719 e!100850))

(declare-fun res!72891 () Bool)

(assert (=> d!50719 (=> (not res!72891) (not e!100850))))

(declare-fun lt!81105 () ListLongMap!1761)

(assert (=> d!50719 (= res!72891 (contains!947 lt!81105 (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun lt!81106 () List!1789)

(assert (=> d!50719 (= lt!81105 (ListLongMap!1762 lt!81106))))

(declare-fun lt!81108 () Unit!4904)

(declare-fun lt!81107 () Unit!4904)

(assert (=> d!50719 (= lt!81108 lt!81107)))

(assert (=> d!50719 (= (getValueByKey!184 lt!81106 (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50719 (= lt!81107 (lemmaContainsTupThenGetReturnValue!97 lt!81106 (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50719 (= lt!81106 (insertStrictlySorted!100 (toList!896 lt!80966) (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50719 (= (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81105)))

(declare-fun b!154363 () Bool)

(declare-fun res!72890 () Bool)

(assert (=> b!154363 (=> (not res!72890) (not e!100850))))

(assert (=> b!154363 (= res!72890 (= (getValueByKey!184 (toList!896 lt!81105) (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154364 () Bool)

(assert (=> b!154364 (= e!100850 (contains!948 (toList!896 lt!81105) (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(assert (= (and d!50719 res!72891) b!154363))

(assert (= (and b!154363 res!72890) b!154364))

(declare-fun m!188339 () Bool)

(assert (=> d!50719 m!188339))

(declare-fun m!188341 () Bool)

(assert (=> d!50719 m!188341))

(declare-fun m!188343 () Bool)

(assert (=> d!50719 m!188343))

(declare-fun m!188345 () Bool)

(assert (=> d!50719 m!188345))

(declare-fun m!188347 () Bool)

(assert (=> b!154363 m!188347))

(declare-fun m!188349 () Bool)

(assert (=> b!154364 m!188349))

(assert (=> b!154212 d!50719))

(declare-fun d!50721 () Bool)

(assert (=> d!50721 (= (apply!128 (+!189 lt!80978 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!80965) (apply!128 lt!80978 lt!80965))))

(declare-fun lt!81109 () Unit!4904)

(assert (=> d!50721 (= lt!81109 (choose!924 lt!80978 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))) lt!80965))))

(declare-fun e!100851 () Bool)

(assert (=> d!50721 e!100851))

(declare-fun res!72892 () Bool)

(assert (=> d!50721 (=> (not res!72892) (not e!100851))))

(assert (=> d!50721 (= res!72892 (contains!947 lt!80978 lt!80965))))

(assert (=> d!50721 (= (addApplyDifferent!104 lt!80978 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))) lt!80965) lt!81109)))

(declare-fun b!154365 () Bool)

(assert (=> b!154365 (= e!100851 (not (= lt!80965 lt!80969)))))

(assert (= (and d!50721 res!72892) b!154365))

(assert (=> d!50721 m!188071))

(assert (=> d!50721 m!188075))

(declare-fun m!188351 () Bool)

(assert (=> d!50721 m!188351))

(assert (=> d!50721 m!188069))

(assert (=> d!50721 m!188071))

(declare-fun m!188353 () Bool)

(assert (=> d!50721 m!188353))

(assert (=> b!154212 d!50721))

(declare-fun d!50723 () Bool)

(assert (=> d!50723 (= (apply!128 (+!189 lt!80961 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!80975) (get!1615 (getValueByKey!184 (toList!896 (+!189 lt!80961 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80975)))))

(declare-fun bs!6543 () Bool)

(assert (= bs!6543 d!50723))

(declare-fun m!188355 () Bool)

(assert (=> bs!6543 m!188355))

(assert (=> bs!6543 m!188355))

(declare-fun m!188357 () Bool)

(assert (=> bs!6543 m!188357))

(assert (=> b!154212 d!50723))

(declare-fun d!50725 () Bool)

(assert (=> d!50725 (= (apply!128 (+!189 lt!80973 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!80968) (get!1615 (getValueByKey!184 (toList!896 (+!189 lt!80973 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80968)))))

(declare-fun bs!6544 () Bool)

(assert (= bs!6544 d!50725))

(declare-fun m!188359 () Bool)

(assert (=> bs!6544 m!188359))

(assert (=> bs!6544 m!188359))

(declare-fun m!188361 () Bool)

(assert (=> bs!6544 m!188361))

(assert (=> b!154212 d!50725))

(assert (=> b!154203 d!50695))

(declare-fun d!50727 () Bool)

(declare-fun e!100852 () Bool)

(assert (=> d!50727 e!100852))

(declare-fun res!72894 () Bool)

(assert (=> d!50727 (=> (not res!72894) (not e!100852))))

(declare-fun lt!81110 () ListLongMap!1761)

(assert (=> d!50727 (= res!72894 (contains!947 lt!81110 (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun lt!81111 () List!1789)

(assert (=> d!50727 (= lt!81110 (ListLongMap!1762 lt!81111))))

(declare-fun lt!81113 () Unit!4904)

(declare-fun lt!81112 () Unit!4904)

(assert (=> d!50727 (= lt!81113 lt!81112)))

(assert (=> d!50727 (= (getValueByKey!184 lt!81111 (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50727 (= lt!81112 (lemmaContainsTupThenGetReturnValue!97 lt!81111 (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50727 (= lt!81111 (insertStrictlySorted!100 (toList!896 call!17143) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50727 (= (+!189 call!17143 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81110)))

(declare-fun b!154366 () Bool)

(declare-fun res!72893 () Bool)

(assert (=> b!154366 (=> (not res!72893) (not e!100852))))

(assert (=> b!154366 (= res!72893 (= (getValueByKey!184 (toList!896 lt!81110) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154367 () Bool)

(assert (=> b!154367 (= e!100852 (contains!948 (toList!896 lt!81110) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(assert (= (and d!50727 res!72894) b!154366))

(assert (= (and b!154366 res!72893) b!154367))

(declare-fun m!188363 () Bool)

(assert (=> d!50727 m!188363))

(declare-fun m!188365 () Bool)

(assert (=> d!50727 m!188365))

(declare-fun m!188367 () Bool)

(assert (=> d!50727 m!188367))

(declare-fun m!188369 () Bool)

(assert (=> d!50727 m!188369))

(declare-fun m!188371 () Bool)

(assert (=> b!154366 m!188371))

(declare-fun m!188373 () Bool)

(assert (=> b!154367 m!188373))

(assert (=> b!154193 d!50727))

(declare-fun d!50729 () Bool)

(declare-fun res!72895 () Bool)

(declare-fun e!100853 () Bool)

(assert (=> d!50729 (=> (not res!72895) (not e!100853))))

(assert (=> d!50729 (= res!72895 (simpleValid!104 (v!3418 (underlying!525 thiss!992))))))

(assert (=> d!50729 (= (valid!631 (v!3418 (underlying!525 thiss!992))) e!100853)))

(declare-fun b!154368 () Bool)

(declare-fun res!72896 () Bool)

(assert (=> b!154368 (=> (not res!72896) (not e!100853))))

(assert (=> b!154368 (= res!72896 (= (arrayCountValidKeys!0 (_keys!4836 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000000 (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))) (_size!672 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun b!154369 () Bool)

(declare-fun res!72897 () Bool)

(assert (=> b!154369 (=> (not res!72897) (not e!100853))))

(assert (=> b!154369 (= res!72897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun b!154370 () Bool)

(assert (=> b!154370 (= e!100853 (arrayNoDuplicates!0 (_keys!4836 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000000 Nil!1787))))

(assert (= (and d!50729 res!72895) b!154368))

(assert (= (and b!154368 res!72896) b!154369))

(assert (= (and b!154369 res!72897) b!154370))

(declare-fun m!188375 () Bool)

(assert (=> d!50729 m!188375))

(declare-fun m!188377 () Bool)

(assert (=> b!154368 m!188377))

(declare-fun m!188379 () Bool)

(assert (=> b!154369 m!188379))

(declare-fun m!188381 () Bool)

(assert (=> b!154370 m!188381))

(assert (=> d!50655 d!50729))

(declare-fun d!50731 () Bool)

(assert (=> d!50731 (= (apply!128 lt!80962 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1615 (getValueByKey!184 (toList!896 lt!80962) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!6545 () Bool)

(assert (= bs!6545 d!50731))

(assert (=> bs!6545 m!188021))

(assert (=> bs!6545 m!188211))

(assert (=> bs!6545 m!188211))

(declare-fun m!188383 () Bool)

(assert (=> bs!6545 m!188383))

(assert (=> b!154210 d!50731))

(declare-fun d!50733 () Bool)

(declare-fun c!29566 () Bool)

(assert (=> d!50733 (= c!29566 ((_ is ValueCellFull!1169) (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!100856 () V!3681)

(assert (=> d!50733 (= (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!100856)))

(declare-fun b!154375 () Bool)

(declare-fun get!1616 (ValueCell!1169 V!3681) V!3681)

(assert (=> b!154375 (= e!100856 (get!1616 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154376 () Bool)

(declare-fun get!1617 (ValueCell!1169 V!3681) V!3681)

(assert (=> b!154376 (= e!100856 (get!1617 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50733 c!29566) b!154375))

(assert (= (and d!50733 (not c!29566)) b!154376))

(assert (=> b!154375 m!188033))

(assert (=> b!154375 m!188037))

(declare-fun m!188385 () Bool)

(assert (=> b!154375 m!188385))

(assert (=> b!154376 m!188033))

(assert (=> b!154376 m!188037))

(declare-fun m!188387 () Bool)

(assert (=> b!154376 m!188387))

(assert (=> b!154210 d!50733))

(declare-fun bm!17164 () Bool)

(declare-fun call!17167 () Bool)

(assert (=> bm!17164 (= call!17167 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4836 newMap!16) (mask!7467 newMap!16)))))

(declare-fun b!154385 () Bool)

(declare-fun e!100864 () Bool)

(assert (=> b!154385 (= e!100864 call!17167)))

(declare-fun b!154386 () Bool)

(declare-fun e!100865 () Bool)

(assert (=> b!154386 (= e!100865 call!17167)))

(declare-fun b!154387 () Bool)

(declare-fun e!100863 () Bool)

(assert (=> b!154387 (= e!100863 e!100865)))

(declare-fun c!29569 () Bool)

(assert (=> b!154387 (= c!29569 (validKeyInArray!0 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154388 () Bool)

(assert (=> b!154388 (= e!100865 e!100864)))

(declare-fun lt!81121 () (_ BitVec 64))

(assert (=> b!154388 (= lt!81121 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!81122 () Unit!4904)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5087 (_ BitVec 64) (_ BitVec 32)) Unit!4904)

(assert (=> b!154388 (= lt!81122 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4836 newMap!16) lt!81121 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!154388 (arrayContainsKey!0 (_keys!4836 newMap!16) lt!81121 #b00000000000000000000000000000000)))

(declare-fun lt!81120 () Unit!4904)

(assert (=> b!154388 (= lt!81120 lt!81122)))

(declare-fun res!72903 () Bool)

(declare-datatypes ((SeekEntryResult!280 0))(
  ( (MissingZero!280 (index!3288 (_ BitVec 32))) (Found!280 (index!3289 (_ BitVec 32))) (Intermediate!280 (undefined!1092 Bool) (index!3290 (_ BitVec 32)) (x!17016 (_ BitVec 32))) (Undefined!280) (MissingVacant!280 (index!3291 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5087 (_ BitVec 32)) SeekEntryResult!280)

(assert (=> b!154388 (= res!72903 (= (seekEntryOrOpen!0 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000) (_keys!4836 newMap!16) (mask!7467 newMap!16)) (Found!280 #b00000000000000000000000000000000)))))

(assert (=> b!154388 (=> (not res!72903) (not e!100864))))

(declare-fun d!50735 () Bool)

(declare-fun res!72902 () Bool)

(assert (=> d!50735 (=> res!72902 e!100863)))

(assert (=> d!50735 (= res!72902 (bvsge #b00000000000000000000000000000000 (size!2679 (_keys!4836 newMap!16))))))

(assert (=> d!50735 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4836 newMap!16) (mask!7467 newMap!16)) e!100863)))

(assert (= (and d!50735 (not res!72902)) b!154387))

(assert (= (and b!154387 c!29569) b!154388))

(assert (= (and b!154387 (not c!29569)) b!154386))

(assert (= (and b!154388 res!72903) b!154385))

(assert (= (or b!154385 b!154386) bm!17164))

(declare-fun m!188389 () Bool)

(assert (=> bm!17164 m!188389))

(assert (=> b!154387 m!188091))

(assert (=> b!154387 m!188091))

(assert (=> b!154387 m!188093))

(assert (=> b!154388 m!188091))

(declare-fun m!188391 () Bool)

(assert (=> b!154388 m!188391))

(declare-fun m!188393 () Bool)

(assert (=> b!154388 m!188393))

(assert (=> b!154388 m!188091))

(declare-fun m!188395 () Bool)

(assert (=> b!154388 m!188395))

(assert (=> b!154148 d!50735))

(declare-fun b!154399 () Bool)

(declare-fun e!100874 () Bool)

(declare-fun contains!949 (List!1790 (_ BitVec 64)) Bool)

(assert (=> b!154399 (= e!100874 (contains!949 Nil!1787 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154400 () Bool)

(declare-fun e!100875 () Bool)

(declare-fun call!17170 () Bool)

(assert (=> b!154400 (= e!100875 call!17170)))

(declare-fun b!154401 () Bool)

(assert (=> b!154401 (= e!100875 call!17170)))

(declare-fun bm!17167 () Bool)

(declare-fun c!29572 () Bool)

(assert (=> bm!17167 (= call!17170 (arrayNoDuplicates!0 (_keys!4836 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29572 (Cons!1786 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000) Nil!1787) Nil!1787)))))

(declare-fun b!154402 () Bool)

(declare-fun e!100876 () Bool)

(assert (=> b!154402 (= e!100876 e!100875)))

(assert (=> b!154402 (= c!29572 (validKeyInArray!0 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154403 () Bool)

(declare-fun e!100877 () Bool)

(assert (=> b!154403 (= e!100877 e!100876)))

(declare-fun res!72912 () Bool)

(assert (=> b!154403 (=> (not res!72912) (not e!100876))))

(assert (=> b!154403 (= res!72912 (not e!100874))))

(declare-fun res!72911 () Bool)

(assert (=> b!154403 (=> (not res!72911) (not e!100874))))

(assert (=> b!154403 (= res!72911 (validKeyInArray!0 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!50737 () Bool)

(declare-fun res!72910 () Bool)

(assert (=> d!50737 (=> res!72910 e!100877)))

(assert (=> d!50737 (= res!72910 (bvsge #b00000000000000000000000000000000 (size!2679 (_keys!4836 newMap!16))))))

(assert (=> d!50737 (= (arrayNoDuplicates!0 (_keys!4836 newMap!16) #b00000000000000000000000000000000 Nil!1787) e!100877)))

(assert (= (and d!50737 (not res!72910)) b!154403))

(assert (= (and b!154403 res!72911) b!154399))

(assert (= (and b!154403 res!72912) b!154402))

(assert (= (and b!154402 c!29572) b!154400))

(assert (= (and b!154402 (not c!29572)) b!154401))

(assert (= (or b!154400 b!154401) bm!17167))

(assert (=> b!154399 m!188091))

(assert (=> b!154399 m!188091))

(declare-fun m!188397 () Bool)

(assert (=> b!154399 m!188397))

(assert (=> bm!17167 m!188091))

(declare-fun m!188399 () Bool)

(assert (=> bm!17167 m!188399))

(assert (=> b!154402 m!188091))

(assert (=> b!154402 m!188091))

(assert (=> b!154402 m!188093))

(assert (=> b!154403 m!188091))

(assert (=> b!154403 m!188091))

(assert (=> b!154403 m!188093))

(assert (=> b!154149 d!50737))

(declare-fun mapNonEmpty!5183 () Bool)

(declare-fun mapRes!5183 () Bool)

(declare-fun tp!12203 () Bool)

(declare-fun e!100878 () Bool)

(assert (=> mapNonEmpty!5183 (= mapRes!5183 (and tp!12203 e!100878))))

(declare-fun mapKey!5183 () (_ BitVec 32))

(declare-fun mapRest!5183 () (Array (_ BitVec 32) ValueCell!1169))

(declare-fun mapValue!5183 () ValueCell!1169)

(assert (=> mapNonEmpty!5183 (= mapRest!5182 (store mapRest!5183 mapKey!5183 mapValue!5183))))

(declare-fun b!154404 () Bool)

(assert (=> b!154404 (= e!100878 tp_is_empty!3025)))

(declare-fun b!154405 () Bool)

(declare-fun e!100879 () Bool)

(assert (=> b!154405 (= e!100879 tp_is_empty!3025)))

(declare-fun condMapEmpty!5183 () Bool)

(declare-fun mapDefault!5183 () ValueCell!1169)

(assert (=> mapNonEmpty!5182 (= condMapEmpty!5183 (= mapRest!5182 ((as const (Array (_ BitVec 32) ValueCell!1169)) mapDefault!5183)))))

(assert (=> mapNonEmpty!5182 (= tp!12202 (and e!100879 mapRes!5183))))

(declare-fun mapIsEmpty!5183 () Bool)

(assert (=> mapIsEmpty!5183 mapRes!5183))

(assert (= (and mapNonEmpty!5182 condMapEmpty!5183) mapIsEmpty!5183))

(assert (= (and mapNonEmpty!5182 (not condMapEmpty!5183)) mapNonEmpty!5183))

(assert (= (and mapNonEmpty!5183 ((_ is ValueCellFull!1169) mapValue!5183)) b!154404))

(assert (= (and mapNonEmpty!5182 ((_ is ValueCellFull!1169) mapDefault!5183)) b!154405))

(declare-fun m!188401 () Bool)

(assert (=> mapNonEmpty!5183 m!188401))

(declare-fun mapNonEmpty!5184 () Bool)

(declare-fun mapRes!5184 () Bool)

(declare-fun tp!12204 () Bool)

(declare-fun e!100880 () Bool)

(assert (=> mapNonEmpty!5184 (= mapRes!5184 (and tp!12204 e!100880))))

(declare-fun mapValue!5184 () ValueCell!1169)

(declare-fun mapRest!5184 () (Array (_ BitVec 32) ValueCell!1169))

(declare-fun mapKey!5184 () (_ BitVec 32))

(assert (=> mapNonEmpty!5184 (= mapRest!5181 (store mapRest!5184 mapKey!5184 mapValue!5184))))

(declare-fun b!154406 () Bool)

(assert (=> b!154406 (= e!100880 tp_is_empty!3025)))

(declare-fun b!154407 () Bool)

(declare-fun e!100881 () Bool)

(assert (=> b!154407 (= e!100881 tp_is_empty!3025)))

(declare-fun condMapEmpty!5184 () Bool)

(declare-fun mapDefault!5184 () ValueCell!1169)

(assert (=> mapNonEmpty!5181 (= condMapEmpty!5184 (= mapRest!5181 ((as const (Array (_ BitVec 32) ValueCell!1169)) mapDefault!5184)))))

(assert (=> mapNonEmpty!5181 (= tp!12201 (and e!100881 mapRes!5184))))

(declare-fun mapIsEmpty!5184 () Bool)

(assert (=> mapIsEmpty!5184 mapRes!5184))

(assert (= (and mapNonEmpty!5181 condMapEmpty!5184) mapIsEmpty!5184))

(assert (= (and mapNonEmpty!5181 (not condMapEmpty!5184)) mapNonEmpty!5184))

(assert (= (and mapNonEmpty!5184 ((_ is ValueCellFull!1169) mapValue!5184)) b!154406))

(assert (= (and mapNonEmpty!5181 ((_ is ValueCellFull!1169) mapDefault!5184)) b!154407))

(declare-fun m!188403 () Bool)

(assert (=> mapNonEmpty!5184 m!188403))

(declare-fun b_lambda!6877 () Bool)

(assert (= b_lambda!6873 (or (and b!154037 b_free!3217) (and b!154048 b_free!3219 (= (defaultEntry!3063 newMap!16) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))))) b_lambda!6877)))

(declare-fun b_lambda!6879 () Bool)

(assert (= b_lambda!6869 (or (and b!154037 b_free!3217 (= (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) (defaultEntry!3063 newMap!16))) (and b!154048 b_free!3219) b_lambda!6879)))

(declare-fun b_lambda!6881 () Bool)

(assert (= b_lambda!6871 (or (and b!154037 b_free!3217) (and b!154048 b_free!3219 (= (defaultEntry!3063 newMap!16) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))))) b_lambda!6881)))

(declare-fun b_lambda!6883 () Bool)

(assert (= b_lambda!6875 (or (and b!154037 b_free!3217) (and b!154048 b_free!3219 (= (defaultEntry!3063 newMap!16) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))))) b_lambda!6883)))

(check-sat (not b!154288) (not b!154359) (not b!154256) (not b_lambda!6867) (not b!154252) (not mapNonEmpty!5183) (not b!154366) (not d!50707) (not b!154337) (not b!154356) (not b!154376) (not b!154348) (not b!154403) (not b!154257) (not b!154225) (not b!154233) (not b!154226) (not d!50701) (not b!154388) (not b!154349) (not d!50687) (not b!154368) tp_is_empty!3025 (not b!154264) (not d!50697) (not b!154369) (not d!50711) (not bm!17148) (not d!50721) (not d!50679) (not b!154299) (not d!50691) (not d!50713) (not b!154362) (not b!154243) (not bm!17164) (not b!154360) (not d!50723) (not b!154347) (not b!154275) (not bm!17155) (not d!50725) (not b!154245) (not b!154235) (not bm!17142) (not d!50729) (not b_next!3217) (not d!50719) (not d!50673) (not b!154246) (not b!154335) (not b!154247) (not bm!17167) (not b!154336) (not bm!17153) (not d!50681) (not b!154402) (not b!154367) (not b_lambda!6881) (not b!154399) (not d!50731) (not bm!17152) (not bm!17146) (not d!50677) (not b!154266) (not b!154231) (not b!154331) (not mapNonEmpty!5184) (not b!154333) (not d!50693) (not b!154236) (not d!50709) (not d!50685) (not b!154370) (not b!154290) (not b!154346) (not bm!17161) (not bm!17145) (not b!154364) (not b_lambda!6879) (not d!50699) (not d!50715) (not b!154254) (not b_lambda!6883) (not b!154339) (not b!154358) (not b!154285) (not b!154273) (not b_next!3219) b_and!9629 (not b_lambda!6877) (not b!154363) (not b!154329) (not b!154375) (not b!154387) (not b!154341) (not d!50675) (not b!154332) (not bm!17149) (not b!154355) (not bm!17158) (not d!50717) (not b!154286) (not b!154338) (not d!50727) b_and!9631 (not d!50703) (not d!50671) (not d!50705))
(check-sat b_and!9629 b_and!9631 (not b_next!3217) (not b_next!3219))
(get-model)

(declare-fun d!50739 () Bool)

(assert (=> d!50739 (= (validKeyInArray!0 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!154299 d!50739))

(assert (=> b!154336 d!50695))

(declare-fun d!50741 () Bool)

(assert (=> d!50741 (= (apply!128 lt!81000 lt!80987) (get!1615 (getValueByKey!184 (toList!896 lt!81000) lt!80987)))))

(declare-fun bs!6546 () Bool)

(assert (= bs!6546 d!50741))

(declare-fun m!188405 () Bool)

(assert (=> bs!6546 m!188405))

(assert (=> bs!6546 m!188405))

(declare-fun m!188407 () Bool)

(assert (=> bs!6546 m!188407))

(assert (=> b!154245 d!50741))

(declare-fun d!50743 () Bool)

(assert (=> d!50743 (= (apply!128 (+!189 lt!81000 (tuple2!2763 lt!80991 (minValue!2906 newMap!16))) lt!80987) (get!1615 (getValueByKey!184 (toList!896 (+!189 lt!81000 (tuple2!2763 lt!80991 (minValue!2906 newMap!16)))) lt!80987)))))

(declare-fun bs!6547 () Bool)

(assert (= bs!6547 d!50743))

(declare-fun m!188409 () Bool)

(assert (=> bs!6547 m!188409))

(assert (=> bs!6547 m!188409))

(declare-fun m!188411 () Bool)

(assert (=> bs!6547 m!188411))

(assert (=> b!154245 d!50743))

(declare-fun d!50745 () Bool)

(assert (=> d!50745 (= (apply!128 (+!189 lt!80983 (tuple2!2763 lt!80993 (zeroValue!2906 newMap!16))) lt!80997) (get!1615 (getValueByKey!184 (toList!896 (+!189 lt!80983 (tuple2!2763 lt!80993 (zeroValue!2906 newMap!16)))) lt!80997)))))

(declare-fun bs!6548 () Bool)

(assert (= bs!6548 d!50745))

(declare-fun m!188413 () Bool)

(assert (=> bs!6548 m!188413))

(assert (=> bs!6548 m!188413))

(declare-fun m!188415 () Bool)

(assert (=> bs!6548 m!188415))

(assert (=> b!154245 d!50745))

(declare-fun d!50747 () Bool)

(assert (=> d!50747 (= (apply!128 (+!189 lt!80983 (tuple2!2763 lt!80993 (zeroValue!2906 newMap!16))) lt!80997) (apply!128 lt!80983 lt!80997))))

(declare-fun lt!81123 () Unit!4904)

(assert (=> d!50747 (= lt!81123 (choose!924 lt!80983 lt!80993 (zeroValue!2906 newMap!16) lt!80997))))

(declare-fun e!100882 () Bool)

(assert (=> d!50747 e!100882))

(declare-fun res!72913 () Bool)

(assert (=> d!50747 (=> (not res!72913) (not e!100882))))

(assert (=> d!50747 (= res!72913 (contains!947 lt!80983 lt!80997))))

(assert (=> d!50747 (= (addApplyDifferent!104 lt!80983 lt!80993 (zeroValue!2906 newMap!16) lt!80997) lt!81123)))

(declare-fun b!154408 () Bool)

(assert (=> b!154408 (= e!100882 (not (= lt!80997 lt!80993)))))

(assert (= (and d!50747 res!72913) b!154408))

(assert (=> d!50747 m!188127))

(assert (=> d!50747 m!188147))

(declare-fun m!188417 () Bool)

(assert (=> d!50747 m!188417))

(assert (=> d!50747 m!188129))

(assert (=> d!50747 m!188127))

(declare-fun m!188419 () Bool)

(assert (=> d!50747 m!188419))

(assert (=> b!154245 d!50747))

(declare-fun d!50749 () Bool)

(assert (=> d!50749 (= (apply!128 (+!189 lt!80995 (tuple2!2763 lt!80982 (minValue!2906 newMap!16))) lt!80990) (get!1615 (getValueByKey!184 (toList!896 (+!189 lt!80995 (tuple2!2763 lt!80982 (minValue!2906 newMap!16)))) lt!80990)))))

(declare-fun bs!6549 () Bool)

(assert (= bs!6549 d!50749))

(declare-fun m!188421 () Bool)

(assert (=> bs!6549 m!188421))

(assert (=> bs!6549 m!188421))

(declare-fun m!188423 () Bool)

(assert (=> bs!6549 m!188423))

(assert (=> b!154245 d!50749))

(declare-fun d!50751 () Bool)

(assert (=> d!50751 (= (apply!128 lt!80995 lt!80990) (get!1615 (getValueByKey!184 (toList!896 lt!80995) lt!80990)))))

(declare-fun bs!6550 () Bool)

(assert (= bs!6550 d!50751))

(declare-fun m!188425 () Bool)

(assert (=> bs!6550 m!188425))

(assert (=> bs!6550 m!188425))

(declare-fun m!188427 () Bool)

(assert (=> bs!6550 m!188427))

(assert (=> b!154245 d!50751))

(declare-fun d!50753 () Bool)

(declare-fun e!100883 () Bool)

(assert (=> d!50753 e!100883))

(declare-fun res!72915 () Bool)

(assert (=> d!50753 (=> (not res!72915) (not e!100883))))

(declare-fun lt!81124 () ListLongMap!1761)

(assert (=> d!50753 (= res!72915 (contains!947 lt!81124 (_1!1392 (tuple2!2763 lt!80998 (zeroValue!2906 newMap!16)))))))

(declare-fun lt!81125 () List!1789)

(assert (=> d!50753 (= lt!81124 (ListLongMap!1762 lt!81125))))

(declare-fun lt!81127 () Unit!4904)

(declare-fun lt!81126 () Unit!4904)

(assert (=> d!50753 (= lt!81127 lt!81126)))

(assert (=> d!50753 (= (getValueByKey!184 lt!81125 (_1!1392 (tuple2!2763 lt!80998 (zeroValue!2906 newMap!16)))) (Some!189 (_2!1392 (tuple2!2763 lt!80998 (zeroValue!2906 newMap!16)))))))

(assert (=> d!50753 (= lt!81126 (lemmaContainsTupThenGetReturnValue!97 lt!81125 (_1!1392 (tuple2!2763 lt!80998 (zeroValue!2906 newMap!16))) (_2!1392 (tuple2!2763 lt!80998 (zeroValue!2906 newMap!16)))))))

(assert (=> d!50753 (= lt!81125 (insertStrictlySorted!100 (toList!896 lt!80988) (_1!1392 (tuple2!2763 lt!80998 (zeroValue!2906 newMap!16))) (_2!1392 (tuple2!2763 lt!80998 (zeroValue!2906 newMap!16)))))))

(assert (=> d!50753 (= (+!189 lt!80988 (tuple2!2763 lt!80998 (zeroValue!2906 newMap!16))) lt!81124)))

(declare-fun b!154409 () Bool)

(declare-fun res!72914 () Bool)

(assert (=> b!154409 (=> (not res!72914) (not e!100883))))

(assert (=> b!154409 (= res!72914 (= (getValueByKey!184 (toList!896 lt!81124) (_1!1392 (tuple2!2763 lt!80998 (zeroValue!2906 newMap!16)))) (Some!189 (_2!1392 (tuple2!2763 lt!80998 (zeroValue!2906 newMap!16))))))))

(declare-fun b!154410 () Bool)

(assert (=> b!154410 (= e!100883 (contains!948 (toList!896 lt!81124) (tuple2!2763 lt!80998 (zeroValue!2906 newMap!16))))))

(assert (= (and d!50753 res!72915) b!154409))

(assert (= (and b!154409 res!72914) b!154410))

(declare-fun m!188429 () Bool)

(assert (=> d!50753 m!188429))

(declare-fun m!188431 () Bool)

(assert (=> d!50753 m!188431))

(declare-fun m!188433 () Bool)

(assert (=> d!50753 m!188433))

(declare-fun m!188435 () Bool)

(assert (=> d!50753 m!188435))

(declare-fun m!188437 () Bool)

(assert (=> b!154409 m!188437))

(declare-fun m!188439 () Bool)

(assert (=> b!154410 m!188439))

(assert (=> b!154245 d!50753))

(declare-fun d!50755 () Bool)

(declare-fun e!100884 () Bool)

(assert (=> d!50755 e!100884))

(declare-fun res!72917 () Bool)

(assert (=> d!50755 (=> (not res!72917) (not e!100884))))

(declare-fun lt!81128 () ListLongMap!1761)

(assert (=> d!50755 (= res!72917 (contains!947 lt!81128 (_1!1392 (tuple2!2763 lt!80991 (minValue!2906 newMap!16)))))))

(declare-fun lt!81129 () List!1789)

(assert (=> d!50755 (= lt!81128 (ListLongMap!1762 lt!81129))))

(declare-fun lt!81131 () Unit!4904)

(declare-fun lt!81130 () Unit!4904)

(assert (=> d!50755 (= lt!81131 lt!81130)))

(assert (=> d!50755 (= (getValueByKey!184 lt!81129 (_1!1392 (tuple2!2763 lt!80991 (minValue!2906 newMap!16)))) (Some!189 (_2!1392 (tuple2!2763 lt!80991 (minValue!2906 newMap!16)))))))

(assert (=> d!50755 (= lt!81130 (lemmaContainsTupThenGetReturnValue!97 lt!81129 (_1!1392 (tuple2!2763 lt!80991 (minValue!2906 newMap!16))) (_2!1392 (tuple2!2763 lt!80991 (minValue!2906 newMap!16)))))))

(assert (=> d!50755 (= lt!81129 (insertStrictlySorted!100 (toList!896 lt!81000) (_1!1392 (tuple2!2763 lt!80991 (minValue!2906 newMap!16))) (_2!1392 (tuple2!2763 lt!80991 (minValue!2906 newMap!16)))))))

(assert (=> d!50755 (= (+!189 lt!81000 (tuple2!2763 lt!80991 (minValue!2906 newMap!16))) lt!81128)))

(declare-fun b!154411 () Bool)

(declare-fun res!72916 () Bool)

(assert (=> b!154411 (=> (not res!72916) (not e!100884))))

(assert (=> b!154411 (= res!72916 (= (getValueByKey!184 (toList!896 lt!81128) (_1!1392 (tuple2!2763 lt!80991 (minValue!2906 newMap!16)))) (Some!189 (_2!1392 (tuple2!2763 lt!80991 (minValue!2906 newMap!16))))))))

(declare-fun b!154412 () Bool)

(assert (=> b!154412 (= e!100884 (contains!948 (toList!896 lt!81128) (tuple2!2763 lt!80991 (minValue!2906 newMap!16))))))

(assert (= (and d!50755 res!72917) b!154411))

(assert (= (and b!154411 res!72916) b!154412))

(declare-fun m!188441 () Bool)

(assert (=> d!50755 m!188441))

(declare-fun m!188443 () Bool)

(assert (=> d!50755 m!188443))

(declare-fun m!188445 () Bool)

(assert (=> d!50755 m!188445))

(declare-fun m!188447 () Bool)

(assert (=> d!50755 m!188447))

(declare-fun m!188449 () Bool)

(assert (=> b!154411 m!188449))

(declare-fun m!188451 () Bool)

(assert (=> b!154412 m!188451))

(assert (=> b!154245 d!50755))

(declare-fun d!50757 () Bool)

(declare-fun e!100886 () Bool)

(assert (=> d!50757 e!100886))

(declare-fun res!72918 () Bool)

(assert (=> d!50757 (=> res!72918 e!100886)))

(declare-fun lt!81132 () Bool)

(assert (=> d!50757 (= res!72918 (not lt!81132))))

(declare-fun lt!81135 () Bool)

(assert (=> d!50757 (= lt!81132 lt!81135)))

(declare-fun lt!81133 () Unit!4904)

(declare-fun e!100885 () Unit!4904)

(assert (=> d!50757 (= lt!81133 e!100885)))

(declare-fun c!29573 () Bool)

(assert (=> d!50757 (= c!29573 lt!81135)))

(assert (=> d!50757 (= lt!81135 (containsKey!187 (toList!896 (+!189 lt!80988 (tuple2!2763 lt!80998 (zeroValue!2906 newMap!16)))) lt!81003))))

(assert (=> d!50757 (= (contains!947 (+!189 lt!80988 (tuple2!2763 lt!80998 (zeroValue!2906 newMap!16))) lt!81003) lt!81132)))

(declare-fun b!154413 () Bool)

(declare-fun lt!81134 () Unit!4904)

(assert (=> b!154413 (= e!100885 lt!81134)))

(assert (=> b!154413 (= lt!81134 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 (+!189 lt!80988 (tuple2!2763 lt!80998 (zeroValue!2906 newMap!16)))) lt!81003))))

(assert (=> b!154413 (isDefined!136 (getValueByKey!184 (toList!896 (+!189 lt!80988 (tuple2!2763 lt!80998 (zeroValue!2906 newMap!16)))) lt!81003))))

(declare-fun b!154414 () Bool)

(declare-fun Unit!4913 () Unit!4904)

(assert (=> b!154414 (= e!100885 Unit!4913)))

(declare-fun b!154415 () Bool)

(assert (=> b!154415 (= e!100886 (isDefined!136 (getValueByKey!184 (toList!896 (+!189 lt!80988 (tuple2!2763 lt!80998 (zeroValue!2906 newMap!16)))) lt!81003)))))

(assert (= (and d!50757 c!29573) b!154413))

(assert (= (and d!50757 (not c!29573)) b!154414))

(assert (= (and d!50757 (not res!72918)) b!154415))

(declare-fun m!188453 () Bool)

(assert (=> d!50757 m!188453))

(declare-fun m!188455 () Bool)

(assert (=> b!154413 m!188455))

(declare-fun m!188457 () Bool)

(assert (=> b!154413 m!188457))

(assert (=> b!154413 m!188457))

(declare-fun m!188459 () Bool)

(assert (=> b!154413 m!188459))

(assert (=> b!154415 m!188457))

(assert (=> b!154415 m!188457))

(assert (=> b!154415 m!188459))

(assert (=> b!154245 d!50757))

(declare-fun d!50759 () Bool)

(assert (=> d!50759 (= (apply!128 (+!189 lt!80995 (tuple2!2763 lt!80982 (minValue!2906 newMap!16))) lt!80990) (apply!128 lt!80995 lt!80990))))

(declare-fun lt!81136 () Unit!4904)

(assert (=> d!50759 (= lt!81136 (choose!924 lt!80995 lt!80982 (minValue!2906 newMap!16) lt!80990))))

(declare-fun e!100887 () Bool)

(assert (=> d!50759 e!100887))

(declare-fun res!72919 () Bool)

(assert (=> d!50759 (=> (not res!72919) (not e!100887))))

(assert (=> d!50759 (= res!72919 (contains!947 lt!80995 lt!80990))))

(assert (=> d!50759 (= (addApplyDifferent!104 lt!80995 lt!80982 (minValue!2906 newMap!16) lt!80990) lt!81136)))

(declare-fun b!154416 () Bool)

(assert (=> b!154416 (= e!100887 (not (= lt!80990 lt!80982)))))

(assert (= (and d!50759 res!72919) b!154416))

(assert (=> d!50759 m!188123))

(assert (=> d!50759 m!188125))

(declare-fun m!188461 () Bool)

(assert (=> d!50759 m!188461))

(assert (=> d!50759 m!188149))

(assert (=> d!50759 m!188123))

(declare-fun m!188463 () Bool)

(assert (=> d!50759 m!188463))

(assert (=> b!154245 d!50759))

(declare-fun d!50761 () Bool)

(declare-fun e!100888 () Bool)

(assert (=> d!50761 e!100888))

(declare-fun res!72921 () Bool)

(assert (=> d!50761 (=> (not res!72921) (not e!100888))))

(declare-fun lt!81137 () ListLongMap!1761)

(assert (=> d!50761 (= res!72921 (contains!947 lt!81137 (_1!1392 (tuple2!2763 lt!80993 (zeroValue!2906 newMap!16)))))))

(declare-fun lt!81138 () List!1789)

(assert (=> d!50761 (= lt!81137 (ListLongMap!1762 lt!81138))))

(declare-fun lt!81140 () Unit!4904)

(declare-fun lt!81139 () Unit!4904)

(assert (=> d!50761 (= lt!81140 lt!81139)))

(assert (=> d!50761 (= (getValueByKey!184 lt!81138 (_1!1392 (tuple2!2763 lt!80993 (zeroValue!2906 newMap!16)))) (Some!189 (_2!1392 (tuple2!2763 lt!80993 (zeroValue!2906 newMap!16)))))))

(assert (=> d!50761 (= lt!81139 (lemmaContainsTupThenGetReturnValue!97 lt!81138 (_1!1392 (tuple2!2763 lt!80993 (zeroValue!2906 newMap!16))) (_2!1392 (tuple2!2763 lt!80993 (zeroValue!2906 newMap!16)))))))

(assert (=> d!50761 (= lt!81138 (insertStrictlySorted!100 (toList!896 lt!80983) (_1!1392 (tuple2!2763 lt!80993 (zeroValue!2906 newMap!16))) (_2!1392 (tuple2!2763 lt!80993 (zeroValue!2906 newMap!16)))))))

(assert (=> d!50761 (= (+!189 lt!80983 (tuple2!2763 lt!80993 (zeroValue!2906 newMap!16))) lt!81137)))

(declare-fun b!154417 () Bool)

(declare-fun res!72920 () Bool)

(assert (=> b!154417 (=> (not res!72920) (not e!100888))))

(assert (=> b!154417 (= res!72920 (= (getValueByKey!184 (toList!896 lt!81137) (_1!1392 (tuple2!2763 lt!80993 (zeroValue!2906 newMap!16)))) (Some!189 (_2!1392 (tuple2!2763 lt!80993 (zeroValue!2906 newMap!16))))))))

(declare-fun b!154418 () Bool)

(assert (=> b!154418 (= e!100888 (contains!948 (toList!896 lt!81137) (tuple2!2763 lt!80993 (zeroValue!2906 newMap!16))))))

(assert (= (and d!50761 res!72921) b!154417))

(assert (= (and b!154417 res!72920) b!154418))

(declare-fun m!188465 () Bool)

(assert (=> d!50761 m!188465))

(declare-fun m!188467 () Bool)

(assert (=> d!50761 m!188467))

(declare-fun m!188469 () Bool)

(assert (=> d!50761 m!188469))

(declare-fun m!188471 () Bool)

(assert (=> d!50761 m!188471))

(declare-fun m!188473 () Bool)

(assert (=> b!154417 m!188473))

(declare-fun m!188475 () Bool)

(assert (=> b!154418 m!188475))

(assert (=> b!154245 d!50761))

(declare-fun d!50763 () Bool)

(declare-fun e!100889 () Bool)

(assert (=> d!50763 e!100889))

(declare-fun res!72923 () Bool)

(assert (=> d!50763 (=> (not res!72923) (not e!100889))))

(declare-fun lt!81141 () ListLongMap!1761)

(assert (=> d!50763 (= res!72923 (contains!947 lt!81141 (_1!1392 (tuple2!2763 lt!80982 (minValue!2906 newMap!16)))))))

(declare-fun lt!81142 () List!1789)

(assert (=> d!50763 (= lt!81141 (ListLongMap!1762 lt!81142))))

(declare-fun lt!81144 () Unit!4904)

(declare-fun lt!81143 () Unit!4904)

(assert (=> d!50763 (= lt!81144 lt!81143)))

(assert (=> d!50763 (= (getValueByKey!184 lt!81142 (_1!1392 (tuple2!2763 lt!80982 (minValue!2906 newMap!16)))) (Some!189 (_2!1392 (tuple2!2763 lt!80982 (minValue!2906 newMap!16)))))))

(assert (=> d!50763 (= lt!81143 (lemmaContainsTupThenGetReturnValue!97 lt!81142 (_1!1392 (tuple2!2763 lt!80982 (minValue!2906 newMap!16))) (_2!1392 (tuple2!2763 lt!80982 (minValue!2906 newMap!16)))))))

(assert (=> d!50763 (= lt!81142 (insertStrictlySorted!100 (toList!896 lt!80995) (_1!1392 (tuple2!2763 lt!80982 (minValue!2906 newMap!16))) (_2!1392 (tuple2!2763 lt!80982 (minValue!2906 newMap!16)))))))

(assert (=> d!50763 (= (+!189 lt!80995 (tuple2!2763 lt!80982 (minValue!2906 newMap!16))) lt!81141)))

(declare-fun b!154419 () Bool)

(declare-fun res!72922 () Bool)

(assert (=> b!154419 (=> (not res!72922) (not e!100889))))

(assert (=> b!154419 (= res!72922 (= (getValueByKey!184 (toList!896 lt!81141) (_1!1392 (tuple2!2763 lt!80982 (minValue!2906 newMap!16)))) (Some!189 (_2!1392 (tuple2!2763 lt!80982 (minValue!2906 newMap!16))))))))

(declare-fun b!154420 () Bool)

(assert (=> b!154420 (= e!100889 (contains!948 (toList!896 lt!81141) (tuple2!2763 lt!80982 (minValue!2906 newMap!16))))))

(assert (= (and d!50763 res!72923) b!154419))

(assert (= (and b!154419 res!72922) b!154420))

(declare-fun m!188477 () Bool)

(assert (=> d!50763 m!188477))

(declare-fun m!188479 () Bool)

(assert (=> d!50763 m!188479))

(declare-fun m!188481 () Bool)

(assert (=> d!50763 m!188481))

(declare-fun m!188483 () Bool)

(assert (=> d!50763 m!188483))

(declare-fun m!188485 () Bool)

(assert (=> b!154419 m!188485))

(declare-fun m!188487 () Bool)

(assert (=> b!154420 m!188487))

(assert (=> b!154245 d!50763))

(declare-fun d!50765 () Bool)

(assert (=> d!50765 (= (apply!128 (+!189 lt!81000 (tuple2!2763 lt!80991 (minValue!2906 newMap!16))) lt!80987) (apply!128 lt!81000 lt!80987))))

(declare-fun lt!81145 () Unit!4904)

(assert (=> d!50765 (= lt!81145 (choose!924 lt!81000 lt!80991 (minValue!2906 newMap!16) lt!80987))))

(declare-fun e!100890 () Bool)

(assert (=> d!50765 e!100890))

(declare-fun res!72924 () Bool)

(assert (=> d!50765 (=> (not res!72924) (not e!100890))))

(assert (=> d!50765 (= res!72924 (contains!947 lt!81000 lt!80987))))

(assert (=> d!50765 (= (addApplyDifferent!104 lt!81000 lt!80991 (minValue!2906 newMap!16) lt!80987) lt!81145)))

(declare-fun b!154421 () Bool)

(assert (=> b!154421 (= e!100890 (not (= lt!80987 lt!80991)))))

(assert (= (and d!50765 res!72924) b!154421))

(assert (=> d!50765 m!188141))

(assert (=> d!50765 m!188145))

(declare-fun m!188489 () Bool)

(assert (=> d!50765 m!188489))

(assert (=> d!50765 m!188139))

(assert (=> d!50765 m!188141))

(declare-fun m!188491 () Bool)

(assert (=> d!50765 m!188491))

(assert (=> b!154245 d!50765))

(declare-fun d!50767 () Bool)

(assert (=> d!50767 (= (apply!128 lt!80983 lt!80997) (get!1615 (getValueByKey!184 (toList!896 lt!80983) lt!80997)))))

(declare-fun bs!6551 () Bool)

(assert (= bs!6551 d!50767))

(declare-fun m!188493 () Bool)

(assert (=> bs!6551 m!188493))

(assert (=> bs!6551 m!188493))

(declare-fun m!188495 () Bool)

(assert (=> bs!6551 m!188495))

(assert (=> b!154245 d!50767))

(declare-fun d!50769 () Bool)

(assert (=> d!50769 (contains!947 (+!189 lt!80988 (tuple2!2763 lt!80998 (zeroValue!2906 newMap!16))) lt!81003)))

(declare-fun lt!81146 () Unit!4904)

(assert (=> d!50769 (= lt!81146 (choose!925 lt!80988 lt!80998 (zeroValue!2906 newMap!16) lt!81003))))

(assert (=> d!50769 (contains!947 lt!80988 lt!81003)))

(assert (=> d!50769 (= (addStillContains!104 lt!80988 lt!80998 (zeroValue!2906 newMap!16) lt!81003) lt!81146)))

(declare-fun bs!6552 () Bool)

(assert (= bs!6552 d!50769))

(assert (=> bs!6552 m!188135))

(assert (=> bs!6552 m!188135))

(assert (=> bs!6552 m!188137))

(declare-fun m!188497 () Bool)

(assert (=> bs!6552 m!188497))

(declare-fun m!188499 () Bool)

(assert (=> bs!6552 m!188499))

(assert (=> b!154245 d!50769))

(declare-fun b!154422 () Bool)

(declare-fun e!100893 () Bool)

(declare-fun e!100897 () Bool)

(assert (=> b!154422 (= e!100893 e!100897)))

(declare-fun c!29577 () Bool)

(declare-fun e!100896 () Bool)

(assert (=> b!154422 (= c!29577 e!100896)))

(declare-fun res!72927 () Bool)

(assert (=> b!154422 (=> (not res!72927) (not e!100896))))

(assert (=> b!154422 (= res!72927 (bvslt #b00000000000000000000000000000000 (size!2679 (_keys!4836 newMap!16))))))

(declare-fun b!154423 () Bool)

(declare-fun e!100892 () ListLongMap!1761)

(assert (=> b!154423 (= e!100892 (ListLongMap!1762 Nil!1786))))

(declare-fun b!154424 () Bool)

(declare-fun e!100895 () Bool)

(declare-fun lt!81149 () ListLongMap!1761)

(assert (=> b!154424 (= e!100895 (isEmpty!436 lt!81149))))

(declare-fun b!154425 () Bool)

(assert (=> b!154425 (= e!100897 e!100895)))

(declare-fun c!29575 () Bool)

(assert (=> b!154425 (= c!29575 (bvslt #b00000000000000000000000000000000 (size!2679 (_keys!4836 newMap!16))))))

(declare-fun b!154426 () Bool)

(declare-fun lt!81151 () Unit!4904)

(declare-fun lt!81147 () Unit!4904)

(assert (=> b!154426 (= lt!81151 lt!81147)))

(declare-fun lt!81148 () (_ BitVec 64))

(declare-fun lt!81153 () V!3681)

(declare-fun lt!81150 () ListLongMap!1761)

(declare-fun lt!81152 () (_ BitVec 64))

(assert (=> b!154426 (not (contains!947 (+!189 lt!81150 (tuple2!2763 lt!81152 lt!81153)) lt!81148))))

(assert (=> b!154426 (= lt!81147 (addStillNotContains!72 lt!81150 lt!81152 lt!81153 lt!81148))))

(assert (=> b!154426 (= lt!81148 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!154426 (= lt!81153 (get!1614 (select (arr!2403 (_values!3046 newMap!16)) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3063 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!154426 (= lt!81152 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun call!17171 () ListLongMap!1761)

(assert (=> b!154426 (= lt!81150 call!17171)))

(declare-fun e!100891 () ListLongMap!1761)

(assert (=> b!154426 (= e!100891 (+!189 call!17171 (tuple2!2763 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000) (get!1614 (select (arr!2403 (_values!3046 newMap!16)) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3063 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!154427 () Bool)

(assert (=> b!154427 (= e!100892 e!100891)))

(declare-fun c!29576 () Bool)

(assert (=> b!154427 (= c!29576 (validKeyInArray!0 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154428 () Bool)

(assert (=> b!154428 (= e!100895 (= lt!81149 (getCurrentListMapNoExtraKeys!159 (_keys!4836 newMap!16) (_values!3046 newMap!16) (mask!7467 newMap!16) (extraKeys!2804 newMap!16) (zeroValue!2906 newMap!16) (minValue!2906 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3063 newMap!16))))))

(declare-fun bm!17168 () Bool)

(assert (=> bm!17168 (= call!17171 (getCurrentListMapNoExtraKeys!159 (_keys!4836 newMap!16) (_values!3046 newMap!16) (mask!7467 newMap!16) (extraKeys!2804 newMap!16) (zeroValue!2906 newMap!16) (minValue!2906 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3063 newMap!16)))))

(declare-fun b!154429 () Bool)

(assert (=> b!154429 (= e!100891 call!17171)))

(declare-fun d!50771 () Bool)

(assert (=> d!50771 e!100893))

(declare-fun res!72928 () Bool)

(assert (=> d!50771 (=> (not res!72928) (not e!100893))))

(assert (=> d!50771 (= res!72928 (not (contains!947 lt!81149 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50771 (= lt!81149 e!100892)))

(declare-fun c!29574 () Bool)

(assert (=> d!50771 (= c!29574 (bvsge #b00000000000000000000000000000000 (size!2679 (_keys!4836 newMap!16))))))

(assert (=> d!50771 (validMask!0 (mask!7467 newMap!16))))

(assert (=> d!50771 (= (getCurrentListMapNoExtraKeys!159 (_keys!4836 newMap!16) (_values!3046 newMap!16) (mask!7467 newMap!16) (extraKeys!2804 newMap!16) (zeroValue!2906 newMap!16) (minValue!2906 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3063 newMap!16)) lt!81149)))

(declare-fun b!154430 () Bool)

(assert (=> b!154430 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2679 (_keys!4836 newMap!16))))))

(assert (=> b!154430 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2680 (_values!3046 newMap!16))))))

(declare-fun e!100894 () Bool)

(assert (=> b!154430 (= e!100894 (= (apply!128 lt!81149 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)) (get!1614 (select (arr!2403 (_values!3046 newMap!16)) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3063 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!154431 () Bool)

(assert (=> b!154431 (= e!100896 (validKeyInArray!0 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!154431 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!154432 () Bool)

(assert (=> b!154432 (= e!100897 e!100894)))

(assert (=> b!154432 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2679 (_keys!4836 newMap!16))))))

(declare-fun res!72926 () Bool)

(assert (=> b!154432 (= res!72926 (contains!947 lt!81149 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!154432 (=> (not res!72926) (not e!100894))))

(declare-fun b!154433 () Bool)

(declare-fun res!72925 () Bool)

(assert (=> b!154433 (=> (not res!72925) (not e!100893))))

(assert (=> b!154433 (= res!72925 (not (contains!947 lt!81149 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50771 c!29574) b!154423))

(assert (= (and d!50771 (not c!29574)) b!154427))

(assert (= (and b!154427 c!29576) b!154426))

(assert (= (and b!154427 (not c!29576)) b!154429))

(assert (= (or b!154426 b!154429) bm!17168))

(assert (= (and d!50771 res!72928) b!154433))

(assert (= (and b!154433 res!72925) b!154422))

(assert (= (and b!154422 res!72927) b!154431))

(assert (= (and b!154422 c!29577) b!154432))

(assert (= (and b!154422 (not c!29577)) b!154425))

(assert (= (and b!154432 res!72926) b!154430))

(assert (= (and b!154425 c!29575) b!154428))

(assert (= (and b!154425 (not c!29575)) b!154424))

(declare-fun b_lambda!6885 () Bool)

(assert (=> (not b_lambda!6885) (not b!154426)))

(assert (=> b!154426 t!6582))

(declare-fun b_and!9633 () Bool)

(assert (= b_and!9629 (and (=> t!6582 result!4489) b_and!9633)))

(assert (=> b!154426 t!6584))

(declare-fun b_and!9635 () Bool)

(assert (= b_and!9631 (and (=> t!6584 result!4491) b_and!9635)))

(declare-fun b_lambda!6887 () Bool)

(assert (=> (not b_lambda!6887) (not b!154430)))

(assert (=> b!154430 t!6582))

(declare-fun b_and!9637 () Bool)

(assert (= b_and!9633 (and (=> t!6582 result!4489) b_and!9637)))

(assert (=> b!154430 t!6584))

(declare-fun b_and!9639 () Bool)

(assert (= b_and!9635 (and (=> t!6584 result!4491) b_and!9639)))

(declare-fun m!188501 () Bool)

(assert (=> b!154433 m!188501))

(assert (=> b!154431 m!188091))

(assert (=> b!154431 m!188091))

(assert (=> b!154431 m!188093))

(declare-fun m!188503 () Bool)

(assert (=> b!154424 m!188503))

(assert (=> b!154426 m!188091))

(assert (=> b!154426 m!188107))

(declare-fun m!188505 () Bool)

(assert (=> b!154426 m!188505))

(assert (=> b!154426 m!188103))

(declare-fun m!188507 () Bool)

(assert (=> b!154426 m!188507))

(declare-fun m!188509 () Bool)

(assert (=> b!154426 m!188509))

(assert (=> b!154426 m!188103))

(assert (=> b!154426 m!188107))

(assert (=> b!154426 m!188109))

(assert (=> b!154426 m!188505))

(declare-fun m!188511 () Bool)

(assert (=> b!154426 m!188511))

(assert (=> b!154427 m!188091))

(assert (=> b!154427 m!188091))

(assert (=> b!154427 m!188093))

(declare-fun m!188513 () Bool)

(assert (=> bm!17168 m!188513))

(assert (=> b!154428 m!188513))

(assert (=> b!154432 m!188091))

(assert (=> b!154432 m!188091))

(declare-fun m!188515 () Bool)

(assert (=> b!154432 m!188515))

(declare-fun m!188517 () Bool)

(assert (=> d!50771 m!188517))

(assert (=> d!50771 m!188113))

(assert (=> b!154430 m!188091))

(assert (=> b!154430 m!188091))

(declare-fun m!188519 () Bool)

(assert (=> b!154430 m!188519))

(assert (=> b!154430 m!188103))

(assert (=> b!154430 m!188107))

(assert (=> b!154430 m!188109))

(assert (=> b!154430 m!188107))

(assert (=> b!154430 m!188103))

(assert (=> b!154245 d!50771))

(declare-fun b!154434 () Bool)

(declare-fun e!100900 () Bool)

(declare-fun e!100904 () Bool)

(assert (=> b!154434 (= e!100900 e!100904)))

(declare-fun c!29581 () Bool)

(declare-fun e!100903 () Bool)

(assert (=> b!154434 (= c!29581 e!100903)))

(declare-fun res!72931 () Bool)

(assert (=> b!154434 (=> (not res!72931) (not e!100903))))

(assert (=> b!154434 (= res!72931 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun b!154435 () Bool)

(declare-fun e!100899 () ListLongMap!1761)

(assert (=> b!154435 (= e!100899 (ListLongMap!1762 Nil!1786))))

(declare-fun b!154436 () Bool)

(declare-fun e!100902 () Bool)

(declare-fun lt!81156 () ListLongMap!1761)

(assert (=> b!154436 (= e!100902 (isEmpty!436 lt!81156))))

(declare-fun b!154437 () Bool)

(assert (=> b!154437 (= e!100904 e!100902)))

(declare-fun c!29579 () Bool)

(assert (=> b!154437 (= c!29579 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun b!154438 () Bool)

(declare-fun lt!81158 () Unit!4904)

(declare-fun lt!81154 () Unit!4904)

(assert (=> b!154438 (= lt!81158 lt!81154)))

(declare-fun lt!81159 () (_ BitVec 64))

(declare-fun lt!81155 () (_ BitVec 64))

(declare-fun lt!81157 () ListLongMap!1761)

(declare-fun lt!81160 () V!3681)

(assert (=> b!154438 (not (contains!947 (+!189 lt!81157 (tuple2!2763 lt!81159 lt!81160)) lt!81155))))

(assert (=> b!154438 (= lt!81154 (addStillNotContains!72 lt!81157 lt!81159 lt!81160 lt!81155))))

(assert (=> b!154438 (= lt!81155 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!154438 (= lt!81160 (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!154438 (= lt!81159 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(declare-fun call!17172 () ListLongMap!1761)

(assert (=> b!154438 (= lt!81157 call!17172)))

(declare-fun e!100898 () ListLongMap!1761)

(assert (=> b!154438 (= e!100898 (+!189 call!17172 (tuple2!2763 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!154439 () Bool)

(assert (=> b!154439 (= e!100899 e!100898)))

(declare-fun c!29580 () Bool)

(assert (=> b!154439 (= c!29580 (validKeyInArray!0 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!154440 () Bool)

(assert (=> b!154440 (= e!100902 (= lt!81156 (getCurrentListMapNoExtraKeys!159 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun bm!17169 () Bool)

(assert (=> bm!17169 (= call!17172 (getCurrentListMapNoExtraKeys!159 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun b!154441 () Bool)

(assert (=> b!154441 (= e!100898 call!17172)))

(declare-fun d!50773 () Bool)

(assert (=> d!50773 e!100900))

(declare-fun res!72932 () Bool)

(assert (=> d!50773 (=> (not res!72932) (not e!100900))))

(assert (=> d!50773 (= res!72932 (not (contains!947 lt!81156 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50773 (= lt!81156 e!100899)))

(declare-fun c!29578 () Bool)

(assert (=> d!50773 (= c!29578 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(assert (=> d!50773 (validMask!0 (mask!7467 (v!3418 (underlying!525 thiss!992))))))

(assert (=> d!50773 (= (getCurrentListMapNoExtraKeys!159 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))) lt!81156)))

(declare-fun b!154442 () Bool)

(assert (=> b!154442 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(assert (=> b!154442 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2680 (_values!3046 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun e!100901 () Bool)

(assert (=> b!154442 (= e!100901 (= (apply!128 lt!81156 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!154443 () Bool)

(assert (=> b!154443 (= e!100903 (validKeyInArray!0 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!154443 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!154444 () Bool)

(assert (=> b!154444 (= e!100904 e!100901)))

(assert (=> b!154444 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun res!72930 () Bool)

(assert (=> b!154444 (= res!72930 (contains!947 lt!81156 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!154444 (=> (not res!72930) (not e!100901))))

(declare-fun b!154445 () Bool)

(declare-fun res!72929 () Bool)

(assert (=> b!154445 (=> (not res!72929) (not e!100900))))

(assert (=> b!154445 (= res!72929 (not (contains!947 lt!81156 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50773 c!29578) b!154435))

(assert (= (and d!50773 (not c!29578)) b!154439))

(assert (= (and b!154439 c!29580) b!154438))

(assert (= (and b!154439 (not c!29580)) b!154441))

(assert (= (or b!154438 b!154441) bm!17169))

(assert (= (and d!50773 res!72932) b!154445))

(assert (= (and b!154445 res!72929) b!154434))

(assert (= (and b!154434 res!72931) b!154443))

(assert (= (and b!154434 c!29581) b!154444))

(assert (= (and b!154434 (not c!29581)) b!154437))

(assert (= (and b!154444 res!72930) b!154442))

(assert (= (and b!154437 c!29579) b!154440))

(assert (= (and b!154437 (not c!29579)) b!154436))

(declare-fun b_lambda!6889 () Bool)

(assert (=> (not b_lambda!6889) (not b!154438)))

(assert (=> b!154438 t!6577))

(declare-fun b_and!9641 () Bool)

(assert (= b_and!9637 (and (=> t!6577 result!4481) b_and!9641)))

(assert (=> b!154438 t!6579))

(declare-fun b_and!9643 () Bool)

(assert (= b_and!9639 (and (=> t!6579 result!4485) b_and!9643)))

(declare-fun b_lambda!6891 () Bool)

(assert (=> (not b_lambda!6891) (not b!154442)))

(assert (=> b!154442 t!6577))

(declare-fun b_and!9645 () Bool)

(assert (= b_and!9641 (and (=> t!6577 result!4481) b_and!9645)))

(assert (=> b!154442 t!6579))

(declare-fun b_and!9647 () Bool)

(assert (= b_and!9643 (and (=> t!6579 result!4485) b_and!9647)))

(declare-fun m!188521 () Bool)

(assert (=> b!154445 m!188521))

(declare-fun m!188523 () Bool)

(assert (=> b!154443 m!188523))

(assert (=> b!154443 m!188523))

(declare-fun m!188525 () Bool)

(assert (=> b!154443 m!188525))

(declare-fun m!188527 () Bool)

(assert (=> b!154436 m!188527))

(assert (=> b!154438 m!188523))

(assert (=> b!154438 m!188037))

(declare-fun m!188529 () Bool)

(assert (=> b!154438 m!188529))

(declare-fun m!188531 () Bool)

(assert (=> b!154438 m!188531))

(declare-fun m!188533 () Bool)

(assert (=> b!154438 m!188533))

(declare-fun m!188535 () Bool)

(assert (=> b!154438 m!188535))

(assert (=> b!154438 m!188531))

(assert (=> b!154438 m!188037))

(declare-fun m!188537 () Bool)

(assert (=> b!154438 m!188537))

(assert (=> b!154438 m!188529))

(declare-fun m!188539 () Bool)

(assert (=> b!154438 m!188539))

(assert (=> b!154439 m!188523))

(assert (=> b!154439 m!188523))

(assert (=> b!154439 m!188525))

(declare-fun m!188541 () Bool)

(assert (=> bm!17169 m!188541))

(assert (=> b!154440 m!188541))

(assert (=> b!154444 m!188523))

(assert (=> b!154444 m!188523))

(declare-fun m!188543 () Bool)

(assert (=> b!154444 m!188543))

(declare-fun m!188545 () Bool)

(assert (=> d!50773 m!188545))

(assert (=> d!50773 m!188043))

(assert (=> b!154442 m!188523))

(assert (=> b!154442 m!188523))

(declare-fun m!188547 () Bool)

(assert (=> b!154442 m!188547))

(assert (=> b!154442 m!188531))

(assert (=> b!154442 m!188037))

(assert (=> b!154442 m!188537))

(assert (=> b!154442 m!188037))

(assert (=> b!154442 m!188531))

(assert (=> b!154333 d!50773))

(assert (=> b!154231 d!50739))

(declare-fun d!50775 () Bool)

(assert (=> d!50775 (= (get!1615 (getValueByKey!184 (toList!896 lt!80978) lt!80965)) (v!3423 (getValueByKey!184 (toList!896 lt!80978) lt!80965)))))

(assert (=> d!50713 d!50775))

(declare-fun b!154454 () Bool)

(declare-fun e!100909 () Option!190)

(assert (=> b!154454 (= e!100909 (Some!189 (_2!1392 (h!2394 (toList!896 lt!80978)))))))

(declare-fun d!50777 () Bool)

(declare-fun c!29586 () Bool)

(assert (=> d!50777 (= c!29586 (and ((_ is Cons!1785) (toList!896 lt!80978)) (= (_1!1392 (h!2394 (toList!896 lt!80978))) lt!80965)))))

(assert (=> d!50777 (= (getValueByKey!184 (toList!896 lt!80978) lt!80965) e!100909)))

(declare-fun b!154456 () Bool)

(declare-fun e!100910 () Option!190)

(assert (=> b!154456 (= e!100910 (getValueByKey!184 (t!6575 (toList!896 lt!80978)) lt!80965))))

(declare-fun b!154455 () Bool)

(assert (=> b!154455 (= e!100909 e!100910)))

(declare-fun c!29587 () Bool)

(assert (=> b!154455 (= c!29587 (and ((_ is Cons!1785) (toList!896 lt!80978)) (not (= (_1!1392 (h!2394 (toList!896 lt!80978))) lt!80965))))))

(declare-fun b!154457 () Bool)

(assert (=> b!154457 (= e!100910 None!188)))

(assert (= (and d!50777 c!29586) b!154454))

(assert (= (and d!50777 (not c!29586)) b!154455))

(assert (= (and b!154455 c!29587) b!154456))

(assert (= (and b!154455 (not c!29587)) b!154457))

(declare-fun m!188549 () Bool)

(assert (=> b!154456 m!188549))

(assert (=> d!50713 d!50777))

(assert (=> b!154387 d!50739))

(declare-fun d!50779 () Bool)

(assert (=> d!50779 (= (get!1615 (getValueByKey!184 (toList!896 lt!80961) lt!80975)) (v!3423 (getValueByKey!184 (toList!896 lt!80961) lt!80975)))))

(assert (=> d!50703 d!50779))

(declare-fun b!154458 () Bool)

(declare-fun e!100911 () Option!190)

(assert (=> b!154458 (= e!100911 (Some!189 (_2!1392 (h!2394 (toList!896 lt!80961)))))))

(declare-fun d!50781 () Bool)

(declare-fun c!29588 () Bool)

(assert (=> d!50781 (= c!29588 (and ((_ is Cons!1785) (toList!896 lt!80961)) (= (_1!1392 (h!2394 (toList!896 lt!80961))) lt!80975)))))

(assert (=> d!50781 (= (getValueByKey!184 (toList!896 lt!80961) lt!80975) e!100911)))

(declare-fun b!154460 () Bool)

(declare-fun e!100912 () Option!190)

(assert (=> b!154460 (= e!100912 (getValueByKey!184 (t!6575 (toList!896 lt!80961)) lt!80975))))

(declare-fun b!154459 () Bool)

(assert (=> b!154459 (= e!100911 e!100912)))

(declare-fun c!29589 () Bool)

(assert (=> b!154459 (= c!29589 (and ((_ is Cons!1785) (toList!896 lt!80961)) (not (= (_1!1392 (h!2394 (toList!896 lt!80961))) lt!80975))))))

(declare-fun b!154461 () Bool)

(assert (=> b!154461 (= e!100912 None!188)))

(assert (= (and d!50781 c!29588) b!154458))

(assert (= (and d!50781 (not c!29588)) b!154459))

(assert (= (and b!154459 c!29589) b!154460))

(assert (= (and b!154459 (not c!29589)) b!154461))

(declare-fun m!188551 () Bool)

(assert (=> b!154460 m!188551))

(assert (=> d!50703 d!50781))

(declare-fun d!50783 () Bool)

(assert (=> d!50783 (= (apply!128 lt!81006 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1615 (getValueByKey!184 (toList!896 lt!81006) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6553 () Bool)

(assert (= bs!6553 d!50783))

(declare-fun m!188553 () Bool)

(assert (=> bs!6553 m!188553))

(assert (=> bs!6553 m!188553))

(declare-fun m!188555 () Bool)

(assert (=> bs!6553 m!188555))

(assert (=> b!154254 d!50783))

(declare-fun d!50785 () Bool)

(assert (=> d!50785 (isDefined!136 (getValueByKey!184 (toList!896 lt!80962) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!81163 () Unit!4904)

(declare-fun choose!926 (List!1789 (_ BitVec 64)) Unit!4904)

(assert (=> d!50785 (= lt!81163 (choose!926 (toList!896 lt!80962) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!100915 () Bool)

(assert (=> d!50785 e!100915))

(declare-fun res!72935 () Bool)

(assert (=> d!50785 (=> (not res!72935) (not e!100915))))

(declare-fun isStrictlySorted!317 (List!1789) Bool)

(assert (=> d!50785 (= res!72935 (isStrictlySorted!317 (toList!896 lt!80962)))))

(assert (=> d!50785 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!80962) #b1000000000000000000000000000000000000000000000000000000000000000) lt!81163)))

(declare-fun b!154464 () Bool)

(assert (=> b!154464 (= e!100915 (containsKey!187 (toList!896 lt!80962) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!50785 res!72935) b!154464))

(assert (=> d!50785 m!188221))

(assert (=> d!50785 m!188221))

(assert (=> d!50785 m!188223))

(declare-fun m!188557 () Bool)

(assert (=> d!50785 m!188557))

(declare-fun m!188559 () Bool)

(assert (=> d!50785 m!188559))

(assert (=> b!154464 m!188217))

(assert (=> b!154288 d!50785))

(declare-fun d!50787 () Bool)

(declare-fun isEmpty!437 (Option!190) Bool)

(assert (=> d!50787 (= (isDefined!136 (getValueByKey!184 (toList!896 lt!80962) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!437 (getValueByKey!184 (toList!896 lt!80962) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!6554 () Bool)

(assert (= bs!6554 d!50787))

(assert (=> bs!6554 m!188221))

(declare-fun m!188561 () Bool)

(assert (=> bs!6554 m!188561))

(assert (=> b!154288 d!50787))

(declare-fun b!154465 () Bool)

(declare-fun e!100916 () Option!190)

(assert (=> b!154465 (= e!100916 (Some!189 (_2!1392 (h!2394 (toList!896 lt!80962)))))))

(declare-fun d!50789 () Bool)

(declare-fun c!29590 () Bool)

(assert (=> d!50789 (= c!29590 (and ((_ is Cons!1785) (toList!896 lt!80962)) (= (_1!1392 (h!2394 (toList!896 lt!80962))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50789 (= (getValueByKey!184 (toList!896 lt!80962) #b1000000000000000000000000000000000000000000000000000000000000000) e!100916)))

(declare-fun b!154467 () Bool)

(declare-fun e!100917 () Option!190)

(assert (=> b!154467 (= e!100917 (getValueByKey!184 (t!6575 (toList!896 lt!80962)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154466 () Bool)

(assert (=> b!154466 (= e!100916 e!100917)))

(declare-fun c!29591 () Bool)

(assert (=> b!154466 (= c!29591 (and ((_ is Cons!1785) (toList!896 lt!80962)) (not (= (_1!1392 (h!2394 (toList!896 lt!80962))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!154468 () Bool)

(assert (=> b!154468 (= e!100917 None!188)))

(assert (= (and d!50789 c!29590) b!154465))

(assert (= (and d!50789 (not c!29590)) b!154466))

(assert (= (and b!154466 c!29591) b!154467))

(assert (= (and b!154466 (not c!29591)) b!154468))

(declare-fun m!188563 () Bool)

(assert (=> b!154467 m!188563))

(assert (=> b!154288 d!50789))

(declare-fun d!50791 () Bool)

(declare-fun e!100919 () Bool)

(assert (=> d!50791 e!100919))

(declare-fun res!72936 () Bool)

(assert (=> d!50791 (=> res!72936 e!100919)))

(declare-fun lt!81164 () Bool)

(assert (=> d!50791 (= res!72936 (not lt!81164))))

(declare-fun lt!81167 () Bool)

(assert (=> d!50791 (= lt!81164 lt!81167)))

(declare-fun lt!81165 () Unit!4904)

(declare-fun e!100918 () Unit!4904)

(assert (=> d!50791 (= lt!81165 e!100918)))

(declare-fun c!29592 () Bool)

(assert (=> d!50791 (= c!29592 lt!81167)))

(assert (=> d!50791 (= lt!81167 (containsKey!187 (toList!896 lt!81061) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50791 (= (contains!947 lt!81061 #b0000000000000000000000000000000000000000000000000000000000000000) lt!81164)))

(declare-fun b!154469 () Bool)

(declare-fun lt!81166 () Unit!4904)

(assert (=> b!154469 (= e!100918 lt!81166)))

(assert (=> b!154469 (= lt!81166 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!81061) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154469 (isDefined!136 (getValueByKey!184 (toList!896 lt!81061) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154470 () Bool)

(declare-fun Unit!4914 () Unit!4904)

(assert (=> b!154470 (= e!100918 Unit!4914)))

(declare-fun b!154471 () Bool)

(assert (=> b!154471 (= e!100919 (isDefined!136 (getValueByKey!184 (toList!896 lt!81061) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50791 c!29592) b!154469))

(assert (= (and d!50791 (not c!29592)) b!154470))

(assert (= (and d!50791 (not res!72936)) b!154471))

(declare-fun m!188565 () Bool)

(assert (=> d!50791 m!188565))

(declare-fun m!188567 () Bool)

(assert (=> b!154469 m!188567))

(declare-fun m!188569 () Bool)

(assert (=> b!154469 m!188569))

(assert (=> b!154469 m!188569))

(declare-fun m!188571 () Bool)

(assert (=> b!154469 m!188571))

(assert (=> b!154471 m!188569))

(assert (=> b!154471 m!188569))

(assert (=> b!154471 m!188571))

(assert (=> d!50687 d!50791))

(assert (=> d!50687 d!50689))

(declare-fun b!154472 () Bool)

(declare-fun e!100920 () Option!190)

(assert (=> b!154472 (= e!100920 (Some!189 (_2!1392 (h!2394 (toList!896 lt!81082)))))))

(declare-fun c!29593 () Bool)

(declare-fun d!50793 () Bool)

(assert (=> d!50793 (= c!29593 (and ((_ is Cons!1785) (toList!896 lt!81082)) (= (_1!1392 (h!2394 (toList!896 lt!81082))) (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!50793 (= (getValueByKey!184 (toList!896 lt!81082) (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) e!100920)))

(declare-fun b!154474 () Bool)

(declare-fun e!100921 () Option!190)

(assert (=> b!154474 (= e!100921 (getValueByKey!184 (t!6575 (toList!896 lt!81082)) (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154473 () Bool)

(assert (=> b!154473 (= e!100920 e!100921)))

(declare-fun c!29594 () Bool)

(assert (=> b!154473 (= c!29594 (and ((_ is Cons!1785) (toList!896 lt!81082)) (not (= (_1!1392 (h!2394 (toList!896 lt!81082))) (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(declare-fun b!154475 () Bool)

(assert (=> b!154475 (= e!100921 None!188)))

(assert (= (and d!50793 c!29593) b!154472))

(assert (= (and d!50793 (not c!29593)) b!154473))

(assert (= (and b!154473 c!29594) b!154474))

(assert (= (and b!154473 (not c!29594)) b!154475))

(declare-fun m!188573 () Bool)

(assert (=> b!154474 m!188573))

(assert (=> b!154348 d!50793))

(declare-fun b!154476 () Bool)

(declare-fun e!100922 () (_ BitVec 32))

(declare-fun e!100923 () (_ BitVec 32))

(assert (=> b!154476 (= e!100922 e!100923)))

(declare-fun c!29595 () Bool)

(assert (=> b!154476 (= c!29595 (validKeyInArray!0 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154477 () Bool)

(assert (=> b!154477 (= e!100922 #b00000000000000000000000000000000)))

(declare-fun b!154478 () Bool)

(declare-fun call!17173 () (_ BitVec 32))

(assert (=> b!154478 (= e!100923 (bvadd #b00000000000000000000000000000001 call!17173))))

(declare-fun d!50795 () Bool)

(declare-fun lt!81168 () (_ BitVec 32))

(assert (=> d!50795 (and (bvsge lt!81168 #b00000000000000000000000000000000) (bvsle lt!81168 (bvsub (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!50795 (= lt!81168 e!100922)))

(declare-fun c!29596 () Bool)

(assert (=> d!50795 (= c!29596 (bvsge #b00000000000000000000000000000000 (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(assert (=> d!50795 (and (bvsle #b00000000000000000000000000000000 (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(assert (=> d!50795 (= (arrayCountValidKeys!0 (_keys!4836 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000000 (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))) lt!81168)))

(declare-fun b!154479 () Bool)

(assert (=> b!154479 (= e!100923 call!17173)))

(declare-fun bm!17170 () Bool)

(assert (=> bm!17170 (= call!17173 (arrayCountValidKeys!0 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(assert (= (and d!50795 c!29596) b!154477))

(assert (= (and d!50795 (not c!29596)) b!154476))

(assert (= (and b!154476 c!29595) b!154478))

(assert (= (and b!154476 (not c!29595)) b!154479))

(assert (= (or b!154478 b!154479) bm!17170))

(assert (=> b!154476 m!188151))

(assert (=> b!154476 m!188151))

(assert (=> b!154476 m!188153))

(declare-fun m!188575 () Bool)

(assert (=> bm!17170 m!188575))

(assert (=> b!154368 d!50795))

(assert (=> d!50675 d!50689))

(declare-fun d!50797 () Bool)

(assert (=> d!50797 (= (get!1615 (getValueByKey!184 (toList!896 (+!189 lt!80961 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80975)) (v!3423 (getValueByKey!184 (toList!896 (+!189 lt!80961 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80975)))))

(assert (=> d!50723 d!50797))

(declare-fun b!154480 () Bool)

(declare-fun e!100924 () Option!190)

(assert (=> b!154480 (= e!100924 (Some!189 (_2!1392 (h!2394 (toList!896 (+!189 lt!80961 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))))

(declare-fun c!29597 () Bool)

(declare-fun d!50799 () Bool)

(assert (=> d!50799 (= c!29597 (and ((_ is Cons!1785) (toList!896 (+!189 lt!80961 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))) (= (_1!1392 (h!2394 (toList!896 (+!189 lt!80961 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))) lt!80975)))))

(assert (=> d!50799 (= (getValueByKey!184 (toList!896 (+!189 lt!80961 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80975) e!100924)))

(declare-fun b!154482 () Bool)

(declare-fun e!100925 () Option!190)

(assert (=> b!154482 (= e!100925 (getValueByKey!184 (t!6575 (toList!896 (+!189 lt!80961 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))) lt!80975))))

(declare-fun b!154481 () Bool)

(assert (=> b!154481 (= e!100924 e!100925)))

(declare-fun c!29598 () Bool)

(assert (=> b!154481 (= c!29598 (and ((_ is Cons!1785) (toList!896 (+!189 lt!80961 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))) (not (= (_1!1392 (h!2394 (toList!896 (+!189 lt!80961 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))) lt!80975))))))

(declare-fun b!154483 () Bool)

(assert (=> b!154483 (= e!100925 None!188)))

(assert (= (and d!50799 c!29597) b!154480))

(assert (= (and d!50799 (not c!29597)) b!154481))

(assert (= (and b!154481 c!29598) b!154482))

(assert (= (and b!154481 (not c!29598)) b!154483))

(declare-fun m!188577 () Bool)

(assert (=> b!154482 m!188577))

(assert (=> d!50723 d!50799))

(declare-fun d!50801 () Bool)

(assert (=> d!50801 (= (apply!128 lt!80984 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)) (get!1615 (getValueByKey!184 (toList!896 lt!80984) (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!6555 () Bool)

(assert (= bs!6555 d!50801))

(assert (=> bs!6555 m!188091))

(declare-fun m!188579 () Bool)

(assert (=> bs!6555 m!188579))

(assert (=> bs!6555 m!188579))

(declare-fun m!188581 () Bool)

(assert (=> bs!6555 m!188581))

(assert (=> b!154243 d!50801))

(declare-fun d!50803 () Bool)

(declare-fun c!29599 () Bool)

(assert (=> d!50803 (= c!29599 ((_ is ValueCellFull!1169) (select (arr!2403 (_values!3046 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!100926 () V!3681)

(assert (=> d!50803 (= (get!1614 (select (arr!2403 (_values!3046 newMap!16)) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3063 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!100926)))

(declare-fun b!154484 () Bool)

(assert (=> b!154484 (= e!100926 (get!1616 (select (arr!2403 (_values!3046 newMap!16)) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3063 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154485 () Bool)

(assert (=> b!154485 (= e!100926 (get!1617 (select (arr!2403 (_values!3046 newMap!16)) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3063 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50803 c!29599) b!154484))

(assert (= (and d!50803 (not c!29599)) b!154485))

(assert (=> b!154484 m!188103))

(assert (=> b!154484 m!188107))

(declare-fun m!188583 () Bool)

(assert (=> b!154484 m!188583))

(assert (=> b!154485 m!188103))

(assert (=> b!154485 m!188107))

(declare-fun m!188585 () Bool)

(assert (=> b!154485 m!188585))

(assert (=> b!154243 d!50803))

(declare-fun d!50805 () Bool)

(declare-fun isEmpty!438 (List!1789) Bool)

(assert (=> d!50805 (= (isEmpty!436 lt!81061) (isEmpty!438 (toList!896 lt!81061)))))

(declare-fun bs!6556 () Bool)

(assert (= bs!6556 d!50805))

(declare-fun m!188587 () Bool)

(assert (=> bs!6556 m!188587))

(assert (=> b!154329 d!50805))

(declare-fun d!50807 () Bool)

(declare-fun lt!81171 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!146 (List!1789) (InoxSet tuple2!2762))

(assert (=> d!50807 (= lt!81171 (select (content!146 (toList!896 lt!81097)) (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun e!100932 () Bool)

(assert (=> d!50807 (= lt!81171 e!100932)))

(declare-fun res!72941 () Bool)

(assert (=> d!50807 (=> (not res!72941) (not e!100932))))

(assert (=> d!50807 (= res!72941 ((_ is Cons!1785) (toList!896 lt!81097)))))

(assert (=> d!50807 (= (contains!948 (toList!896 lt!81097) (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81171)))

(declare-fun b!154490 () Bool)

(declare-fun e!100931 () Bool)

(assert (=> b!154490 (= e!100932 e!100931)))

(declare-fun res!72942 () Bool)

(assert (=> b!154490 (=> res!72942 e!100931)))

(assert (=> b!154490 (= res!72942 (= (h!2394 (toList!896 lt!81097)) (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun b!154491 () Bool)

(assert (=> b!154491 (= e!100931 (contains!948 (t!6575 (toList!896 lt!81097)) (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(assert (= (and d!50807 res!72941) b!154490))

(assert (= (and b!154490 (not res!72942)) b!154491))

(declare-fun m!188589 () Bool)

(assert (=> d!50807 m!188589))

(declare-fun m!188591 () Bool)

(assert (=> d!50807 m!188591))

(declare-fun m!188593 () Bool)

(assert (=> b!154491 m!188593))

(assert (=> b!154359 d!50807))

(declare-fun d!50809 () Bool)

(declare-fun e!100933 () Bool)

(assert (=> d!50809 e!100933))

(declare-fun res!72944 () Bool)

(assert (=> d!50809 (=> (not res!72944) (not e!100933))))

(declare-fun lt!81172 () ListLongMap!1761)

(assert (=> d!50809 (= res!72944 (contains!947 lt!81172 (_1!1392 (ite (or c!29537 c!29536) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun lt!81173 () List!1789)

(assert (=> d!50809 (= lt!81172 (ListLongMap!1762 lt!81173))))

(declare-fun lt!81175 () Unit!4904)

(declare-fun lt!81174 () Unit!4904)

(assert (=> d!50809 (= lt!81175 lt!81174)))

(assert (=> d!50809 (= (getValueByKey!184 lt!81173 (_1!1392 (ite (or c!29537 c!29536) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))) (Some!189 (_2!1392 (ite (or c!29537 c!29536) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!50809 (= lt!81174 (lemmaContainsTupThenGetReturnValue!97 lt!81173 (_1!1392 (ite (or c!29537 c!29536) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (_2!1392 (ite (or c!29537 c!29536) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!50809 (= lt!81173 (insertStrictlySorted!100 (toList!896 (ite c!29537 call!17152 (ite c!29536 call!17156 call!17155))) (_1!1392 (ite (or c!29537 c!29536) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (_2!1392 (ite (or c!29537 c!29536) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!50809 (= (+!189 (ite c!29537 call!17152 (ite c!29536 call!17156 call!17155)) (ite (or c!29537 c!29536) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81172)))

(declare-fun b!154492 () Bool)

(declare-fun res!72943 () Bool)

(assert (=> b!154492 (=> (not res!72943) (not e!100933))))

(assert (=> b!154492 (= res!72943 (= (getValueByKey!184 (toList!896 lt!81172) (_1!1392 (ite (or c!29537 c!29536) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))) (Some!189 (_2!1392 (ite (or c!29537 c!29536) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(declare-fun b!154493 () Bool)

(assert (=> b!154493 (= e!100933 (contains!948 (toList!896 lt!81172) (ite (or c!29537 c!29536) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (= (and d!50809 res!72944) b!154492))

(assert (= (and b!154492 res!72943) b!154493))

(declare-fun m!188595 () Bool)

(assert (=> d!50809 m!188595))

(declare-fun m!188597 () Bool)

(assert (=> d!50809 m!188597))

(declare-fun m!188599 () Bool)

(assert (=> d!50809 m!188599))

(declare-fun m!188601 () Bool)

(assert (=> d!50809 m!188601))

(declare-fun m!188603 () Bool)

(assert (=> b!154492 m!188603))

(declare-fun m!188605 () Bool)

(assert (=> b!154493 m!188605))

(assert (=> bm!17155 d!50809))

(declare-fun d!50811 () Bool)

(declare-fun e!100935 () Bool)

(assert (=> d!50811 e!100935))

(declare-fun res!72945 () Bool)

(assert (=> d!50811 (=> res!72945 e!100935)))

(declare-fun lt!81176 () Bool)

(assert (=> d!50811 (= res!72945 (not lt!81176))))

(declare-fun lt!81179 () Bool)

(assert (=> d!50811 (= lt!81176 lt!81179)))

(declare-fun lt!81177 () Unit!4904)

(declare-fun e!100934 () Unit!4904)

(assert (=> d!50811 (= lt!81177 e!100934)))

(declare-fun c!29600 () Bool)

(assert (=> d!50811 (= c!29600 lt!81179)))

(assert (=> d!50811 (= lt!81179 (containsKey!187 (toList!896 lt!81006) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!50811 (= (contains!947 lt!81006 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)) lt!81176)))

(declare-fun b!154494 () Bool)

(declare-fun lt!81178 () Unit!4904)

(assert (=> b!154494 (= e!100934 lt!81178)))

(assert (=> b!154494 (= lt!81178 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!81006) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> b!154494 (isDefined!136 (getValueByKey!184 (toList!896 lt!81006) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154495 () Bool)

(declare-fun Unit!4915 () Unit!4904)

(assert (=> b!154495 (= e!100934 Unit!4915)))

(declare-fun b!154496 () Bool)

(assert (=> b!154496 (= e!100935 (isDefined!136 (getValueByKey!184 (toList!896 lt!81006) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000))))))

(assert (= (and d!50811 c!29600) b!154494))

(assert (= (and d!50811 (not c!29600)) b!154495))

(assert (= (and d!50811 (not res!72945)) b!154496))

(assert (=> d!50811 m!188151))

(declare-fun m!188607 () Bool)

(assert (=> d!50811 m!188607))

(assert (=> b!154494 m!188151))

(declare-fun m!188609 () Bool)

(assert (=> b!154494 m!188609))

(assert (=> b!154494 m!188151))

(declare-fun m!188611 () Bool)

(assert (=> b!154494 m!188611))

(assert (=> b!154494 m!188611))

(declare-fun m!188613 () Bool)

(assert (=> b!154494 m!188613))

(assert (=> b!154496 m!188151))

(assert (=> b!154496 m!188611))

(assert (=> b!154496 m!188611))

(assert (=> b!154496 m!188613))

(assert (=> b!154246 d!50811))

(declare-fun d!50813 () Bool)

(assert (=> d!50813 (= (get!1615 (getValueByKey!184 (toList!896 lt!80962) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3423 (getValueByKey!184 (toList!896 lt!80962) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50685 d!50813))

(assert (=> d!50685 d!50789))

(declare-fun b!154498 () Bool)

(declare-fun res!72947 () Bool)

(declare-fun e!100936 () Bool)

(assert (=> b!154498 (=> (not res!72947) (not e!100936))))

(assert (=> b!154498 (= res!72947 (bvsge (size!2685 (v!3418 (underlying!525 thiss!992))) (_size!672 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun d!50815 () Bool)

(declare-fun res!72946 () Bool)

(assert (=> d!50815 (=> (not res!72946) (not e!100936))))

(assert (=> d!50815 (= res!72946 (validMask!0 (mask!7467 (v!3418 (underlying!525 thiss!992)))))))

(assert (=> d!50815 (= (simpleValid!104 (v!3418 (underlying!525 thiss!992))) e!100936)))

(declare-fun b!154499 () Bool)

(declare-fun res!72949 () Bool)

(assert (=> b!154499 (=> (not res!72949) (not e!100936))))

(assert (=> b!154499 (= res!72949 (= (size!2685 (v!3418 (underlying!525 thiss!992))) (bvadd (_size!672 (v!3418 (underlying!525 thiss!992))) (bvsdiv (bvadd (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!154500 () Bool)

(assert (=> b!154500 (= e!100936 (and (bvsge (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!672 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!154497 () Bool)

(declare-fun res!72948 () Bool)

(assert (=> b!154497 (=> (not res!72948) (not e!100936))))

(assert (=> b!154497 (= res!72948 (and (= (size!2680 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000001)) (= (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (size!2680 (_values!3046 (v!3418 (underlying!525 thiss!992))))) (bvsge (_size!672 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!672 (v!3418 (underlying!525 thiss!992))) (bvadd (mask!7467 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000001))))))

(assert (= (and d!50815 res!72946) b!154497))

(assert (= (and b!154497 res!72948) b!154498))

(assert (= (and b!154498 res!72947) b!154499))

(assert (= (and b!154499 res!72949) b!154500))

(declare-fun m!188615 () Bool)

(assert (=> b!154498 m!188615))

(assert (=> d!50815 m!188043))

(assert (=> b!154499 m!188615))

(assert (=> d!50729 d!50815))

(declare-fun d!50817 () Bool)

(declare-fun res!72954 () Bool)

(declare-fun e!100941 () Bool)

(assert (=> d!50817 (=> res!72954 e!100941)))

(assert (=> d!50817 (= res!72954 (and ((_ is Cons!1785) (toList!896 lt!80962)) (= (_1!1392 (h!2394 (toList!896 lt!80962))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50817 (= (containsKey!187 (toList!896 lt!80962) #b1000000000000000000000000000000000000000000000000000000000000000) e!100941)))

(declare-fun b!154505 () Bool)

(declare-fun e!100942 () Bool)

(assert (=> b!154505 (= e!100941 e!100942)))

(declare-fun res!72955 () Bool)

(assert (=> b!154505 (=> (not res!72955) (not e!100942))))

(assert (=> b!154505 (= res!72955 (and (or (not ((_ is Cons!1785) (toList!896 lt!80962))) (bvsle (_1!1392 (h!2394 (toList!896 lt!80962))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1785) (toList!896 lt!80962)) (bvslt (_1!1392 (h!2394 (toList!896 lt!80962))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154506 () Bool)

(assert (=> b!154506 (= e!100942 (containsKey!187 (t!6575 (toList!896 lt!80962)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!50817 (not res!72954)) b!154505))

(assert (= (and b!154505 res!72955) b!154506))

(declare-fun m!188617 () Bool)

(assert (=> b!154506 m!188617))

(assert (=> d!50681 d!50817))

(declare-fun d!50819 () Bool)

(assert (=> d!50819 (isDefined!136 (getValueByKey!184 (toList!896 lt!80962) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!81180 () Unit!4904)

(assert (=> d!50819 (= lt!81180 (choose!926 (toList!896 lt!80962) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!100943 () Bool)

(assert (=> d!50819 e!100943))

(declare-fun res!72956 () Bool)

(assert (=> d!50819 (=> (not res!72956) (not e!100943))))

(assert (=> d!50819 (= res!72956 (isStrictlySorted!317 (toList!896 lt!80962)))))

(assert (=> d!50819 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!80962) #b0000000000000000000000000000000000000000000000000000000000000000) lt!81180)))

(declare-fun b!154507 () Bool)

(assert (=> b!154507 (= e!100943 (containsKey!187 (toList!896 lt!80962) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!50819 res!72956) b!154507))

(assert (=> d!50819 m!188087))

(assert (=> d!50819 m!188087))

(assert (=> d!50819 m!188253))

(declare-fun m!188619 () Bool)

(assert (=> d!50819 m!188619))

(assert (=> d!50819 m!188559))

(assert (=> b!154507 m!188249))

(assert (=> b!154339 d!50819))

(declare-fun d!50821 () Bool)

(assert (=> d!50821 (= (isDefined!136 (getValueByKey!184 (toList!896 lt!80962) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!437 (getValueByKey!184 (toList!896 lt!80962) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!6557 () Bool)

(assert (= bs!6557 d!50821))

(assert (=> bs!6557 m!188087))

(declare-fun m!188621 () Bool)

(assert (=> bs!6557 m!188621))

(assert (=> b!154339 d!50821))

(declare-fun b!154508 () Bool)

(declare-fun e!100944 () Option!190)

(assert (=> b!154508 (= e!100944 (Some!189 (_2!1392 (h!2394 (toList!896 lt!80962)))))))

(declare-fun d!50823 () Bool)

(declare-fun c!29601 () Bool)

(assert (=> d!50823 (= c!29601 (and ((_ is Cons!1785) (toList!896 lt!80962)) (= (_1!1392 (h!2394 (toList!896 lt!80962))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50823 (= (getValueByKey!184 (toList!896 lt!80962) #b0000000000000000000000000000000000000000000000000000000000000000) e!100944)))

(declare-fun b!154510 () Bool)

(declare-fun e!100945 () Option!190)

(assert (=> b!154510 (= e!100945 (getValueByKey!184 (t!6575 (toList!896 lt!80962)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154509 () Bool)

(assert (=> b!154509 (= e!100944 e!100945)))

(declare-fun c!29602 () Bool)

(assert (=> b!154509 (= c!29602 (and ((_ is Cons!1785) (toList!896 lt!80962)) (not (= (_1!1392 (h!2394 (toList!896 lt!80962))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!154511 () Bool)

(assert (=> b!154511 (= e!100945 None!188)))

(assert (= (and d!50823 c!29601) b!154508))

(assert (= (and d!50823 (not c!29601)) b!154509))

(assert (= (and b!154509 c!29602) b!154510))

(assert (= (and b!154509 (not c!29602)) b!154511))

(declare-fun m!188623 () Bool)

(assert (=> b!154510 m!188623))

(assert (=> b!154339 d!50823))

(assert (=> bm!17145 d!50771))

(declare-fun d!50825 () Bool)

(assert (=> d!50825 (isDefined!136 (getValueByKey!184 (toList!896 lt!80962) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!81181 () Unit!4904)

(assert (=> d!50825 (= lt!81181 (choose!926 (toList!896 lt!80962) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!100946 () Bool)

(assert (=> d!50825 e!100946))

(declare-fun res!72957 () Bool)

(assert (=> d!50825 (=> (not res!72957) (not e!100946))))

(assert (=> d!50825 (= res!72957 (isStrictlySorted!317 (toList!896 lt!80962)))))

(assert (=> d!50825 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!80962) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!81181)))

(declare-fun b!154512 () Bool)

(assert (=> b!154512 (= e!100946 (containsKey!187 (toList!896 lt!80962) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!50825 res!72957) b!154512))

(assert (=> d!50825 m!188021))

(assert (=> d!50825 m!188211))

(assert (=> d!50825 m!188211))

(assert (=> d!50825 m!188213))

(assert (=> d!50825 m!188021))

(declare-fun m!188625 () Bool)

(assert (=> d!50825 m!188625))

(assert (=> d!50825 m!188559))

(assert (=> b!154512 m!188021))

(assert (=> b!154512 m!188207))

(assert (=> b!154273 d!50825))

(declare-fun d!50827 () Bool)

(assert (=> d!50827 (= (isDefined!136 (getValueByKey!184 (toList!896 lt!80962) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (not (isEmpty!437 (getValueByKey!184 (toList!896 lt!80962) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun bs!6558 () Bool)

(assert (= bs!6558 d!50827))

(assert (=> bs!6558 m!188211))

(declare-fun m!188627 () Bool)

(assert (=> bs!6558 m!188627))

(assert (=> b!154273 d!50827))

(declare-fun b!154513 () Bool)

(declare-fun e!100947 () Option!190)

(assert (=> b!154513 (= e!100947 (Some!189 (_2!1392 (h!2394 (toList!896 lt!80962)))))))

(declare-fun c!29603 () Bool)

(declare-fun d!50829 () Bool)

(assert (=> d!50829 (= c!29603 (and ((_ is Cons!1785) (toList!896 lt!80962)) (= (_1!1392 (h!2394 (toList!896 lt!80962))) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!50829 (= (getValueByKey!184 (toList!896 lt!80962) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!100947)))

(declare-fun b!154515 () Bool)

(declare-fun e!100948 () Option!190)

(assert (=> b!154515 (= e!100948 (getValueByKey!184 (t!6575 (toList!896 lt!80962)) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!154514 () Bool)

(assert (=> b!154514 (= e!100947 e!100948)))

(declare-fun c!29604 () Bool)

(assert (=> b!154514 (= c!29604 (and ((_ is Cons!1785) (toList!896 lt!80962)) (not (= (_1!1392 (h!2394 (toList!896 lt!80962))) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun b!154516 () Bool)

(assert (=> b!154516 (= e!100948 None!188)))

(assert (= (and d!50829 c!29603) b!154513))

(assert (= (and d!50829 (not c!29603)) b!154514))

(assert (= (and b!154514 c!29604) b!154515))

(assert (= (and b!154514 (not c!29604)) b!154516))

(assert (=> b!154515 m!188021))

(declare-fun m!188629 () Bool)

(assert (=> b!154515 m!188629))

(assert (=> b!154273 d!50829))

(declare-fun d!50831 () Bool)

(declare-fun e!100950 () Bool)

(assert (=> d!50831 e!100950))

(declare-fun res!72958 () Bool)

(assert (=> d!50831 (=> res!72958 e!100950)))

(declare-fun lt!81182 () Bool)

(assert (=> d!50831 (= res!72958 (not lt!81182))))

(declare-fun lt!81185 () Bool)

(assert (=> d!50831 (= lt!81182 lt!81185)))

(declare-fun lt!81183 () Unit!4904)

(declare-fun e!100949 () Unit!4904)

(assert (=> d!50831 (= lt!81183 e!100949)))

(declare-fun c!29605 () Bool)

(assert (=> d!50831 (= c!29605 lt!81185)))

(assert (=> d!50831 (= lt!81185 (containsKey!187 (toList!896 lt!81006) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50831 (= (contains!947 lt!81006 #b1000000000000000000000000000000000000000000000000000000000000000) lt!81182)))

(declare-fun b!154517 () Bool)

(declare-fun lt!81184 () Unit!4904)

(assert (=> b!154517 (= e!100949 lt!81184)))

(assert (=> b!154517 (= lt!81184 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!81006) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154517 (isDefined!136 (getValueByKey!184 (toList!896 lt!81006) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154518 () Bool)

(declare-fun Unit!4916 () Unit!4904)

(assert (=> b!154518 (= e!100949 Unit!4916)))

(declare-fun b!154519 () Bool)

(assert (=> b!154519 (= e!100950 (isDefined!136 (getValueByKey!184 (toList!896 lt!81006) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50831 c!29605) b!154517))

(assert (= (and d!50831 (not c!29605)) b!154518))

(assert (= (and d!50831 (not res!72958)) b!154519))

(declare-fun m!188631 () Bool)

(assert (=> d!50831 m!188631))

(declare-fun m!188633 () Bool)

(assert (=> b!154517 m!188633))

(declare-fun m!188635 () Bool)

(assert (=> b!154517 m!188635))

(assert (=> b!154517 m!188635))

(declare-fun m!188637 () Bool)

(assert (=> b!154517 m!188637))

(assert (=> b!154519 m!188635))

(assert (=> b!154519 m!188635))

(assert (=> b!154519 m!188637))

(assert (=> bm!17153 d!50831))

(declare-fun d!50833 () Bool)

(assert (=> d!50833 (= (get!1617 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154376 d!50833))

(declare-fun b!154520 () Bool)

(declare-fun e!100951 () (_ BitVec 32))

(declare-fun e!100952 () (_ BitVec 32))

(assert (=> b!154520 (= e!100951 e!100952)))

(declare-fun c!29606 () Bool)

(assert (=> b!154520 (= c!29606 (validKeyInArray!0 (select (arr!2402 (_keys!4836 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!154521 () Bool)

(assert (=> b!154521 (= e!100951 #b00000000000000000000000000000000)))

(declare-fun b!154522 () Bool)

(declare-fun call!17174 () (_ BitVec 32))

(assert (=> b!154522 (= e!100952 (bvadd #b00000000000000000000000000000001 call!17174))))

(declare-fun d!50835 () Bool)

(declare-fun lt!81186 () (_ BitVec 32))

(assert (=> d!50835 (and (bvsge lt!81186 #b00000000000000000000000000000000) (bvsle lt!81186 (bvsub (size!2679 (_keys!4836 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!50835 (= lt!81186 e!100951)))

(declare-fun c!29607 () Bool)

(assert (=> d!50835 (= c!29607 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2679 (_keys!4836 newMap!16))))))

(assert (=> d!50835 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2679 (_keys!4836 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!2679 (_keys!4836 newMap!16)) (size!2679 (_keys!4836 newMap!16))))))

(assert (=> d!50835 (= (arrayCountValidKeys!0 (_keys!4836 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2679 (_keys!4836 newMap!16))) lt!81186)))

(declare-fun b!154523 () Bool)

(assert (=> b!154523 (= e!100952 call!17174)))

(declare-fun bm!17171 () Bool)

(assert (=> bm!17171 (= call!17174 (arrayCountValidKeys!0 (_keys!4836 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2679 (_keys!4836 newMap!16))))))

(assert (= (and d!50835 c!29607) b!154521))

(assert (= (and d!50835 (not c!29607)) b!154520))

(assert (= (and b!154520 c!29606) b!154522))

(assert (= (and b!154520 (not c!29606)) b!154523))

(assert (= (or b!154522 b!154523) bm!17171))

(declare-fun m!188639 () Bool)

(assert (=> b!154520 m!188639))

(assert (=> b!154520 m!188639))

(declare-fun m!188641 () Bool)

(assert (=> b!154520 m!188641))

(declare-fun m!188643 () Bool)

(assert (=> bm!17171 m!188643))

(assert (=> bm!17158 d!50835))

(declare-fun d!50837 () Bool)

(assert (=> d!50837 (= (get!1615 (getValueByKey!184 (toList!896 lt!80962) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (v!3423 (getValueByKey!184 (toList!896 lt!80962) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!50731 d!50837))

(assert (=> d!50731 d!50829))

(declare-fun d!50839 () Bool)

(assert (=> d!50839 (= (get!1615 (getValueByKey!184 (toList!896 (+!189 lt!80973 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80968)) (v!3423 (getValueByKey!184 (toList!896 (+!189 lt!80973 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80968)))))

(assert (=> d!50725 d!50839))

(declare-fun e!100953 () Option!190)

(declare-fun b!154524 () Bool)

(assert (=> b!154524 (= e!100953 (Some!189 (_2!1392 (h!2394 (toList!896 (+!189 lt!80973 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))))

(declare-fun d!50841 () Bool)

(declare-fun c!29608 () Bool)

(assert (=> d!50841 (= c!29608 (and ((_ is Cons!1785) (toList!896 (+!189 lt!80973 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))) (= (_1!1392 (h!2394 (toList!896 (+!189 lt!80973 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))) lt!80968)))))

(assert (=> d!50841 (= (getValueByKey!184 (toList!896 (+!189 lt!80973 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80968) e!100953)))

(declare-fun e!100954 () Option!190)

(declare-fun b!154526 () Bool)

(assert (=> b!154526 (= e!100954 (getValueByKey!184 (t!6575 (toList!896 (+!189 lt!80973 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))) lt!80968))))

(declare-fun b!154525 () Bool)

(assert (=> b!154525 (= e!100953 e!100954)))

(declare-fun c!29609 () Bool)

(assert (=> b!154525 (= c!29609 (and ((_ is Cons!1785) (toList!896 (+!189 lt!80973 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))) (not (= (_1!1392 (h!2394 (toList!896 (+!189 lt!80973 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))) lt!80968))))))

(declare-fun b!154527 () Bool)

(assert (=> b!154527 (= e!100954 None!188)))

(assert (= (and d!50841 c!29608) b!154524))

(assert (= (and d!50841 (not c!29608)) b!154525))

(assert (= (and b!154525 c!29609) b!154526))

(assert (= (and b!154525 (not c!29609)) b!154527))

(declare-fun m!188645 () Bool)

(assert (=> b!154526 m!188645))

(assert (=> d!50725 d!50841))

(declare-fun d!50843 () Bool)

(declare-fun res!72959 () Bool)

(declare-fun e!100955 () Bool)

(assert (=> d!50843 (=> res!72959 e!100955)))

(assert (=> d!50843 (= res!72959 (and ((_ is Cons!1785) (toList!896 lt!80962)) (= (_1!1392 (h!2394 (toList!896 lt!80962))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50843 (= (containsKey!187 (toList!896 lt!80962) #b0000000000000000000000000000000000000000000000000000000000000000) e!100955)))

(declare-fun b!154528 () Bool)

(declare-fun e!100956 () Bool)

(assert (=> b!154528 (= e!100955 e!100956)))

(declare-fun res!72960 () Bool)

(assert (=> b!154528 (=> (not res!72960) (not e!100956))))

(assert (=> b!154528 (= res!72960 (and (or (not ((_ is Cons!1785) (toList!896 lt!80962))) (bvsle (_1!1392 (h!2394 (toList!896 lt!80962))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1785) (toList!896 lt!80962)) (bvslt (_1!1392 (h!2394 (toList!896 lt!80962))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154529 () Bool)

(assert (=> b!154529 (= e!100956 (containsKey!187 (t!6575 (toList!896 lt!80962)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!50843 (not res!72959)) b!154528))

(assert (= (and b!154528 res!72960) b!154529))

(declare-fun m!188647 () Bool)

(assert (=> b!154529 m!188647))

(assert (=> d!50691 d!50843))

(declare-fun d!50845 () Bool)

(assert (=> d!50845 (= (apply!128 lt!81061 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1615 (getValueByKey!184 (toList!896 lt!81061) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!6559 () Bool)

(assert (= bs!6559 d!50845))

(assert (=> bs!6559 m!188021))

(declare-fun m!188649 () Bool)

(assert (=> bs!6559 m!188649))

(assert (=> bs!6559 m!188649))

(declare-fun m!188651 () Bool)

(assert (=> bs!6559 m!188651))

(assert (=> b!154335 d!50845))

(assert (=> b!154335 d!50733))

(declare-fun d!50847 () Bool)

(assert (=> d!50847 (= (apply!128 lt!80984 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1615 (getValueByKey!184 (toList!896 lt!80984) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6560 () Bool)

(assert (= bs!6560 d!50847))

(declare-fun m!188653 () Bool)

(assert (=> bs!6560 m!188653))

(assert (=> bs!6560 m!188653))

(declare-fun m!188655 () Bool)

(assert (=> bs!6560 m!188655))

(assert (=> b!154233 d!50847))

(declare-fun d!50849 () Bool)

(declare-fun e!100958 () Bool)

(assert (=> d!50849 e!100958))

(declare-fun res!72961 () Bool)

(assert (=> d!50849 (=> res!72961 e!100958)))

(declare-fun lt!81187 () Bool)

(assert (=> d!50849 (= res!72961 (not lt!81187))))

(declare-fun lt!81190 () Bool)

(assert (=> d!50849 (= lt!81187 lt!81190)))

(declare-fun lt!81188 () Unit!4904)

(declare-fun e!100957 () Unit!4904)

(assert (=> d!50849 (= lt!81188 e!100957)))

(declare-fun c!29610 () Bool)

(assert (=> d!50849 (= c!29610 lt!81190)))

(assert (=> d!50849 (= lt!81190 (containsKey!187 (toList!896 lt!81097) (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50849 (= (contains!947 lt!81097 (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81187)))

(declare-fun b!154530 () Bool)

(declare-fun lt!81189 () Unit!4904)

(assert (=> b!154530 (= e!100957 lt!81189)))

(assert (=> b!154530 (= lt!81189 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!81097) (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> b!154530 (isDefined!136 (getValueByKey!184 (toList!896 lt!81097) (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154531 () Bool)

(declare-fun Unit!4917 () Unit!4904)

(assert (=> b!154531 (= e!100957 Unit!4917)))

(declare-fun b!154532 () Bool)

(assert (=> b!154532 (= e!100958 (isDefined!136 (getValueByKey!184 (toList!896 lt!81097) (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (= (and d!50849 c!29610) b!154530))

(assert (= (and d!50849 (not c!29610)) b!154531))

(assert (= (and d!50849 (not res!72961)) b!154532))

(declare-fun m!188657 () Bool)

(assert (=> d!50849 m!188657))

(declare-fun m!188659 () Bool)

(assert (=> b!154530 m!188659))

(assert (=> b!154530 m!188327))

(assert (=> b!154530 m!188327))

(declare-fun m!188661 () Bool)

(assert (=> b!154530 m!188661))

(assert (=> b!154532 m!188327))

(assert (=> b!154532 m!188327))

(assert (=> b!154532 m!188661))

(assert (=> d!50715 d!50849))

(declare-fun b!154533 () Bool)

(declare-fun e!100959 () Option!190)

(assert (=> b!154533 (= e!100959 (Some!189 (_2!1392 (h!2394 lt!81098))))))

(declare-fun c!29611 () Bool)

(declare-fun d!50851 () Bool)

(assert (=> d!50851 (= c!29611 (and ((_ is Cons!1785) lt!81098) (= (_1!1392 (h!2394 lt!81098)) (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!50851 (= (getValueByKey!184 lt!81098 (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) e!100959)))

(declare-fun b!154535 () Bool)

(declare-fun e!100960 () Option!190)

(assert (=> b!154535 (= e!100960 (getValueByKey!184 (t!6575 lt!81098) (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154534 () Bool)

(assert (=> b!154534 (= e!100959 e!100960)))

(declare-fun c!29612 () Bool)

(assert (=> b!154534 (= c!29612 (and ((_ is Cons!1785) lt!81098) (not (= (_1!1392 (h!2394 lt!81098)) (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(declare-fun b!154536 () Bool)

(assert (=> b!154536 (= e!100960 None!188)))

(assert (= (and d!50851 c!29611) b!154533))

(assert (= (and d!50851 (not c!29611)) b!154534))

(assert (= (and b!154534 c!29612) b!154535))

(assert (= (and b!154534 (not c!29612)) b!154536))

(declare-fun m!188663 () Bool)

(assert (=> b!154535 m!188663))

(assert (=> d!50715 d!50851))

(declare-fun d!50853 () Bool)

(assert (=> d!50853 (= (getValueByKey!184 lt!81098 (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun lt!81193 () Unit!4904)

(declare-fun choose!927 (List!1789 (_ BitVec 64) V!3681) Unit!4904)

(assert (=> d!50853 (= lt!81193 (choose!927 lt!81098 (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun e!100963 () Bool)

(assert (=> d!50853 e!100963))

(declare-fun res!72966 () Bool)

(assert (=> d!50853 (=> (not res!72966) (not e!100963))))

(assert (=> d!50853 (= res!72966 (isStrictlySorted!317 lt!81098))))

(assert (=> d!50853 (= (lemmaContainsTupThenGetReturnValue!97 lt!81098 (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81193)))

(declare-fun b!154541 () Bool)

(declare-fun res!72967 () Bool)

(assert (=> b!154541 (=> (not res!72967) (not e!100963))))

(assert (=> b!154541 (= res!72967 (containsKey!187 lt!81098 (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154542 () Bool)

(assert (=> b!154542 (= e!100963 (contains!948 lt!81098 (tuple2!2763 (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (= (and d!50853 res!72966) b!154541))

(assert (= (and b!154541 res!72967) b!154542))

(assert (=> d!50853 m!188321))

(declare-fun m!188665 () Bool)

(assert (=> d!50853 m!188665))

(declare-fun m!188667 () Bool)

(assert (=> d!50853 m!188667))

(declare-fun m!188669 () Bool)

(assert (=> b!154541 m!188669))

(declare-fun m!188671 () Bool)

(assert (=> b!154542 m!188671))

(assert (=> d!50715 d!50853))

(declare-fun b!154563 () Bool)

(declare-fun res!72973 () Bool)

(declare-fun e!100977 () Bool)

(assert (=> b!154563 (=> (not res!72973) (not e!100977))))

(declare-fun lt!81196 () List!1789)

(assert (=> b!154563 (= res!72973 (containsKey!187 lt!81196 (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun e!100976 () List!1789)

(declare-fun c!29624 () Bool)

(declare-fun c!29621 () Bool)

(declare-fun b!154564 () Bool)

(assert (=> b!154564 (= e!100976 (ite c!29621 (t!6575 (toList!896 lt!80978)) (ite c!29624 (Cons!1785 (h!2394 (toList!896 lt!80978)) (t!6575 (toList!896 lt!80978))) Nil!1786)))))

(declare-fun b!154565 () Bool)

(declare-fun e!100978 () List!1789)

(declare-fun call!17183 () List!1789)

(assert (=> b!154565 (= e!100978 call!17183)))

(declare-fun b!154566 () Bool)

(assert (=> b!154566 (= e!100976 (insertStrictlySorted!100 (t!6575 (toList!896 lt!80978)) (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun bm!17179 () Bool)

(declare-fun call!17181 () List!1789)

(declare-fun call!17182 () List!1789)

(assert (=> bm!17179 (= call!17181 call!17182)))

(declare-fun d!50855 () Bool)

(assert (=> d!50855 e!100977))

(declare-fun res!72972 () Bool)

(assert (=> d!50855 (=> (not res!72972) (not e!100977))))

(assert (=> d!50855 (= res!72972 (isStrictlySorted!317 lt!81196))))

(assert (=> d!50855 (= lt!81196 e!100978)))

(declare-fun c!29623 () Bool)

(assert (=> d!50855 (= c!29623 (and ((_ is Cons!1785) (toList!896 lt!80978)) (bvslt (_1!1392 (h!2394 (toList!896 lt!80978))) (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!50855 (isStrictlySorted!317 (toList!896 lt!80978))))

(assert (=> d!50855 (= (insertStrictlySorted!100 (toList!896 lt!80978) (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81196)))

(declare-fun bm!17178 () Bool)

(assert (=> bm!17178 (= call!17182 call!17183)))

(declare-fun b!154567 () Bool)

(declare-fun e!100974 () List!1789)

(assert (=> b!154567 (= e!100974 call!17181)))

(declare-fun b!154568 () Bool)

(assert (=> b!154568 (= c!29624 (and ((_ is Cons!1785) (toList!896 lt!80978)) (bvsgt (_1!1392 (h!2394 (toList!896 lt!80978))) (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun e!100975 () List!1789)

(assert (=> b!154568 (= e!100975 e!100974)))

(declare-fun b!154569 () Bool)

(assert (=> b!154569 (= e!100975 call!17182)))

(declare-fun b!154570 () Bool)

(assert (=> b!154570 (= e!100977 (contains!948 lt!81196 (tuple2!2763 (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154571 () Bool)

(assert (=> b!154571 (= e!100978 e!100975)))

(assert (=> b!154571 (= c!29621 (and ((_ is Cons!1785) (toList!896 lt!80978)) (= (_1!1392 (h!2394 (toList!896 lt!80978))) (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154572 () Bool)

(assert (=> b!154572 (= e!100974 call!17181)))

(declare-fun bm!17180 () Bool)

(declare-fun $colon$colon!95 (List!1789 tuple2!2762) List!1789)

(assert (=> bm!17180 (= call!17183 ($colon$colon!95 e!100976 (ite c!29623 (h!2394 (toList!896 lt!80978)) (tuple2!2763 (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(declare-fun c!29622 () Bool)

(assert (=> bm!17180 (= c!29622 c!29623)))

(assert (= (and d!50855 c!29623) b!154565))

(assert (= (and d!50855 (not c!29623)) b!154571))

(assert (= (and b!154571 c!29621) b!154569))

(assert (= (and b!154571 (not c!29621)) b!154568))

(assert (= (and b!154568 c!29624) b!154567))

(assert (= (and b!154568 (not c!29624)) b!154572))

(assert (= (or b!154567 b!154572) bm!17179))

(assert (= (or b!154569 bm!17179) bm!17178))

(assert (= (or b!154565 bm!17178) bm!17180))

(assert (= (and bm!17180 c!29622) b!154566))

(assert (= (and bm!17180 (not c!29622)) b!154564))

(assert (= (and d!50855 res!72972) b!154563))

(assert (= (and b!154563 res!72973) b!154570))

(declare-fun m!188673 () Bool)

(assert (=> b!154570 m!188673))

(declare-fun m!188675 () Bool)

(assert (=> b!154566 m!188675))

(declare-fun m!188677 () Bool)

(assert (=> b!154563 m!188677))

(declare-fun m!188679 () Bool)

(assert (=> bm!17180 m!188679))

(declare-fun m!188681 () Bool)

(assert (=> d!50855 m!188681))

(declare-fun m!188683 () Bool)

(assert (=> d!50855 m!188683))

(assert (=> d!50715 d!50855))

(assert (=> b!154332 d!50695))

(declare-fun d!50857 () Bool)

(assert (=> d!50857 (= (validMask!0 (mask!7467 newMap!16)) (and (or (= (mask!7467 newMap!16) #b00000000000000000000000000000111) (= (mask!7467 newMap!16) #b00000000000000000000000000001111) (= (mask!7467 newMap!16) #b00000000000000000000000000011111) (= (mask!7467 newMap!16) #b00000000000000000000000000111111) (= (mask!7467 newMap!16) #b00000000000000000000000001111111) (= (mask!7467 newMap!16) #b00000000000000000000000011111111) (= (mask!7467 newMap!16) #b00000000000000000000000111111111) (= (mask!7467 newMap!16) #b00000000000000000000001111111111) (= (mask!7467 newMap!16) #b00000000000000000000011111111111) (= (mask!7467 newMap!16) #b00000000000000000000111111111111) (= (mask!7467 newMap!16) #b00000000000000000001111111111111) (= (mask!7467 newMap!16) #b00000000000000000011111111111111) (= (mask!7467 newMap!16) #b00000000000000000111111111111111) (= (mask!7467 newMap!16) #b00000000000000001111111111111111) (= (mask!7467 newMap!16) #b00000000000000011111111111111111) (= (mask!7467 newMap!16) #b00000000000000111111111111111111) (= (mask!7467 newMap!16) #b00000000000001111111111111111111) (= (mask!7467 newMap!16) #b00000000000011111111111111111111) (= (mask!7467 newMap!16) #b00000000000111111111111111111111) (= (mask!7467 newMap!16) #b00000000001111111111111111111111) (= (mask!7467 newMap!16) #b00000000011111111111111111111111) (= (mask!7467 newMap!16) #b00000000111111111111111111111111) (= (mask!7467 newMap!16) #b00000001111111111111111111111111) (= (mask!7467 newMap!16) #b00000011111111111111111111111111) (= (mask!7467 newMap!16) #b00000111111111111111111111111111) (= (mask!7467 newMap!16) #b00001111111111111111111111111111) (= (mask!7467 newMap!16) #b00011111111111111111111111111111) (= (mask!7467 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!7467 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!50673 d!50857))

(declare-fun d!50859 () Bool)

(assert (=> d!50859 (= (validKeyInArray!0 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!154257 d!50859))

(declare-fun d!50861 () Bool)

(declare-fun e!100980 () Bool)

(assert (=> d!50861 e!100980))

(declare-fun res!72974 () Bool)

(assert (=> d!50861 (=> res!72974 e!100980)))

(declare-fun lt!81197 () Bool)

(assert (=> d!50861 (= res!72974 (not lt!81197))))

(declare-fun lt!81200 () Bool)

(assert (=> d!50861 (= lt!81197 lt!81200)))

(declare-fun lt!81198 () Unit!4904)

(declare-fun e!100979 () Unit!4904)

(assert (=> d!50861 (= lt!81198 e!100979)))

(declare-fun c!29625 () Bool)

(assert (=> d!50861 (= c!29625 lt!81200)))

(assert (=> d!50861 (= lt!81200 (containsKey!187 (toList!896 lt!81006) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50861 (= (contains!947 lt!81006 #b0000000000000000000000000000000000000000000000000000000000000000) lt!81197)))

(declare-fun b!154573 () Bool)

(declare-fun lt!81199 () Unit!4904)

(assert (=> b!154573 (= e!100979 lt!81199)))

(assert (=> b!154573 (= lt!81199 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!81006) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154573 (isDefined!136 (getValueByKey!184 (toList!896 lt!81006) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154574 () Bool)

(declare-fun Unit!4918 () Unit!4904)

(assert (=> b!154574 (= e!100979 Unit!4918)))

(declare-fun b!154575 () Bool)

(assert (=> b!154575 (= e!100980 (isDefined!136 (getValueByKey!184 (toList!896 lt!81006) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50861 c!29625) b!154573))

(assert (= (and d!50861 (not c!29625)) b!154574))

(assert (= (and d!50861 (not res!72974)) b!154575))

(declare-fun m!188685 () Bool)

(assert (=> d!50861 m!188685))

(declare-fun m!188687 () Bool)

(assert (=> b!154573 m!188687))

(assert (=> b!154573 m!188553))

(assert (=> b!154573 m!188553))

(declare-fun m!188689 () Bool)

(assert (=> b!154573 m!188689))

(assert (=> b!154575 m!188553))

(assert (=> b!154575 m!188553))

(assert (=> b!154575 m!188689))

(assert (=> bm!17149 d!50861))

(assert (=> d!50679 d!50857))

(declare-fun d!50863 () Bool)

(assert (=> d!50863 (= (isDefined!136 (getValueByKey!184 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80981)) (not (isEmpty!437 (getValueByKey!184 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80981))))))

(declare-fun bs!6561 () Bool)

(assert (= bs!6561 d!50863))

(assert (=> bs!6561 m!188335))

(declare-fun m!188691 () Bool)

(assert (=> bs!6561 m!188691))

(assert (=> b!154362 d!50863))

(declare-fun e!100981 () Option!190)

(declare-fun b!154576 () Bool)

(assert (=> b!154576 (= e!100981 (Some!189 (_2!1392 (h!2394 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))))

(declare-fun c!29626 () Bool)

(declare-fun d!50865 () Bool)

(assert (=> d!50865 (= c!29626 (and ((_ is Cons!1785) (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))) (= (_1!1392 (h!2394 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))) lt!80981)))))

(assert (=> d!50865 (= (getValueByKey!184 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80981) e!100981)))

(declare-fun b!154578 () Bool)

(declare-fun e!100982 () Option!190)

(assert (=> b!154578 (= e!100982 (getValueByKey!184 (t!6575 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))) lt!80981))))

(declare-fun b!154577 () Bool)

(assert (=> b!154577 (= e!100981 e!100982)))

(declare-fun c!29627 () Bool)

(assert (=> b!154577 (= c!29627 (and ((_ is Cons!1785) (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))) (not (= (_1!1392 (h!2394 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))) lt!80981))))))

(declare-fun b!154579 () Bool)

(assert (=> b!154579 (= e!100982 None!188)))

(assert (= (and d!50865 c!29626) b!154576))

(assert (= (and d!50865 (not c!29626)) b!154577))

(assert (= (and b!154577 c!29627) b!154578))

(assert (= (and b!154577 (not c!29627)) b!154579))

(declare-fun m!188693 () Bool)

(assert (=> b!154578 m!188693))

(assert (=> b!154362 d!50865))

(declare-fun d!50867 () Bool)

(declare-fun e!100983 () Bool)

(assert (=> d!50867 e!100983))

(declare-fun res!72976 () Bool)

(assert (=> d!50867 (=> (not res!72976) (not e!100983))))

(declare-fun lt!81201 () ListLongMap!1761)

(assert (=> d!50867 (= res!72976 (contains!947 lt!81201 (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))))))

(declare-fun lt!81202 () List!1789)

(assert (=> d!50867 (= lt!81201 (ListLongMap!1762 lt!81202))))

(declare-fun lt!81204 () Unit!4904)

(declare-fun lt!81203 () Unit!4904)

(assert (=> d!50867 (= lt!81204 lt!81203)))

(assert (=> d!50867 (= (getValueByKey!184 lt!81202 (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))) (Some!189 (_2!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))))))

(assert (=> d!50867 (= lt!81203 (lemmaContainsTupThenGetReturnValue!97 lt!81202 (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))) (_2!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))))))

(assert (=> d!50867 (= lt!81202 (insertStrictlySorted!100 (toList!896 call!17150) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))) (_2!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))))))

(assert (=> d!50867 (= (+!189 call!17150 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))) lt!81201)))

(declare-fun b!154580 () Bool)

(declare-fun res!72975 () Bool)

(assert (=> b!154580 (=> (not res!72975) (not e!100983))))

(assert (=> b!154580 (= res!72975 (= (getValueByKey!184 (toList!896 lt!81201) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))) (Some!189 (_2!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))))))))

(declare-fun b!154581 () Bool)

(assert (=> b!154581 (= e!100983 (contains!948 (toList!896 lt!81201) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))))))

(assert (= (and d!50867 res!72976) b!154580))

(assert (= (and b!154580 res!72975) b!154581))

(declare-fun m!188695 () Bool)

(assert (=> d!50867 m!188695))

(declare-fun m!188697 () Bool)

(assert (=> d!50867 m!188697))

(declare-fun m!188699 () Bool)

(assert (=> d!50867 m!188699))

(declare-fun m!188701 () Bool)

(assert (=> d!50867 m!188701))

(declare-fun m!188703 () Bool)

(assert (=> b!154580 m!188703))

(declare-fun m!188705 () Bool)

(assert (=> b!154581 m!188705))

(assert (=> b!154226 d!50867))

(declare-fun d!50869 () Bool)

(declare-fun lt!81205 () Bool)

(assert (=> d!50869 (= lt!81205 (select (content!146 (toList!896 lt!81078)) (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun e!100985 () Bool)

(assert (=> d!50869 (= lt!81205 e!100985)))

(declare-fun res!72977 () Bool)

(assert (=> d!50869 (=> (not res!72977) (not e!100985))))

(assert (=> d!50869 (= res!72977 ((_ is Cons!1785) (toList!896 lt!81078)))))

(assert (=> d!50869 (= (contains!948 (toList!896 lt!81078) (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81205)))

(declare-fun b!154582 () Bool)

(declare-fun e!100984 () Bool)

(assert (=> b!154582 (= e!100985 e!100984)))

(declare-fun res!72978 () Bool)

(assert (=> b!154582 (=> res!72978 e!100984)))

(assert (=> b!154582 (= res!72978 (= (h!2394 (toList!896 lt!81078)) (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154583 () Bool)

(assert (=> b!154583 (= e!100984 (contains!948 (t!6575 (toList!896 lt!81078)) (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (= (and d!50869 res!72977) b!154582))

(assert (= (and b!154582 (not res!72978)) b!154583))

(declare-fun m!188707 () Bool)

(assert (=> d!50869 m!188707))

(declare-fun m!188709 () Bool)

(assert (=> d!50869 m!188709))

(declare-fun m!188711 () Bool)

(assert (=> b!154583 m!188711))

(assert (=> b!154347 d!50869))

(declare-fun b!154584 () Bool)

(declare-fun e!100986 () Option!190)

(assert (=> b!154584 (= e!100986 (Some!189 (_2!1392 (h!2394 (toList!896 lt!81097)))))))

(declare-fun c!29628 () Bool)

(declare-fun d!50871 () Bool)

(assert (=> d!50871 (= c!29628 (and ((_ is Cons!1785) (toList!896 lt!81097)) (= (_1!1392 (h!2394 (toList!896 lt!81097))) (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!50871 (= (getValueByKey!184 (toList!896 lt!81097) (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) e!100986)))

(declare-fun e!100987 () Option!190)

(declare-fun b!154586 () Bool)

(assert (=> b!154586 (= e!100987 (getValueByKey!184 (t!6575 (toList!896 lt!81097)) (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154585 () Bool)

(assert (=> b!154585 (= e!100986 e!100987)))

(declare-fun c!29629 () Bool)

(assert (=> b!154585 (= c!29629 (and ((_ is Cons!1785) (toList!896 lt!81097)) (not (= (_1!1392 (h!2394 (toList!896 lt!81097))) (_1!1392 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(declare-fun b!154587 () Bool)

(assert (=> b!154587 (= e!100987 None!188)))

(assert (= (and d!50871 c!29628) b!154584))

(assert (= (and d!50871 (not c!29628)) b!154585))

(assert (= (and b!154585 c!29629) b!154586))

(assert (= (and b!154585 (not c!29629)) b!154587))

(declare-fun m!188713 () Bool)

(assert (=> b!154586 m!188713))

(assert (=> b!154358 d!50871))

(assert (=> d!50711 d!50697))

(declare-fun d!50873 () Bool)

(declare-fun e!100989 () Bool)

(assert (=> d!50873 e!100989))

(declare-fun res!72979 () Bool)

(assert (=> d!50873 (=> res!72979 e!100989)))

(declare-fun lt!81206 () Bool)

(assert (=> d!50873 (= res!72979 (not lt!81206))))

(declare-fun lt!81209 () Bool)

(assert (=> d!50873 (= lt!81206 lt!81209)))

(declare-fun lt!81207 () Unit!4904)

(declare-fun e!100988 () Unit!4904)

(assert (=> d!50873 (= lt!81207 e!100988)))

(declare-fun c!29630 () Bool)

(assert (=> d!50873 (= c!29630 lt!81209)))

(assert (=> d!50873 (= lt!81209 (containsKey!187 (toList!896 lt!80961) lt!80975))))

(assert (=> d!50873 (= (contains!947 lt!80961 lt!80975) lt!81206)))

(declare-fun b!154588 () Bool)

(declare-fun lt!81208 () Unit!4904)

(assert (=> b!154588 (= e!100988 lt!81208)))

(assert (=> b!154588 (= lt!81208 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!80961) lt!80975))))

(assert (=> b!154588 (isDefined!136 (getValueByKey!184 (toList!896 lt!80961) lt!80975))))

(declare-fun b!154589 () Bool)

(declare-fun Unit!4919 () Unit!4904)

(assert (=> b!154589 (= e!100988 Unit!4919)))

(declare-fun b!154590 () Bool)

(assert (=> b!154590 (= e!100989 (isDefined!136 (getValueByKey!184 (toList!896 lt!80961) lt!80975)))))

(assert (= (and d!50873 c!29630) b!154588))

(assert (= (and d!50873 (not c!29630)) b!154589))

(assert (= (and d!50873 (not res!72979)) b!154590))

(declare-fun m!188715 () Bool)

(assert (=> d!50873 m!188715))

(declare-fun m!188717 () Bool)

(assert (=> b!154588 m!188717))

(assert (=> b!154588 m!188287))

(assert (=> b!154588 m!188287))

(declare-fun m!188719 () Bool)

(assert (=> b!154588 m!188719))

(assert (=> b!154590 m!188287))

(assert (=> b!154590 m!188287))

(assert (=> b!154590 m!188719))

(assert (=> d!50711 d!50873))

(assert (=> d!50711 d!50703))

(assert (=> d!50711 d!50723))

(declare-fun d!50875 () Bool)

(assert (=> d!50875 (= (apply!128 (+!189 lt!80961 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!80975) (apply!128 lt!80961 lt!80975))))

(assert (=> d!50875 true))

(declare-fun _$34!1042 () Unit!4904)

(assert (=> d!50875 (= (choose!924 lt!80961 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) lt!80975) _$34!1042)))

(declare-fun bs!6562 () Bool)

(assert (= bs!6562 d!50875))

(assert (=> bs!6562 m!188057))

(assert (=> bs!6562 m!188057))

(assert (=> bs!6562 m!188077))

(assert (=> bs!6562 m!188059))

(assert (=> d!50711 d!50875))

(declare-fun d!50877 () Bool)

(assert (=> d!50877 (= (get!1615 (getValueByKey!184 (toList!896 lt!80973) lt!80968)) (v!3423 (getValueByKey!184 (toList!896 lt!80973) lt!80968)))))

(assert (=> d!50699 d!50877))

(declare-fun b!154592 () Bool)

(declare-fun e!100990 () Option!190)

(assert (=> b!154592 (= e!100990 (Some!189 (_2!1392 (h!2394 (toList!896 lt!80973)))))))

(declare-fun d!50879 () Bool)

(declare-fun c!29631 () Bool)

(assert (=> d!50879 (= c!29631 (and ((_ is Cons!1785) (toList!896 lt!80973)) (= (_1!1392 (h!2394 (toList!896 lt!80973))) lt!80968)))))

(assert (=> d!50879 (= (getValueByKey!184 (toList!896 lt!80973) lt!80968) e!100990)))

(declare-fun b!154594 () Bool)

(declare-fun e!100991 () Option!190)

(assert (=> b!154594 (= e!100991 (getValueByKey!184 (t!6575 (toList!896 lt!80973)) lt!80968))))

(declare-fun b!154593 () Bool)

(assert (=> b!154593 (= e!100990 e!100991)))

(declare-fun c!29632 () Bool)

(assert (=> b!154593 (= c!29632 (and ((_ is Cons!1785) (toList!896 lt!80973)) (not (= (_1!1392 (h!2394 (toList!896 lt!80973))) lt!80968))))))

(declare-fun b!154595 () Bool)

(assert (=> b!154595 (= e!100991 None!188)))

(assert (= (and d!50879 c!29631) b!154592))

(assert (= (and d!50879 (not c!29631)) b!154593))

(assert (= (and b!154593 c!29632) b!154594))

(assert (= (and b!154593 (not c!29632)) b!154595))

(declare-fun m!188721 () Bool)

(assert (=> b!154594 m!188721))

(assert (=> d!50699 d!50879))

(assert (=> d!50705 d!50717))

(assert (=> d!50705 d!50719))

(declare-fun d!50881 () Bool)

(assert (=> d!50881 (contains!947 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!80981)))

(assert (=> d!50881 true))

(declare-fun _$35!405 () Unit!4904)

(assert (=> d!50881 (= (choose!925 lt!80966 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) lt!80981) _$35!405)))

(declare-fun bs!6563 () Bool)

(assert (= bs!6563 d!50881))

(assert (=> bs!6563 m!188065))

(assert (=> bs!6563 m!188065))

(assert (=> bs!6563 m!188067))

(assert (=> d!50705 d!50881))

(declare-fun d!50883 () Bool)

(declare-fun e!100993 () Bool)

(assert (=> d!50883 e!100993))

(declare-fun res!72980 () Bool)

(assert (=> d!50883 (=> res!72980 e!100993)))

(declare-fun lt!81210 () Bool)

(assert (=> d!50883 (= res!72980 (not lt!81210))))

(declare-fun lt!81213 () Bool)

(assert (=> d!50883 (= lt!81210 lt!81213)))

(declare-fun lt!81211 () Unit!4904)

(declare-fun e!100992 () Unit!4904)

(assert (=> d!50883 (= lt!81211 e!100992)))

(declare-fun c!29633 () Bool)

(assert (=> d!50883 (= c!29633 lt!81213)))

(assert (=> d!50883 (= lt!81213 (containsKey!187 (toList!896 lt!80966) lt!80981))))

(assert (=> d!50883 (= (contains!947 lt!80966 lt!80981) lt!81210)))

(declare-fun b!154597 () Bool)

(declare-fun lt!81212 () Unit!4904)

(assert (=> b!154597 (= e!100992 lt!81212)))

(assert (=> b!154597 (= lt!81212 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!80966) lt!80981))))

(assert (=> b!154597 (isDefined!136 (getValueByKey!184 (toList!896 lt!80966) lt!80981))))

(declare-fun b!154598 () Bool)

(declare-fun Unit!4920 () Unit!4904)

(assert (=> b!154598 (= e!100992 Unit!4920)))

(declare-fun b!154599 () Bool)

(assert (=> b!154599 (= e!100993 (isDefined!136 (getValueByKey!184 (toList!896 lt!80966) lt!80981)))))

(assert (= (and d!50883 c!29633) b!154597))

(assert (= (and d!50883 (not c!29633)) b!154598))

(assert (= (and d!50883 (not res!72980)) b!154599))

(declare-fun m!188723 () Bool)

(assert (=> d!50883 m!188723))

(declare-fun m!188725 () Bool)

(assert (=> b!154597 m!188725))

(declare-fun m!188727 () Bool)

(assert (=> b!154597 m!188727))

(assert (=> b!154597 m!188727))

(declare-fun m!188729 () Bool)

(assert (=> b!154597 m!188729))

(assert (=> b!154599 m!188727))

(assert (=> b!154599 m!188727))

(assert (=> b!154599 m!188729))

(assert (=> d!50705 d!50883))

(declare-fun d!50885 () Bool)

(assert (=> d!50885 (= (get!1616 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3417 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!154375 d!50885))

(declare-fun d!50887 () Bool)

(assert (=> d!50887 (= (size!2685 newMap!16) (bvadd (_size!672 newMap!16) (bvsdiv (bvadd (extraKeys!2804 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!154286 d!50887))

(declare-fun d!50889 () Bool)

(declare-fun e!100995 () Bool)

(assert (=> d!50889 e!100995))

(declare-fun res!72981 () Bool)

(assert (=> d!50889 (=> res!72981 e!100995)))

(declare-fun lt!81214 () Bool)

(assert (=> d!50889 (= res!72981 (not lt!81214))))

(declare-fun lt!81217 () Bool)

(assert (=> d!50889 (= lt!81214 lt!81217)))

(declare-fun lt!81215 () Unit!4904)

(declare-fun e!100994 () Unit!4904)

(assert (=> d!50889 (= lt!81215 e!100994)))

(declare-fun c!29634 () Bool)

(assert (=> d!50889 (= c!29634 lt!81217)))

(assert (=> d!50889 (= lt!81217 (containsKey!187 (toList!896 lt!80978) lt!80965))))

(assert (=> d!50889 (= (contains!947 lt!80978 lt!80965) lt!81214)))

(declare-fun b!154600 () Bool)

(declare-fun lt!81216 () Unit!4904)

(assert (=> b!154600 (= e!100994 lt!81216)))

(assert (=> b!154600 (= lt!81216 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!80978) lt!80965))))

(assert (=> b!154600 (isDefined!136 (getValueByKey!184 (toList!896 lt!80978) lt!80965))))

(declare-fun b!154601 () Bool)

(declare-fun Unit!4921 () Unit!4904)

(assert (=> b!154601 (= e!100994 Unit!4921)))

(declare-fun b!154602 () Bool)

(assert (=> b!154602 (= e!100995 (isDefined!136 (getValueByKey!184 (toList!896 lt!80978) lt!80965)))))

(assert (= (and d!50889 c!29634) b!154600))

(assert (= (and d!50889 (not c!29634)) b!154601))

(assert (= (and d!50889 (not res!72981)) b!154602))

(declare-fun m!188731 () Bool)

(assert (=> d!50889 m!188731))

(declare-fun m!188733 () Bool)

(assert (=> b!154600 m!188733))

(assert (=> b!154600 m!188315))

(assert (=> b!154600 m!188315))

(declare-fun m!188735 () Bool)

(assert (=> b!154600 m!188735))

(assert (=> b!154602 m!188315))

(assert (=> b!154602 m!188315))

(assert (=> b!154602 m!188735))

(assert (=> d!50721 d!50889))

(assert (=> d!50721 d!50707))

(declare-fun d!50891 () Bool)

(assert (=> d!50891 (= (apply!128 (+!189 lt!80978 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!80965) (apply!128 lt!80978 lt!80965))))

(assert (=> d!50891 true))

(declare-fun _$34!1043 () Unit!4904)

(assert (=> d!50891 (= (choose!924 lt!80978 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))) lt!80965) _$34!1043)))

(declare-fun bs!6564 () Bool)

(assert (= bs!6564 d!50891))

(assert (=> bs!6564 m!188071))

(assert (=> bs!6564 m!188071))

(assert (=> bs!6564 m!188075))

(assert (=> bs!6564 m!188069))

(assert (=> d!50721 d!50891))

(assert (=> d!50721 d!50713))

(assert (=> d!50721 d!50715))

(declare-fun d!50893 () Bool)

(declare-fun e!100997 () Bool)

(assert (=> d!50893 e!100997))

(declare-fun res!72982 () Bool)

(assert (=> d!50893 (=> res!72982 e!100997)))

(declare-fun lt!81218 () Bool)

(assert (=> d!50893 (= res!72982 (not lt!81218))))

(declare-fun lt!81221 () Bool)

(assert (=> d!50893 (= lt!81218 lt!81221)))

(declare-fun lt!81219 () Unit!4904)

(declare-fun e!100996 () Unit!4904)

(assert (=> d!50893 (= lt!81219 e!100996)))

(declare-fun c!29635 () Bool)

(assert (=> d!50893 (= c!29635 lt!81221)))

(assert (=> d!50893 (= lt!81221 (containsKey!187 (toList!896 lt!80984) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50893 (= (contains!947 lt!80984 #b0000000000000000000000000000000000000000000000000000000000000000) lt!81218)))

(declare-fun b!154603 () Bool)

(declare-fun lt!81220 () Unit!4904)

(assert (=> b!154603 (= e!100996 lt!81220)))

(assert (=> b!154603 (= lt!81220 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!80984) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154603 (isDefined!136 (getValueByKey!184 (toList!896 lt!80984) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154604 () Bool)

(declare-fun Unit!4922 () Unit!4904)

(assert (=> b!154604 (= e!100996 Unit!4922)))

(declare-fun b!154605 () Bool)

(assert (=> b!154605 (= e!100997 (isDefined!136 (getValueByKey!184 (toList!896 lt!80984) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50893 c!29635) b!154603))

(assert (= (and d!50893 (not c!29635)) b!154604))

(assert (= (and d!50893 (not res!72982)) b!154605))

(declare-fun m!188737 () Bool)

(assert (=> d!50893 m!188737))

(declare-fun m!188739 () Bool)

(assert (=> b!154603 m!188739))

(assert (=> b!154603 m!188653))

(assert (=> b!154603 m!188653))

(declare-fun m!188741 () Bool)

(assert (=> b!154603 m!188741))

(assert (=> b!154605 m!188653))

(assert (=> b!154605 m!188653))

(assert (=> b!154605 m!188741))

(assert (=> bm!17142 d!50893))

(declare-fun d!50895 () Bool)

(assert (=> d!50895 (= (get!1615 (getValueByKey!184 (toList!896 (+!189 lt!80978 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80965)) (v!3423 (getValueByKey!184 (toList!896 (+!189 lt!80978 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80965)))))

(assert (=> d!50707 d!50895))

(declare-fun e!100998 () Option!190)

(declare-fun b!154606 () Bool)

(assert (=> b!154606 (= e!100998 (Some!189 (_2!1392 (h!2394 (toList!896 (+!189 lt!80978 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))))

(declare-fun d!50897 () Bool)

(declare-fun c!29636 () Bool)

(assert (=> d!50897 (= c!29636 (and ((_ is Cons!1785) (toList!896 (+!189 lt!80978 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))) (= (_1!1392 (h!2394 (toList!896 (+!189 lt!80978 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))) lt!80965)))))

(assert (=> d!50897 (= (getValueByKey!184 (toList!896 (+!189 lt!80978 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80965) e!100998)))

(declare-fun b!154608 () Bool)

(declare-fun e!100999 () Option!190)

(assert (=> b!154608 (= e!100999 (getValueByKey!184 (t!6575 (toList!896 (+!189 lt!80978 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))) lt!80965))))

(declare-fun b!154607 () Bool)

(assert (=> b!154607 (= e!100998 e!100999)))

(declare-fun c!29637 () Bool)

(assert (=> b!154607 (= c!29637 (and ((_ is Cons!1785) (toList!896 (+!189 lt!80978 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))) (not (= (_1!1392 (h!2394 (toList!896 (+!189 lt!80978 (tuple2!2763 lt!80969 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))) lt!80965))))))

(declare-fun b!154609 () Bool)

(assert (=> b!154609 (= e!100999 None!188)))

(assert (= (and d!50897 c!29636) b!154606))

(assert (= (and d!50897 (not c!29636)) b!154607))

(assert (= (and b!154607 c!29637) b!154608))

(assert (= (and b!154607 (not c!29637)) b!154609))

(declare-fun m!188743 () Bool)

(assert (=> b!154608 m!188743))

(assert (=> d!50707 d!50897))

(declare-fun d!50899 () Bool)

(assert (=> d!50899 (= (apply!128 lt!81006 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1615 (getValueByKey!184 (toList!896 lt!81006) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6565 () Bool)

(assert (= bs!6565 d!50899))

(assert (=> bs!6565 m!188635))

(assert (=> bs!6565 m!188635))

(declare-fun m!188745 () Bool)

(assert (=> bs!6565 m!188745))

(assert (=> b!154256 d!50899))

(assert (=> b!154290 d!50787))

(assert (=> b!154290 d!50789))

(declare-fun b!154610 () Bool)

(declare-fun e!101000 () Bool)

(assert (=> b!154610 (= e!101000 (contains!949 Nil!1787 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154611 () Bool)

(declare-fun e!101001 () Bool)

(declare-fun call!17184 () Bool)

(assert (=> b!154611 (= e!101001 call!17184)))

(declare-fun b!154612 () Bool)

(assert (=> b!154612 (= e!101001 call!17184)))

(declare-fun bm!17181 () Bool)

(declare-fun c!29638 () Bool)

(assert (=> bm!17181 (= call!17184 (arrayNoDuplicates!0 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29638 (Cons!1786 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000) Nil!1787) Nil!1787)))))

(declare-fun b!154613 () Bool)

(declare-fun e!101002 () Bool)

(assert (=> b!154613 (= e!101002 e!101001)))

(assert (=> b!154613 (= c!29638 (validKeyInArray!0 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154614 () Bool)

(declare-fun e!101003 () Bool)

(assert (=> b!154614 (= e!101003 e!101002)))

(declare-fun res!72985 () Bool)

(assert (=> b!154614 (=> (not res!72985) (not e!101002))))

(assert (=> b!154614 (= res!72985 (not e!101000))))

(declare-fun res!72984 () Bool)

(assert (=> b!154614 (=> (not res!72984) (not e!101000))))

(assert (=> b!154614 (= res!72984 (validKeyInArray!0 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!50901 () Bool)

(declare-fun res!72983 () Bool)

(assert (=> d!50901 (=> res!72983 e!101003)))

(assert (=> d!50901 (= res!72983 (bvsge #b00000000000000000000000000000000 (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(assert (=> d!50901 (= (arrayNoDuplicates!0 (_keys!4836 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000000 Nil!1787) e!101003)))

(assert (= (and d!50901 (not res!72983)) b!154614))

(assert (= (and b!154614 res!72984) b!154610))

(assert (= (and b!154614 res!72985) b!154613))

(assert (= (and b!154613 c!29638) b!154611))

(assert (= (and b!154613 (not c!29638)) b!154612))

(assert (= (or b!154611 b!154612) bm!17181))

(assert (=> b!154610 m!188151))

(assert (=> b!154610 m!188151))

(declare-fun m!188747 () Bool)

(assert (=> b!154610 m!188747))

(assert (=> bm!17181 m!188151))

(declare-fun m!188749 () Bool)

(assert (=> bm!17181 m!188749))

(assert (=> b!154613 m!188151))

(assert (=> b!154613 m!188151))

(assert (=> b!154613 m!188153))

(assert (=> b!154614 m!188151))

(assert (=> b!154614 m!188151))

(assert (=> b!154614 m!188153))

(assert (=> b!154370 d!50901))

(declare-fun d!50903 () Bool)

(declare-fun lt!81222 () Bool)

(assert (=> d!50903 (= lt!81222 (select (content!146 (toList!896 lt!81110)) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun e!101005 () Bool)

(assert (=> d!50903 (= lt!81222 e!101005)))

(declare-fun res!72986 () Bool)

(assert (=> d!50903 (=> (not res!72986) (not e!101005))))

(assert (=> d!50903 (= res!72986 ((_ is Cons!1785) (toList!896 lt!81110)))))

(assert (=> d!50903 (= (contains!948 (toList!896 lt!81110) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81222)))

(declare-fun b!154615 () Bool)

(declare-fun e!101004 () Bool)

(assert (=> b!154615 (= e!101005 e!101004)))

(declare-fun res!72987 () Bool)

(assert (=> b!154615 (=> res!72987 e!101004)))

(assert (=> b!154615 (= res!72987 (= (h!2394 (toList!896 lt!81110)) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun b!154616 () Bool)

(assert (=> b!154616 (= e!101004 (contains!948 (t!6575 (toList!896 lt!81110)) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(assert (= (and d!50903 res!72986) b!154615))

(assert (= (and b!154615 (not res!72987)) b!154616))

(declare-fun m!188751 () Bool)

(assert (=> d!50903 m!188751))

(declare-fun m!188753 () Bool)

(assert (=> d!50903 m!188753))

(declare-fun m!188755 () Bool)

(assert (=> b!154616 m!188755))

(assert (=> b!154367 d!50903))

(declare-fun d!50905 () Bool)

(declare-fun e!101006 () Bool)

(assert (=> d!50905 e!101006))

(declare-fun res!72989 () Bool)

(assert (=> d!50905 (=> (not res!72989) (not e!101006))))

(declare-fun lt!81223 () ListLongMap!1761)

(assert (=> d!50905 (= res!72989 (contains!947 lt!81223 (_1!1392 (ite (or c!29531 c!29530) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))))))))

(declare-fun lt!81224 () List!1789)

(assert (=> d!50905 (= lt!81223 (ListLongMap!1762 lt!81224))))

(declare-fun lt!81226 () Unit!4904)

(declare-fun lt!81225 () Unit!4904)

(assert (=> d!50905 (= lt!81226 lt!81225)))

(assert (=> d!50905 (= (getValueByKey!184 lt!81224 (_1!1392 (ite (or c!29531 c!29530) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))))) (Some!189 (_2!1392 (ite (or c!29531 c!29530) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))))))))

(assert (=> d!50905 (= lt!81225 (lemmaContainsTupThenGetReturnValue!97 lt!81224 (_1!1392 (ite (or c!29531 c!29530) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))) (_2!1392 (ite (or c!29531 c!29530) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))))))))

(assert (=> d!50905 (= lt!81224 (insertStrictlySorted!100 (toList!896 (ite c!29531 call!17145 (ite c!29530 call!17149 call!17148))) (_1!1392 (ite (or c!29531 c!29530) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))) (_2!1392 (ite (or c!29531 c!29530) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))))))))

(assert (=> d!50905 (= (+!189 (ite c!29531 call!17145 (ite c!29530 call!17149 call!17148)) (ite (or c!29531 c!29530) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))) lt!81223)))

(declare-fun b!154617 () Bool)

(declare-fun res!72988 () Bool)

(assert (=> b!154617 (=> (not res!72988) (not e!101006))))

(assert (=> b!154617 (= res!72988 (= (getValueByKey!184 (toList!896 lt!81223) (_1!1392 (ite (or c!29531 c!29530) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))))) (Some!189 (_2!1392 (ite (or c!29531 c!29530) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))))))))

(declare-fun b!154618 () Bool)

(assert (=> b!154618 (= e!101006 (contains!948 (toList!896 lt!81223) (ite (or c!29531 c!29530) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))))))

(assert (= (and d!50905 res!72989) b!154617))

(assert (= (and b!154617 res!72988) b!154618))

(declare-fun m!188757 () Bool)

(assert (=> d!50905 m!188757))

(declare-fun m!188759 () Bool)

(assert (=> d!50905 m!188759))

(declare-fun m!188761 () Bool)

(assert (=> d!50905 m!188761))

(declare-fun m!188763 () Bool)

(assert (=> d!50905 m!188763))

(declare-fun m!188765 () Bool)

(assert (=> b!154617 m!188765))

(declare-fun m!188767 () Bool)

(assert (=> b!154618 m!188767))

(assert (=> bm!17148 d!50905))

(declare-fun d!50907 () Bool)

(assert (=> d!50907 (not (contains!947 (+!189 lt!81062 (tuple2!2763 lt!81064 lt!81065)) lt!81060))))

(declare-fun lt!81229 () Unit!4904)

(declare-fun choose!928 (ListLongMap!1761 (_ BitVec 64) V!3681 (_ BitVec 64)) Unit!4904)

(assert (=> d!50907 (= lt!81229 (choose!928 lt!81062 lt!81064 lt!81065 lt!81060))))

(declare-fun e!101009 () Bool)

(assert (=> d!50907 e!101009))

(declare-fun res!72992 () Bool)

(assert (=> d!50907 (=> (not res!72992) (not e!101009))))

(assert (=> d!50907 (= res!72992 (not (contains!947 lt!81062 lt!81060)))))

(assert (=> d!50907 (= (addStillNotContains!72 lt!81062 lt!81064 lt!81065 lt!81060) lt!81229)))

(declare-fun b!154622 () Bool)

(assert (=> b!154622 (= e!101009 (not (= lt!81064 lt!81060)))))

(assert (= (and d!50907 res!72992) b!154622))

(assert (=> d!50907 m!188233))

(assert (=> d!50907 m!188233))

(assert (=> d!50907 m!188239))

(declare-fun m!188769 () Bool)

(assert (=> d!50907 m!188769))

(declare-fun m!188771 () Bool)

(assert (=> d!50907 m!188771))

(assert (=> b!154331 d!50907))

(assert (=> b!154331 d!50733))

(declare-fun d!50909 () Bool)

(declare-fun e!101011 () Bool)

(assert (=> d!50909 e!101011))

(declare-fun res!72993 () Bool)

(assert (=> d!50909 (=> res!72993 e!101011)))

(declare-fun lt!81230 () Bool)

(assert (=> d!50909 (= res!72993 (not lt!81230))))

(declare-fun lt!81233 () Bool)

(assert (=> d!50909 (= lt!81230 lt!81233)))

(declare-fun lt!81231 () Unit!4904)

(declare-fun e!101010 () Unit!4904)

(assert (=> d!50909 (= lt!81231 e!101010)))

(declare-fun c!29639 () Bool)

(assert (=> d!50909 (= c!29639 lt!81233)))

(assert (=> d!50909 (= lt!81233 (containsKey!187 (toList!896 (+!189 lt!81062 (tuple2!2763 lt!81064 lt!81065))) lt!81060))))

(assert (=> d!50909 (= (contains!947 (+!189 lt!81062 (tuple2!2763 lt!81064 lt!81065)) lt!81060) lt!81230)))

(declare-fun b!154623 () Bool)

(declare-fun lt!81232 () Unit!4904)

(assert (=> b!154623 (= e!101010 lt!81232)))

(assert (=> b!154623 (= lt!81232 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 (+!189 lt!81062 (tuple2!2763 lt!81064 lt!81065))) lt!81060))))

(assert (=> b!154623 (isDefined!136 (getValueByKey!184 (toList!896 (+!189 lt!81062 (tuple2!2763 lt!81064 lt!81065))) lt!81060))))

(declare-fun b!154624 () Bool)

(declare-fun Unit!4923 () Unit!4904)

(assert (=> b!154624 (= e!101010 Unit!4923)))

(declare-fun b!154625 () Bool)

(assert (=> b!154625 (= e!101011 (isDefined!136 (getValueByKey!184 (toList!896 (+!189 lt!81062 (tuple2!2763 lt!81064 lt!81065))) lt!81060)))))

(assert (= (and d!50909 c!29639) b!154623))

(assert (= (and d!50909 (not c!29639)) b!154624))

(assert (= (and d!50909 (not res!72993)) b!154625))

(declare-fun m!188773 () Bool)

(assert (=> d!50909 m!188773))

(declare-fun m!188775 () Bool)

(assert (=> b!154623 m!188775))

(declare-fun m!188777 () Bool)

(assert (=> b!154623 m!188777))

(assert (=> b!154623 m!188777))

(declare-fun m!188779 () Bool)

(assert (=> b!154623 m!188779))

(assert (=> b!154625 m!188777))

(assert (=> b!154625 m!188777))

(assert (=> b!154625 m!188779))

(assert (=> b!154331 d!50909))

(declare-fun d!50911 () Bool)

(declare-fun e!101012 () Bool)

(assert (=> d!50911 e!101012))

(declare-fun res!72995 () Bool)

(assert (=> d!50911 (=> (not res!72995) (not e!101012))))

(declare-fun lt!81234 () ListLongMap!1761)

(assert (=> d!50911 (= res!72995 (contains!947 lt!81234 (_1!1392 (tuple2!2763 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!81235 () List!1789)

(assert (=> d!50911 (= lt!81234 (ListLongMap!1762 lt!81235))))

(declare-fun lt!81237 () Unit!4904)

(declare-fun lt!81236 () Unit!4904)

(assert (=> d!50911 (= lt!81237 lt!81236)))

(assert (=> d!50911 (= (getValueByKey!184 lt!81235 (_1!1392 (tuple2!2763 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!189 (_2!1392 (tuple2!2763 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!50911 (= lt!81236 (lemmaContainsTupThenGetReturnValue!97 lt!81235 (_1!1392 (tuple2!2763 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1392 (tuple2!2763 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!50911 (= lt!81235 (insertStrictlySorted!100 (toList!896 call!17164) (_1!1392 (tuple2!2763 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1392 (tuple2!2763 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!50911 (= (+!189 call!17164 (tuple2!2763 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!81234)))

(declare-fun b!154626 () Bool)

(declare-fun res!72994 () Bool)

(assert (=> b!154626 (=> (not res!72994) (not e!101012))))

(assert (=> b!154626 (= res!72994 (= (getValueByKey!184 (toList!896 lt!81234) (_1!1392 (tuple2!2763 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!189 (_2!1392 (tuple2!2763 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!154627 () Bool)

(assert (=> b!154627 (= e!101012 (contains!948 (toList!896 lt!81234) (tuple2!2763 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!50911 res!72995) b!154626))

(assert (= (and b!154626 res!72994) b!154627))

(declare-fun m!188781 () Bool)

(assert (=> d!50911 m!188781))

(declare-fun m!188783 () Bool)

(assert (=> d!50911 m!188783))

(declare-fun m!188785 () Bool)

(assert (=> d!50911 m!188785))

(declare-fun m!188787 () Bool)

(assert (=> d!50911 m!188787))

(declare-fun m!188789 () Bool)

(assert (=> b!154626 m!188789))

(declare-fun m!188791 () Bool)

(assert (=> b!154627 m!188791))

(assert (=> b!154331 d!50911))

(declare-fun d!50913 () Bool)

(declare-fun e!101013 () Bool)

(assert (=> d!50913 e!101013))

(declare-fun res!72997 () Bool)

(assert (=> d!50913 (=> (not res!72997) (not e!101013))))

(declare-fun lt!81238 () ListLongMap!1761)

(assert (=> d!50913 (= res!72997 (contains!947 lt!81238 (_1!1392 (tuple2!2763 lt!81064 lt!81065))))))

(declare-fun lt!81239 () List!1789)

(assert (=> d!50913 (= lt!81238 (ListLongMap!1762 lt!81239))))

(declare-fun lt!81241 () Unit!4904)

(declare-fun lt!81240 () Unit!4904)

(assert (=> d!50913 (= lt!81241 lt!81240)))

(assert (=> d!50913 (= (getValueByKey!184 lt!81239 (_1!1392 (tuple2!2763 lt!81064 lt!81065))) (Some!189 (_2!1392 (tuple2!2763 lt!81064 lt!81065))))))

(assert (=> d!50913 (= lt!81240 (lemmaContainsTupThenGetReturnValue!97 lt!81239 (_1!1392 (tuple2!2763 lt!81064 lt!81065)) (_2!1392 (tuple2!2763 lt!81064 lt!81065))))))

(assert (=> d!50913 (= lt!81239 (insertStrictlySorted!100 (toList!896 lt!81062) (_1!1392 (tuple2!2763 lt!81064 lt!81065)) (_2!1392 (tuple2!2763 lt!81064 lt!81065))))))

(assert (=> d!50913 (= (+!189 lt!81062 (tuple2!2763 lt!81064 lt!81065)) lt!81238)))

(declare-fun b!154628 () Bool)

(declare-fun res!72996 () Bool)

(assert (=> b!154628 (=> (not res!72996) (not e!101013))))

(assert (=> b!154628 (= res!72996 (= (getValueByKey!184 (toList!896 lt!81238) (_1!1392 (tuple2!2763 lt!81064 lt!81065))) (Some!189 (_2!1392 (tuple2!2763 lt!81064 lt!81065)))))))

(declare-fun b!154629 () Bool)

(assert (=> b!154629 (= e!101013 (contains!948 (toList!896 lt!81238) (tuple2!2763 lt!81064 lt!81065)))))

(assert (= (and d!50913 res!72997) b!154628))

(assert (= (and b!154628 res!72996) b!154629))

(declare-fun m!188793 () Bool)

(assert (=> d!50913 m!188793))

(declare-fun m!188795 () Bool)

(assert (=> d!50913 m!188795))

(declare-fun m!188797 () Bool)

(assert (=> d!50913 m!188797))

(declare-fun m!188799 () Bool)

(assert (=> d!50913 m!188799))

(declare-fun m!188801 () Bool)

(assert (=> b!154628 m!188801))

(declare-fun m!188803 () Bool)

(assert (=> b!154629 m!188803))

(assert (=> b!154331 d!50913))

(assert (=> b!154403 d!50739))

(declare-fun d!50915 () Bool)

(declare-fun e!101015 () Bool)

(assert (=> d!50915 e!101015))

(declare-fun res!72998 () Bool)

(assert (=> d!50915 (=> res!72998 e!101015)))

(declare-fun lt!81242 () Bool)

(assert (=> d!50915 (= res!72998 (not lt!81242))))

(declare-fun lt!81245 () Bool)

(assert (=> d!50915 (= lt!81242 lt!81245)))

(declare-fun lt!81243 () Unit!4904)

(declare-fun e!101014 () Unit!4904)

(assert (=> d!50915 (= lt!81243 e!101014)))

(declare-fun c!29640 () Bool)

(assert (=> d!50915 (= c!29640 lt!81245)))

(assert (=> d!50915 (= lt!81245 (containsKey!187 (toList!896 lt!80984) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50915 (= (contains!947 lt!80984 #b1000000000000000000000000000000000000000000000000000000000000000) lt!81242)))

(declare-fun b!154630 () Bool)

(declare-fun lt!81244 () Unit!4904)

(assert (=> b!154630 (= e!101014 lt!81244)))

(assert (=> b!154630 (= lt!81244 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!80984) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154630 (isDefined!136 (getValueByKey!184 (toList!896 lt!80984) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154631 () Bool)

(declare-fun Unit!4924 () Unit!4904)

(assert (=> b!154631 (= e!101014 Unit!4924)))

(declare-fun b!154632 () Bool)

(assert (=> b!154632 (= e!101015 (isDefined!136 (getValueByKey!184 (toList!896 lt!80984) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50915 c!29640) b!154630))

(assert (= (and d!50915 (not c!29640)) b!154631))

(assert (= (and d!50915 (not res!72998)) b!154632))

(declare-fun m!188805 () Bool)

(assert (=> d!50915 m!188805))

(declare-fun m!188807 () Bool)

(assert (=> b!154630 m!188807))

(declare-fun m!188809 () Bool)

(assert (=> b!154630 m!188809))

(assert (=> b!154630 m!188809))

(declare-fun m!188811 () Bool)

(assert (=> b!154630 m!188811))

(assert (=> b!154632 m!188809))

(assert (=> b!154632 m!188809))

(assert (=> b!154632 m!188811))

(assert (=> bm!17146 d!50915))

(declare-fun d!50917 () Bool)

(declare-fun res!72999 () Bool)

(declare-fun e!101016 () Bool)

(assert (=> d!50917 (=> res!72999 e!101016)))

(assert (=> d!50917 (= res!72999 (and ((_ is Cons!1785) (toList!896 lt!80962)) (= (_1!1392 (h!2394 (toList!896 lt!80962))) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!50917 (= (containsKey!187 (toList!896 lt!80962) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!101016)))

(declare-fun b!154633 () Bool)

(declare-fun e!101017 () Bool)

(assert (=> b!154633 (= e!101016 e!101017)))

(declare-fun res!73000 () Bool)

(assert (=> b!154633 (=> (not res!73000) (not e!101017))))

(assert (=> b!154633 (= res!73000 (and (or (not ((_ is Cons!1785) (toList!896 lt!80962))) (bvsle (_1!1392 (h!2394 (toList!896 lt!80962))) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) ((_ is Cons!1785) (toList!896 lt!80962)) (bvslt (_1!1392 (h!2394 (toList!896 lt!80962))) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun b!154634 () Bool)

(assert (=> b!154634 (= e!101017 (containsKey!187 (t!6575 (toList!896 lt!80962)) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!50917 (not res!72999)) b!154633))

(assert (= (and b!154633 res!73000) b!154634))

(assert (=> b!154634 m!188021))

(declare-fun m!188813 () Bool)

(assert (=> b!154634 m!188813))

(assert (=> d!50677 d!50917))

(declare-fun d!50919 () Bool)

(declare-fun e!101019 () Bool)

(assert (=> d!50919 e!101019))

(declare-fun res!73001 () Bool)

(assert (=> d!50919 (=> res!73001 e!101019)))

(declare-fun lt!81246 () Bool)

(assert (=> d!50919 (= res!73001 (not lt!81246))))

(declare-fun lt!81249 () Bool)

(assert (=> d!50919 (= lt!81246 lt!81249)))

(declare-fun lt!81247 () Unit!4904)

(declare-fun e!101018 () Unit!4904)

(assert (=> d!50919 (= lt!81247 e!101018)))

(declare-fun c!29641 () Bool)

(assert (=> d!50919 (= c!29641 lt!81249)))

(assert (=> d!50919 (= lt!81249 (containsKey!187 (toList!896 lt!80984) (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!50919 (= (contains!947 lt!80984 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)) lt!81246)))

(declare-fun b!154635 () Bool)

(declare-fun lt!81248 () Unit!4904)

(assert (=> b!154635 (= e!101018 lt!81248)))

(assert (=> b!154635 (= lt!81248 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!80984) (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!154635 (isDefined!136 (getValueByKey!184 (toList!896 lt!80984) (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154636 () Bool)

(declare-fun Unit!4925 () Unit!4904)

(assert (=> b!154636 (= e!101018 Unit!4925)))

(declare-fun b!154637 () Bool)

(assert (=> b!154637 (= e!101019 (isDefined!136 (getValueByKey!184 (toList!896 lt!80984) (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!50919 c!29641) b!154635))

(assert (= (and d!50919 (not c!29641)) b!154636))

(assert (= (and d!50919 (not res!73001)) b!154637))

(assert (=> d!50919 m!188091))

(declare-fun m!188815 () Bool)

(assert (=> d!50919 m!188815))

(assert (=> b!154635 m!188091))

(declare-fun m!188817 () Bool)

(assert (=> b!154635 m!188817))

(assert (=> b!154635 m!188091))

(assert (=> b!154635 m!188579))

(assert (=> b!154635 m!188579))

(declare-fun m!188819 () Bool)

(assert (=> b!154635 m!188819))

(assert (=> b!154637 m!188091))

(assert (=> b!154637 m!188579))

(assert (=> b!154637 m!188579))

(assert (=> b!154637 m!188819))

(assert (=> b!154225 d!50919))

(assert (=> b!154341 d!50821))

(assert (=> b!154341 d!50823))

(declare-fun d!50921 () Bool)

(declare-fun lt!81250 () Bool)

(assert (=> d!50921 (= lt!81250 (select (content!146 (toList!896 lt!81105)) (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun e!101021 () Bool)

(assert (=> d!50921 (= lt!81250 e!101021)))

(declare-fun res!73002 () Bool)

(assert (=> d!50921 (=> (not res!73002) (not e!101021))))

(assert (=> d!50921 (= res!73002 ((_ is Cons!1785) (toList!896 lt!81105)))))

(assert (=> d!50921 (= (contains!948 (toList!896 lt!81105) (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81250)))

(declare-fun b!154638 () Bool)

(declare-fun e!101020 () Bool)

(assert (=> b!154638 (= e!101021 e!101020)))

(declare-fun res!73003 () Bool)

(assert (=> b!154638 (=> res!73003 e!101020)))

(assert (=> b!154638 (= res!73003 (= (h!2394 (toList!896 lt!81105)) (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun b!154639 () Bool)

(assert (=> b!154639 (= e!101020 (contains!948 (t!6575 (toList!896 lt!81105)) (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(assert (= (and d!50921 res!73002) b!154638))

(assert (= (and b!154638 (not res!73003)) b!154639))

(declare-fun m!188821 () Bool)

(assert (=> d!50921 m!188821))

(declare-fun m!188823 () Bool)

(assert (=> d!50921 m!188823))

(declare-fun m!188825 () Bool)

(assert (=> b!154639 m!188825))

(assert (=> b!154364 d!50921))

(declare-fun d!50923 () Bool)

(assert (=> d!50923 (isDefined!136 (getValueByKey!184 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80981))))

(declare-fun lt!81251 () Unit!4904)

(assert (=> d!50923 (= lt!81251 (choose!926 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80981))))

(declare-fun e!101022 () Bool)

(assert (=> d!50923 e!101022))

(declare-fun res!73004 () Bool)

(assert (=> d!50923 (=> (not res!73004) (not e!101022))))

(assert (=> d!50923 (= res!73004 (isStrictlySorted!317 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!50923 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80981) lt!81251)))

(declare-fun b!154640 () Bool)

(assert (=> b!154640 (= e!101022 (containsKey!187 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80981))))

(assert (= (and d!50923 res!73004) b!154640))

(assert (=> d!50923 m!188335))

(assert (=> d!50923 m!188335))

(assert (=> d!50923 m!188337))

(declare-fun m!188827 () Bool)

(assert (=> d!50923 m!188827))

(declare-fun m!188829 () Bool)

(assert (=> d!50923 m!188829))

(assert (=> b!154640 m!188331))

(assert (=> b!154360 d!50923))

(assert (=> b!154360 d!50863))

(assert (=> b!154360 d!50865))

(declare-fun d!50925 () Bool)

(declare-fun lt!81254 () Bool)

(declare-fun content!147 (List!1790) (InoxSet (_ BitVec 64)))

(assert (=> d!50925 (= lt!81254 (select (content!147 Nil!1787) (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!101028 () Bool)

(assert (=> d!50925 (= lt!81254 e!101028)))

(declare-fun res!73010 () Bool)

(assert (=> d!50925 (=> (not res!73010) (not e!101028))))

(assert (=> d!50925 (= res!73010 ((_ is Cons!1786) Nil!1787))))

(assert (=> d!50925 (= (contains!949 Nil!1787 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)) lt!81254)))

(declare-fun b!154645 () Bool)

(declare-fun e!101027 () Bool)

(assert (=> b!154645 (= e!101028 e!101027)))

(declare-fun res!73009 () Bool)

(assert (=> b!154645 (=> res!73009 e!101027)))

(assert (=> b!154645 (= res!73009 (= (h!2395 Nil!1787) (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154646 () Bool)

(assert (=> b!154646 (= e!101027 (contains!949 (t!6580 Nil!1787) (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!50925 res!73010) b!154645))

(assert (= (and b!154645 (not res!73009)) b!154646))

(declare-fun m!188831 () Bool)

(assert (=> d!50925 m!188831))

(assert (=> d!50925 m!188091))

(declare-fun m!188833 () Bool)

(assert (=> d!50925 m!188833))

(assert (=> b!154646 m!188091))

(declare-fun m!188835 () Bool)

(assert (=> b!154646 m!188835))

(assert (=> b!154399 d!50925))

(assert (=> b!154275 d!50827))

(assert (=> b!154275 d!50829))

(assert (=> b!154402 d!50739))

(declare-fun d!50927 () Bool)

(assert (=> d!50927 (= (apply!128 lt!81006 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)) (get!1615 (getValueByKey!184 (toList!896 lt!81006) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000))))))

(declare-fun bs!6566 () Bool)

(assert (= bs!6566 d!50927))

(assert (=> bs!6566 m!188151))

(assert (=> bs!6566 m!188611))

(assert (=> bs!6566 m!188611))

(declare-fun m!188837 () Bool)

(assert (=> bs!6566 m!188837))

(assert (=> b!154264 d!50927))

(declare-fun d!50929 () Bool)

(declare-fun c!29642 () Bool)

(assert (=> d!50929 (= c!29642 ((_ is ValueCellFull!1169) (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!101029 () V!3681)

(assert (=> d!50929 (= (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!101029)))

(declare-fun b!154647 () Bool)

(assert (=> b!154647 (= e!101029 (get!1616 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154648 () Bool)

(assert (=> b!154648 (= e!101029 (get!1617 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50929 c!29642) b!154647))

(assert (= (and d!50929 (not c!29642)) b!154648))

(assert (=> b!154647 m!188163))

(assert (=> b!154647 m!188037))

(declare-fun m!188839 () Bool)

(assert (=> b!154647 m!188839))

(assert (=> b!154648 m!188163))

(assert (=> b!154648 m!188037))

(declare-fun m!188841 () Bool)

(assert (=> b!154648 m!188841))

(assert (=> b!154264 d!50929))

(declare-fun b!154649 () Bool)

(declare-fun e!101030 () Option!190)

(assert (=> b!154649 (= e!101030 (Some!189 (_2!1392 (h!2394 (toList!896 lt!81078)))))))

(declare-fun c!29643 () Bool)

(declare-fun d!50931 () Bool)

(assert (=> d!50931 (= c!29643 (and ((_ is Cons!1785) (toList!896 lt!81078)) (= (_1!1392 (h!2394 (toList!896 lt!81078))) (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(assert (=> d!50931 (= (getValueByKey!184 (toList!896 lt!81078) (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))) e!101030)))

(declare-fun b!154651 () Bool)

(declare-fun e!101031 () Option!190)

(assert (=> b!154651 (= e!101031 (getValueByKey!184 (t!6575 (toList!896 lt!81078)) (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154650 () Bool)

(assert (=> b!154650 (= e!101030 e!101031)))

(declare-fun c!29644 () Bool)

(assert (=> b!154650 (= c!29644 (and ((_ is Cons!1785) (toList!896 lt!81078)) (not (= (_1!1392 (h!2394 (toList!896 lt!81078))) (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))))

(declare-fun b!154652 () Bool)

(assert (=> b!154652 (= e!101031 None!188)))

(assert (= (and d!50931 c!29643) b!154649))

(assert (= (and d!50931 (not c!29643)) b!154650))

(assert (= (and b!154650 c!29644) b!154651))

(assert (= (and b!154650 (not c!29644)) b!154652))

(declare-fun m!188843 () Bool)

(assert (=> b!154651 m!188843))

(assert (=> b!154346 d!50931))

(declare-fun d!50933 () Bool)

(declare-fun e!101033 () Bool)

(assert (=> d!50933 e!101033))

(declare-fun res!73011 () Bool)

(assert (=> d!50933 (=> res!73011 e!101033)))

(declare-fun lt!81255 () Bool)

(assert (=> d!50933 (= res!73011 (not lt!81255))))

(declare-fun lt!81258 () Bool)

(assert (=> d!50933 (= lt!81255 lt!81258)))

(declare-fun lt!81256 () Unit!4904)

(declare-fun e!101032 () Unit!4904)

(assert (=> d!50933 (= lt!81256 e!101032)))

(declare-fun c!29645 () Bool)

(assert (=> d!50933 (= c!29645 lt!81258)))

(assert (=> d!50933 (= lt!81258 (containsKey!187 (toList!896 lt!81110) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50933 (= (contains!947 lt!81110 (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81255)))

(declare-fun b!154653 () Bool)

(declare-fun lt!81257 () Unit!4904)

(assert (=> b!154653 (= e!101032 lt!81257)))

(assert (=> b!154653 (= lt!81257 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!81110) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> b!154653 (isDefined!136 (getValueByKey!184 (toList!896 lt!81110) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154654 () Bool)

(declare-fun Unit!4926 () Unit!4904)

(assert (=> b!154654 (= e!101032 Unit!4926)))

(declare-fun b!154655 () Bool)

(assert (=> b!154655 (= e!101033 (isDefined!136 (getValueByKey!184 (toList!896 lt!81110) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (= (and d!50933 c!29645) b!154653))

(assert (= (and d!50933 (not c!29645)) b!154654))

(assert (= (and d!50933 (not res!73011)) b!154655))

(declare-fun m!188845 () Bool)

(assert (=> d!50933 m!188845))

(declare-fun m!188847 () Bool)

(assert (=> b!154653 m!188847))

(assert (=> b!154653 m!188371))

(assert (=> b!154653 m!188371))

(declare-fun m!188849 () Bool)

(assert (=> b!154653 m!188849))

(assert (=> b!154655 m!188371))

(assert (=> b!154655 m!188371))

(assert (=> b!154655 m!188849))

(assert (=> d!50727 d!50933))

(declare-fun b!154656 () Bool)

(declare-fun e!101034 () Option!190)

(assert (=> b!154656 (= e!101034 (Some!189 (_2!1392 (h!2394 lt!81111))))))

(declare-fun d!50935 () Bool)

(declare-fun c!29646 () Bool)

(assert (=> d!50935 (= c!29646 (and ((_ is Cons!1785) lt!81111) (= (_1!1392 (h!2394 lt!81111)) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!50935 (= (getValueByKey!184 lt!81111 (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) e!101034)))

(declare-fun b!154658 () Bool)

(declare-fun e!101035 () Option!190)

(assert (=> b!154658 (= e!101035 (getValueByKey!184 (t!6575 lt!81111) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154657 () Bool)

(assert (=> b!154657 (= e!101034 e!101035)))

(declare-fun c!29647 () Bool)

(assert (=> b!154657 (= c!29647 (and ((_ is Cons!1785) lt!81111) (not (= (_1!1392 (h!2394 lt!81111)) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(declare-fun b!154659 () Bool)

(assert (=> b!154659 (= e!101035 None!188)))

(assert (= (and d!50935 c!29646) b!154656))

(assert (= (and d!50935 (not c!29646)) b!154657))

(assert (= (and b!154657 c!29647) b!154658))

(assert (= (and b!154657 (not c!29647)) b!154659))

(declare-fun m!188851 () Bool)

(assert (=> b!154658 m!188851))

(assert (=> d!50727 d!50935))

(declare-fun d!50937 () Bool)

(assert (=> d!50937 (= (getValueByKey!184 lt!81111 (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun lt!81259 () Unit!4904)

(assert (=> d!50937 (= lt!81259 (choose!927 lt!81111 (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun e!101036 () Bool)

(assert (=> d!50937 e!101036))

(declare-fun res!73012 () Bool)

(assert (=> d!50937 (=> (not res!73012) (not e!101036))))

(assert (=> d!50937 (= res!73012 (isStrictlySorted!317 lt!81111))))

(assert (=> d!50937 (= (lemmaContainsTupThenGetReturnValue!97 lt!81111 (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81259)))

(declare-fun b!154660 () Bool)

(declare-fun res!73013 () Bool)

(assert (=> b!154660 (=> (not res!73013) (not e!101036))))

(assert (=> b!154660 (= res!73013 (containsKey!187 lt!81111 (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154661 () Bool)

(assert (=> b!154661 (= e!101036 (contains!948 lt!81111 (tuple2!2763 (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (= (and d!50937 res!73012) b!154660))

(assert (= (and b!154660 res!73013) b!154661))

(assert (=> d!50937 m!188365))

(declare-fun m!188853 () Bool)

(assert (=> d!50937 m!188853))

(declare-fun m!188855 () Bool)

(assert (=> d!50937 m!188855))

(declare-fun m!188857 () Bool)

(assert (=> b!154660 m!188857))

(declare-fun m!188859 () Bool)

(assert (=> b!154661 m!188859))

(assert (=> d!50727 d!50937))

(declare-fun b!154662 () Bool)

(declare-fun res!73015 () Bool)

(declare-fun e!101040 () Bool)

(assert (=> b!154662 (=> (not res!73015) (not e!101040))))

(declare-fun lt!81260 () List!1789)

(assert (=> b!154662 (= res!73015 (containsKey!187 lt!81260 (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun c!29648 () Bool)

(declare-fun c!29651 () Bool)

(declare-fun b!154663 () Bool)

(declare-fun e!101039 () List!1789)

(assert (=> b!154663 (= e!101039 (ite c!29648 (t!6575 (toList!896 call!17143)) (ite c!29651 (Cons!1785 (h!2394 (toList!896 call!17143)) (t!6575 (toList!896 call!17143))) Nil!1786)))))

(declare-fun b!154664 () Bool)

(declare-fun e!101041 () List!1789)

(declare-fun call!17187 () List!1789)

(assert (=> b!154664 (= e!101041 call!17187)))

(declare-fun b!154665 () Bool)

(assert (=> b!154665 (= e!101039 (insertStrictlySorted!100 (t!6575 (toList!896 call!17143)) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun bm!17183 () Bool)

(declare-fun call!17185 () List!1789)

(declare-fun call!17186 () List!1789)

(assert (=> bm!17183 (= call!17185 call!17186)))

(declare-fun d!50939 () Bool)

(assert (=> d!50939 e!101040))

(declare-fun res!73014 () Bool)

(assert (=> d!50939 (=> (not res!73014) (not e!101040))))

(assert (=> d!50939 (= res!73014 (isStrictlySorted!317 lt!81260))))

(assert (=> d!50939 (= lt!81260 e!101041)))

(declare-fun c!29650 () Bool)

(assert (=> d!50939 (= c!29650 (and ((_ is Cons!1785) (toList!896 call!17143)) (bvslt (_1!1392 (h!2394 (toList!896 call!17143))) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!50939 (isStrictlySorted!317 (toList!896 call!17143))))

(assert (=> d!50939 (= (insertStrictlySorted!100 (toList!896 call!17143) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81260)))

(declare-fun bm!17182 () Bool)

(assert (=> bm!17182 (= call!17186 call!17187)))

(declare-fun b!154666 () Bool)

(declare-fun e!101037 () List!1789)

(assert (=> b!154666 (= e!101037 call!17185)))

(declare-fun b!154667 () Bool)

(assert (=> b!154667 (= c!29651 (and ((_ is Cons!1785) (toList!896 call!17143)) (bvsgt (_1!1392 (h!2394 (toList!896 call!17143))) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun e!101038 () List!1789)

(assert (=> b!154667 (= e!101038 e!101037)))

(declare-fun b!154668 () Bool)

(assert (=> b!154668 (= e!101038 call!17186)))

(declare-fun b!154669 () Bool)

(assert (=> b!154669 (= e!101040 (contains!948 lt!81260 (tuple2!2763 (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154670 () Bool)

(assert (=> b!154670 (= e!101041 e!101038)))

(assert (=> b!154670 (= c!29648 (and ((_ is Cons!1785) (toList!896 call!17143)) (= (_1!1392 (h!2394 (toList!896 call!17143))) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154671 () Bool)

(assert (=> b!154671 (= e!101037 call!17185)))

(declare-fun bm!17184 () Bool)

(assert (=> bm!17184 (= call!17187 ($colon$colon!95 e!101039 (ite c!29650 (h!2394 (toList!896 call!17143)) (tuple2!2763 (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(declare-fun c!29649 () Bool)

(assert (=> bm!17184 (= c!29649 c!29650)))

(assert (= (and d!50939 c!29650) b!154664))

(assert (= (and d!50939 (not c!29650)) b!154670))

(assert (= (and b!154670 c!29648) b!154668))

(assert (= (and b!154670 (not c!29648)) b!154667))

(assert (= (and b!154667 c!29651) b!154666))

(assert (= (and b!154667 (not c!29651)) b!154671))

(assert (= (or b!154666 b!154671) bm!17183))

(assert (= (or b!154668 bm!17183) bm!17182))

(assert (= (or b!154664 bm!17182) bm!17184))

(assert (= (and bm!17184 c!29649) b!154665))

(assert (= (and bm!17184 (not c!29649)) b!154663))

(assert (= (and d!50939 res!73014) b!154662))

(assert (= (and b!154662 res!73015) b!154669))

(declare-fun m!188861 () Bool)

(assert (=> b!154669 m!188861))

(declare-fun m!188863 () Bool)

(assert (=> b!154665 m!188863))

(declare-fun m!188865 () Bool)

(assert (=> b!154662 m!188865))

(declare-fun m!188867 () Bool)

(assert (=> bm!17184 m!188867))

(declare-fun m!188869 () Bool)

(assert (=> d!50939 m!188869))

(declare-fun m!188871 () Bool)

(assert (=> d!50939 m!188871))

(assert (=> d!50727 d!50939))

(assert (=> b!154285 d!50887))

(declare-fun d!50941 () Bool)

(declare-fun e!101043 () Bool)

(assert (=> d!50941 e!101043))

(declare-fun res!73016 () Bool)

(assert (=> d!50941 (=> res!73016 e!101043)))

(declare-fun lt!81261 () Bool)

(assert (=> d!50941 (= res!73016 (not lt!81261))))

(declare-fun lt!81264 () Bool)

(assert (=> d!50941 (= lt!81261 lt!81264)))

(declare-fun lt!81262 () Unit!4904)

(declare-fun e!101042 () Unit!4904)

(assert (=> d!50941 (= lt!81262 e!101042)))

(declare-fun c!29652 () Bool)

(assert (=> d!50941 (= c!29652 lt!81264)))

(assert (=> d!50941 (= lt!81264 (containsKey!187 (toList!896 lt!81061) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50941 (= (contains!947 lt!81061 #b1000000000000000000000000000000000000000000000000000000000000000) lt!81261)))

(declare-fun b!154672 () Bool)

(declare-fun lt!81263 () Unit!4904)

(assert (=> b!154672 (= e!101042 lt!81263)))

(assert (=> b!154672 (= lt!81263 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!81061) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154672 (isDefined!136 (getValueByKey!184 (toList!896 lt!81061) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154673 () Bool)

(declare-fun Unit!4927 () Unit!4904)

(assert (=> b!154673 (= e!101042 Unit!4927)))

(declare-fun b!154674 () Bool)

(assert (=> b!154674 (= e!101043 (isDefined!136 (getValueByKey!184 (toList!896 lt!81061) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50941 c!29652) b!154672))

(assert (= (and d!50941 (not c!29652)) b!154673))

(assert (= (and d!50941 (not res!73016)) b!154674))

(declare-fun m!188873 () Bool)

(assert (=> d!50941 m!188873))

(declare-fun m!188875 () Bool)

(assert (=> b!154672 m!188875))

(declare-fun m!188877 () Bool)

(assert (=> b!154672 m!188877))

(assert (=> b!154672 m!188877))

(declare-fun m!188879 () Bool)

(assert (=> b!154672 m!188879))

(assert (=> b!154674 m!188877))

(assert (=> b!154674 m!188877))

(assert (=> b!154674 m!188879))

(assert (=> b!154338 d!50941))

(assert (=> b!154236 d!50739))

(declare-fun d!50943 () Bool)

(declare-fun e!101045 () Bool)

(assert (=> d!50943 e!101045))

(declare-fun res!73017 () Bool)

(assert (=> d!50943 (=> res!73017 e!101045)))

(declare-fun lt!81265 () Bool)

(assert (=> d!50943 (= res!73017 (not lt!81265))))

(declare-fun lt!81268 () Bool)

(assert (=> d!50943 (= lt!81265 lt!81268)))

(declare-fun lt!81266 () Unit!4904)

(declare-fun e!101044 () Unit!4904)

(assert (=> d!50943 (= lt!81266 e!101044)))

(declare-fun c!29653 () Bool)

(assert (=> d!50943 (= c!29653 lt!81268)))

(assert (=> d!50943 (= lt!81268 (containsKey!187 (toList!896 lt!81078) (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!50943 (= (contains!947 lt!81078 (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))) lt!81265)))

(declare-fun b!154675 () Bool)

(declare-fun lt!81267 () Unit!4904)

(assert (=> b!154675 (= e!101044 lt!81267)))

(assert (=> b!154675 (= lt!81267 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!81078) (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> b!154675 (isDefined!136 (getValueByKey!184 (toList!896 lt!81078) (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154676 () Bool)

(declare-fun Unit!4928 () Unit!4904)

(assert (=> b!154676 (= e!101044 Unit!4928)))

(declare-fun b!154677 () Bool)

(assert (=> b!154677 (= e!101045 (isDefined!136 (getValueByKey!184 (toList!896 lt!81078) (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(assert (= (and d!50943 c!29653) b!154675))

(assert (= (and d!50943 (not c!29653)) b!154676))

(assert (= (and d!50943 (not res!73017)) b!154677))

(declare-fun m!188881 () Bool)

(assert (=> d!50943 m!188881))

(declare-fun m!188883 () Bool)

(assert (=> b!154675 m!188883))

(assert (=> b!154675 m!188263))

(assert (=> b!154675 m!188263))

(declare-fun m!188885 () Bool)

(assert (=> b!154675 m!188885))

(assert (=> b!154677 m!188263))

(assert (=> b!154677 m!188263))

(assert (=> b!154677 m!188885))

(assert (=> d!50693 d!50943))

(declare-fun b!154678 () Bool)

(declare-fun e!101046 () Option!190)

(assert (=> b!154678 (= e!101046 (Some!189 (_2!1392 (h!2394 lt!81079))))))

(declare-fun c!29654 () Bool)

(declare-fun d!50945 () Bool)

(assert (=> d!50945 (= c!29654 (and ((_ is Cons!1785) lt!81079) (= (_1!1392 (h!2394 lt!81079)) (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(assert (=> d!50945 (= (getValueByKey!184 lt!81079 (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))) e!101046)))

(declare-fun e!101047 () Option!190)

(declare-fun b!154680 () Bool)

(assert (=> b!154680 (= e!101047 (getValueByKey!184 (t!6575 lt!81079) (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154679 () Bool)

(assert (=> b!154679 (= e!101046 e!101047)))

(declare-fun c!29655 () Bool)

(assert (=> b!154679 (= c!29655 (and ((_ is Cons!1785) lt!81079) (not (= (_1!1392 (h!2394 lt!81079)) (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))))

(declare-fun b!154681 () Bool)

(assert (=> b!154681 (= e!101047 None!188)))

(assert (= (and d!50945 c!29654) b!154678))

(assert (= (and d!50945 (not c!29654)) b!154679))

(assert (= (and b!154679 c!29655) b!154680))

(assert (= (and b!154679 (not c!29655)) b!154681))

(declare-fun m!188887 () Bool)

(assert (=> b!154680 m!188887))

(assert (=> d!50693 d!50945))

(declare-fun d!50947 () Bool)

(assert (=> d!50947 (= (getValueByKey!184 lt!81079 (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))) (Some!189 (_2!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun lt!81269 () Unit!4904)

(assert (=> d!50947 (= lt!81269 (choose!927 lt!81079 (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (_2!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun e!101048 () Bool)

(assert (=> d!50947 e!101048))

(declare-fun res!73018 () Bool)

(assert (=> d!50947 (=> (not res!73018) (not e!101048))))

(assert (=> d!50947 (= res!73018 (isStrictlySorted!317 lt!81079))))

(assert (=> d!50947 (= (lemmaContainsTupThenGetReturnValue!97 lt!81079 (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (_2!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))) lt!81269)))

(declare-fun b!154682 () Bool)

(declare-fun res!73019 () Bool)

(assert (=> b!154682 (=> (not res!73019) (not e!101048))))

(assert (=> b!154682 (= res!73019 (containsKey!187 lt!81079 (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154683 () Bool)

(assert (=> b!154683 (= e!101048 (contains!948 lt!81079 (tuple2!2763 (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (_2!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(assert (= (and d!50947 res!73018) b!154682))

(assert (= (and b!154682 res!73019) b!154683))

(assert (=> d!50947 m!188257))

(declare-fun m!188889 () Bool)

(assert (=> d!50947 m!188889))

(declare-fun m!188891 () Bool)

(assert (=> d!50947 m!188891))

(declare-fun m!188893 () Bool)

(assert (=> b!154682 m!188893))

(declare-fun m!188895 () Bool)

(assert (=> b!154683 m!188895))

(assert (=> d!50693 d!50947))

(declare-fun b!154684 () Bool)

(declare-fun res!73021 () Bool)

(declare-fun e!101052 () Bool)

(assert (=> b!154684 (=> (not res!73021) (not e!101052))))

(declare-fun lt!81270 () List!1789)

(assert (=> b!154684 (= res!73021 (containsKey!187 lt!81270 (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun c!29656 () Bool)

(declare-fun e!101051 () List!1789)

(declare-fun b!154685 () Bool)

(declare-fun c!29659 () Bool)

(assert (=> b!154685 (= e!101051 (ite c!29656 (t!6575 (toList!896 (ite c!29525 call!17138 (ite c!29524 call!17142 call!17141)))) (ite c!29659 (Cons!1785 (h!2394 (toList!896 (ite c!29525 call!17138 (ite c!29524 call!17142 call!17141)))) (t!6575 (toList!896 (ite c!29525 call!17138 (ite c!29524 call!17142 call!17141))))) Nil!1786)))))

(declare-fun b!154686 () Bool)

(declare-fun e!101053 () List!1789)

(declare-fun call!17190 () List!1789)

(assert (=> b!154686 (= e!101053 call!17190)))

(declare-fun b!154687 () Bool)

(assert (=> b!154687 (= e!101051 (insertStrictlySorted!100 (t!6575 (toList!896 (ite c!29525 call!17138 (ite c!29524 call!17142 call!17141)))) (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (_2!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun bm!17186 () Bool)

(declare-fun call!17188 () List!1789)

(declare-fun call!17189 () List!1789)

(assert (=> bm!17186 (= call!17188 call!17189)))

(declare-fun d!50949 () Bool)

(assert (=> d!50949 e!101052))

(declare-fun res!73020 () Bool)

(assert (=> d!50949 (=> (not res!73020) (not e!101052))))

(assert (=> d!50949 (= res!73020 (isStrictlySorted!317 lt!81270))))

(assert (=> d!50949 (= lt!81270 e!101053)))

(declare-fun c!29658 () Bool)

(assert (=> d!50949 (= c!29658 (and ((_ is Cons!1785) (toList!896 (ite c!29525 call!17138 (ite c!29524 call!17142 call!17141)))) (bvslt (_1!1392 (h!2394 (toList!896 (ite c!29525 call!17138 (ite c!29524 call!17142 call!17141))))) (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(assert (=> d!50949 (isStrictlySorted!317 (toList!896 (ite c!29525 call!17138 (ite c!29524 call!17142 call!17141))))))

(assert (=> d!50949 (= (insertStrictlySorted!100 (toList!896 (ite c!29525 call!17138 (ite c!29524 call!17142 call!17141))) (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (_2!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))) lt!81270)))

(declare-fun bm!17185 () Bool)

(assert (=> bm!17185 (= call!17189 call!17190)))

(declare-fun b!154688 () Bool)

(declare-fun e!101049 () List!1789)

(assert (=> b!154688 (= e!101049 call!17188)))

(declare-fun b!154689 () Bool)

(assert (=> b!154689 (= c!29659 (and ((_ is Cons!1785) (toList!896 (ite c!29525 call!17138 (ite c!29524 call!17142 call!17141)))) (bvsgt (_1!1392 (h!2394 (toList!896 (ite c!29525 call!17138 (ite c!29524 call!17142 call!17141))))) (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(declare-fun e!101050 () List!1789)

(assert (=> b!154689 (= e!101050 e!101049)))

(declare-fun b!154690 () Bool)

(assert (=> b!154690 (= e!101050 call!17189)))

(declare-fun b!154691 () Bool)

(assert (=> b!154691 (= e!101052 (contains!948 lt!81270 (tuple2!2763 (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (_2!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(declare-fun b!154692 () Bool)

(assert (=> b!154692 (= e!101053 e!101050)))

(assert (=> b!154692 (= c!29656 (and ((_ is Cons!1785) (toList!896 (ite c!29525 call!17138 (ite c!29524 call!17142 call!17141)))) (= (_1!1392 (h!2394 (toList!896 (ite c!29525 call!17138 (ite c!29524 call!17142 call!17141))))) (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(declare-fun b!154693 () Bool)

(assert (=> b!154693 (= e!101049 call!17188)))

(declare-fun bm!17187 () Bool)

(assert (=> bm!17187 (= call!17190 ($colon$colon!95 e!101051 (ite c!29658 (h!2394 (toList!896 (ite c!29525 call!17138 (ite c!29524 call!17142 call!17141)))) (tuple2!2763 (_1!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (_2!1392 (ite (or c!29525 c!29524) (tuple2!2763 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))))

(declare-fun c!29657 () Bool)

(assert (=> bm!17187 (= c!29657 c!29658)))

(assert (= (and d!50949 c!29658) b!154686))

(assert (= (and d!50949 (not c!29658)) b!154692))

(assert (= (and b!154692 c!29656) b!154690))

(assert (= (and b!154692 (not c!29656)) b!154689))

(assert (= (and b!154689 c!29659) b!154688))

(assert (= (and b!154689 (not c!29659)) b!154693))

(assert (= (or b!154688 b!154693) bm!17186))

(assert (= (or b!154690 bm!17186) bm!17185))

(assert (= (or b!154686 bm!17185) bm!17187))

(assert (= (and bm!17187 c!29657) b!154687))

(assert (= (and bm!17187 (not c!29657)) b!154685))

(assert (= (and d!50949 res!73020) b!154684))

(assert (= (and b!154684 res!73021) b!154691))

(declare-fun m!188897 () Bool)

(assert (=> b!154691 m!188897))

(declare-fun m!188899 () Bool)

(assert (=> b!154687 m!188899))

(declare-fun m!188901 () Bool)

(assert (=> b!154684 m!188901))

(declare-fun m!188903 () Bool)

(assert (=> bm!17187 m!188903))

(declare-fun m!188905 () Bool)

(assert (=> d!50949 m!188905))

(declare-fun m!188907 () Bool)

(assert (=> d!50949 m!188907))

(assert (=> d!50693 d!50949))

(assert (=> bm!17161 d!50773))

(declare-fun d!50951 () Bool)

(assert (=> d!50951 (arrayContainsKey!0 (_keys!4836 newMap!16) lt!81121 #b00000000000000000000000000000000)))

(declare-fun lt!81273 () Unit!4904)

(declare-fun choose!13 (array!5087 (_ BitVec 64) (_ BitVec 32)) Unit!4904)

(assert (=> d!50951 (= lt!81273 (choose!13 (_keys!4836 newMap!16) lt!81121 #b00000000000000000000000000000000))))

(assert (=> d!50951 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!50951 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4836 newMap!16) lt!81121 #b00000000000000000000000000000000) lt!81273)))

(declare-fun bs!6567 () Bool)

(assert (= bs!6567 d!50951))

(assert (=> bs!6567 m!188393))

(declare-fun m!188909 () Bool)

(assert (=> bs!6567 m!188909))

(assert (=> b!154388 d!50951))

(declare-fun d!50953 () Bool)

(declare-fun res!73026 () Bool)

(declare-fun e!101058 () Bool)

(assert (=> d!50953 (=> res!73026 e!101058)))

(assert (=> d!50953 (= res!73026 (= (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000) lt!81121))))

(assert (=> d!50953 (= (arrayContainsKey!0 (_keys!4836 newMap!16) lt!81121 #b00000000000000000000000000000000) e!101058)))

(declare-fun b!154698 () Bool)

(declare-fun e!101059 () Bool)

(assert (=> b!154698 (= e!101058 e!101059)))

(declare-fun res!73027 () Bool)

(assert (=> b!154698 (=> (not res!73027) (not e!101059))))

(assert (=> b!154698 (= res!73027 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2679 (_keys!4836 newMap!16))))))

(declare-fun b!154699 () Bool)

(assert (=> b!154699 (= e!101059 (arrayContainsKey!0 (_keys!4836 newMap!16) lt!81121 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!50953 (not res!73026)) b!154698))

(assert (= (and b!154698 res!73027) b!154699))

(assert (=> d!50953 m!188091))

(declare-fun m!188911 () Bool)

(assert (=> b!154699 m!188911))

(assert (=> b!154388 d!50953))

(declare-fun b!154712 () Bool)

(declare-fun e!101067 () SeekEntryResult!280)

(declare-fun lt!81281 () SeekEntryResult!280)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5087 (_ BitVec 32)) SeekEntryResult!280)

(assert (=> b!154712 (= e!101067 (seekKeyOrZeroReturnVacant!0 (x!17016 lt!81281) (index!3290 lt!81281) (index!3290 lt!81281) (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000) (_keys!4836 newMap!16) (mask!7467 newMap!16)))))

(declare-fun d!50955 () Bool)

(declare-fun lt!81282 () SeekEntryResult!280)

(assert (=> d!50955 (and (or ((_ is Undefined!280) lt!81282) (not ((_ is Found!280) lt!81282)) (and (bvsge (index!3289 lt!81282) #b00000000000000000000000000000000) (bvslt (index!3289 lt!81282) (size!2679 (_keys!4836 newMap!16))))) (or ((_ is Undefined!280) lt!81282) ((_ is Found!280) lt!81282) (not ((_ is MissingZero!280) lt!81282)) (and (bvsge (index!3288 lt!81282) #b00000000000000000000000000000000) (bvslt (index!3288 lt!81282) (size!2679 (_keys!4836 newMap!16))))) (or ((_ is Undefined!280) lt!81282) ((_ is Found!280) lt!81282) ((_ is MissingZero!280) lt!81282) (not ((_ is MissingVacant!280) lt!81282)) (and (bvsge (index!3291 lt!81282) #b00000000000000000000000000000000) (bvslt (index!3291 lt!81282) (size!2679 (_keys!4836 newMap!16))))) (or ((_ is Undefined!280) lt!81282) (ite ((_ is Found!280) lt!81282) (= (select (arr!2402 (_keys!4836 newMap!16)) (index!3289 lt!81282)) (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!280) lt!81282) (= (select (arr!2402 (_keys!4836 newMap!16)) (index!3288 lt!81282)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!280) lt!81282) (= (select (arr!2402 (_keys!4836 newMap!16)) (index!3291 lt!81282)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!101068 () SeekEntryResult!280)

(assert (=> d!50955 (= lt!81282 e!101068)))

(declare-fun c!29668 () Bool)

(assert (=> d!50955 (= c!29668 (and ((_ is Intermediate!280) lt!81281) (undefined!1092 lt!81281)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5087 (_ BitVec 32)) SeekEntryResult!280)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!50955 (= lt!81281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000) (mask!7467 newMap!16)) (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000) (_keys!4836 newMap!16) (mask!7467 newMap!16)))))

(assert (=> d!50955 (validMask!0 (mask!7467 newMap!16))))

(assert (=> d!50955 (= (seekEntryOrOpen!0 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000) (_keys!4836 newMap!16) (mask!7467 newMap!16)) lt!81282)))

(declare-fun b!154713 () Bool)

(declare-fun c!29666 () Bool)

(declare-fun lt!81280 () (_ BitVec 64))

(assert (=> b!154713 (= c!29666 (= lt!81280 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!101066 () SeekEntryResult!280)

(assert (=> b!154713 (= e!101066 e!101067)))

(declare-fun b!154714 () Bool)

(assert (=> b!154714 (= e!101068 e!101066)))

(assert (=> b!154714 (= lt!81280 (select (arr!2402 (_keys!4836 newMap!16)) (index!3290 lt!81281)))))

(declare-fun c!29667 () Bool)

(assert (=> b!154714 (= c!29667 (= lt!81280 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154715 () Bool)

(assert (=> b!154715 (= e!101067 (MissingZero!280 (index!3290 lt!81281)))))

(declare-fun b!154716 () Bool)

(assert (=> b!154716 (= e!101068 Undefined!280)))

(declare-fun b!154717 () Bool)

(assert (=> b!154717 (= e!101066 (Found!280 (index!3290 lt!81281)))))

(assert (= (and d!50955 c!29668) b!154716))

(assert (= (and d!50955 (not c!29668)) b!154714))

(assert (= (and b!154714 c!29667) b!154717))

(assert (= (and b!154714 (not c!29667)) b!154713))

(assert (= (and b!154713 c!29666) b!154715))

(assert (= (and b!154713 (not c!29666)) b!154712))

(assert (=> b!154712 m!188091))

(declare-fun m!188913 () Bool)

(assert (=> b!154712 m!188913))

(declare-fun m!188915 () Bool)

(assert (=> d!50955 m!188915))

(declare-fun m!188917 () Bool)

(assert (=> d!50955 m!188917))

(assert (=> d!50955 m!188091))

(declare-fun m!188919 () Bool)

(assert (=> d!50955 m!188919))

(assert (=> d!50955 m!188113))

(assert (=> d!50955 m!188091))

(assert (=> d!50955 m!188917))

(declare-fun m!188921 () Bool)

(assert (=> d!50955 m!188921))

(declare-fun m!188923 () Bool)

(assert (=> d!50955 m!188923))

(declare-fun m!188925 () Bool)

(assert (=> b!154714 m!188925))

(assert (=> b!154388 d!50955))

(declare-fun lt!81283 () Bool)

(declare-fun d!50957 () Bool)

(assert (=> d!50957 (= lt!81283 (select (content!146 (toList!896 lt!81092)) (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun e!101070 () Bool)

(assert (=> d!50957 (= lt!81283 e!101070)))

(declare-fun res!73028 () Bool)

(assert (=> d!50957 (=> (not res!73028) (not e!101070))))

(assert (=> d!50957 (= res!73028 ((_ is Cons!1785) (toList!896 lt!81092)))))

(assert (=> d!50957 (= (contains!948 (toList!896 lt!81092) (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81283)))

(declare-fun b!154718 () Bool)

(declare-fun e!101069 () Bool)

(assert (=> b!154718 (= e!101070 e!101069)))

(declare-fun res!73029 () Bool)

(assert (=> b!154718 (=> res!73029 e!101069)))

(assert (=> b!154718 (= res!73029 (= (h!2394 (toList!896 lt!81092)) (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun b!154719 () Bool)

(assert (=> b!154719 (= e!101069 (contains!948 (t!6575 (toList!896 lt!81092)) (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(assert (= (and d!50957 res!73028) b!154718))

(assert (= (and b!154718 (not res!73029)) b!154719))

(declare-fun m!188927 () Bool)

(assert (=> d!50957 m!188927))

(declare-fun m!188929 () Bool)

(assert (=> d!50957 m!188929))

(declare-fun m!188931 () Bool)

(assert (=> b!154719 m!188931))

(assert (=> b!154356 d!50957))

(declare-fun bm!17188 () Bool)

(declare-fun call!17191 () Bool)

(assert (=> bm!17188 (= call!17191 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4836 newMap!16) (mask!7467 newMap!16)))))

(declare-fun b!154720 () Bool)

(declare-fun e!101072 () Bool)

(assert (=> b!154720 (= e!101072 call!17191)))

(declare-fun b!154721 () Bool)

(declare-fun e!101073 () Bool)

(assert (=> b!154721 (= e!101073 call!17191)))

(declare-fun b!154722 () Bool)

(declare-fun e!101071 () Bool)

(assert (=> b!154722 (= e!101071 e!101073)))

(declare-fun c!29669 () Bool)

(assert (=> b!154722 (= c!29669 (validKeyInArray!0 (select (arr!2402 (_keys!4836 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!154723 () Bool)

(assert (=> b!154723 (= e!101073 e!101072)))

(declare-fun lt!81285 () (_ BitVec 64))

(assert (=> b!154723 (= lt!81285 (select (arr!2402 (_keys!4836 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!81286 () Unit!4904)

(assert (=> b!154723 (= lt!81286 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4836 newMap!16) lt!81285 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!154723 (arrayContainsKey!0 (_keys!4836 newMap!16) lt!81285 #b00000000000000000000000000000000)))

(declare-fun lt!81284 () Unit!4904)

(assert (=> b!154723 (= lt!81284 lt!81286)))

(declare-fun res!73031 () Bool)

(assert (=> b!154723 (= res!73031 (= (seekEntryOrOpen!0 (select (arr!2402 (_keys!4836 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4836 newMap!16) (mask!7467 newMap!16)) (Found!280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!154723 (=> (not res!73031) (not e!101072))))

(declare-fun d!50959 () Bool)

(declare-fun res!73030 () Bool)

(assert (=> d!50959 (=> res!73030 e!101071)))

(assert (=> d!50959 (= res!73030 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2679 (_keys!4836 newMap!16))))))

(assert (=> d!50959 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4836 newMap!16) (mask!7467 newMap!16)) e!101071)))

(assert (= (and d!50959 (not res!73030)) b!154722))

(assert (= (and b!154722 c!29669) b!154723))

(assert (= (and b!154722 (not c!29669)) b!154721))

(assert (= (and b!154723 res!73031) b!154720))

(assert (= (or b!154720 b!154721) bm!17188))

(declare-fun m!188933 () Bool)

(assert (=> bm!17188 m!188933))

(assert (=> b!154722 m!188639))

(assert (=> b!154722 m!188639))

(assert (=> b!154722 m!188641))

(assert (=> b!154723 m!188639))

(declare-fun m!188935 () Bool)

(assert (=> b!154723 m!188935))

(declare-fun m!188937 () Bool)

(assert (=> b!154723 m!188937))

(assert (=> b!154723 m!188639))

(declare-fun m!188939 () Bool)

(assert (=> b!154723 m!188939))

(assert (=> bm!17164 d!50959))

(declare-fun d!50961 () Bool)

(declare-fun e!101075 () Bool)

(assert (=> d!50961 e!101075))

(declare-fun res!73032 () Bool)

(assert (=> d!50961 (=> res!73032 e!101075)))

(declare-fun lt!81287 () Bool)

(assert (=> d!50961 (= res!73032 (not lt!81287))))

(declare-fun lt!81290 () Bool)

(assert (=> d!50961 (= lt!81287 lt!81290)))

(declare-fun lt!81288 () Unit!4904)

(declare-fun e!101074 () Unit!4904)

(assert (=> d!50961 (= lt!81288 e!101074)))

(declare-fun c!29670 () Bool)

(assert (=> d!50961 (= c!29670 lt!81290)))

(assert (=> d!50961 (= lt!81290 (containsKey!187 (toList!896 (+!189 lt!81010 (tuple2!2763 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81025))))

(assert (=> d!50961 (= (contains!947 (+!189 lt!81010 (tuple2!2763 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81025) lt!81287)))

(declare-fun b!154724 () Bool)

(declare-fun lt!81289 () Unit!4904)

(assert (=> b!154724 (= e!101074 lt!81289)))

(assert (=> b!154724 (= lt!81289 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 (+!189 lt!81010 (tuple2!2763 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81025))))

(assert (=> b!154724 (isDefined!136 (getValueByKey!184 (toList!896 (+!189 lt!81010 (tuple2!2763 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81025))))

(declare-fun b!154725 () Bool)

(declare-fun Unit!4929 () Unit!4904)

(assert (=> b!154725 (= e!101074 Unit!4929)))

(declare-fun b!154726 () Bool)

(assert (=> b!154726 (= e!101075 (isDefined!136 (getValueByKey!184 (toList!896 (+!189 lt!81010 (tuple2!2763 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81025)))))

(assert (= (and d!50961 c!29670) b!154724))

(assert (= (and d!50961 (not c!29670)) b!154725))

(assert (= (and d!50961 (not res!73032)) b!154726))

(declare-fun m!188941 () Bool)

(assert (=> d!50961 m!188941))

(declare-fun m!188943 () Bool)

(assert (=> b!154724 m!188943))

(declare-fun m!188945 () Bool)

(assert (=> b!154724 m!188945))

(assert (=> b!154724 m!188945))

(declare-fun m!188947 () Bool)

(assert (=> b!154724 m!188947))

(assert (=> b!154726 m!188945))

(assert (=> b!154726 m!188945))

(assert (=> b!154726 m!188947))

(assert (=> b!154266 d!50961))

(declare-fun d!50963 () Bool)

(assert (=> d!50963 (= (apply!128 (+!189 lt!81022 (tuple2!2763 lt!81013 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81009) (get!1615 (getValueByKey!184 (toList!896 (+!189 lt!81022 (tuple2!2763 lt!81013 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81009)))))

(declare-fun bs!6568 () Bool)

(assert (= bs!6568 d!50963))

(declare-fun m!188949 () Bool)

(assert (=> bs!6568 m!188949))

(assert (=> bs!6568 m!188949))

(declare-fun m!188951 () Bool)

(assert (=> bs!6568 m!188951))

(assert (=> b!154266 d!50963))

(declare-fun d!50965 () Bool)

(assert (=> d!50965 (= (apply!128 (+!189 lt!81005 (tuple2!2763 lt!81015 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81019) (apply!128 lt!81005 lt!81019))))

(declare-fun lt!81291 () Unit!4904)

(assert (=> d!50965 (= lt!81291 (choose!924 lt!81005 lt!81015 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) lt!81019))))

(declare-fun e!101076 () Bool)

(assert (=> d!50965 e!101076))

(declare-fun res!73033 () Bool)

(assert (=> d!50965 (=> (not res!73033) (not e!101076))))

(assert (=> d!50965 (= res!73033 (contains!947 lt!81005 lt!81019))))

(assert (=> d!50965 (= (addApplyDifferent!104 lt!81005 lt!81015 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) lt!81019) lt!81291)))

(declare-fun b!154727 () Bool)

(assert (=> b!154727 (= e!101076 (not (= lt!81019 lt!81015)))))

(assert (= (and d!50965 res!73033) b!154727))

(assert (=> d!50965 m!188183))

(assert (=> d!50965 m!188203))

(declare-fun m!188953 () Bool)

(assert (=> d!50965 m!188953))

(assert (=> d!50965 m!188185))

(assert (=> d!50965 m!188183))

(declare-fun m!188955 () Bool)

(assert (=> d!50965 m!188955))

(assert (=> b!154266 d!50965))

(declare-fun d!50967 () Bool)

(assert (=> d!50967 (= (apply!128 (+!189 lt!81022 (tuple2!2763 lt!81013 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81009) (apply!128 lt!81022 lt!81009))))

(declare-fun lt!81292 () Unit!4904)

(assert (=> d!50967 (= lt!81292 (choose!924 lt!81022 lt!81013 (minValue!2906 (v!3418 (underlying!525 thiss!992))) lt!81009))))

(declare-fun e!101077 () Bool)

(assert (=> d!50967 e!101077))

(declare-fun res!73034 () Bool)

(assert (=> d!50967 (=> (not res!73034) (not e!101077))))

(assert (=> d!50967 (= res!73034 (contains!947 lt!81022 lt!81009))))

(assert (=> d!50967 (= (addApplyDifferent!104 lt!81022 lt!81013 (minValue!2906 (v!3418 (underlying!525 thiss!992))) lt!81009) lt!81292)))

(declare-fun b!154728 () Bool)

(assert (=> b!154728 (= e!101077 (not (= lt!81009 lt!81013)))))

(assert (= (and d!50967 res!73034) b!154728))

(assert (=> d!50967 m!188197))

(assert (=> d!50967 m!188201))

(declare-fun m!188957 () Bool)

(assert (=> d!50967 m!188957))

(assert (=> d!50967 m!188195))

(assert (=> d!50967 m!188197))

(declare-fun m!188959 () Bool)

(assert (=> d!50967 m!188959))

(assert (=> b!154266 d!50967))

(declare-fun d!50969 () Bool)

(assert (=> d!50969 (= (apply!128 lt!81017 lt!81012) (get!1615 (getValueByKey!184 (toList!896 lt!81017) lt!81012)))))

(declare-fun bs!6569 () Bool)

(assert (= bs!6569 d!50969))

(declare-fun m!188961 () Bool)

(assert (=> bs!6569 m!188961))

(assert (=> bs!6569 m!188961))

(declare-fun m!188963 () Bool)

(assert (=> bs!6569 m!188963))

(assert (=> b!154266 d!50969))

(declare-fun d!50971 () Bool)

(assert (=> d!50971 (contains!947 (+!189 lt!81010 (tuple2!2763 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81025)))

(declare-fun lt!81293 () Unit!4904)

(assert (=> d!50971 (= lt!81293 (choose!925 lt!81010 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) lt!81025))))

(assert (=> d!50971 (contains!947 lt!81010 lt!81025)))

(assert (=> d!50971 (= (addStillContains!104 lt!81010 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) lt!81025) lt!81293)))

(declare-fun bs!6570 () Bool)

(assert (= bs!6570 d!50971))

(assert (=> bs!6570 m!188191))

(assert (=> bs!6570 m!188191))

(assert (=> bs!6570 m!188193))

(declare-fun m!188965 () Bool)

(assert (=> bs!6570 m!188965))

(declare-fun m!188967 () Bool)

(assert (=> bs!6570 m!188967))

(assert (=> b!154266 d!50971))

(declare-fun b!154729 () Bool)

(declare-fun e!101080 () Bool)

(declare-fun e!101084 () Bool)

(assert (=> b!154729 (= e!101080 e!101084)))

(declare-fun c!29674 () Bool)

(declare-fun e!101083 () Bool)

(assert (=> b!154729 (= c!29674 e!101083)))

(declare-fun res!73037 () Bool)

(assert (=> b!154729 (=> (not res!73037) (not e!101083))))

(assert (=> b!154729 (= res!73037 (bvslt #b00000000000000000000000000000000 (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun b!154730 () Bool)

(declare-fun e!101079 () ListLongMap!1761)

(assert (=> b!154730 (= e!101079 (ListLongMap!1762 Nil!1786))))

(declare-fun b!154731 () Bool)

(declare-fun e!101082 () Bool)

(declare-fun lt!81296 () ListLongMap!1761)

(assert (=> b!154731 (= e!101082 (isEmpty!436 lt!81296))))

(declare-fun b!154732 () Bool)

(assert (=> b!154732 (= e!101084 e!101082)))

(declare-fun c!29672 () Bool)

(assert (=> b!154732 (= c!29672 (bvslt #b00000000000000000000000000000000 (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun b!154733 () Bool)

(declare-fun lt!81298 () Unit!4904)

(declare-fun lt!81294 () Unit!4904)

(assert (=> b!154733 (= lt!81298 lt!81294)))

(declare-fun lt!81295 () (_ BitVec 64))

(declare-fun lt!81299 () (_ BitVec 64))

(declare-fun lt!81297 () ListLongMap!1761)

(declare-fun lt!81300 () V!3681)

(assert (=> b!154733 (not (contains!947 (+!189 lt!81297 (tuple2!2763 lt!81299 lt!81300)) lt!81295))))

(assert (=> b!154733 (= lt!81294 (addStillNotContains!72 lt!81297 lt!81299 lt!81300 lt!81295))))

(assert (=> b!154733 (= lt!81295 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!154733 (= lt!81300 (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!154733 (= lt!81299 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun call!17192 () ListLongMap!1761)

(assert (=> b!154733 (= lt!81297 call!17192)))

(declare-fun e!101078 () ListLongMap!1761)

(assert (=> b!154733 (= e!101078 (+!189 call!17192 (tuple2!2763 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000) (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!154734 () Bool)

(assert (=> b!154734 (= e!101079 e!101078)))

(declare-fun c!29673 () Bool)

(assert (=> b!154734 (= c!29673 (validKeyInArray!0 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154735 () Bool)

(assert (=> b!154735 (= e!101082 (= lt!81296 (getCurrentListMapNoExtraKeys!159 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun bm!17189 () Bool)

(assert (=> bm!17189 (= call!17192 (getCurrentListMapNoExtraKeys!159 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun b!154736 () Bool)

(assert (=> b!154736 (= e!101078 call!17192)))

(declare-fun d!50973 () Bool)

(assert (=> d!50973 e!101080))

(declare-fun res!73038 () Bool)

(assert (=> d!50973 (=> (not res!73038) (not e!101080))))

(assert (=> d!50973 (= res!73038 (not (contains!947 lt!81296 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50973 (= lt!81296 e!101079)))

(declare-fun c!29671 () Bool)

(assert (=> d!50973 (= c!29671 (bvsge #b00000000000000000000000000000000 (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(assert (=> d!50973 (validMask!0 (mask!7467 (v!3418 (underlying!525 thiss!992))))))

(assert (=> d!50973 (= (getCurrentListMapNoExtraKeys!159 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (_values!3046 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992))) (extraKeys!2804 (v!3418 (underlying!525 thiss!992))) (zeroValue!2906 (v!3418 (underlying!525 thiss!992))) (minValue!2906 (v!3418 (underlying!525 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992)))) lt!81296)))

(declare-fun b!154737 () Bool)

(assert (=> b!154737 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(assert (=> b!154737 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2680 (_values!3046 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun e!101081 () Bool)

(assert (=> b!154737 (= e!101081 (= (apply!128 lt!81296 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)) (get!1614 (select (arr!2403 (_values!3046 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!471 (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!154738 () Bool)

(assert (=> b!154738 (= e!101083 (validKeyInArray!0 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> b!154738 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!154739 () Bool)

(assert (=> b!154739 (= e!101084 e!101081)))

(assert (=> b!154739 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun res!73036 () Bool)

(assert (=> b!154739 (= res!73036 (contains!947 lt!81296 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> b!154739 (=> (not res!73036) (not e!101081))))

(declare-fun b!154740 () Bool)

(declare-fun res!73035 () Bool)

(assert (=> b!154740 (=> (not res!73035) (not e!101080))))

(assert (=> b!154740 (= res!73035 (not (contains!947 lt!81296 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50973 c!29671) b!154730))

(assert (= (and d!50973 (not c!29671)) b!154734))

(assert (= (and b!154734 c!29673) b!154733))

(assert (= (and b!154734 (not c!29673)) b!154736))

(assert (= (or b!154733 b!154736) bm!17189))

(assert (= (and d!50973 res!73038) b!154740))

(assert (= (and b!154740 res!73035) b!154729))

(assert (= (and b!154729 res!73037) b!154738))

(assert (= (and b!154729 c!29674) b!154739))

(assert (= (and b!154729 (not c!29674)) b!154732))

(assert (= (and b!154739 res!73036) b!154737))

(assert (= (and b!154732 c!29672) b!154735))

(assert (= (and b!154732 (not c!29672)) b!154731))

(declare-fun b_lambda!6893 () Bool)

(assert (=> (not b_lambda!6893) (not b!154733)))

(assert (=> b!154733 t!6577))

(declare-fun b_and!9649 () Bool)

(assert (= b_and!9645 (and (=> t!6577 result!4481) b_and!9649)))

(assert (=> b!154733 t!6579))

(declare-fun b_and!9651 () Bool)

(assert (= b_and!9647 (and (=> t!6579 result!4485) b_and!9651)))

(declare-fun b_lambda!6895 () Bool)

(assert (=> (not b_lambda!6895) (not b!154737)))

(assert (=> b!154737 t!6577))

(declare-fun b_and!9653 () Bool)

(assert (= b_and!9649 (and (=> t!6577 result!4481) b_and!9653)))

(assert (=> b!154737 t!6579))

(declare-fun b_and!9655 () Bool)

(assert (= b_and!9651 (and (=> t!6579 result!4485) b_and!9655)))

(declare-fun m!188969 () Bool)

(assert (=> b!154740 m!188969))

(assert (=> b!154738 m!188151))

(assert (=> b!154738 m!188151))

(assert (=> b!154738 m!188153))

(declare-fun m!188971 () Bool)

(assert (=> b!154731 m!188971))

(assert (=> b!154733 m!188151))

(assert (=> b!154733 m!188037))

(declare-fun m!188973 () Bool)

(assert (=> b!154733 m!188973))

(assert (=> b!154733 m!188163))

(declare-fun m!188975 () Bool)

(assert (=> b!154733 m!188975))

(declare-fun m!188977 () Bool)

(assert (=> b!154733 m!188977))

(assert (=> b!154733 m!188163))

(assert (=> b!154733 m!188037))

(assert (=> b!154733 m!188167))

(assert (=> b!154733 m!188973))

(declare-fun m!188979 () Bool)

(assert (=> b!154733 m!188979))

(assert (=> b!154734 m!188151))

(assert (=> b!154734 m!188151))

(assert (=> b!154734 m!188153))

(declare-fun m!188981 () Bool)

(assert (=> bm!17189 m!188981))

(assert (=> b!154735 m!188981))

(assert (=> b!154739 m!188151))

(assert (=> b!154739 m!188151))

(declare-fun m!188983 () Bool)

(assert (=> b!154739 m!188983))

(declare-fun m!188985 () Bool)

(assert (=> d!50973 m!188985))

(assert (=> d!50973 m!188043))

(assert (=> b!154737 m!188151))

(assert (=> b!154737 m!188151))

(declare-fun m!188987 () Bool)

(assert (=> b!154737 m!188987))

(assert (=> b!154737 m!188163))

(assert (=> b!154737 m!188037))

(assert (=> b!154737 m!188167))

(assert (=> b!154737 m!188037))

(assert (=> b!154737 m!188163))

(assert (=> b!154266 d!50973))

(declare-fun d!50975 () Bool)

(assert (=> d!50975 (= (apply!128 (+!189 lt!81017 (tuple2!2763 lt!81004 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81012) (get!1615 (getValueByKey!184 (toList!896 (+!189 lt!81017 (tuple2!2763 lt!81004 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81012)))))

(declare-fun bs!6571 () Bool)

(assert (= bs!6571 d!50975))

(declare-fun m!188989 () Bool)

(assert (=> bs!6571 m!188989))

(assert (=> bs!6571 m!188989))

(declare-fun m!188991 () Bool)

(assert (=> bs!6571 m!188991))

(assert (=> b!154266 d!50975))

(declare-fun d!50977 () Bool)

(declare-fun e!101085 () Bool)

(assert (=> d!50977 e!101085))

(declare-fun res!73040 () Bool)

(assert (=> d!50977 (=> (not res!73040) (not e!101085))))

(declare-fun lt!81301 () ListLongMap!1761)

(assert (=> d!50977 (= res!73040 (contains!947 lt!81301 (_1!1392 (tuple2!2763 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun lt!81302 () List!1789)

(assert (=> d!50977 (= lt!81301 (ListLongMap!1762 lt!81302))))

(declare-fun lt!81304 () Unit!4904)

(declare-fun lt!81303 () Unit!4904)

(assert (=> d!50977 (= lt!81304 lt!81303)))

(assert (=> d!50977 (= (getValueByKey!184 lt!81302 (_1!1392 (tuple2!2763 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50977 (= lt!81303 (lemmaContainsTupThenGetReturnValue!97 lt!81302 (_1!1392 (tuple2!2763 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50977 (= lt!81302 (insertStrictlySorted!100 (toList!896 lt!81010) (_1!1392 (tuple2!2763 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50977 (= (+!189 lt!81010 (tuple2!2763 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81301)))

(declare-fun b!154741 () Bool)

(declare-fun res!73039 () Bool)

(assert (=> b!154741 (=> (not res!73039) (not e!101085))))

(assert (=> b!154741 (= res!73039 (= (getValueByKey!184 (toList!896 lt!81301) (_1!1392 (tuple2!2763 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154742 () Bool)

(assert (=> b!154742 (= e!101085 (contains!948 (toList!896 lt!81301) (tuple2!2763 lt!81020 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(assert (= (and d!50977 res!73040) b!154741))

(assert (= (and b!154741 res!73039) b!154742))

(declare-fun m!188993 () Bool)

(assert (=> d!50977 m!188993))

(declare-fun m!188995 () Bool)

(assert (=> d!50977 m!188995))

(declare-fun m!188997 () Bool)

(assert (=> d!50977 m!188997))

(declare-fun m!188999 () Bool)

(assert (=> d!50977 m!188999))

(declare-fun m!189001 () Bool)

(assert (=> b!154741 m!189001))

(declare-fun m!189003 () Bool)

(assert (=> b!154742 m!189003))

(assert (=> b!154266 d!50977))

(declare-fun d!50979 () Bool)

(declare-fun e!101086 () Bool)

(assert (=> d!50979 e!101086))

(declare-fun res!73042 () Bool)

(assert (=> d!50979 (=> (not res!73042) (not e!101086))))

(declare-fun lt!81305 () ListLongMap!1761)

(assert (=> d!50979 (= res!73042 (contains!947 lt!81305 (_1!1392 (tuple2!2763 lt!81015 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun lt!81306 () List!1789)

(assert (=> d!50979 (= lt!81305 (ListLongMap!1762 lt!81306))))

(declare-fun lt!81308 () Unit!4904)

(declare-fun lt!81307 () Unit!4904)

(assert (=> d!50979 (= lt!81308 lt!81307)))

(assert (=> d!50979 (= (getValueByKey!184 lt!81306 (_1!1392 (tuple2!2763 lt!81015 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 lt!81015 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50979 (= lt!81307 (lemmaContainsTupThenGetReturnValue!97 lt!81306 (_1!1392 (tuple2!2763 lt!81015 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!81015 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50979 (= lt!81306 (insertStrictlySorted!100 (toList!896 lt!81005) (_1!1392 (tuple2!2763 lt!81015 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!81015 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50979 (= (+!189 lt!81005 (tuple2!2763 lt!81015 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81305)))

(declare-fun b!154743 () Bool)

(declare-fun res!73041 () Bool)

(assert (=> b!154743 (=> (not res!73041) (not e!101086))))

(assert (=> b!154743 (= res!73041 (= (getValueByKey!184 (toList!896 lt!81305) (_1!1392 (tuple2!2763 lt!81015 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 lt!81015 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154744 () Bool)

(assert (=> b!154744 (= e!101086 (contains!948 (toList!896 lt!81305) (tuple2!2763 lt!81015 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(assert (= (and d!50979 res!73042) b!154743))

(assert (= (and b!154743 res!73041) b!154744))

(declare-fun m!189005 () Bool)

(assert (=> d!50979 m!189005))

(declare-fun m!189007 () Bool)

(assert (=> d!50979 m!189007))

(declare-fun m!189009 () Bool)

(assert (=> d!50979 m!189009))

(declare-fun m!189011 () Bool)

(assert (=> d!50979 m!189011))

(declare-fun m!189013 () Bool)

(assert (=> b!154743 m!189013))

(declare-fun m!189015 () Bool)

(assert (=> b!154744 m!189015))

(assert (=> b!154266 d!50979))

(declare-fun d!50981 () Bool)

(assert (=> d!50981 (= (apply!128 (+!189 lt!81017 (tuple2!2763 lt!81004 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81012) (apply!128 lt!81017 lt!81012))))

(declare-fun lt!81309 () Unit!4904)

(assert (=> d!50981 (= lt!81309 (choose!924 lt!81017 lt!81004 (minValue!2906 (v!3418 (underlying!525 thiss!992))) lt!81012))))

(declare-fun e!101087 () Bool)

(assert (=> d!50981 e!101087))

(declare-fun res!73043 () Bool)

(assert (=> d!50981 (=> (not res!73043) (not e!101087))))

(assert (=> d!50981 (= res!73043 (contains!947 lt!81017 lt!81012))))

(assert (=> d!50981 (= (addApplyDifferent!104 lt!81017 lt!81004 (minValue!2906 (v!3418 (underlying!525 thiss!992))) lt!81012) lt!81309)))

(declare-fun b!154745 () Bool)

(assert (=> b!154745 (= e!101087 (not (= lt!81012 lt!81004)))))

(assert (= (and d!50981 res!73043) b!154745))

(assert (=> d!50981 m!188179))

(assert (=> d!50981 m!188181))

(declare-fun m!189017 () Bool)

(assert (=> d!50981 m!189017))

(assert (=> d!50981 m!188205))

(assert (=> d!50981 m!188179))

(declare-fun m!189019 () Bool)

(assert (=> d!50981 m!189019))

(assert (=> b!154266 d!50981))

(declare-fun d!50983 () Bool)

(assert (=> d!50983 (= (apply!128 lt!81005 lt!81019) (get!1615 (getValueByKey!184 (toList!896 lt!81005) lt!81019)))))

(declare-fun bs!6572 () Bool)

(assert (= bs!6572 d!50983))

(declare-fun m!189021 () Bool)

(assert (=> bs!6572 m!189021))

(assert (=> bs!6572 m!189021))

(declare-fun m!189023 () Bool)

(assert (=> bs!6572 m!189023))

(assert (=> b!154266 d!50983))

(declare-fun d!50985 () Bool)

(assert (=> d!50985 (= (apply!128 (+!189 lt!81005 (tuple2!2763 lt!81015 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81019) (get!1615 (getValueByKey!184 (toList!896 (+!189 lt!81005 (tuple2!2763 lt!81015 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81019)))))

(declare-fun bs!6573 () Bool)

(assert (= bs!6573 d!50985))

(declare-fun m!189025 () Bool)

(assert (=> bs!6573 m!189025))

(assert (=> bs!6573 m!189025))

(declare-fun m!189027 () Bool)

(assert (=> bs!6573 m!189027))

(assert (=> b!154266 d!50985))

(declare-fun d!50987 () Bool)

(declare-fun e!101088 () Bool)

(assert (=> d!50987 e!101088))

(declare-fun res!73045 () Bool)

(assert (=> d!50987 (=> (not res!73045) (not e!101088))))

(declare-fun lt!81310 () ListLongMap!1761)

(assert (=> d!50987 (= res!73045 (contains!947 lt!81310 (_1!1392 (tuple2!2763 lt!81004 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun lt!81311 () List!1789)

(assert (=> d!50987 (= lt!81310 (ListLongMap!1762 lt!81311))))

(declare-fun lt!81313 () Unit!4904)

(declare-fun lt!81312 () Unit!4904)

(assert (=> d!50987 (= lt!81313 lt!81312)))

(assert (=> d!50987 (= (getValueByKey!184 lt!81311 (_1!1392 (tuple2!2763 lt!81004 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 lt!81004 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50987 (= lt!81312 (lemmaContainsTupThenGetReturnValue!97 lt!81311 (_1!1392 (tuple2!2763 lt!81004 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!81004 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50987 (= lt!81311 (insertStrictlySorted!100 (toList!896 lt!81017) (_1!1392 (tuple2!2763 lt!81004 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!81004 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50987 (= (+!189 lt!81017 (tuple2!2763 lt!81004 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81310)))

(declare-fun b!154746 () Bool)

(declare-fun res!73044 () Bool)

(assert (=> b!154746 (=> (not res!73044) (not e!101088))))

(assert (=> b!154746 (= res!73044 (= (getValueByKey!184 (toList!896 lt!81310) (_1!1392 (tuple2!2763 lt!81004 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 lt!81004 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154747 () Bool)

(assert (=> b!154747 (= e!101088 (contains!948 (toList!896 lt!81310) (tuple2!2763 lt!81004 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(assert (= (and d!50987 res!73045) b!154746))

(assert (= (and b!154746 res!73044) b!154747))

(declare-fun m!189029 () Bool)

(assert (=> d!50987 m!189029))

(declare-fun m!189031 () Bool)

(assert (=> d!50987 m!189031))

(declare-fun m!189033 () Bool)

(assert (=> d!50987 m!189033))

(declare-fun m!189035 () Bool)

(assert (=> d!50987 m!189035))

(declare-fun m!189037 () Bool)

(assert (=> b!154746 m!189037))

(declare-fun m!189039 () Bool)

(assert (=> b!154747 m!189039))

(assert (=> b!154266 d!50987))

(declare-fun d!50989 () Bool)

(declare-fun e!101089 () Bool)

(assert (=> d!50989 e!101089))

(declare-fun res!73047 () Bool)

(assert (=> d!50989 (=> (not res!73047) (not e!101089))))

(declare-fun lt!81314 () ListLongMap!1761)

(assert (=> d!50989 (= res!73047 (contains!947 lt!81314 (_1!1392 (tuple2!2763 lt!81013 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun lt!81315 () List!1789)

(assert (=> d!50989 (= lt!81314 (ListLongMap!1762 lt!81315))))

(declare-fun lt!81317 () Unit!4904)

(declare-fun lt!81316 () Unit!4904)

(assert (=> d!50989 (= lt!81317 lt!81316)))

(assert (=> d!50989 (= (getValueByKey!184 lt!81315 (_1!1392 (tuple2!2763 lt!81013 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 lt!81013 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50989 (= lt!81316 (lemmaContainsTupThenGetReturnValue!97 lt!81315 (_1!1392 (tuple2!2763 lt!81013 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!81013 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50989 (= lt!81315 (insertStrictlySorted!100 (toList!896 lt!81022) (_1!1392 (tuple2!2763 lt!81013 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!81013 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!50989 (= (+!189 lt!81022 (tuple2!2763 lt!81013 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81314)))

(declare-fun b!154748 () Bool)

(declare-fun res!73046 () Bool)

(assert (=> b!154748 (=> (not res!73046) (not e!101089))))

(assert (=> b!154748 (= res!73046 (= (getValueByKey!184 (toList!896 lt!81314) (_1!1392 (tuple2!2763 lt!81013 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 lt!81013 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154749 () Bool)

(assert (=> b!154749 (= e!101089 (contains!948 (toList!896 lt!81314) (tuple2!2763 lt!81013 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(assert (= (and d!50989 res!73047) b!154748))

(assert (= (and b!154748 res!73046) b!154749))

(declare-fun m!189041 () Bool)

(assert (=> d!50989 m!189041))

(declare-fun m!189043 () Bool)

(assert (=> d!50989 m!189043))

(declare-fun m!189045 () Bool)

(assert (=> d!50989 m!189045))

(declare-fun m!189047 () Bool)

(assert (=> d!50989 m!189047))

(declare-fun m!189049 () Bool)

(assert (=> b!154748 m!189049))

(declare-fun m!189051 () Bool)

(assert (=> b!154749 m!189051))

(assert (=> b!154266 d!50989))

(declare-fun d!50991 () Bool)

(assert (=> d!50991 (= (apply!128 lt!81022 lt!81009) (get!1615 (getValueByKey!184 (toList!896 lt!81022) lt!81009)))))

(declare-fun bs!6574 () Bool)

(assert (= bs!6574 d!50991))

(declare-fun m!189053 () Bool)

(assert (=> bs!6574 m!189053))

(assert (=> bs!6574 m!189053))

(declare-fun m!189055 () Bool)

(assert (=> bs!6574 m!189055))

(assert (=> b!154266 d!50991))

(assert (=> b!154252 d!50859))

(assert (=> d!50701 d!50699))

(declare-fun d!50993 () Bool)

(assert (=> d!50993 (= (apply!128 (+!189 lt!80973 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!80968) (apply!128 lt!80973 lt!80968))))

(assert (=> d!50993 true))

(declare-fun _$34!1044 () Unit!4904)

(assert (=> d!50993 (= (choose!924 lt!80973 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))) lt!80968) _$34!1044)))

(declare-fun bs!6575 () Bool)

(assert (= bs!6575 d!50993))

(assert (=> bs!6575 m!188053))

(assert (=> bs!6575 m!188053))

(assert (=> bs!6575 m!188055))

(assert (=> bs!6575 m!188079))

(assert (=> d!50701 d!50993))

(declare-fun d!50995 () Bool)

(declare-fun e!101091 () Bool)

(assert (=> d!50995 e!101091))

(declare-fun res!73048 () Bool)

(assert (=> d!50995 (=> res!73048 e!101091)))

(declare-fun lt!81318 () Bool)

(assert (=> d!50995 (= res!73048 (not lt!81318))))

(declare-fun lt!81321 () Bool)

(assert (=> d!50995 (= lt!81318 lt!81321)))

(declare-fun lt!81319 () Unit!4904)

(declare-fun e!101090 () Unit!4904)

(assert (=> d!50995 (= lt!81319 e!101090)))

(declare-fun c!29675 () Bool)

(assert (=> d!50995 (= c!29675 lt!81321)))

(assert (=> d!50995 (= lt!81321 (containsKey!187 (toList!896 lt!80973) lt!80968))))

(assert (=> d!50995 (= (contains!947 lt!80973 lt!80968) lt!81318)))

(declare-fun b!154750 () Bool)

(declare-fun lt!81320 () Unit!4904)

(assert (=> b!154750 (= e!101090 lt!81320)))

(assert (=> b!154750 (= lt!81320 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!80973) lt!80968))))

(assert (=> b!154750 (isDefined!136 (getValueByKey!184 (toList!896 lt!80973) lt!80968))))

(declare-fun b!154751 () Bool)

(declare-fun Unit!4930 () Unit!4904)

(assert (=> b!154751 (= e!101090 Unit!4930)))

(declare-fun b!154752 () Bool)

(assert (=> b!154752 (= e!101091 (isDefined!136 (getValueByKey!184 (toList!896 lt!80973) lt!80968)))))

(assert (= (and d!50995 c!29675) b!154750))

(assert (= (and d!50995 (not c!29675)) b!154751))

(assert (= (and d!50995 (not res!73048)) b!154752))

(declare-fun m!189057 () Bool)

(assert (=> d!50995 m!189057))

(declare-fun m!189059 () Bool)

(assert (=> b!154750 m!189059))

(assert (=> b!154750 m!188279))

(assert (=> b!154750 m!188279))

(declare-fun m!189061 () Bool)

(assert (=> b!154750 m!189061))

(assert (=> b!154752 m!188279))

(assert (=> b!154752 m!188279))

(assert (=> b!154752 m!189061))

(assert (=> d!50701 d!50995))

(assert (=> d!50701 d!50725))

(assert (=> d!50701 d!50709))

(declare-fun d!50997 () Bool)

(declare-fun lt!81322 () Bool)

(assert (=> d!50997 (= lt!81322 (select (content!146 (toList!896 lt!81082)) (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun e!101093 () Bool)

(assert (=> d!50997 (= lt!81322 e!101093)))

(declare-fun res!73049 () Bool)

(assert (=> d!50997 (=> (not res!73049) (not e!101093))))

(assert (=> d!50997 (= res!73049 ((_ is Cons!1785) (toList!896 lt!81082)))))

(assert (=> d!50997 (= (contains!948 (toList!896 lt!81082) (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81322)))

(declare-fun b!154753 () Bool)

(declare-fun e!101092 () Bool)

(assert (=> b!154753 (= e!101093 e!101092)))

(declare-fun res!73050 () Bool)

(assert (=> b!154753 (=> res!73050 e!101092)))

(assert (=> b!154753 (= res!73050 (= (h!2394 (toList!896 lt!81082)) (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(declare-fun b!154754 () Bool)

(assert (=> b!154754 (= e!101092 (contains!948 (t!6575 (toList!896 lt!81082)) (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(assert (= (and d!50997 res!73049) b!154753))

(assert (= (and b!154753 (not res!73050)) b!154754))

(declare-fun m!189063 () Bool)

(assert (=> d!50997 m!189063))

(declare-fun m!189065 () Bool)

(assert (=> d!50997 m!189065))

(declare-fun m!189067 () Bool)

(assert (=> b!154754 m!189067))

(assert (=> b!154349 d!50997))

(declare-fun bm!17190 () Bool)

(declare-fun call!17193 () Bool)

(assert (=> bm!17190 (= call!17193 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4836 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992)))))))

(declare-fun b!154755 () Bool)

(declare-fun e!101095 () Bool)

(assert (=> b!154755 (= e!101095 call!17193)))

(declare-fun b!154756 () Bool)

(declare-fun e!101096 () Bool)

(assert (=> b!154756 (= e!101096 call!17193)))

(declare-fun b!154757 () Bool)

(declare-fun e!101094 () Bool)

(assert (=> b!154757 (= e!101094 e!101096)))

(declare-fun c!29676 () Bool)

(assert (=> b!154757 (= c!29676 (validKeyInArray!0 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154758 () Bool)

(assert (=> b!154758 (= e!101096 e!101095)))

(declare-fun lt!81324 () (_ BitVec 64))

(assert (=> b!154758 (= lt!81324 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!81325 () Unit!4904)

(assert (=> b!154758 (= lt!81325 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4836 (v!3418 (underlying!525 thiss!992))) lt!81324 #b00000000000000000000000000000000))))

(assert (=> b!154758 (arrayContainsKey!0 (_keys!4836 (v!3418 (underlying!525 thiss!992))) lt!81324 #b00000000000000000000000000000000)))

(declare-fun lt!81323 () Unit!4904)

(assert (=> b!154758 (= lt!81323 lt!81325)))

(declare-fun res!73052 () Bool)

(assert (=> b!154758 (= res!73052 (= (seekEntryOrOpen!0 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) #b00000000000000000000000000000000) (_keys!4836 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992)))) (Found!280 #b00000000000000000000000000000000)))))

(assert (=> b!154758 (=> (not res!73052) (not e!101095))))

(declare-fun d!50999 () Bool)

(declare-fun res!73051 () Bool)

(assert (=> d!50999 (=> res!73051 e!101094)))

(assert (=> d!50999 (= res!73051 (bvsge #b00000000000000000000000000000000 (size!2679 (_keys!4836 (v!3418 (underlying!525 thiss!992))))))))

(assert (=> d!50999 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4836 (v!3418 (underlying!525 thiss!992))) (mask!7467 (v!3418 (underlying!525 thiss!992)))) e!101094)))

(assert (= (and d!50999 (not res!73051)) b!154757))

(assert (= (and b!154757 c!29676) b!154758))

(assert (= (and b!154757 (not c!29676)) b!154756))

(assert (= (and b!154758 res!73052) b!154755))

(assert (= (or b!154755 b!154756) bm!17190))

(declare-fun m!189069 () Bool)

(assert (=> bm!17190 m!189069))

(assert (=> b!154757 m!188151))

(assert (=> b!154757 m!188151))

(assert (=> b!154757 m!188153))

(assert (=> b!154758 m!188151))

(declare-fun m!189071 () Bool)

(assert (=> b!154758 m!189071))

(declare-fun m!189073 () Bool)

(assert (=> b!154758 m!189073))

(assert (=> b!154758 m!188151))

(declare-fun m!189075 () Bool)

(assert (=> b!154758 m!189075))

(assert (=> b!154369 d!50999))

(declare-fun b!154759 () Bool)

(declare-fun e!101097 () Option!190)

(assert (=> b!154759 (= e!101097 (Some!189 (_2!1392 (h!2394 (toList!896 lt!81110)))))))

(declare-fun d!51001 () Bool)

(declare-fun c!29677 () Bool)

(assert (=> d!51001 (= c!29677 (and ((_ is Cons!1785) (toList!896 lt!81110)) (= (_1!1392 (h!2394 (toList!896 lt!81110))) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!51001 (= (getValueByKey!184 (toList!896 lt!81110) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) e!101097)))

(declare-fun b!154761 () Bool)

(declare-fun e!101098 () Option!190)

(assert (=> b!154761 (= e!101098 (getValueByKey!184 (t!6575 (toList!896 lt!81110)) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154760 () Bool)

(assert (=> b!154760 (= e!101097 e!101098)))

(declare-fun c!29678 () Bool)

(assert (=> b!154760 (= c!29678 (and ((_ is Cons!1785) (toList!896 lt!81110)) (not (= (_1!1392 (h!2394 (toList!896 lt!81110))) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(declare-fun b!154762 () Bool)

(assert (=> b!154762 (= e!101098 None!188)))

(assert (= (and d!51001 c!29677) b!154759))

(assert (= (and d!51001 (not c!29677)) b!154760))

(assert (= (and b!154760 c!29678) b!154761))

(assert (= (and b!154760 (not c!29678)) b!154762))

(declare-fun m!189077 () Bool)

(assert (=> b!154761 m!189077))

(assert (=> b!154366 d!51001))

(declare-fun b!154763 () Bool)

(declare-fun e!101099 () Option!190)

(assert (=> b!154763 (= e!101099 (Some!189 (_2!1392 (h!2394 (toList!896 lt!81105)))))))

(declare-fun c!29679 () Bool)

(declare-fun d!51003 () Bool)

(assert (=> d!51003 (= c!29679 (and ((_ is Cons!1785) (toList!896 lt!81105)) (= (_1!1392 (h!2394 (toList!896 lt!81105))) (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!51003 (= (getValueByKey!184 (toList!896 lt!81105) (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) e!101099)))

(declare-fun b!154765 () Bool)

(declare-fun e!101100 () Option!190)

(assert (=> b!154765 (= e!101100 (getValueByKey!184 (t!6575 (toList!896 lt!81105)) (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154764 () Bool)

(assert (=> b!154764 (= e!101099 e!101100)))

(declare-fun c!29680 () Bool)

(assert (=> b!154764 (= c!29680 (and ((_ is Cons!1785) (toList!896 lt!81105)) (not (= (_1!1392 (h!2394 (toList!896 lt!81105))) (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(declare-fun b!154766 () Bool)

(assert (=> b!154766 (= e!101100 None!188)))

(assert (= (and d!51003 c!29679) b!154763))

(assert (= (and d!51003 (not c!29679)) b!154764))

(assert (= (and b!154764 c!29680) b!154765))

(assert (= (and b!154764 (not c!29680)) b!154766))

(declare-fun m!189079 () Bool)

(assert (=> b!154765 m!189079))

(assert (=> b!154363 d!51003))

(declare-fun b!154767 () Bool)

(declare-fun e!101101 () Option!190)

(assert (=> b!154767 (= e!101101 (Some!189 (_2!1392 (h!2394 (toList!896 lt!81092)))))))

(declare-fun c!29681 () Bool)

(declare-fun d!51005 () Bool)

(assert (=> d!51005 (= c!29681 (and ((_ is Cons!1785) (toList!896 lt!81092)) (= (_1!1392 (h!2394 (toList!896 lt!81092))) (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!51005 (= (getValueByKey!184 (toList!896 lt!81092) (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) e!101101)))

(declare-fun e!101102 () Option!190)

(declare-fun b!154769 () Bool)

(assert (=> b!154769 (= e!101102 (getValueByKey!184 (t!6575 (toList!896 lt!81092)) (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154768 () Bool)

(assert (=> b!154768 (= e!101101 e!101102)))

(declare-fun c!29682 () Bool)

(assert (=> b!154768 (= c!29682 (and ((_ is Cons!1785) (toList!896 lt!81092)) (not (= (_1!1392 (h!2394 (toList!896 lt!81092))) (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(declare-fun b!154770 () Bool)

(assert (=> b!154770 (= e!101102 None!188)))

(assert (= (and d!51005 c!29681) b!154767))

(assert (= (and d!51005 (not c!29681)) b!154768))

(assert (= (and b!154768 c!29682) b!154769))

(assert (= (and b!154768 (not c!29682)) b!154770))

(declare-fun m!189081 () Bool)

(assert (=> b!154769 m!189081))

(assert (=> b!154355 d!51005))

(declare-fun d!51007 () Bool)

(assert (=> d!51007 (= (get!1615 (getValueByKey!184 (toList!896 lt!80962) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3423 (getValueByKey!184 (toList!896 lt!80962) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50671 d!51007))

(assert (=> d!50671 d!50823))

(declare-fun d!51009 () Bool)

(declare-fun e!101103 () Bool)

(assert (=> d!51009 e!101103))

(declare-fun res!73054 () Bool)

(assert (=> d!51009 (=> (not res!73054) (not e!101103))))

(declare-fun lt!81326 () ListLongMap!1761)

(assert (=> d!51009 (= res!73054 (contains!947 lt!81326 (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun lt!81327 () List!1789)

(assert (=> d!51009 (= lt!81326 (ListLongMap!1762 lt!81327))))

(declare-fun lt!81329 () Unit!4904)

(declare-fun lt!81328 () Unit!4904)

(assert (=> d!51009 (= lt!81329 lt!81328)))

(assert (=> d!51009 (= (getValueByKey!184 lt!81327 (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!51009 (= lt!81328 (lemmaContainsTupThenGetReturnValue!97 lt!81327 (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!51009 (= lt!81327 (insertStrictlySorted!100 (toList!896 call!17157) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!51009 (= (+!189 call!17157 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) lt!81326)))

(declare-fun b!154771 () Bool)

(declare-fun res!73053 () Bool)

(assert (=> b!154771 (=> (not res!73053) (not e!101103))))

(assert (=> b!154771 (= res!73053 (= (getValueByKey!184 (toList!896 lt!81326) (_1!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154772 () Bool)

(assert (=> b!154772 (= e!101103 (contains!948 (toList!896 lt!81326) (tuple2!2763 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))

(assert (= (and d!51009 res!73054) b!154771))

(assert (= (and b!154771 res!73053) b!154772))

(declare-fun m!189083 () Bool)

(assert (=> d!51009 m!189083))

(declare-fun m!189085 () Bool)

(assert (=> d!51009 m!189085))

(declare-fun m!189087 () Bool)

(assert (=> d!51009 m!189087))

(declare-fun m!189089 () Bool)

(assert (=> d!51009 m!189089))

(declare-fun m!189091 () Bool)

(assert (=> b!154771 m!189091))

(declare-fun m!189093 () Bool)

(assert (=> b!154772 m!189093))

(assert (=> b!154247 d!51009))

(declare-fun b!154773 () Bool)

(declare-fun e!101104 () Bool)

(assert (=> b!154773 (= e!101104 (contains!949 (ite c!29572 (Cons!1786 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000) Nil!1787) Nil!1787) (select (arr!2402 (_keys!4836 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!154774 () Bool)

(declare-fun e!101105 () Bool)

(declare-fun call!17194 () Bool)

(assert (=> b!154774 (= e!101105 call!17194)))

(declare-fun b!154775 () Bool)

(assert (=> b!154775 (= e!101105 call!17194)))

(declare-fun c!29683 () Bool)

(declare-fun bm!17191 () Bool)

(assert (=> bm!17191 (= call!17194 (arrayNoDuplicates!0 (_keys!4836 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!29683 (Cons!1786 (select (arr!2402 (_keys!4836 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!29572 (Cons!1786 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000) Nil!1787) Nil!1787)) (ite c!29572 (Cons!1786 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000) Nil!1787) Nil!1787))))))

(declare-fun b!154776 () Bool)

(declare-fun e!101106 () Bool)

(assert (=> b!154776 (= e!101106 e!101105)))

(assert (=> b!154776 (= c!29683 (validKeyInArray!0 (select (arr!2402 (_keys!4836 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!154777 () Bool)

(declare-fun e!101107 () Bool)

(assert (=> b!154777 (= e!101107 e!101106)))

(declare-fun res!73057 () Bool)

(assert (=> b!154777 (=> (not res!73057) (not e!101106))))

(assert (=> b!154777 (= res!73057 (not e!101104))))

(declare-fun res!73056 () Bool)

(assert (=> b!154777 (=> (not res!73056) (not e!101104))))

(assert (=> b!154777 (= res!73056 (validKeyInArray!0 (select (arr!2402 (_keys!4836 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!51011 () Bool)

(declare-fun res!73055 () Bool)

(assert (=> d!51011 (=> res!73055 e!101107)))

(assert (=> d!51011 (= res!73055 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2679 (_keys!4836 newMap!16))))))

(assert (=> d!51011 (= (arrayNoDuplicates!0 (_keys!4836 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29572 (Cons!1786 (select (arr!2402 (_keys!4836 newMap!16)) #b00000000000000000000000000000000) Nil!1787) Nil!1787)) e!101107)))

(assert (= (and d!51011 (not res!73055)) b!154777))

(assert (= (and b!154777 res!73056) b!154773))

(assert (= (and b!154777 res!73057) b!154776))

(assert (= (and b!154776 c!29683) b!154774))

(assert (= (and b!154776 (not c!29683)) b!154775))

(assert (= (or b!154774 b!154775) bm!17191))

(assert (=> b!154773 m!188639))

(assert (=> b!154773 m!188639))

(declare-fun m!189095 () Bool)

(assert (=> b!154773 m!189095))

(assert (=> bm!17191 m!188639))

(declare-fun m!189097 () Bool)

(assert (=> bm!17191 m!189097))

(assert (=> b!154776 m!188639))

(assert (=> b!154776 m!188639))

(assert (=> b!154776 m!188641))

(assert (=> b!154777 m!188639))

(assert (=> b!154777 m!188639))

(assert (=> b!154777 m!188641))

(assert (=> bm!17167 d!51011))

(declare-fun d!51013 () Bool)

(declare-fun e!101109 () Bool)

(assert (=> d!51013 e!101109))

(declare-fun res!73058 () Bool)

(assert (=> d!51013 (=> res!73058 e!101109)))

(declare-fun lt!81330 () Bool)

(assert (=> d!51013 (= res!73058 (not lt!81330))))

(declare-fun lt!81333 () Bool)

(assert (=> d!51013 (= lt!81330 lt!81333)))

(declare-fun lt!81331 () Unit!4904)

(declare-fun e!101108 () Unit!4904)

(assert (=> d!51013 (= lt!81331 e!101108)))

(declare-fun c!29684 () Bool)

(assert (=> d!51013 (= c!29684 lt!81333)))

(assert (=> d!51013 (= lt!81333 (containsKey!187 (toList!896 lt!81082) (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!51013 (= (contains!947 lt!81082 (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81330)))

(declare-fun b!154778 () Bool)

(declare-fun lt!81332 () Unit!4904)

(assert (=> b!154778 (= e!101108 lt!81332)))

(assert (=> b!154778 (= lt!81332 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!81082) (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> b!154778 (isDefined!136 (getValueByKey!184 (toList!896 lt!81082) (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154779 () Bool)

(declare-fun Unit!4931 () Unit!4904)

(assert (=> b!154779 (= e!101108 Unit!4931)))

(declare-fun b!154780 () Bool)

(assert (=> b!154780 (= e!101109 (isDefined!136 (getValueByKey!184 (toList!896 lt!81082) (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (= (and d!51013 c!29684) b!154778))

(assert (= (and d!51013 (not c!29684)) b!154779))

(assert (= (and d!51013 (not res!73058)) b!154780))

(declare-fun m!189099 () Bool)

(assert (=> d!51013 m!189099))

(declare-fun m!189101 () Bool)

(assert (=> b!154778 m!189101))

(assert (=> b!154778 m!188275))

(assert (=> b!154778 m!188275))

(declare-fun m!189103 () Bool)

(assert (=> b!154778 m!189103))

(assert (=> b!154780 m!188275))

(assert (=> b!154780 m!188275))

(assert (=> b!154780 m!189103))

(assert (=> d!50697 d!51013))

(declare-fun b!154781 () Bool)

(declare-fun e!101110 () Option!190)

(assert (=> b!154781 (= e!101110 (Some!189 (_2!1392 (h!2394 lt!81083))))))

(declare-fun d!51015 () Bool)

(declare-fun c!29685 () Bool)

(assert (=> d!51015 (= c!29685 (and ((_ is Cons!1785) lt!81083) (= (_1!1392 (h!2394 lt!81083)) (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!51015 (= (getValueByKey!184 lt!81083 (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) e!101110)))

(declare-fun b!154783 () Bool)

(declare-fun e!101111 () Option!190)

(assert (=> b!154783 (= e!101111 (getValueByKey!184 (t!6575 lt!81083) (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154782 () Bool)

(assert (=> b!154782 (= e!101110 e!101111)))

(declare-fun c!29686 () Bool)

(assert (=> b!154782 (= c!29686 (and ((_ is Cons!1785) lt!81083) (not (= (_1!1392 (h!2394 lt!81083)) (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(declare-fun b!154784 () Bool)

(assert (=> b!154784 (= e!101111 None!188)))

(assert (= (and d!51015 c!29685) b!154781))

(assert (= (and d!51015 (not c!29685)) b!154782))

(assert (= (and b!154782 c!29686) b!154783))

(assert (= (and b!154782 (not c!29686)) b!154784))

(declare-fun m!189105 () Bool)

(assert (=> b!154783 m!189105))

(assert (=> d!50697 d!51015))

(declare-fun d!51017 () Bool)

(assert (=> d!51017 (= (getValueByKey!184 lt!81083 (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun lt!81334 () Unit!4904)

(assert (=> d!51017 (= lt!81334 (choose!927 lt!81083 (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun e!101112 () Bool)

(assert (=> d!51017 e!101112))

(declare-fun res!73059 () Bool)

(assert (=> d!51017 (=> (not res!73059) (not e!101112))))

(assert (=> d!51017 (= res!73059 (isStrictlySorted!317 lt!81083))))

(assert (=> d!51017 (= (lemmaContainsTupThenGetReturnValue!97 lt!81083 (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81334)))

(declare-fun b!154785 () Bool)

(declare-fun res!73060 () Bool)

(assert (=> b!154785 (=> (not res!73060) (not e!101112))))

(assert (=> b!154785 (= res!73060 (containsKey!187 lt!81083 (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154786 () Bool)

(assert (=> b!154786 (= e!101112 (contains!948 lt!81083 (tuple2!2763 (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (= (and d!51017 res!73059) b!154785))

(assert (= (and b!154785 res!73060) b!154786))

(assert (=> d!51017 m!188269))

(declare-fun m!189107 () Bool)

(assert (=> d!51017 m!189107))

(declare-fun m!189109 () Bool)

(assert (=> d!51017 m!189109))

(declare-fun m!189111 () Bool)

(assert (=> b!154785 m!189111))

(declare-fun m!189113 () Bool)

(assert (=> b!154786 m!189113))

(assert (=> d!50697 d!51017))

(declare-fun b!154787 () Bool)

(declare-fun res!73062 () Bool)

(declare-fun e!101116 () Bool)

(assert (=> b!154787 (=> (not res!73062) (not e!101116))))

(declare-fun lt!81335 () List!1789)

(assert (=> b!154787 (= res!73062 (containsKey!187 lt!81335 (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154788 () Bool)

(declare-fun c!29687 () Bool)

(declare-fun c!29690 () Bool)

(declare-fun e!101115 () List!1789)

(assert (=> b!154788 (= e!101115 (ite c!29687 (t!6575 (toList!896 lt!80961)) (ite c!29690 (Cons!1785 (h!2394 (toList!896 lt!80961)) (t!6575 (toList!896 lt!80961))) Nil!1786)))))

(declare-fun b!154789 () Bool)

(declare-fun e!101117 () List!1789)

(declare-fun call!17197 () List!1789)

(assert (=> b!154789 (= e!101117 call!17197)))

(declare-fun b!154790 () Bool)

(assert (=> b!154790 (= e!101115 (insertStrictlySorted!100 (t!6575 (toList!896 lt!80961)) (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun bm!17193 () Bool)

(declare-fun call!17195 () List!1789)

(declare-fun call!17196 () List!1789)

(assert (=> bm!17193 (= call!17195 call!17196)))

(declare-fun d!51019 () Bool)

(assert (=> d!51019 e!101116))

(declare-fun res!73061 () Bool)

(assert (=> d!51019 (=> (not res!73061) (not e!101116))))

(assert (=> d!51019 (= res!73061 (isStrictlySorted!317 lt!81335))))

(assert (=> d!51019 (= lt!81335 e!101117)))

(declare-fun c!29689 () Bool)

(assert (=> d!51019 (= c!29689 (and ((_ is Cons!1785) (toList!896 lt!80961)) (bvslt (_1!1392 (h!2394 (toList!896 lt!80961))) (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!51019 (isStrictlySorted!317 (toList!896 lt!80961))))

(assert (=> d!51019 (= (insertStrictlySorted!100 (toList!896 lt!80961) (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81335)))

(declare-fun bm!17192 () Bool)

(assert (=> bm!17192 (= call!17196 call!17197)))

(declare-fun b!154791 () Bool)

(declare-fun e!101113 () List!1789)

(assert (=> b!154791 (= e!101113 call!17195)))

(declare-fun b!154792 () Bool)

(assert (=> b!154792 (= c!29690 (and ((_ is Cons!1785) (toList!896 lt!80961)) (bvsgt (_1!1392 (h!2394 (toList!896 lt!80961))) (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun e!101114 () List!1789)

(assert (=> b!154792 (= e!101114 e!101113)))

(declare-fun b!154793 () Bool)

(assert (=> b!154793 (= e!101114 call!17196)))

(declare-fun b!154794 () Bool)

(assert (=> b!154794 (= e!101116 (contains!948 lt!81335 (tuple2!2763 (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154795 () Bool)

(assert (=> b!154795 (= e!101117 e!101114)))

(assert (=> b!154795 (= c!29687 (and ((_ is Cons!1785) (toList!896 lt!80961)) (= (_1!1392 (h!2394 (toList!896 lt!80961))) (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154796 () Bool)

(assert (=> b!154796 (= e!101113 call!17195)))

(declare-fun bm!17194 () Bool)

(assert (=> bm!17194 (= call!17197 ($colon$colon!95 e!101115 (ite c!29689 (h!2394 (toList!896 lt!80961)) (tuple2!2763 (_1!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80971 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(declare-fun c!29688 () Bool)

(assert (=> bm!17194 (= c!29688 c!29689)))

(assert (= (and d!51019 c!29689) b!154789))

(assert (= (and d!51019 (not c!29689)) b!154795))

(assert (= (and b!154795 c!29687) b!154793))

(assert (= (and b!154795 (not c!29687)) b!154792))

(assert (= (and b!154792 c!29690) b!154791))

(assert (= (and b!154792 (not c!29690)) b!154796))

(assert (= (or b!154791 b!154796) bm!17193))

(assert (= (or b!154793 bm!17193) bm!17192))

(assert (= (or b!154789 bm!17192) bm!17194))

(assert (= (and bm!17194 c!29688) b!154790))

(assert (= (and bm!17194 (not c!29688)) b!154788))

(assert (= (and d!51019 res!73061) b!154787))

(assert (= (and b!154787 res!73062) b!154794))

(declare-fun m!189115 () Bool)

(assert (=> b!154794 m!189115))

(declare-fun m!189117 () Bool)

(assert (=> b!154790 m!189117))

(declare-fun m!189119 () Bool)

(assert (=> b!154787 m!189119))

(declare-fun m!189121 () Bool)

(assert (=> bm!17194 m!189121))

(declare-fun m!189123 () Bool)

(assert (=> d!51019 m!189123))

(declare-fun m!189125 () Bool)

(assert (=> d!51019 m!189125))

(assert (=> d!50697 d!51019))

(declare-fun d!51021 () Bool)

(declare-fun e!101119 () Bool)

(assert (=> d!51021 e!101119))

(declare-fun res!73063 () Bool)

(assert (=> d!51021 (=> res!73063 e!101119)))

(declare-fun lt!81336 () Bool)

(assert (=> d!51021 (= res!73063 (not lt!81336))))

(declare-fun lt!81339 () Bool)

(assert (=> d!51021 (= lt!81336 lt!81339)))

(declare-fun lt!81337 () Unit!4904)

(declare-fun e!101118 () Unit!4904)

(assert (=> d!51021 (= lt!81337 e!101118)))

(declare-fun c!29691 () Bool)

(assert (=> d!51021 (= c!29691 lt!81339)))

(assert (=> d!51021 (= lt!81339 (containsKey!187 (toList!896 lt!81105) (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!51021 (= (contains!947 lt!81105 (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81336)))

(declare-fun b!154797 () Bool)

(declare-fun lt!81338 () Unit!4904)

(assert (=> b!154797 (= e!101118 lt!81338)))

(assert (=> b!154797 (= lt!81338 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!81105) (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> b!154797 (isDefined!136 (getValueByKey!184 (toList!896 lt!81105) (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154798 () Bool)

(declare-fun Unit!4932 () Unit!4904)

(assert (=> b!154798 (= e!101118 Unit!4932)))

(declare-fun b!154799 () Bool)

(assert (=> b!154799 (= e!101119 (isDefined!136 (getValueByKey!184 (toList!896 lt!81105) (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (= (and d!51021 c!29691) b!154797))

(assert (= (and d!51021 (not c!29691)) b!154798))

(assert (= (and d!51021 (not res!73063)) b!154799))

(declare-fun m!189127 () Bool)

(assert (=> d!51021 m!189127))

(declare-fun m!189129 () Bool)

(assert (=> b!154797 m!189129))

(assert (=> b!154797 m!188347))

(assert (=> b!154797 m!188347))

(declare-fun m!189131 () Bool)

(assert (=> b!154797 m!189131))

(assert (=> b!154799 m!188347))

(assert (=> b!154799 m!188347))

(assert (=> b!154799 m!189131))

(assert (=> d!50719 d!51021))

(declare-fun b!154800 () Bool)

(declare-fun e!101120 () Option!190)

(assert (=> b!154800 (= e!101120 (Some!189 (_2!1392 (h!2394 lt!81106))))))

(declare-fun d!51023 () Bool)

(declare-fun c!29692 () Bool)

(assert (=> d!51023 (= c!29692 (and ((_ is Cons!1785) lt!81106) (= (_1!1392 (h!2394 lt!81106)) (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!51023 (= (getValueByKey!184 lt!81106 (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) e!101120)))

(declare-fun e!101121 () Option!190)

(declare-fun b!154802 () Bool)

(assert (=> b!154802 (= e!101121 (getValueByKey!184 (t!6575 lt!81106) (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154801 () Bool)

(assert (=> b!154801 (= e!101120 e!101121)))

(declare-fun c!29693 () Bool)

(assert (=> b!154801 (= c!29693 (and ((_ is Cons!1785) lt!81106) (not (= (_1!1392 (h!2394 lt!81106)) (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(declare-fun b!154803 () Bool)

(assert (=> b!154803 (= e!101121 None!188)))

(assert (= (and d!51023 c!29692) b!154800))

(assert (= (and d!51023 (not c!29692)) b!154801))

(assert (= (and b!154801 c!29693) b!154802))

(assert (= (and b!154801 (not c!29693)) b!154803))

(declare-fun m!189133 () Bool)

(assert (=> b!154802 m!189133))

(assert (=> d!50719 d!51023))

(declare-fun d!51025 () Bool)

(assert (=> d!51025 (= (getValueByKey!184 lt!81106 (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun lt!81340 () Unit!4904)

(assert (=> d!51025 (= lt!81340 (choose!927 lt!81106 (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun e!101122 () Bool)

(assert (=> d!51025 e!101122))

(declare-fun res!73064 () Bool)

(assert (=> d!51025 (=> (not res!73064) (not e!101122))))

(assert (=> d!51025 (= res!73064 (isStrictlySorted!317 lt!81106))))

(assert (=> d!51025 (= (lemmaContainsTupThenGetReturnValue!97 lt!81106 (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81340)))

(declare-fun b!154804 () Bool)

(declare-fun res!73065 () Bool)

(assert (=> b!154804 (=> (not res!73065) (not e!101122))))

(assert (=> b!154804 (= res!73065 (containsKey!187 lt!81106 (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154805 () Bool)

(assert (=> b!154805 (= e!101122 (contains!948 lt!81106 (tuple2!2763 (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (= (and d!51025 res!73064) b!154804))

(assert (= (and b!154804 res!73065) b!154805))

(assert (=> d!51025 m!188341))

(declare-fun m!189135 () Bool)

(assert (=> d!51025 m!189135))

(declare-fun m!189137 () Bool)

(assert (=> d!51025 m!189137))

(declare-fun m!189139 () Bool)

(assert (=> b!154804 m!189139))

(declare-fun m!189141 () Bool)

(assert (=> b!154805 m!189141))

(assert (=> d!50719 d!51025))

(declare-fun b!154806 () Bool)

(declare-fun res!73067 () Bool)

(declare-fun e!101126 () Bool)

(assert (=> b!154806 (=> (not res!73067) (not e!101126))))

(declare-fun lt!81341 () List!1789)

(assert (=> b!154806 (= res!73067 (containsKey!187 lt!81341 (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154807 () Bool)

(declare-fun c!29697 () Bool)

(declare-fun c!29694 () Bool)

(declare-fun e!101125 () List!1789)

(assert (=> b!154807 (= e!101125 (ite c!29694 (t!6575 (toList!896 lt!80966)) (ite c!29697 (Cons!1785 (h!2394 (toList!896 lt!80966)) (t!6575 (toList!896 lt!80966))) Nil!1786)))))

(declare-fun b!154808 () Bool)

(declare-fun e!101127 () List!1789)

(declare-fun call!17200 () List!1789)

(assert (=> b!154808 (= e!101127 call!17200)))

(declare-fun b!154809 () Bool)

(assert (=> b!154809 (= e!101125 (insertStrictlySorted!100 (t!6575 (toList!896 lt!80966)) (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun bm!17196 () Bool)

(declare-fun call!17198 () List!1789)

(declare-fun call!17199 () List!1789)

(assert (=> bm!17196 (= call!17198 call!17199)))

(declare-fun d!51027 () Bool)

(assert (=> d!51027 e!101126))

(declare-fun res!73066 () Bool)

(assert (=> d!51027 (=> (not res!73066) (not e!101126))))

(assert (=> d!51027 (= res!73066 (isStrictlySorted!317 lt!81341))))

(assert (=> d!51027 (= lt!81341 e!101127)))

(declare-fun c!29696 () Bool)

(assert (=> d!51027 (= c!29696 (and ((_ is Cons!1785) (toList!896 lt!80966)) (bvslt (_1!1392 (h!2394 (toList!896 lt!80966))) (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!51027 (isStrictlySorted!317 (toList!896 lt!80966))))

(assert (=> d!51027 (= (insertStrictlySorted!100 (toList!896 lt!80966) (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81341)))

(declare-fun bm!17195 () Bool)

(assert (=> bm!17195 (= call!17199 call!17200)))

(declare-fun b!154810 () Bool)

(declare-fun e!101123 () List!1789)

(assert (=> b!154810 (= e!101123 call!17198)))

(declare-fun b!154811 () Bool)

(assert (=> b!154811 (= c!29697 (and ((_ is Cons!1785) (toList!896 lt!80966)) (bvsgt (_1!1392 (h!2394 (toList!896 lt!80966))) (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun e!101124 () List!1789)

(assert (=> b!154811 (= e!101124 e!101123)))

(declare-fun b!154812 () Bool)

(assert (=> b!154812 (= e!101124 call!17199)))

(declare-fun b!154813 () Bool)

(assert (=> b!154813 (= e!101126 (contains!948 lt!81341 (tuple2!2763 (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154814 () Bool)

(assert (=> b!154814 (= e!101127 e!101124)))

(assert (=> b!154814 (= c!29694 (and ((_ is Cons!1785) (toList!896 lt!80966)) (= (_1!1392 (h!2394 (toList!896 lt!80966))) (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154815 () Bool)

(assert (=> b!154815 (= e!101123 call!17198)))

(declare-fun bm!17197 () Bool)

(assert (=> bm!17197 (= call!17200 ($colon$colon!95 e!101125 (ite c!29696 (h!2394 (toList!896 lt!80966)) (tuple2!2763 (_1!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(declare-fun c!29695 () Bool)

(assert (=> bm!17197 (= c!29695 c!29696)))

(assert (= (and d!51027 c!29696) b!154808))

(assert (= (and d!51027 (not c!29696)) b!154814))

(assert (= (and b!154814 c!29694) b!154812))

(assert (= (and b!154814 (not c!29694)) b!154811))

(assert (= (and b!154811 c!29697) b!154810))

(assert (= (and b!154811 (not c!29697)) b!154815))

(assert (= (or b!154810 b!154815) bm!17196))

(assert (= (or b!154812 bm!17196) bm!17195))

(assert (= (or b!154808 bm!17195) bm!17197))

(assert (= (and bm!17197 c!29695) b!154809))

(assert (= (and bm!17197 (not c!29695)) b!154807))

(assert (= (and d!51027 res!73066) b!154806))

(assert (= (and b!154806 res!73067) b!154813))

(declare-fun m!189143 () Bool)

(assert (=> b!154813 m!189143))

(declare-fun m!189145 () Bool)

(assert (=> b!154809 m!189145))

(declare-fun m!189147 () Bool)

(assert (=> b!154806 m!189147))

(declare-fun m!189149 () Bool)

(assert (=> bm!17197 m!189149))

(declare-fun m!189151 () Bool)

(assert (=> d!51027 m!189151))

(declare-fun m!189153 () Bool)

(assert (=> d!51027 m!189153))

(assert (=> d!50719 d!51027))

(declare-fun d!51029 () Bool)

(declare-fun res!73068 () Bool)

(declare-fun e!101128 () Bool)

(assert (=> d!51029 (=> res!73068 e!101128)))

(assert (=> d!51029 (= res!73068 (and ((_ is Cons!1785) (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))) (= (_1!1392 (h!2394 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))) lt!80981)))))

(assert (=> d!51029 (= (containsKey!187 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!80981) e!101128)))

(declare-fun b!154816 () Bool)

(declare-fun e!101129 () Bool)

(assert (=> b!154816 (= e!101128 e!101129)))

(declare-fun res!73069 () Bool)

(assert (=> b!154816 (=> (not res!73069) (not e!101129))))

(assert (=> b!154816 (= res!73069 (and (or (not ((_ is Cons!1785) (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))) (bvsle (_1!1392 (h!2394 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))) lt!80981)) ((_ is Cons!1785) (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))) (bvslt (_1!1392 (h!2394 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992)))))))) lt!80981)))))

(declare-fun b!154817 () Bool)

(assert (=> b!154817 (= e!101129 (containsKey!187 (t!6575 (toList!896 (+!189 lt!80966 (tuple2!2763 lt!80976 (zeroValue!2906 (v!3418 (underlying!525 thiss!992))))))) lt!80981))))

(assert (= (and d!51029 (not res!73068)) b!154816))

(assert (= (and b!154816 res!73069) b!154817))

(declare-fun m!189155 () Bool)

(assert (=> b!154817 m!189155))

(assert (=> d!50717 d!51029))

(declare-fun d!51031 () Bool)

(declare-fun e!101131 () Bool)

(assert (=> d!51031 e!101131))

(declare-fun res!73070 () Bool)

(assert (=> d!51031 (=> res!73070 e!101131)))

(declare-fun lt!81342 () Bool)

(assert (=> d!51031 (= res!73070 (not lt!81342))))

(declare-fun lt!81345 () Bool)

(assert (=> d!51031 (= lt!81342 lt!81345)))

(declare-fun lt!81343 () Unit!4904)

(declare-fun e!101130 () Unit!4904)

(assert (=> d!51031 (= lt!81343 e!101130)))

(declare-fun c!29698 () Bool)

(assert (=> d!51031 (= c!29698 lt!81345)))

(assert (=> d!51031 (= lt!81345 (containsKey!187 (toList!896 lt!81061) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!51031 (= (contains!947 lt!81061 (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!81342)))

(declare-fun b!154818 () Bool)

(declare-fun lt!81344 () Unit!4904)

(assert (=> b!154818 (= e!101130 lt!81344)))

(assert (=> b!154818 (= lt!81344 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!81061) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!154818 (isDefined!136 (getValueByKey!184 (toList!896 lt!81061) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!154819 () Bool)

(declare-fun Unit!4933 () Unit!4904)

(assert (=> b!154819 (= e!101130 Unit!4933)))

(declare-fun b!154820 () Bool)

(assert (=> b!154820 (= e!101131 (isDefined!136 (getValueByKey!184 (toList!896 lt!81061) (select (arr!2402 (_keys!4836 (v!3418 (underlying!525 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!51031 c!29698) b!154818))

(assert (= (and d!51031 (not c!29698)) b!154819))

(assert (= (and d!51031 (not res!73070)) b!154820))

(assert (=> d!51031 m!188021))

(declare-fun m!189157 () Bool)

(assert (=> d!51031 m!189157))

(assert (=> b!154818 m!188021))

(declare-fun m!189159 () Bool)

(assert (=> b!154818 m!189159))

(assert (=> b!154818 m!188021))

(assert (=> b!154818 m!188649))

(assert (=> b!154818 m!188649))

(declare-fun m!189161 () Bool)

(assert (=> b!154818 m!189161))

(assert (=> b!154820 m!188021))

(assert (=> b!154820 m!188649))

(assert (=> b!154820 m!188649))

(assert (=> b!154820 m!189161))

(assert (=> b!154337 d!51031))

(declare-fun d!51033 () Bool)

(assert (=> d!51033 (= (apply!128 lt!80984 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1615 (getValueByKey!184 (toList!896 lt!80984) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6576 () Bool)

(assert (= bs!6576 d!51033))

(assert (=> bs!6576 m!188809))

(assert (=> bs!6576 m!188809))

(declare-fun m!189163 () Bool)

(assert (=> bs!6576 m!189163))

(assert (=> b!154235 d!51033))

(declare-fun d!51035 () Bool)

(declare-fun e!101133 () Bool)

(assert (=> d!51035 e!101133))

(declare-fun res!73071 () Bool)

(assert (=> d!51035 (=> res!73071 e!101133)))

(declare-fun lt!81346 () Bool)

(assert (=> d!51035 (= res!73071 (not lt!81346))))

(declare-fun lt!81349 () Bool)

(assert (=> d!51035 (= lt!81346 lt!81349)))

(declare-fun lt!81347 () Unit!4904)

(declare-fun e!101132 () Unit!4904)

(assert (=> d!51035 (= lt!81347 e!101132)))

(declare-fun c!29699 () Bool)

(assert (=> d!51035 (= c!29699 lt!81349)))

(assert (=> d!51035 (= lt!81349 (containsKey!187 (toList!896 lt!81092) (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> d!51035 (= (contains!947 lt!81092 (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81346)))

(declare-fun b!154821 () Bool)

(declare-fun lt!81348 () Unit!4904)

(assert (=> b!154821 (= e!101132 lt!81348)))

(assert (=> b!154821 (= lt!81348 (lemmaContainsKeyImpliesGetValueByKeyDefined!135 (toList!896 lt!81092) (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(assert (=> b!154821 (isDefined!136 (getValueByKey!184 (toList!896 lt!81092) (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154822 () Bool)

(declare-fun Unit!4934 () Unit!4904)

(assert (=> b!154822 (= e!101132 Unit!4934)))

(declare-fun b!154823 () Bool)

(assert (=> b!154823 (= e!101133 (isDefined!136 (getValueByKey!184 (toList!896 lt!81092) (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (= (and d!51035 c!29699) b!154821))

(assert (= (and d!51035 (not c!29699)) b!154822))

(assert (= (and d!51035 (not res!73071)) b!154823))

(declare-fun m!189165 () Bool)

(assert (=> d!51035 m!189165))

(declare-fun m!189167 () Bool)

(assert (=> b!154821 m!189167))

(assert (=> b!154821 m!188307))

(assert (=> b!154821 m!188307))

(declare-fun m!189169 () Bool)

(assert (=> b!154821 m!189169))

(assert (=> b!154823 m!188307))

(assert (=> b!154823 m!188307))

(assert (=> b!154823 m!189169))

(assert (=> d!50709 d!51035))

(declare-fun b!154824 () Bool)

(declare-fun e!101134 () Option!190)

(assert (=> b!154824 (= e!101134 (Some!189 (_2!1392 (h!2394 lt!81093))))))

(declare-fun d!51037 () Bool)

(declare-fun c!29700 () Bool)

(assert (=> d!51037 (= c!29700 (and ((_ is Cons!1785) lt!81093) (= (_1!1392 (h!2394 lt!81093)) (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!51037 (= (getValueByKey!184 lt!81093 (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) e!101134)))

(declare-fun b!154826 () Bool)

(declare-fun e!101135 () Option!190)

(assert (=> b!154826 (= e!101135 (getValueByKey!184 (t!6575 lt!81093) (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154825 () Bool)

(assert (=> b!154825 (= e!101134 e!101135)))

(declare-fun c!29701 () Bool)

(assert (=> b!154825 (= c!29701 (and ((_ is Cons!1785) lt!81093) (not (= (_1!1392 (h!2394 lt!81093)) (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(declare-fun b!154827 () Bool)

(assert (=> b!154827 (= e!101135 None!188)))

(assert (= (and d!51037 c!29700) b!154824))

(assert (= (and d!51037 (not c!29700)) b!154825))

(assert (= (and b!154825 c!29701) b!154826))

(assert (= (and b!154825 (not c!29701)) b!154827))

(declare-fun m!189171 () Bool)

(assert (=> b!154826 m!189171))

(assert (=> d!50709 d!51037))

(declare-fun d!51039 () Bool)

(assert (=> d!51039 (= (getValueByKey!184 lt!81093 (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) (Some!189 (_2!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun lt!81350 () Unit!4904)

(assert (=> d!51039 (= lt!81350 (choose!927 lt!81093 (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun e!101136 () Bool)

(assert (=> d!51039 e!101136))

(declare-fun res!73072 () Bool)

(assert (=> d!51039 (=> (not res!73072) (not e!101136))))

(assert (=> d!51039 (= res!73072 (isStrictlySorted!317 lt!81093))))

(assert (=> d!51039 (= (lemmaContainsTupThenGetReturnValue!97 lt!81093 (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81350)))

(declare-fun b!154828 () Bool)

(declare-fun res!73073 () Bool)

(assert (=> b!154828 (=> (not res!73073) (not e!101136))))

(assert (=> b!154828 (= res!73073 (containsKey!187 lt!81093 (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun b!154829 () Bool)

(assert (=> b!154829 (= e!101136 (contains!948 lt!81093 (tuple2!2763 (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (= (and d!51039 res!73072) b!154828))

(assert (= (and b!154828 res!73073) b!154829))

(assert (=> d!51039 m!188301))

(declare-fun m!189173 () Bool)

(assert (=> d!51039 m!189173))

(declare-fun m!189175 () Bool)

(assert (=> d!51039 m!189175))

(declare-fun m!189177 () Bool)

(assert (=> b!154828 m!189177))

(declare-fun m!189179 () Bool)

(assert (=> b!154829 m!189179))

(assert (=> d!50709 d!51039))

(declare-fun b!154830 () Bool)

(declare-fun res!73075 () Bool)

(declare-fun e!101140 () Bool)

(assert (=> b!154830 (=> (not res!73075) (not e!101140))))

(declare-fun lt!81351 () List!1789)

(assert (=> b!154830 (= res!73075 (containsKey!187 lt!81351 (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun e!101139 () List!1789)

(declare-fun c!29702 () Bool)

(declare-fun b!154831 () Bool)

(declare-fun c!29705 () Bool)

(assert (=> b!154831 (= e!101139 (ite c!29702 (t!6575 (toList!896 lt!80973)) (ite c!29705 (Cons!1785 (h!2394 (toList!896 lt!80973)) (t!6575 (toList!896 lt!80973))) Nil!1786)))))

(declare-fun b!154832 () Bool)

(declare-fun e!101141 () List!1789)

(declare-fun call!17203 () List!1789)

(assert (=> b!154832 (= e!101141 call!17203)))

(declare-fun b!154833 () Bool)

(assert (=> b!154833 (= e!101139 (insertStrictlySorted!100 (t!6575 (toList!896 lt!80973)) (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))

(declare-fun bm!17199 () Bool)

(declare-fun call!17201 () List!1789)

(declare-fun call!17202 () List!1789)

(assert (=> bm!17199 (= call!17201 call!17202)))

(declare-fun d!51041 () Bool)

(assert (=> d!51041 e!101140))

(declare-fun res!73074 () Bool)

(assert (=> d!51041 (=> (not res!73074) (not e!101140))))

(assert (=> d!51041 (= res!73074 (isStrictlySorted!317 lt!81351))))

(assert (=> d!51041 (= lt!81351 e!101141)))

(declare-fun c!29704 () Bool)

(assert (=> d!51041 (= c!29704 (and ((_ is Cons!1785) (toList!896 lt!80973)) (bvslt (_1!1392 (h!2394 (toList!896 lt!80973))) (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(assert (=> d!51041 (isStrictlySorted!317 (toList!896 lt!80973))))

(assert (=> d!51041 (= (insertStrictlySorted!100 (toList!896 lt!80973) (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))) lt!81351)))

(declare-fun bm!17198 () Bool)

(assert (=> bm!17198 (= call!17202 call!17203)))

(declare-fun b!154834 () Bool)

(declare-fun e!101137 () List!1789)

(assert (=> b!154834 (= e!101137 call!17201)))

(declare-fun b!154835 () Bool)

(assert (=> b!154835 (= c!29705 (and ((_ is Cons!1785) (toList!896 lt!80973)) (bvsgt (_1!1392 (h!2394 (toList!896 lt!80973))) (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun e!101138 () List!1789)

(assert (=> b!154835 (= e!101138 e!101137)))

(declare-fun b!154836 () Bool)

(assert (=> b!154836 (= e!101138 call!17202)))

(declare-fun b!154837 () Bool)

(assert (=> b!154837 (= e!101140 (contains!948 lt!81351 (tuple2!2763 (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154838 () Bool)

(assert (=> b!154838 (= e!101141 e!101138)))

(assert (=> b!154838 (= c!29702 (and ((_ is Cons!1785) (toList!896 lt!80973)) (= (_1!1392 (h!2394 (toList!896 lt!80973))) (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))))))))

(declare-fun b!154839 () Bool)

(assert (=> b!154839 (= e!101137 call!17201)))

(declare-fun bm!17200 () Bool)

(assert (=> bm!17200 (= call!17203 ($colon$colon!95 e!101139 (ite c!29704 (h!2394 (toList!896 lt!80973)) (tuple2!2763 (_1!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992))))) (_2!1392 (tuple2!2763 lt!80960 (minValue!2906 (v!3418 (underlying!525 thiss!992)))))))))))

(declare-fun c!29703 () Bool)

(assert (=> bm!17200 (= c!29703 c!29704)))

(assert (= (and d!51041 c!29704) b!154832))

(assert (= (and d!51041 (not c!29704)) b!154838))

(assert (= (and b!154838 c!29702) b!154836))

(assert (= (and b!154838 (not c!29702)) b!154835))

(assert (= (and b!154835 c!29705) b!154834))

(assert (= (and b!154835 (not c!29705)) b!154839))

(assert (= (or b!154834 b!154839) bm!17199))

(assert (= (or b!154836 bm!17199) bm!17198))

(assert (= (or b!154832 bm!17198) bm!17200))

(assert (= (and bm!17200 c!29703) b!154833))

(assert (= (and bm!17200 (not c!29703)) b!154831))

(assert (= (and d!51041 res!73074) b!154830))

(assert (= (and b!154830 res!73075) b!154837))

(declare-fun m!189181 () Bool)

(assert (=> b!154837 m!189181))

(declare-fun m!189183 () Bool)

(assert (=> b!154833 m!189183))

(declare-fun m!189185 () Bool)

(assert (=> b!154830 m!189185))

(declare-fun m!189187 () Bool)

(assert (=> bm!17200 m!189187))

(declare-fun m!189189 () Bool)

(assert (=> d!51041 m!189189))

(declare-fun m!189191 () Bool)

(assert (=> d!51041 m!189191))

(assert (=> d!50709 d!51041))

(assert (=> bm!17152 d!50973))

(declare-fun mapNonEmpty!5185 () Bool)

(declare-fun mapRes!5185 () Bool)

(declare-fun tp!12205 () Bool)

(declare-fun e!101142 () Bool)

(assert (=> mapNonEmpty!5185 (= mapRes!5185 (and tp!12205 e!101142))))

(declare-fun mapValue!5185 () ValueCell!1169)

(declare-fun mapKey!5185 () (_ BitVec 32))

(declare-fun mapRest!5185 () (Array (_ BitVec 32) ValueCell!1169))

(assert (=> mapNonEmpty!5185 (= mapRest!5183 (store mapRest!5185 mapKey!5185 mapValue!5185))))

(declare-fun b!154840 () Bool)

(assert (=> b!154840 (= e!101142 tp_is_empty!3025)))

(declare-fun b!154841 () Bool)

(declare-fun e!101143 () Bool)

(assert (=> b!154841 (= e!101143 tp_is_empty!3025)))

(declare-fun condMapEmpty!5185 () Bool)

(declare-fun mapDefault!5185 () ValueCell!1169)

(assert (=> mapNonEmpty!5183 (= condMapEmpty!5185 (= mapRest!5183 ((as const (Array (_ BitVec 32) ValueCell!1169)) mapDefault!5185)))))

(assert (=> mapNonEmpty!5183 (= tp!12203 (and e!101143 mapRes!5185))))

(declare-fun mapIsEmpty!5185 () Bool)

(assert (=> mapIsEmpty!5185 mapRes!5185))

(assert (= (and mapNonEmpty!5183 condMapEmpty!5185) mapIsEmpty!5185))

(assert (= (and mapNonEmpty!5183 (not condMapEmpty!5185)) mapNonEmpty!5185))

(assert (= (and mapNonEmpty!5185 ((_ is ValueCellFull!1169) mapValue!5185)) b!154840))

(assert (= (and mapNonEmpty!5183 ((_ is ValueCellFull!1169) mapDefault!5185)) b!154841))

(declare-fun m!189193 () Bool)

(assert (=> mapNonEmpty!5185 m!189193))

(declare-fun mapNonEmpty!5186 () Bool)

(declare-fun mapRes!5186 () Bool)

(declare-fun tp!12206 () Bool)

(declare-fun e!101144 () Bool)

(assert (=> mapNonEmpty!5186 (= mapRes!5186 (and tp!12206 e!101144))))

(declare-fun mapKey!5186 () (_ BitVec 32))

(declare-fun mapValue!5186 () ValueCell!1169)

(declare-fun mapRest!5186 () (Array (_ BitVec 32) ValueCell!1169))

(assert (=> mapNonEmpty!5186 (= mapRest!5184 (store mapRest!5186 mapKey!5186 mapValue!5186))))

(declare-fun b!154842 () Bool)

(assert (=> b!154842 (= e!101144 tp_is_empty!3025)))

(declare-fun b!154843 () Bool)

(declare-fun e!101145 () Bool)

(assert (=> b!154843 (= e!101145 tp_is_empty!3025)))

(declare-fun condMapEmpty!5186 () Bool)

(declare-fun mapDefault!5186 () ValueCell!1169)

(assert (=> mapNonEmpty!5184 (= condMapEmpty!5186 (= mapRest!5184 ((as const (Array (_ BitVec 32) ValueCell!1169)) mapDefault!5186)))))

(assert (=> mapNonEmpty!5184 (= tp!12204 (and e!101145 mapRes!5186))))

(declare-fun mapIsEmpty!5186 () Bool)

(assert (=> mapIsEmpty!5186 mapRes!5186))

(assert (= (and mapNonEmpty!5184 condMapEmpty!5186) mapIsEmpty!5186))

(assert (= (and mapNonEmpty!5184 (not condMapEmpty!5186)) mapNonEmpty!5186))

(assert (= (and mapNonEmpty!5186 ((_ is ValueCellFull!1169) mapValue!5186)) b!154842))

(assert (= (and mapNonEmpty!5184 ((_ is ValueCellFull!1169) mapDefault!5186)) b!154843))

(declare-fun m!189195 () Bool)

(assert (=> mapNonEmpty!5186 m!189195))

(declare-fun b_lambda!6897 () Bool)

(assert (= b_lambda!6885 (or (and b!154037 b_free!3217 (= (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) (defaultEntry!3063 newMap!16))) (and b!154048 b_free!3219) b_lambda!6897)))

(declare-fun b_lambda!6899 () Bool)

(assert (= b_lambda!6893 (or (and b!154037 b_free!3217) (and b!154048 b_free!3219 (= (defaultEntry!3063 newMap!16) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))))) b_lambda!6899)))

(declare-fun b_lambda!6901 () Bool)

(assert (= b_lambda!6891 (or (and b!154037 b_free!3217) (and b!154048 b_free!3219 (= (defaultEntry!3063 newMap!16) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))))) b_lambda!6901)))

(declare-fun b_lambda!6903 () Bool)

(assert (= b_lambda!6887 (or (and b!154037 b_free!3217 (= (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))) (defaultEntry!3063 newMap!16))) (and b!154048 b_free!3219) b_lambda!6903)))

(declare-fun b_lambda!6905 () Bool)

(assert (= b_lambda!6889 (or (and b!154037 b_free!3217) (and b!154048 b_free!3219 (= (defaultEntry!3063 newMap!16) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))))) b_lambda!6905)))

(declare-fun b_lambda!6907 () Bool)

(assert (= b_lambda!6895 (or (and b!154037 b_free!3217) (and b!154048 b_free!3219 (= (defaultEntry!3063 newMap!16) (defaultEntry!3063 (v!3418 (underlying!525 thiss!992))))) b_lambda!6907)))

(check-sat (not b!154529) (not d!50763) b_and!9655 (not b!154512) (not b!154739) (not d!50825) (not b_lambda!6867) (not b!154780) (not b!154467) (not d!50915) (not d!51035) (not d!50921) (not b!154476) (not b!154687) (not b!154411) (not b!154680) (not b!154597) (not b!154482) (not d!50883) (not d!50983) (not d!50939) (not d!50881) (not b!154651) (not d!51025) (not bm!17190) (not b!154617) (not b!154773) (not b_lambda!6897) (not b!154485) (not b!154610) (not b!154608) (not d!50801) (not d!50965) (not d!51017) (not b!154806) (not d!50811) (not b!154733) (not d!51039) (not d!50769) (not d!50855) (not b!154820) (not b!154750) (not b!154802) (not b!154469) (not d!50773) (not b!154719) (not bm!17197) (not d!50807) (not d!50861) (not d!50955) (not b_lambda!6905) (not b!154765) (not b!154498) (not b!154409) tp_is_empty!3025 (not b!154809) (not b!154682) (not b!154600) (not d!50991) (not b!154830) (not b!154613) (not b!154726) (not b!154464) (not b!154426) (not bm!17187) (not b!154634) (not d!50937) (not b!154653) (not b!154805) (not b!154413) (not bm!17181) (not d!50893) (not b!154749) (not b!154510) (not b!154415) (not d!50765) (not d!50767) (not b!154599) (not b!154665) (not d!50741) (not b!154722) (not d!50759) (not b!154662) (not b!154427) (not d!51021) (not d!50791) (not b!154712) (not b!154474) (not b!154661) (not b!154532) (not d!50745) (not d!50985) (not d!50809) (not b!154771) (not b!154691) (not d!50961) (not b!154460) (not b!154526) (not b!154496) (not b!154778) (not d!50933) (not b!154594) (not d!50747) (not d!50783) (not b!154723) (not b!154790) (not b!154747) (not d!50771) (not b!154428) (not b!154440) (not d!50755) (not b!154563) (not b!154443) (not b!154519) (not d!50925) (not d!50827) (not d!50979) (not d!50923) (not d!50853) (not b!154647) (not d!50927) (not d!50969) (not b!154658) (not b!154578) (not b!154583) (not d!50787) (not bm!17169) (not b!154630) (not d!51033) (not b!154677) (not b!154674) (not b!154646) (not d!50845) (not d!50891) (not b!154570) (not b!154573) (not b!154818) (not d!50957) (not b!154669) (not b!154833) (not b!154417) (not b!154566) (not b!154776) (not bm!17189) (not d!50947) (not d!50757) (not b!154628) (not b!154471) (not b!154442) (not b!154735) (not b!154741) (not b!154639) (not b!154699) (not b!154829) (not b_next!3217) (not b!154436) (not d!50753) (not b!154623) (not b!154494) (not b!154761) (not d!50815) (not b!154660) (not d!50889) (not b!154632) (not d!50819) (not mapNonEmpty!5185) (not bm!17171) (not d!50847) (not b!154444) (not d!50903) (not b!154575) (not b!154530) (not b!154535) (not b!154648) (not b!154737) (not bm!17188) (not b_lambda!6901) (not b!154783) (not b_lambda!6903) (not b!154731) (not b!154744) (not d!50981) (not b!154734) (not b!154724) (not d!50949) (not b!154746) (not b!154432) (not bm!17200) (not b_lambda!6881) (not d!50821) (not d!51041) (not b!154581) (not b!154635) (not d!50943) (not d!50993) (not b!154588) (not b!154520) (not b!154484) (not bm!17170) (not b!154410) (not bm!17184) (not b!154602) (not d!51019) (not d!50975) (not d!51013) (not b!154743) (not b_lambda!6907) (not d!51027) (not d!50849) (not d!50987) (not bm!17191) (not d!50941) (not b!154627) (not b!154603) (not b!154817) (not b!154420) (not b!154785) (not b!154438) (not b!154684) (not d!50899) (not b!154541) (not b!154419) (not d!50805) (not b!154493) (not d!50785) (not d!50909) (not b!154625) (not b!154821) (not b!154430) (not b!154813) (not b!154412) (not d!50875) (not d!51031) (not b!154433) (not b!154683) (not bm!17194) (not b_lambda!6879) (not b!154605) (not b!154754) (not d!50743) (not d!50751) (not d!50863) (not b!154626) (not b!154491) (not b!154418) (not b!154431) (not b_lambda!6883) (not b!154637) (not b!154675) (not b!154580) (not bm!17180) (not b!154445) (not bm!17168) (not b!154740) (not b!154787) (not d!50971) b_and!9653 (not d!50905) (not d!50989) (not b!154748) (not b_next!3219) (not d!50995) (not b!154492) (not b_lambda!6877) (not b!154794) (not b!154614) (not d!50977) (not b!154507) (not b!154456) (not b!154772) (not b!154672) (not d!50869) (not b!154542) (not b!154769) (not b!154758) (not b!154655) (not b!154826) (not b!154439) (not b!154506) (not mapNonEmpty!5186) (not b!154797) (not b!154640) (not d!50951) (not b!154738) (not b!154629) (not d!50973) (not b!154618) (not d!50907) (not b!154424) (not b!154616) (not d!50963) (not b!154499) (not d!50913) (not b!154586) (not d!50873) (not b!154517) (not d!50761) (not d!50911) (not d!50831) (not d!50867) (not b!154742) (not b!154590) (not b_lambda!6899) (not b!154786) (not b!154828) (not b!154777) (not b!154757) (not b!154515) (not d!50919) (not d!50749) (not d!50997) (not b!154823) (not d!51009) (not b!154804) (not b!154752) (not b!154837) (not b!154799) (not d!50967))
(check-sat b_and!9653 b_and!9655 (not b_next!3217) (not b_next!3219))
