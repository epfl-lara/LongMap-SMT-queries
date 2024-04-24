; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21950 () Bool)

(assert start!21950)

(declare-fun b!224150 () Bool)

(declare-fun b_free!6013 () Bool)

(declare-fun b_next!6013 () Bool)

(assert (=> b!224150 (= b_free!6013 (not b_next!6013))))

(declare-fun tp!21180 () Bool)

(declare-fun b_and!12925 () Bool)

(assert (=> b!224150 (= tp!21180 b_and!12925)))

(declare-fun b!224132 () Bool)

(declare-fun res!110248 () Bool)

(declare-fun e!145543 () Bool)

(assert (=> b!224132 (=> (not res!110248) (not e!145543))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!224132 (= res!110248 (validKeyInArray!0 key!932))))

(declare-fun b!224133 () Bool)

(declare-datatypes ((Unit!6701 0))(
  ( (Unit!6702) )
))
(declare-fun e!145544 () Unit!6701)

(declare-fun Unit!6703 () Unit!6701)

(assert (=> b!224133 (= e!145544 Unit!6703)))

(declare-fun lt!113124 () Unit!6701)

(declare-datatypes ((V!7481 0))(
  ( (V!7482 (val!2982 Int)) )
))
(declare-datatypes ((ValueCell!2594 0))(
  ( (ValueCellFull!2594 (v!5003 V!7481)) (EmptyCell!2594) )
))
(declare-datatypes ((array!10991 0))(
  ( (array!10992 (arr!5215 (Array (_ BitVec 32) ValueCell!2594)) (size!5548 (_ BitVec 32))) )
))
(declare-datatypes ((array!10993 0))(
  ( (array!10994 (arr!5216 (Array (_ BitVec 32) (_ BitVec 64))) (size!5549 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3088 0))(
  ( (LongMapFixedSize!3089 (defaultEntry!4203 Int) (mask!10035 (_ BitVec 32)) (extraKeys!3940 (_ BitVec 32)) (zeroValue!4044 V!7481) (minValue!4044 V!7481) (_size!1593 (_ BitVec 32)) (_keys!6257 array!10993) (_values!4186 array!10991) (_vacant!1593 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3088)

(declare-fun lemmaArrayContainsKeyThenInListMap!71 (array!10993 array!10991 (_ BitVec 32) (_ BitVec 32) V!7481 V!7481 (_ BitVec 64) (_ BitVec 32) Int) Unit!6701)

(assert (=> b!224133 (= lt!113124 (lemmaArrayContainsKeyThenInListMap!71 (_keys!6257 thiss!1504) (_values!4186 thiss!1504) (mask!10035 thiss!1504) (extraKeys!3940 thiss!1504) (zeroValue!4044 thiss!1504) (minValue!4044 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4203 thiss!1504)))))

(assert (=> b!224133 false))

(declare-fun b!224134 () Bool)

(declare-fun res!110233 () Bool)

(assert (=> b!224134 (=> (not res!110233) (not e!145543))))

(declare-fun lt!113123 () Bool)

(assert (=> b!224134 (= res!110233 (not lt!113123))))

(declare-fun b!224135 () Bool)

(declare-fun res!110239 () Bool)

(assert (=> b!224135 (=> (not res!110239) (not e!145543))))

(declare-datatypes ((List!3238 0))(
  ( (Nil!3235) (Cons!3234 (h!3882 (_ BitVec 64)) (t!8189 List!3238)) )
))
(declare-fun contains!1524 (List!3238 (_ BitVec 64)) Bool)

(assert (=> b!224135 (= res!110239 (not (contains!1524 Nil!3235 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!20858 () Bool)

(declare-fun c!37187 () Bool)

(declare-fun call!20861 () Bool)

(declare-datatypes ((SeekEntryResult!826 0))(
  ( (MissingZero!826 (index!5474 (_ BitVec 32))) (Found!826 (index!5475 (_ BitVec 32))) (Intermediate!826 (undefined!1638 Bool) (index!5476 (_ BitVec 32)) (x!23094 (_ BitVec 32))) (Undefined!826) (MissingVacant!826 (index!5477 (_ BitVec 32))) )
))
(declare-fun lt!113121 () SeekEntryResult!826)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20858 (= call!20861 (inRange!0 (ite c!37187 (index!5474 lt!113121) (index!5477 lt!113121)) (mask!10035 thiss!1504)))))

(declare-fun b!224136 () Bool)

(declare-fun res!110237 () Bool)

(assert (=> b!224136 (=> (not res!110237) (not e!145543))))

(declare-fun e!145542 () Bool)

(assert (=> b!224136 (= res!110237 e!145542)))

(declare-fun res!110232 () Bool)

(assert (=> b!224136 (=> res!110232 e!145542)))

(declare-fun e!145547 () Bool)

(assert (=> b!224136 (= res!110232 e!145547)))

(declare-fun res!110241 () Bool)

(assert (=> b!224136 (=> (not res!110241) (not e!145547))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!224136 (= res!110241 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!224137 () Bool)

(declare-fun res!110247 () Bool)

(declare-fun e!145535 () Bool)

(assert (=> b!224137 (=> (not res!110247) (not e!145535))))

(assert (=> b!224137 (= res!110247 call!20861)))

(declare-fun e!145532 () Bool)

(assert (=> b!224137 (= e!145532 e!145535)))

(declare-fun b!224138 () Bool)

(declare-fun e!145540 () Bool)

(assert (=> b!224138 (= e!145540 (not (contains!1524 Nil!3235 key!932)))))

(declare-fun res!110246 () Bool)

(declare-fun e!145536 () Bool)

(assert (=> start!21950 (=> (not res!110246) (not e!145536))))

(declare-fun valid!1250 (LongMapFixedSize!3088) Bool)

(assert (=> start!21950 (= res!110246 (valid!1250 thiss!1504))))

(assert (=> start!21950 e!145536))

(declare-fun e!145533 () Bool)

(assert (=> start!21950 e!145533))

(assert (=> start!21950 true))

(declare-fun b!224139 () Bool)

(assert (=> b!224139 (= e!145543 false)))

(declare-fun lt!113127 () Bool)

(assert (=> b!224139 (= lt!113127 (contains!1524 Nil!3235 key!932))))

(declare-fun mapIsEmpty!9982 () Bool)

(declare-fun mapRes!9982 () Bool)

(assert (=> mapIsEmpty!9982 mapRes!9982))

(declare-fun mapNonEmpty!9982 () Bool)

(declare-fun tp!21181 () Bool)

(declare-fun e!145541 () Bool)

(assert (=> mapNonEmpty!9982 (= mapRes!9982 (and tp!21181 e!145541))))

(declare-fun mapRest!9982 () (Array (_ BitVec 32) ValueCell!2594))

(declare-fun mapValue!9982 () ValueCell!2594)

(declare-fun mapKey!9982 () (_ BitVec 32))

(assert (=> mapNonEmpty!9982 (= (arr!5215 (_values!4186 thiss!1504)) (store mapRest!9982 mapKey!9982 mapValue!9982))))

(declare-fun b!224140 () Bool)

(declare-fun res!110242 () Bool)

(assert (=> b!224140 (=> (not res!110242) (not e!145535))))

(assert (=> b!224140 (= res!110242 (= (select (arr!5216 (_keys!6257 thiss!1504)) (index!5474 lt!113121)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!224141 () Bool)

(declare-fun e!145537 () Bool)

(declare-fun e!145546 () Bool)

(assert (=> b!224141 (= e!145537 e!145546)))

(declare-fun res!110236 () Bool)

(assert (=> b!224141 (=> (not res!110236) (not e!145546))))

(assert (=> b!224141 (= res!110236 (inRange!0 index!297 (mask!10035 thiss!1504)))))

(declare-fun lt!113122 () Unit!6701)

(declare-fun e!145534 () Unit!6701)

(assert (=> b!224141 (= lt!113122 e!145534)))

(declare-fun c!37188 () Bool)

(declare-datatypes ((tuple2!4336 0))(
  ( (tuple2!4337 (_1!2179 (_ BitVec 64)) (_2!2179 V!7481)) )
))
(declare-datatypes ((List!3239 0))(
  ( (Nil!3236) (Cons!3235 (h!3883 tuple2!4336) (t!8190 List!3239)) )
))
(declare-datatypes ((ListLongMap!3251 0))(
  ( (ListLongMap!3252 (toList!1641 List!3239)) )
))
(declare-fun contains!1525 (ListLongMap!3251 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1173 (array!10993 array!10991 (_ BitVec 32) (_ BitVec 32) V!7481 V!7481 (_ BitVec 32) Int) ListLongMap!3251)

(assert (=> b!224141 (= c!37188 (contains!1525 (getCurrentListMap!1173 (_keys!6257 thiss!1504) (_values!4186 thiss!1504) (mask!10035 thiss!1504) (extraKeys!3940 thiss!1504) (zeroValue!4044 thiss!1504) (minValue!4044 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4203 thiss!1504)) key!932))))

(declare-fun b!224142 () Bool)

(declare-fun e!145539 () Bool)

(declare-fun tp_is_empty!5875 () Bool)

(assert (=> b!224142 (= e!145539 tp_is_empty!5875)))

(declare-fun b!224143 () Bool)

(declare-fun e!145531 () Bool)

(declare-fun call!20862 () Bool)

(assert (=> b!224143 (= e!145531 (not call!20862))))

(declare-fun b!224144 () Bool)

(assert (=> b!224144 (= e!145542 e!145540)))

(declare-fun res!110234 () Bool)

(assert (=> b!224144 (=> (not res!110234) (not e!145540))))

(assert (=> b!224144 (= res!110234 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!224145 () Bool)

(declare-fun Unit!6704 () Unit!6701)

(assert (=> b!224145 (= e!145544 Unit!6704)))

(declare-fun b!224146 () Bool)

(declare-fun Unit!6705 () Unit!6701)

(assert (=> b!224146 (= e!145534 Unit!6705)))

(declare-fun lt!113125 () Unit!6701)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!233 (array!10993 array!10991 (_ BitVec 32) (_ BitVec 32) V!7481 V!7481 (_ BitVec 64) Int) Unit!6701)

(assert (=> b!224146 (= lt!113125 (lemmaInListMapThenSeekEntryOrOpenFindsIt!233 (_keys!6257 thiss!1504) (_values!4186 thiss!1504) (mask!10035 thiss!1504) (extraKeys!3940 thiss!1504) (zeroValue!4044 thiss!1504) (minValue!4044 thiss!1504) key!932 (defaultEntry!4203 thiss!1504)))))

(assert (=> b!224146 false))

(declare-fun b!224147 () Bool)

(assert (=> b!224147 (= e!145541 tp_is_empty!5875)))

(declare-fun b!224148 () Bool)

(declare-fun c!37186 () Bool)

(get-info :version)

(assert (=> b!224148 (= c!37186 ((_ is MissingVacant!826) lt!113121))))

(declare-fun e!145538 () Bool)

(assert (=> b!224148 (= e!145532 e!145538)))

(declare-fun b!224149 () Bool)

(declare-fun res!110243 () Bool)

(assert (=> b!224149 (=> (not res!110243) (not e!145536))))

(assert (=> b!224149 (= res!110243 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!145530 () Bool)

(declare-fun array_inv!3425 (array!10993) Bool)

(declare-fun array_inv!3426 (array!10991) Bool)

(assert (=> b!224150 (= e!145533 (and tp!21180 tp_is_empty!5875 (array_inv!3425 (_keys!6257 thiss!1504)) (array_inv!3426 (_values!4186 thiss!1504)) e!145530))))

(declare-fun b!224151 () Bool)

(declare-fun lt!113126 () Unit!6701)

(assert (=> b!224151 (= e!145534 lt!113126)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!226 (array!10993 array!10991 (_ BitVec 32) (_ BitVec 32) V!7481 V!7481 (_ BitVec 64) Int) Unit!6701)

(assert (=> b!224151 (= lt!113126 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!226 (_keys!6257 thiss!1504) (_values!4186 thiss!1504) (mask!10035 thiss!1504) (extraKeys!3940 thiss!1504) (zeroValue!4044 thiss!1504) (minValue!4044 thiss!1504) key!932 (defaultEntry!4203 thiss!1504)))))

(assert (=> b!224151 (= c!37187 ((_ is MissingZero!826) lt!113121))))

(assert (=> b!224151 e!145532))

(declare-fun b!224152 () Bool)

(assert (=> b!224152 (= e!145538 ((_ is Undefined!826) lt!113121))))

(declare-fun b!224153 () Bool)

(declare-fun res!110251 () Bool)

(assert (=> b!224153 (=> (not res!110251) (not e!145543))))

(declare-fun arrayNoDuplicates!0 (array!10993 (_ BitVec 32) List!3238) Bool)

(assert (=> b!224153 (= res!110251 (arrayNoDuplicates!0 (_keys!6257 thiss!1504) #b00000000000000000000000000000000 Nil!3235))))

(declare-fun b!224154 () Bool)

(declare-fun res!110240 () Bool)

(assert (=> b!224154 (=> (not res!110240) (not e!145543))))

(assert (=> b!224154 (= res!110240 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5549 (_keys!6257 thiss!1504)))))))

(declare-fun b!224155 () Bool)

(declare-fun res!110249 () Bool)

(assert (=> b!224155 (=> (not res!110249) (not e!145543))))

(assert (=> b!224155 (= res!110249 (not (contains!1524 Nil!3235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!20859 () Bool)

(declare-fun arrayContainsKey!0 (array!10993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20859 (= call!20862 (arrayContainsKey!0 (_keys!6257 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224156 () Bool)

(declare-fun res!110244 () Bool)

(assert (=> b!224156 (=> (not res!110244) (not e!145543))))

(declare-fun noDuplicate!82 (List!3238) Bool)

(assert (=> b!224156 (= res!110244 (noDuplicate!82 Nil!3235))))

(declare-fun b!224157 () Bool)

(assert (=> b!224157 (= e!145546 e!145543)))

(declare-fun res!110235 () Bool)

(assert (=> b!224157 (=> (not res!110235) (not e!145543))))

(assert (=> b!224157 (= res!110235 (and (bvslt (size!5549 (_keys!6257 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5549 (_keys!6257 thiss!1504)))))))

(declare-fun lt!113128 () Unit!6701)

(assert (=> b!224157 (= lt!113128 e!145544)))

(declare-fun c!37189 () Bool)

(assert (=> b!224157 (= c!37189 lt!113123)))

(assert (=> b!224157 (= lt!113123 (arrayContainsKey!0 (_keys!6257 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224158 () Bool)

(assert (=> b!224158 (= e!145538 e!145531)))

(declare-fun res!110245 () Bool)

(assert (=> b!224158 (= res!110245 call!20861)))

(assert (=> b!224158 (=> (not res!110245) (not e!145531))))

(declare-fun b!224159 () Bool)

(assert (=> b!224159 (= e!145530 (and e!145539 mapRes!9982))))

(declare-fun condMapEmpty!9982 () Bool)

(declare-fun mapDefault!9982 () ValueCell!2594)

(assert (=> b!224159 (= condMapEmpty!9982 (= (arr!5215 (_values!4186 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2594)) mapDefault!9982)))))

(declare-fun b!224160 () Bool)

(assert (=> b!224160 (= e!145547 (contains!1524 Nil!3235 key!932))))

(declare-fun b!224161 () Bool)

(assert (=> b!224161 (= e!145536 e!145537)))

(declare-fun res!110238 () Bool)

(assert (=> b!224161 (=> (not res!110238) (not e!145537))))

(assert (=> b!224161 (= res!110238 (or (= lt!113121 (MissingZero!826 index!297)) (= lt!113121 (MissingVacant!826 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10993 (_ BitVec 32)) SeekEntryResult!826)

(assert (=> b!224161 (= lt!113121 (seekEntryOrOpen!0 key!932 (_keys!6257 thiss!1504) (mask!10035 thiss!1504)))))

(declare-fun b!224162 () Bool)

(declare-fun res!110250 () Bool)

(assert (=> b!224162 (= res!110250 (= (select (arr!5216 (_keys!6257 thiss!1504)) (index!5477 lt!113121)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!224162 (=> (not res!110250) (not e!145531))))

(declare-fun b!224163 () Bool)

(assert (=> b!224163 (= e!145535 (not call!20862))))

(assert (= (and start!21950 res!110246) b!224149))

(assert (= (and b!224149 res!110243) b!224161))

(assert (= (and b!224161 res!110238) b!224141))

(assert (= (and b!224141 c!37188) b!224146))

(assert (= (and b!224141 (not c!37188)) b!224151))

(assert (= (and b!224151 c!37187) b!224137))

(assert (= (and b!224151 (not c!37187)) b!224148))

(assert (= (and b!224137 res!110247) b!224140))

(assert (= (and b!224140 res!110242) b!224163))

(assert (= (and b!224148 c!37186) b!224158))

(assert (= (and b!224148 (not c!37186)) b!224152))

(assert (= (and b!224158 res!110245) b!224162))

(assert (= (and b!224162 res!110250) b!224143))

(assert (= (or b!224137 b!224158) bm!20858))

(assert (= (or b!224163 b!224143) bm!20859))

(assert (= (and b!224141 res!110236) b!224157))

(assert (= (and b!224157 c!37189) b!224133))

(assert (= (and b!224157 (not c!37189)) b!224145))

(assert (= (and b!224157 res!110235) b!224156))

(assert (= (and b!224156 res!110244) b!224155))

(assert (= (and b!224155 res!110249) b!224135))

(assert (= (and b!224135 res!110239) b!224136))

(assert (= (and b!224136 res!110241) b!224160))

(assert (= (and b!224136 (not res!110232)) b!224144))

(assert (= (and b!224144 res!110234) b!224138))

(assert (= (and b!224136 res!110237) b!224153))

(assert (= (and b!224153 res!110251) b!224154))

(assert (= (and b!224154 res!110240) b!224132))

(assert (= (and b!224132 res!110248) b!224134))

(assert (= (and b!224134 res!110233) b!224139))

(assert (= (and b!224159 condMapEmpty!9982) mapIsEmpty!9982))

(assert (= (and b!224159 (not condMapEmpty!9982)) mapNonEmpty!9982))

(assert (= (and mapNonEmpty!9982 ((_ is ValueCellFull!2594) mapValue!9982)) b!224147))

(assert (= (and b!224159 ((_ is ValueCellFull!2594) mapDefault!9982)) b!224142))

(assert (= b!224150 b!224159))

(assert (= start!21950 b!224150))

(declare-fun m!247471 () Bool)

(assert (=> b!224146 m!247471))

(declare-fun m!247473 () Bool)

(assert (=> bm!20859 m!247473))

(declare-fun m!247475 () Bool)

(assert (=> b!224150 m!247475))

(declare-fun m!247477 () Bool)

(assert (=> b!224150 m!247477))

(declare-fun m!247479 () Bool)

(assert (=> b!224151 m!247479))

(declare-fun m!247481 () Bool)

(assert (=> b!224153 m!247481))

(declare-fun m!247483 () Bool)

(assert (=> bm!20858 m!247483))

(declare-fun m!247485 () Bool)

(assert (=> b!224141 m!247485))

(declare-fun m!247487 () Bool)

(assert (=> b!224141 m!247487))

(assert (=> b!224141 m!247487))

(declare-fun m!247489 () Bool)

(assert (=> b!224141 m!247489))

(declare-fun m!247491 () Bool)

(assert (=> b!224160 m!247491))

(declare-fun m!247493 () Bool)

(assert (=> b!224162 m!247493))

(declare-fun m!247495 () Bool)

(assert (=> start!21950 m!247495))

(declare-fun m!247497 () Bool)

(assert (=> b!224155 m!247497))

(declare-fun m!247499 () Bool)

(assert (=> b!224161 m!247499))

(declare-fun m!247501 () Bool)

(assert (=> b!224133 m!247501))

(declare-fun m!247503 () Bool)

(assert (=> mapNonEmpty!9982 m!247503))

(declare-fun m!247505 () Bool)

(assert (=> b!224132 m!247505))

(assert (=> b!224157 m!247473))

(declare-fun m!247507 () Bool)

(assert (=> b!224156 m!247507))

(assert (=> b!224139 m!247491))

(declare-fun m!247509 () Bool)

(assert (=> b!224140 m!247509))

(declare-fun m!247511 () Bool)

(assert (=> b!224135 m!247511))

(assert (=> b!224138 m!247491))

(check-sat (not b!224132) (not b!224138) (not b!224155) (not start!21950) (not b!224133) (not bm!20859) (not b!224157) (not b!224160) (not b!224141) b_and!12925 (not b!224135) (not b_next!6013) (not bm!20858) (not b!224161) (not mapNonEmpty!9982) (not b!224150) (not b!224156) (not b!224153) (not b!224146) tp_is_empty!5875 (not b!224151) (not b!224139))
(check-sat b_and!12925 (not b_next!6013))
