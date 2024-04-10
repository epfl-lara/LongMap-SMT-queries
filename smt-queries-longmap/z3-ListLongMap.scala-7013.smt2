; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89072 () Bool)

(assert start!89072)

(declare-fun b!1021273 () Bool)

(declare-fun b_free!20133 () Bool)

(declare-fun b_next!20133 () Bool)

(assert (=> b!1021273 (= b_free!20133 (not b_next!20133))))

(declare-fun tp!71427 () Bool)

(declare-fun b_and!32321 () Bool)

(assert (=> b!1021273 (= tp!71427 b_and!32321)))

(declare-fun b!1021270 () Bool)

(declare-fun e!575154 () Bool)

(declare-fun e!575155 () Bool)

(assert (=> b!1021270 (= e!575154 e!575155)))

(declare-fun b!1021271 () Bool)

(declare-fun e!575157 () Bool)

(declare-fun tp_is_empty!23853 () Bool)

(assert (=> b!1021271 (= e!575157 tp_is_empty!23853)))

(declare-fun b!1021272 () Bool)

(declare-fun e!575161 () Bool)

(assert (=> b!1021272 (= e!575161 tp_is_empty!23853)))

(declare-datatypes ((V!36677 0))(
  ( (V!36678 (val!11977 Int)) )
))
(declare-datatypes ((tuple2!15486 0))(
  ( (tuple2!15487 (_1!7754 (_ BitVec 64)) (_2!7754 V!36677)) )
))
(declare-datatypes ((List!21651 0))(
  ( (Nil!21648) (Cons!21647 (h!22845 tuple2!15486) (t!30661 List!21651)) )
))
(declare-datatypes ((ListLongMap!13633 0))(
  ( (ListLongMap!13634 (toList!6832 List!21651)) )
))
(declare-fun call!43194 () ListLongMap!13633)

(declare-fun bm!43190 () Bool)

(declare-datatypes ((array!63746 0))(
  ( (array!63747 (arr!30687 (Array (_ BitVec 32) (_ BitVec 64))) (size!31198 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11223 0))(
  ( (ValueCellFull!11223 (v!14541 V!36677)) (EmptyCell!11223) )
))
(declare-datatypes ((array!63748 0))(
  ( (array!63749 (arr!30688 (Array (_ BitVec 32) ValueCell!11223)) (size!31199 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5040 0))(
  ( (LongMapFixedSize!5041 (defaultEntry!5872 Int) (mask!29439 (_ BitVec 32)) (extraKeys!5604 (_ BitVec 32)) (zeroValue!5708 V!36677) (minValue!5708 V!36677) (_size!2575 (_ BitVec 32)) (_keys!11017 array!63746) (_values!5895 array!63748) (_vacant!2575 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1114 0))(
  ( (Cell!1115 (v!14542 LongMapFixedSize!5040)) )
))
(declare-datatypes ((LongMap!1114 0))(
  ( (LongMap!1115 (underlying!568 Cell!1114)) )
))
(declare-fun lt!450009 () LongMap!1114)

(declare-fun c!103519 () Bool)

(declare-fun thiss!908 () LongMap!1114)

(declare-fun map!14476 (LongMap!1114) ListLongMap!13633)

(assert (=> bm!43190 (= call!43194 (map!14476 (ite c!103519 lt!450009 thiss!908)))))

(declare-fun e!575162 () Bool)

(declare-fun key!697 () (_ BitVec 64))

(declare-fun b!1021274 () Bool)

(declare-fun call!43193 () ListLongMap!13633)

(declare-fun -!459 (ListLongMap!13633 (_ BitVec 64)) ListLongMap!13633)

(assert (=> b!1021274 (= e!575162 (not (= call!43194 (-!459 call!43193 key!697))))))

(declare-fun b!1021275 () Bool)

(declare-fun e!575158 () Bool)

(assert (=> b!1021275 (= e!575158 e!575162)))

(declare-datatypes ((tuple2!15488 0))(
  ( (tuple2!15489 (_1!7755 Bool) (_2!7755 LongMapFixedSize!5040)) )
))
(declare-fun lt!450008 () tuple2!15488)

(assert (=> b!1021275 (= c!103519 (_1!7755 lt!450008))))

(declare-fun mapIsEmpty!37191 () Bool)

(declare-fun mapRes!37191 () Bool)

(assert (=> mapIsEmpty!37191 mapRes!37191))

(declare-fun mapNonEmpty!37191 () Bool)

(declare-fun tp!71428 () Bool)

(assert (=> mapNonEmpty!37191 (= mapRes!37191 (and tp!71428 e!575161))))

(declare-fun mapValue!37191 () ValueCell!11223)

(declare-fun mapKey!37191 () (_ BitVec 32))

(declare-fun mapRest!37191 () (Array (_ BitVec 32) ValueCell!11223))

(assert (=> mapNonEmpty!37191 (= (arr!30688 (_values!5895 (v!14542 (underlying!568 thiss!908)))) (store mapRest!37191 mapKey!37191 mapValue!37191))))

(declare-fun b!1021276 () Bool)

(declare-fun e!575159 () Bool)

(assert (=> b!1021276 (= e!575159 (and e!575157 mapRes!37191))))

(declare-fun condMapEmpty!37191 () Bool)

(declare-fun mapDefault!37191 () ValueCell!11223)

(assert (=> b!1021276 (= condMapEmpty!37191 (= (arr!30688 (_values!5895 (v!14542 (underlying!568 thiss!908)))) ((as const (Array (_ BitVec 32) ValueCell!11223)) mapDefault!37191)))))

(declare-fun b!1021277 () Bool)

(declare-fun e!575156 () Bool)

(assert (=> b!1021277 (= e!575156 e!575158)))

(declare-fun res!684358 () Bool)

(assert (=> b!1021277 (=> res!684358 e!575158)))

(declare-fun valid!1919 (LongMap!1114) Bool)

(assert (=> b!1021277 (= res!684358 (not (valid!1919 lt!450009)))))

(assert (=> b!1021277 (= lt!450009 (LongMap!1115 (Cell!1115 (_2!7755 lt!450008))))))

(declare-fun remove!10 (LongMapFixedSize!5040 (_ BitVec 64)) tuple2!15488)

(assert (=> b!1021277 (= lt!450008 (remove!10 (v!14542 (underlying!568 thiss!908)) key!697))))

(declare-fun b!1021278 () Bool)

(assert (=> b!1021278 (= e!575162 (not (= call!43193 call!43194)))))

(declare-fun res!684359 () Bool)

(assert (=> start!89072 (=> (not res!684359) (not e!575156))))

(assert (=> start!89072 (= res!684359 (valid!1919 thiss!908))))

(assert (=> start!89072 e!575156))

(declare-fun e!575163 () Bool)

(assert (=> start!89072 e!575163))

(assert (=> start!89072 true))

(declare-fun array_inv!23799 (array!63746) Bool)

(declare-fun array_inv!23800 (array!63748) Bool)

(assert (=> b!1021273 (= e!575155 (and tp!71427 tp_is_empty!23853 (array_inv!23799 (_keys!11017 (v!14542 (underlying!568 thiss!908)))) (array_inv!23800 (_values!5895 (v!14542 (underlying!568 thiss!908)))) e!575159))))

(declare-fun b!1021279 () Bool)

(assert (=> b!1021279 (= e!575163 e!575154)))

(declare-fun bm!43191 () Bool)

(assert (=> bm!43191 (= call!43193 (map!14476 (ite c!103519 thiss!908 lt!450009)))))

(assert (= (and start!89072 res!684359) b!1021277))

(assert (= (and b!1021277 (not res!684358)) b!1021275))

(assert (= (and b!1021275 c!103519) b!1021274))

(assert (= (and b!1021275 (not c!103519)) b!1021278))

(assert (= (or b!1021274 b!1021278) bm!43190))

(assert (= (or b!1021274 b!1021278) bm!43191))

(assert (= (and b!1021276 condMapEmpty!37191) mapIsEmpty!37191))

(assert (= (and b!1021276 (not condMapEmpty!37191)) mapNonEmpty!37191))

(get-info :version)

(assert (= (and mapNonEmpty!37191 ((_ is ValueCellFull!11223) mapValue!37191)) b!1021272))

(assert (= (and b!1021276 ((_ is ValueCellFull!11223) mapDefault!37191)) b!1021271))

(assert (= b!1021273 b!1021276))

(assert (= b!1021270 b!1021273))

(assert (= b!1021279 b!1021270))

(assert (= start!89072 b!1021279))

(declare-fun m!940835 () Bool)

(assert (=> start!89072 m!940835))

(declare-fun m!940837 () Bool)

(assert (=> bm!43190 m!940837))

(declare-fun m!940839 () Bool)

(assert (=> bm!43191 m!940839))

(declare-fun m!940841 () Bool)

(assert (=> mapNonEmpty!37191 m!940841))

(declare-fun m!940843 () Bool)

(assert (=> b!1021277 m!940843))

(declare-fun m!940845 () Bool)

(assert (=> b!1021277 m!940845))

(declare-fun m!940847 () Bool)

(assert (=> b!1021274 m!940847))

(declare-fun m!940849 () Bool)

(assert (=> b!1021273 m!940849))

(declare-fun m!940851 () Bool)

(assert (=> b!1021273 m!940851))

(check-sat b_and!32321 tp_is_empty!23853 (not start!89072) (not b!1021273) (not b!1021274) (not bm!43190) (not b!1021277) (not bm!43191) (not mapNonEmpty!37191) (not b_next!20133))
(check-sat b_and!32321 (not b_next!20133))
(get-model)

(declare-fun d!122495 () Bool)

(declare-fun valid!1921 (LongMapFixedSize!5040) Bool)

(assert (=> d!122495 (= (valid!1919 thiss!908) (valid!1921 (v!14542 (underlying!568 thiss!908))))))

(declare-fun bs!29765 () Bool)

(assert (= bs!29765 d!122495))

(declare-fun m!940871 () Bool)

(assert (=> bs!29765 m!940871))

(assert (=> start!89072 d!122495))

(declare-fun d!122497 () Bool)

(declare-fun lt!450018 () ListLongMap!13633)

(declare-fun contains!5940 (ListLongMap!13633 (_ BitVec 64)) Bool)

(assert (=> d!122497 (not (contains!5940 lt!450018 key!697))))

(declare-fun removeStrictlySorted!48 (List!21651 (_ BitVec 64)) List!21651)

(assert (=> d!122497 (= lt!450018 (ListLongMap!13634 (removeStrictlySorted!48 (toList!6832 call!43193) key!697)))))

(assert (=> d!122497 (= (-!459 call!43193 key!697) lt!450018)))

(declare-fun bs!29766 () Bool)

(assert (= bs!29766 d!122497))

(declare-fun m!940873 () Bool)

(assert (=> bs!29766 m!940873))

(declare-fun m!940875 () Bool)

(assert (=> bs!29766 m!940875))

(assert (=> b!1021274 d!122497))

(declare-fun d!122499 () Bool)

(assert (=> d!122499 (= (valid!1919 lt!450009) (valid!1921 (v!14542 (underlying!568 lt!450009))))))

(declare-fun bs!29767 () Bool)

(assert (= bs!29767 d!122499))

(declare-fun m!940877 () Bool)

(assert (=> bs!29767 m!940877))

(assert (=> b!1021277 d!122499))

(declare-fun b!1021344 () Bool)

(declare-datatypes ((Unit!33305 0))(
  ( (Unit!33306) )
))
(declare-fun lt!450087 () Unit!33305)

(declare-fun lt!450082 () Unit!33305)

(assert (=> b!1021344 (= lt!450087 lt!450082)))

(declare-fun call!43221 () ListLongMap!13633)

(declare-fun call!43217 () ListLongMap!13633)

(assert (=> b!1021344 (= call!43221 call!43217)))

(declare-fun lt!450091 () (_ BitVec 32))

(declare-fun lt!450099 () V!36677)

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!1 (array!63746 array!63748 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36677 V!36677 V!36677 Int) Unit!33305)

(assert (=> b!1021344 (= lt!450082 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!1 (_keys!11017 (v!14542 (underlying!568 thiss!908))) (_values!5895 (v!14542 (underlying!568 thiss!908))) (mask!29439 (v!14542 (underlying!568 thiss!908))) (extraKeys!5604 (v!14542 (underlying!568 thiss!908))) lt!450091 (zeroValue!5708 (v!14542 (underlying!568 thiss!908))) (minValue!5708 (v!14542 (underlying!568 thiss!908))) lt!450099 (defaultEntry!5872 (v!14542 (underlying!568 thiss!908)))))))

(declare-fun dynLambda!1930 (Int (_ BitVec 64)) V!36677)

(assert (=> b!1021344 (= lt!450099 (dynLambda!1930 (defaultEntry!5872 (v!14542 (underlying!568 thiss!908))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1021344 (= lt!450091 (bvand (extraKeys!5604 (v!14542 (underlying!568 thiss!908))) #b00000000000000000000000000000001))))

(declare-fun e!575220 () tuple2!15488)

(assert (=> b!1021344 (= e!575220 (tuple2!15489 true (LongMapFixedSize!5041 (defaultEntry!5872 (v!14542 (underlying!568 thiss!908))) (mask!29439 (v!14542 (underlying!568 thiss!908))) (bvand (extraKeys!5604 (v!14542 (underlying!568 thiss!908))) #b00000000000000000000000000000001) (zeroValue!5708 (v!14542 (underlying!568 thiss!908))) (dynLambda!1930 (defaultEntry!5872 (v!14542 (underlying!568 thiss!908))) #b1000000000000000000000000000000000000000000000000000000000000000) (_size!2575 (v!14542 (underlying!568 thiss!908))) (_keys!11017 (v!14542 (underlying!568 thiss!908))) (_values!5895 (v!14542 (underlying!568 thiss!908))) (_vacant!2575 (v!14542 (underlying!568 thiss!908))))))))

(declare-fun b!1021345 () Bool)

(declare-fun e!575212 () Bool)

(declare-datatypes ((tuple2!15494 0))(
  ( (tuple2!15495 (_1!7758 Unit!33305) (_2!7758 LongMapFixedSize!5040)) )
))
(declare-fun lt!450105 () tuple2!15494)

(declare-fun arrayContainsKey!0 (array!63746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1021345 (= e!575212 (arrayContainsKey!0 (_keys!11017 (_2!7758 lt!450105)) key!697 #b00000000000000000000000000000000))))

(declare-fun lt!450084 () (_ BitVec 32))

(declare-fun b!1021346 () Bool)

(declare-fun e!575217 () tuple2!15494)

(declare-datatypes ((SeekEntryResult!9587 0))(
  ( (MissingZero!9587 (index!40719 (_ BitVec 32))) (Found!9587 (index!40720 (_ BitVec 32))) (Intermediate!9587 (undefined!10399 Bool) (index!40721 (_ BitVec 32)) (x!90669 (_ BitVec 32))) (Undefined!9587) (MissingVacant!9587 (index!40722 (_ BitVec 32))) )
))
(declare-fun lt!450088 () SeekEntryResult!9587)

(declare-fun Unit!33307 () Unit!33305)

(assert (=> b!1021346 (= e!575217 (tuple2!15495 Unit!33307 (LongMapFixedSize!5041 (defaultEntry!5872 (v!14542 (underlying!568 thiss!908))) (mask!29439 (v!14542 (underlying!568 thiss!908))) (extraKeys!5604 (v!14542 (underlying!568 thiss!908))) (zeroValue!5708 (v!14542 (underlying!568 thiss!908))) (minValue!5708 (v!14542 (underlying!568 thiss!908))) (bvsub (_size!2575 (v!14542 (underlying!568 thiss!908))) #b00000000000000000000000000000001) (array!63747 (store (arr!30687 (_keys!11017 (v!14542 (underlying!568 thiss!908)))) (index!40720 lt!450088) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31198 (_keys!11017 (v!14542 (underlying!568 thiss!908))))) (array!63749 (store (arr!30688 (_values!5895 (v!14542 (underlying!568 thiss!908)))) (index!40720 lt!450088) (ValueCellFull!11223 (dynLambda!1930 (defaultEntry!5872 (v!14542 (underlying!568 thiss!908))) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31199 (_values!5895 (v!14542 (underlying!568 thiss!908))))) lt!450084)))))

(declare-fun c!103545 () Bool)

(declare-fun bm!43214 () Bool)

(declare-fun e!575216 () array!63748)

(declare-fun call!43222 () ListLongMap!13633)

(declare-fun c!103542 () Bool)

(declare-fun getCurrentListMap!3881 (array!63746 array!63748 (_ BitVec 32) (_ BitVec 32) V!36677 V!36677 (_ BitVec 32) Int) ListLongMap!13633)

(assert (=> bm!43214 (= call!43222 (getCurrentListMap!3881 (ite c!103545 (_keys!11017 (v!14542 (underlying!568 thiss!908))) (array!63747 (store (arr!30687 (_keys!11017 (v!14542 (underlying!568 thiss!908)))) (index!40720 lt!450088) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31198 (_keys!11017 (v!14542 (underlying!568 thiss!908)))))) e!575216 (mask!29439 (v!14542 (underlying!568 thiss!908))) (ite c!103545 (ite c!103542 (extraKeys!5604 (v!14542 (underlying!568 thiss!908))) lt!450091) (extraKeys!5604 (v!14542 (underlying!568 thiss!908)))) (zeroValue!5708 (v!14542 (underlying!568 thiss!908))) (ite c!103545 (ite c!103542 (minValue!5708 (v!14542 (underlying!568 thiss!908))) lt!450099) (minValue!5708 (v!14542 (underlying!568 thiss!908)))) #b00000000000000000000000000000000 (defaultEntry!5872 (v!14542 (underlying!568 thiss!908)))))))

(declare-fun c!103540 () Bool)

(assert (=> bm!43214 (= c!103540 c!103545)))

(declare-fun b!1021347 () Bool)

(declare-fun e!575214 () Unit!33305)

(declare-fun Unit!33308 () Unit!33305)

(assert (=> b!1021347 (= e!575214 Unit!33308)))

(declare-fun lt!450081 () Unit!33305)

(declare-fun lemmaKeyInListMapIsInArray!343 (array!63746 array!63748 (_ BitVec 32) (_ BitVec 32) V!36677 V!36677 (_ BitVec 64) Int) Unit!33305)

(assert (=> b!1021347 (= lt!450081 (lemmaKeyInListMapIsInArray!343 (_keys!11017 (_2!7758 lt!450105)) (_values!5895 (_2!7758 lt!450105)) (mask!29439 (_2!7758 lt!450105)) (extraKeys!5604 (_2!7758 lt!450105)) (zeroValue!5708 (_2!7758 lt!450105)) (minValue!5708 (_2!7758 lt!450105)) key!697 (defaultEntry!5872 (_2!7758 lt!450105))))))

(declare-fun c!103544 () Bool)

(assert (=> b!1021347 (= c!103544 (and (not (= key!697 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!697 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1021347 e!575212))

(declare-fun lt!450078 () Unit!33305)

(assert (=> b!1021347 (= lt!450078 lt!450081)))

(assert (=> b!1021347 false))

(declare-fun b!1021348 () Bool)

(declare-fun lt!450100 () Unit!33305)

(declare-fun lt!450085 () Unit!33305)

(assert (=> b!1021348 (= lt!450100 lt!450085)))

(declare-fun call!43223 () ListLongMap!13633)

(assert (=> b!1021348 (= call!43221 call!43223)))

(declare-fun lt!450098 () V!36677)

(declare-fun lt!450097 () (_ BitVec 32))

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!1 (array!63746 array!63748 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36677 V!36677 V!36677 Int) Unit!33305)

(assert (=> b!1021348 (= lt!450085 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!1 (_keys!11017 (v!14542 (underlying!568 thiss!908))) (_values!5895 (v!14542 (underlying!568 thiss!908))) (mask!29439 (v!14542 (underlying!568 thiss!908))) (extraKeys!5604 (v!14542 (underlying!568 thiss!908))) lt!450097 (zeroValue!5708 (v!14542 (underlying!568 thiss!908))) lt!450098 (minValue!5708 (v!14542 (underlying!568 thiss!908))) (defaultEntry!5872 (v!14542 (underlying!568 thiss!908)))))))

(assert (=> b!1021348 (= lt!450098 (dynLambda!1930 (defaultEntry!5872 (v!14542 (underlying!568 thiss!908))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1021348 (= lt!450097 (bvand (extraKeys!5604 (v!14542 (underlying!568 thiss!908))) #b00000000000000000000000000000010))))

(assert (=> b!1021348 (= e!575220 (tuple2!15489 true (LongMapFixedSize!5041 (defaultEntry!5872 (v!14542 (underlying!568 thiss!908))) (mask!29439 (v!14542 (underlying!568 thiss!908))) (bvand (extraKeys!5604 (v!14542 (underlying!568 thiss!908))) #b00000000000000000000000000000010) (dynLambda!1930 (defaultEntry!5872 (v!14542 (underlying!568 thiss!908))) #b0000000000000000000000000000000000000000000000000000000000000000) (minValue!5708 (v!14542 (underlying!568 thiss!908))) (_size!2575 (v!14542 (underlying!568 thiss!908))) (_keys!11017 (v!14542 (underlying!568 thiss!908))) (_values!5895 (v!14542 (underlying!568 thiss!908))) (_vacant!2575 (v!14542 (underlying!568 thiss!908))))))))

(declare-fun b!1021349 () Bool)

(declare-fun e!575218 () Bool)

(declare-fun e!575215 () Bool)

(assert (=> b!1021349 (= e!575218 e!575215)))

(declare-fun c!103543 () Bool)

(declare-fun lt!450077 () tuple2!15488)

(assert (=> b!1021349 (= c!103543 (_1!7755 lt!450077))))

(declare-fun b!1021351 () Bool)

(assert (=> b!1021351 (= e!575216 (_values!5895 (v!14542 (underlying!568 thiss!908))))))

(declare-fun bm!43215 () Bool)

(assert (=> bm!43215 (= call!43217 call!43222)))

(declare-fun b!1021352 () Bool)

(declare-fun call!43218 () ListLongMap!13633)

(declare-fun call!43220 () ListLongMap!13633)

(assert (=> b!1021352 (= e!575215 (= call!43218 call!43220))))

(declare-fun b!1021353 () Bool)

(declare-fun Unit!33309 () Unit!33305)

(assert (=> b!1021353 (= e!575217 (tuple2!15495 Unit!33309 (LongMapFixedSize!5041 (defaultEntry!5872 (v!14542 (underlying!568 thiss!908))) (mask!29439 (v!14542 (underlying!568 thiss!908))) (extraKeys!5604 (v!14542 (underlying!568 thiss!908))) (zeroValue!5708 (v!14542 (underlying!568 thiss!908))) (minValue!5708 (v!14542 (underlying!568 thiss!908))) (bvsub (_size!2575 (v!14542 (underlying!568 thiss!908))) #b00000000000000000000000000000001) (array!63747 (store (arr!30687 (_keys!11017 (v!14542 (underlying!568 thiss!908)))) (index!40720 lt!450088) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31198 (_keys!11017 (v!14542 (underlying!568 thiss!908))))) (array!63749 (store (arr!30688 (_values!5895 (v!14542 (underlying!568 thiss!908)))) (index!40720 lt!450088) (ValueCellFull!11223 (dynLambda!1930 (defaultEntry!5872 (v!14542 (underlying!568 thiss!908))) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31199 (_values!5895 (v!14542 (underlying!568 thiss!908))))) (_vacant!2575 (v!14542 (underlying!568 thiss!908))))))))

(declare-fun b!1021354 () Bool)

(declare-fun e!575219 () tuple2!15488)

(assert (=> b!1021354 (= e!575219 e!575220)))

(assert (=> b!1021354 (= c!103542 (= key!697 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1021355 () Bool)

(declare-fun e!575213 () tuple2!15488)

(assert (=> b!1021355 (= e!575219 e!575213)))

(declare-fun seekEntry!0 ((_ BitVec 64) array!63746 (_ BitVec 32)) SeekEntryResult!9587)

(assert (=> b!1021355 (= lt!450088 (seekEntry!0 key!697 (_keys!11017 (v!14542 (underlying!568 thiss!908))) (mask!29439 (v!14542 (underlying!568 thiss!908)))))))

(declare-fun c!103539 () Bool)

(assert (=> b!1021355 (= c!103539 ((_ is Found!9587) lt!450088))))

(declare-fun b!1021356 () Bool)

(declare-fun lt!450089 () Unit!33305)

(assert (=> b!1021356 (= lt!450089 e!575214)))

(declare-fun c!103541 () Bool)

(assert (=> b!1021356 (= c!103541 (contains!5940 (getCurrentListMap!3881 (_keys!11017 (_2!7758 lt!450105)) (_values!5895 (_2!7758 lt!450105)) (mask!29439 (_2!7758 lt!450105)) (extraKeys!5604 (_2!7758 lt!450105)) (zeroValue!5708 (_2!7758 lt!450105)) (minValue!5708 (_2!7758 lt!450105)) #b00000000000000000000000000000000 (defaultEntry!5872 (_2!7758 lt!450105))) key!697))))

(assert (=> b!1021356 (= lt!450105 e!575217)))

(declare-fun c!103546 () Bool)

(assert (=> b!1021356 (= c!103546 (bvsgt lt!450084 #b00000000000000000000000000000000))))

(assert (=> b!1021356 (= lt!450084 (bvadd (_vacant!2575 (v!14542 (underlying!568 thiss!908))) #b00000000000000000000000000000001))))

(declare-fun lt!450083 () Unit!33305)

(declare-fun lt!450103 () Unit!33305)

(assert (=> b!1021356 (= lt!450083 lt!450103)))

(declare-fun call!43219 () ListLongMap!13633)

(assert (=> b!1021356 (= call!43219 call!43222)))

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!1 (array!63746 array!63748 (_ BitVec 32) (_ BitVec 32) V!36677 V!36677 (_ BitVec 32) (_ BitVec 64) Int) Unit!33305)

(assert (=> b!1021356 (= lt!450103 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!1 (_keys!11017 (v!14542 (underlying!568 thiss!908))) (_values!5895 (v!14542 (underlying!568 thiss!908))) (mask!29439 (v!14542 (underlying!568 thiss!908))) (extraKeys!5604 (v!14542 (underlying!568 thiss!908))) (zeroValue!5708 (v!14542 (underlying!568 thiss!908))) (minValue!5708 (v!14542 (underlying!568 thiss!908))) (index!40720 lt!450088) key!697 (defaultEntry!5872 (v!14542 (underlying!568 thiss!908)))))))

(declare-fun lt!450094 () Unit!33305)

(declare-fun lt!450102 () Unit!33305)

(assert (=> b!1021356 (= lt!450094 lt!450102)))

(assert (=> b!1021356 (not (arrayContainsKey!0 (array!63747 (store (arr!30687 (_keys!11017 (v!14542 (underlying!568 thiss!908)))) (index!40720 lt!450088) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31198 (_keys!11017 (v!14542 (underlying!568 thiss!908))))) key!697 #b00000000000000000000000000000000))))

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!63746 (_ BitVec 32) (_ BitVec 64)) Unit!33305)

(assert (=> b!1021356 (= lt!450102 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11017 (v!14542 (underlying!568 thiss!908))) (index!40720 lt!450088) key!697))))

(declare-fun lt!450090 () Unit!33305)

(declare-fun lt!450093 () Unit!33305)

(assert (=> b!1021356 (= lt!450090 lt!450093)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63746 (_ BitVec 32)) Bool)

(assert (=> b!1021356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!63747 (store (arr!30687 (_keys!11017 (v!14542 (underlying!568 thiss!908)))) (index!40720 lt!450088) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31198 (_keys!11017 (v!14542 (underlying!568 thiss!908))))) (mask!29439 (v!14542 (underlying!568 thiss!908))))))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!63746 (_ BitVec 32) (_ BitVec 32)) Unit!33305)

(assert (=> b!1021356 (= lt!450093 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11017 (v!14542 (underlying!568 thiss!908))) (index!40720 lt!450088) (mask!29439 (v!14542 (underlying!568 thiss!908)))))))

(declare-fun lt!450101 () Unit!33305)

(declare-fun lt!450080 () Unit!33305)

(assert (=> b!1021356 (= lt!450101 lt!450080)))

(declare-fun lt!450095 () (_ BitVec 32))

(declare-fun lt!450104 () (_ BitVec 64))

(declare-datatypes ((List!21653 0))(
  ( (Nil!21650) (Cons!21649 (h!22847 (_ BitVec 64)) (t!30667 List!21653)) )
))
(declare-fun lt!450079 () List!21653)

(declare-fun arrayNoDuplicates!0 (array!63746 (_ BitVec 32) List!21653) Bool)

(assert (=> b!1021356 (arrayNoDuplicates!0 (array!63747 (store (arr!30687 (_keys!11017 (v!14542 (underlying!568 thiss!908)))) (index!40720 lt!450088) lt!450104) (size!31198 (_keys!11017 (v!14542 (underlying!568 thiss!908))))) lt!450095 lt!450079)))

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!63746 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21653) Unit!33305)

(assert (=> b!1021356 (= lt!450080 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11017 (v!14542 (underlying!568 thiss!908))) lt!450104 (index!40720 lt!450088) lt!450095 lt!450079))))

(assert (=> b!1021356 (= lt!450079 Nil!21650)))

(assert (=> b!1021356 (= lt!450095 #b00000000000000000000000000000000)))

(assert (=> b!1021356 (= lt!450104 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!450096 () Unit!33305)

(declare-fun lt!450092 () Unit!33305)

(assert (=> b!1021356 (= lt!450096 lt!450092)))

(declare-fun lt!450086 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!63746 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1021356 (= (arrayCountValidKeys!0 (array!63747 (store (arr!30687 (_keys!11017 (v!14542 (underlying!568 thiss!908)))) (index!40720 lt!450088) lt!450086) (size!31198 (_keys!11017 (v!14542 (underlying!568 thiss!908))))) #b00000000000000000000000000000000 (size!31198 (_keys!11017 (v!14542 (underlying!568 thiss!908))))) (bvsub (arrayCountValidKeys!0 (_keys!11017 (v!14542 (underlying!568 thiss!908))) #b00000000000000000000000000000000 (size!31198 (_keys!11017 (v!14542 (underlying!568 thiss!908))))) #b00000000000000000000000000000001))))

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!63746 (_ BitVec 32) (_ BitVec 64)) Unit!33305)

(assert (=> b!1021356 (= lt!450092 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11017 (v!14542 (underlying!568 thiss!908))) (index!40720 lt!450088) lt!450086))))

(assert (=> b!1021356 (= lt!450086 #b1000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1021356 (= e!575213 (tuple2!15489 true (_2!7758 lt!450105)))))

(declare-fun bm!43216 () Bool)

(declare-fun call!43224 () ListLongMap!13633)

(assert (=> bm!43216 (= call!43223 call!43224)))

(declare-fun bm!43217 () Bool)

(declare-fun map!14477 (LongMapFixedSize!5040) ListLongMap!13633)

(assert (=> bm!43217 (= call!43220 (map!14477 (ite c!103543 (_2!7755 lt!450077) (v!14542 (underlying!568 thiss!908)))))))

(declare-fun b!1021357 () Bool)

(declare-fun Unit!33310 () Unit!33305)

(assert (=> b!1021357 (= e!575214 Unit!33310)))

(declare-fun bm!43218 () Bool)

(assert (=> bm!43218 (= call!43224 (getCurrentListMap!3881 (_keys!11017 (v!14542 (underlying!568 thiss!908))) (_values!5895 (v!14542 (underlying!568 thiss!908))) (mask!29439 (v!14542 (underlying!568 thiss!908))) (ite (and c!103545 c!103542) lt!450097 (extraKeys!5604 (v!14542 (underlying!568 thiss!908)))) (ite (and c!103545 c!103542) lt!450098 (zeroValue!5708 (v!14542 (underlying!568 thiss!908)))) (minValue!5708 (v!14542 (underlying!568 thiss!908))) #b00000000000000000000000000000000 (defaultEntry!5872 (v!14542 (underlying!568 thiss!908)))))))

(declare-fun d!122501 () Bool)

(assert (=> d!122501 e!575218))

(declare-fun res!684368 () Bool)

(assert (=> d!122501 (=> (not res!684368) (not e!575218))))

(assert (=> d!122501 (= res!684368 (valid!1921 (_2!7755 lt!450077)))))

(assert (=> d!122501 (= lt!450077 e!575219)))

(assert (=> d!122501 (= c!103545 (= key!697 (bvneg key!697)))))

(assert (=> d!122501 (valid!1921 (v!14542 (underlying!568 thiss!908)))))

(assert (=> d!122501 (= (remove!10 (v!14542 (underlying!568 thiss!908)) key!697) lt!450077)))

(declare-fun b!1021350 () Bool)

(assert (=> b!1021350 (= e!575216 (array!63749 (store (arr!30688 (_values!5895 (v!14542 (underlying!568 thiss!908)))) (index!40720 lt!450088) (ValueCellFull!11223 (dynLambda!1930 (defaultEntry!5872 (v!14542 (underlying!568 thiss!908))) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31199 (_values!5895 (v!14542 (underlying!568 thiss!908))))))))

(declare-fun bm!43219 () Bool)

(assert (=> bm!43219 (= call!43218 (map!14477 (ite c!103543 (v!14542 (underlying!568 thiss!908)) (_2!7755 lt!450077))))))

(declare-fun b!1021358 () Bool)

(assert (=> b!1021358 (= e!575212 (ite (= key!697 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5604 (_2!7758 lt!450105)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5604 (_2!7758 lt!450105)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1021359 () Bool)

(assert (=> b!1021359 (= e!575215 (= call!43220 (-!459 call!43218 key!697)))))

(declare-fun bm!43220 () Bool)

(assert (=> bm!43220 (= call!43221 call!43219)))

(declare-fun b!1021360 () Bool)

(assert (=> b!1021360 (= e!575213 (tuple2!15489 false (v!14542 (underlying!568 thiss!908))))))

(declare-fun bm!43221 () Bool)

(assert (=> bm!43221 (= call!43219 (-!459 (ite c!103545 (ite c!103542 call!43217 call!43223) call!43224) (ite c!103545 (ite c!103542 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) key!697)))))

(assert (= (and d!122501 c!103545) b!1021354))

(assert (= (and d!122501 (not c!103545)) b!1021355))

(assert (= (and b!1021354 c!103542) b!1021348))

(assert (= (and b!1021354 (not c!103542)) b!1021344))

(assert (= (or b!1021348 b!1021344) bm!43216))

(assert (= (or b!1021348 b!1021344) bm!43215))

(assert (= (or b!1021348 b!1021344) bm!43220))

(assert (= (and b!1021355 c!103539) b!1021356))

(assert (= (and b!1021355 (not c!103539)) b!1021360))

(assert (= (and b!1021356 c!103546) b!1021346))

(assert (= (and b!1021356 (not c!103546)) b!1021353))

(assert (= (and b!1021356 c!103541) b!1021347))

(assert (= (and b!1021356 (not c!103541)) b!1021357))

(assert (= (and b!1021347 c!103544) b!1021345))

(assert (= (and b!1021347 (not c!103544)) b!1021358))

(assert (= (or bm!43215 b!1021356) bm!43214))

(assert (= (and bm!43214 c!103540) b!1021351))

(assert (= (and bm!43214 (not c!103540)) b!1021350))

(assert (= (or bm!43216 b!1021356) bm!43218))

(assert (= (or bm!43220 b!1021356) bm!43221))

(assert (= (and d!122501 res!684368) b!1021349))

(assert (= (and b!1021349 c!103543) b!1021359))

(assert (= (and b!1021349 (not c!103543)) b!1021352))

(assert (= (or b!1021359 b!1021352) bm!43219))

(assert (= (or b!1021359 b!1021352) bm!43217))

(declare-fun b_lambda!15651 () Bool)

(assert (=> (not b_lambda!15651) (not b!1021344)))

(declare-fun t!30664 () Bool)

(declare-fun tb!6835 () Bool)

(assert (=> (and b!1021273 (= (defaultEntry!5872 (v!14542 (underlying!568 thiss!908))) (defaultEntry!5872 (v!14542 (underlying!568 thiss!908)))) t!30664) tb!6835))

(declare-fun result!13977 () Bool)

(assert (=> tb!6835 (= result!13977 tp_is_empty!23853)))

(assert (=> b!1021344 t!30664))

(declare-fun b_and!32325 () Bool)

(assert (= b_and!32321 (and (=> t!30664 result!13977) b_and!32325)))

(declare-fun b_lambda!15653 () Bool)

(assert (=> (not b_lambda!15653) (not b!1021348)))

(declare-fun t!30666 () Bool)

(declare-fun tb!6837 () Bool)

(assert (=> (and b!1021273 (= (defaultEntry!5872 (v!14542 (underlying!568 thiss!908))) (defaultEntry!5872 (v!14542 (underlying!568 thiss!908)))) t!30666) tb!6837))

(declare-fun result!13981 () Bool)

(assert (=> tb!6837 (= result!13981 tp_is_empty!23853)))

(assert (=> b!1021348 t!30666))

(declare-fun b_and!32327 () Bool)

(assert (= b_and!32325 (and (=> t!30666 result!13981) b_and!32327)))

(declare-fun b_lambda!15655 () Bool)

(assert (=> (not b_lambda!15655) (not b!1021353)))

(assert (=> b!1021353 t!30666))

(declare-fun b_and!32329 () Bool)

(assert (= b_and!32327 (and (=> t!30666 result!13981) b_and!32329)))

(declare-fun b_lambda!15657 () Bool)

(assert (=> (not b_lambda!15657) (not b!1021346)))

(assert (=> b!1021346 t!30666))

(declare-fun b_and!32331 () Bool)

(assert (= b_and!32329 (and (=> t!30666 result!13981) b_and!32331)))

(declare-fun b_lambda!15659 () Bool)

(assert (=> (not b_lambda!15659) (not b!1021350)))

(assert (=> b!1021350 t!30666))

(declare-fun b_and!32333 () Bool)

(assert (= b_and!32331 (and (=> t!30666 result!13981) b_and!32333)))

(declare-fun m!940879 () Bool)

(assert (=> bm!43219 m!940879))

(declare-fun m!940881 () Bool)

(assert (=> b!1021345 m!940881))

(declare-fun m!940883 () Bool)

(assert (=> d!122501 m!940883))

(assert (=> d!122501 m!940871))

(declare-fun m!940885 () Bool)

(assert (=> b!1021355 m!940885))

(declare-fun m!940887 () Bool)

(assert (=> bm!43214 m!940887))

(declare-fun m!940889 () Bool)

(assert (=> bm!43214 m!940889))

(assert (=> b!1021353 m!940887))

(declare-fun m!940891 () Bool)

(assert (=> b!1021353 m!940891))

(declare-fun m!940893 () Bool)

(assert (=> b!1021353 m!940893))

(declare-fun m!940895 () Bool)

(assert (=> bm!43218 m!940895))

(declare-fun m!940897 () Bool)

(assert (=> bm!43217 m!940897))

(declare-fun m!940899 () Bool)

(assert (=> b!1021347 m!940899))

(assert (=> b!1021350 m!940891))

(assert (=> b!1021350 m!940893))

(declare-fun m!940901 () Bool)

(assert (=> b!1021344 m!940901))

(declare-fun m!940903 () Bool)

(assert (=> b!1021344 m!940903))

(declare-fun m!940905 () Bool)

(assert (=> b!1021348 m!940905))

(assert (=> b!1021348 m!940891))

(declare-fun m!940907 () Bool)

(assert (=> b!1021359 m!940907))

(declare-fun m!940909 () Bool)

(assert (=> bm!43221 m!940909))

(declare-fun m!940911 () Bool)

(assert (=> b!1021356 m!940911))

(declare-fun m!940913 () Bool)

(assert (=> b!1021356 m!940913))

(declare-fun m!940915 () Bool)

(assert (=> b!1021356 m!940915))

(declare-fun m!940917 () Bool)

(assert (=> b!1021356 m!940917))

(declare-fun m!940919 () Bool)

(assert (=> b!1021356 m!940919))

(declare-fun m!940921 () Bool)

(assert (=> b!1021356 m!940921))

(declare-fun m!940923 () Bool)

(assert (=> b!1021356 m!940923))

(declare-fun m!940925 () Bool)

(assert (=> b!1021356 m!940925))

(assert (=> b!1021356 m!940887))

(declare-fun m!940927 () Bool)

(assert (=> b!1021356 m!940927))

(declare-fun m!940929 () Bool)

(assert (=> b!1021356 m!940929))

(assert (=> b!1021356 m!940913))

(declare-fun m!940931 () Bool)

(assert (=> b!1021356 m!940931))

(declare-fun m!940933 () Bool)

(assert (=> b!1021356 m!940933))

(declare-fun m!940935 () Bool)

(assert (=> b!1021356 m!940935))

(declare-fun m!940937 () Bool)

(assert (=> b!1021356 m!940937))

(assert (=> b!1021346 m!940887))

(assert (=> b!1021346 m!940891))

(assert (=> b!1021346 m!940893))

(assert (=> b!1021277 d!122501))

(declare-fun d!122503 () Bool)

(assert (=> d!122503 (= (map!14476 (ite c!103519 lt!450009 thiss!908)) (map!14477 (v!14542 (underlying!568 (ite c!103519 lt!450009 thiss!908)))))))

(declare-fun bs!29768 () Bool)

(assert (= bs!29768 d!122503))

(declare-fun m!940939 () Bool)

(assert (=> bs!29768 m!940939))

(assert (=> bm!43190 d!122503))

(declare-fun d!122505 () Bool)

(assert (=> d!122505 (= (array_inv!23799 (_keys!11017 (v!14542 (underlying!568 thiss!908)))) (bvsge (size!31198 (_keys!11017 (v!14542 (underlying!568 thiss!908)))) #b00000000000000000000000000000000))))

(assert (=> b!1021273 d!122505))

(declare-fun d!122507 () Bool)

(assert (=> d!122507 (= (array_inv!23800 (_values!5895 (v!14542 (underlying!568 thiss!908)))) (bvsge (size!31199 (_values!5895 (v!14542 (underlying!568 thiss!908)))) #b00000000000000000000000000000000))))

(assert (=> b!1021273 d!122507))

(declare-fun d!122509 () Bool)

(assert (=> d!122509 (= (map!14476 (ite c!103519 thiss!908 lt!450009)) (map!14477 (v!14542 (underlying!568 (ite c!103519 thiss!908 lt!450009)))))))

(declare-fun bs!29769 () Bool)

(assert (= bs!29769 d!122509))

(declare-fun m!940941 () Bool)

(assert (=> bs!29769 m!940941))

(assert (=> bm!43191 d!122509))

(declare-fun condMapEmpty!37197 () Bool)

(declare-fun mapDefault!37197 () ValueCell!11223)

(assert (=> mapNonEmpty!37191 (= condMapEmpty!37197 (= mapRest!37191 ((as const (Array (_ BitVec 32) ValueCell!11223)) mapDefault!37197)))))

(declare-fun e!575225 () Bool)

(declare-fun mapRes!37197 () Bool)

(assert (=> mapNonEmpty!37191 (= tp!71428 (and e!575225 mapRes!37197))))

(declare-fun mapNonEmpty!37197 () Bool)

(declare-fun tp!71437 () Bool)

(declare-fun e!575226 () Bool)

(assert (=> mapNonEmpty!37197 (= mapRes!37197 (and tp!71437 e!575226))))

(declare-fun mapValue!37197 () ValueCell!11223)

(declare-fun mapKey!37197 () (_ BitVec 32))

(declare-fun mapRest!37197 () (Array (_ BitVec 32) ValueCell!11223))

(assert (=> mapNonEmpty!37197 (= mapRest!37191 (store mapRest!37197 mapKey!37197 mapValue!37197))))

(declare-fun b!1021370 () Bool)

(assert (=> b!1021370 (= e!575225 tp_is_empty!23853)))

(declare-fun b!1021369 () Bool)

(assert (=> b!1021369 (= e!575226 tp_is_empty!23853)))

(declare-fun mapIsEmpty!37197 () Bool)

(assert (=> mapIsEmpty!37197 mapRes!37197))

(assert (= (and mapNonEmpty!37191 condMapEmpty!37197) mapIsEmpty!37197))

(assert (= (and mapNonEmpty!37191 (not condMapEmpty!37197)) mapNonEmpty!37197))

(assert (= (and mapNonEmpty!37197 ((_ is ValueCellFull!11223) mapValue!37197)) b!1021369))

(assert (= (and mapNonEmpty!37191 ((_ is ValueCellFull!11223) mapDefault!37197)) b!1021370))

(declare-fun m!940943 () Bool)

(assert (=> mapNonEmpty!37197 m!940943))

(declare-fun b_lambda!15661 () Bool)

(assert (= b_lambda!15657 (or (and b!1021273 b_free!20133) b_lambda!15661)))

(declare-fun b_lambda!15663 () Bool)

(assert (= b_lambda!15659 (or (and b!1021273 b_free!20133) b_lambda!15663)))

(declare-fun b_lambda!15665 () Bool)

(assert (= b_lambda!15653 (or (and b!1021273 b_free!20133) b_lambda!15665)))

(declare-fun b_lambda!15667 () Bool)

(assert (= b_lambda!15655 (or (and b!1021273 b_free!20133) b_lambda!15667)))

(declare-fun b_lambda!15669 () Bool)

(assert (= b_lambda!15651 (or (and b!1021273 b_free!20133) b_lambda!15669)))

(check-sat (not d!122499) (not b_next!20133) (not bm!43219) tp_is_empty!23853 (not d!122501) (not bm!43217) (not b_lambda!15667) (not d!122497) (not b!1021356) (not b_lambda!15665) (not bm!43218) (not d!122503) (not b!1021355) b_and!32333 (not b!1021348) (not b!1021359) (not b!1021344) (not bm!43221) (not b_lambda!15663) (not b_lambda!15661) (not b_lambda!15669) (not b!1021345) (not bm!43214) (not mapNonEmpty!37197) (not b!1021347) (not d!122509) (not d!122495))
(check-sat b_and!32333 (not b_next!20133))
