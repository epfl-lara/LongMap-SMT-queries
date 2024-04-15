; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89068 () Bool)

(assert start!89068)

(declare-fun b!1021101 () Bool)

(declare-fun b_free!20131 () Bool)

(declare-fun b_next!20131 () Bool)

(assert (=> b!1021101 (= b_free!20131 (not b_next!20131))))

(declare-fun tp!71421 () Bool)

(declare-fun b_and!32293 () Bool)

(assert (=> b!1021101 (= tp!71421 b_and!32293)))

(declare-fun b!1021095 () Bool)

(declare-fun e!575042 () Bool)

(declare-datatypes ((V!36675 0))(
  ( (V!36676 (val!11976 Int)) )
))
(declare-datatypes ((tuple2!15562 0))(
  ( (tuple2!15563 (_1!7792 (_ BitVec 64)) (_2!7792 V!36675)) )
))
(declare-datatypes ((List!21685 0))(
  ( (Nil!21682) (Cons!21681 (h!22879 tuple2!15562) (t!30686 List!21685)) )
))
(declare-datatypes ((ListLongMap!13701 0))(
  ( (ListLongMap!13702 (toList!6866 List!21685)) )
))
(declare-fun call!43165 () ListLongMap!13701)

(declare-fun call!43164 () ListLongMap!13701)

(assert (=> b!1021095 (= e!575042 (not (= call!43165 call!43164)))))

(declare-fun b!1021096 () Bool)

(declare-fun e!575037 () Bool)

(declare-fun tp_is_empty!23851 () Bool)

(assert (=> b!1021096 (= e!575037 tp_is_empty!23851)))

(declare-fun b!1021097 () Bool)

(declare-fun e!575043 () Bool)

(assert (=> b!1021097 (= e!575043 e!575042)))

(declare-fun c!103480 () Bool)

(declare-datatypes ((array!63681 0))(
  ( (array!63682 (arr!30654 (Array (_ BitVec 32) (_ BitVec 64))) (size!31167 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11222 0))(
  ( (ValueCellFull!11222 (v!14538 V!36675)) (EmptyCell!11222) )
))
(declare-datatypes ((array!63683 0))(
  ( (array!63684 (arr!30655 (Array (_ BitVec 32) ValueCell!11222)) (size!31168 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5038 0))(
  ( (LongMapFixedSize!5039 (defaultEntry!5871 Int) (mask!29433 (_ BitVec 32)) (extraKeys!5603 (_ BitVec 32)) (zeroValue!5707 V!36675) (minValue!5707 V!36675) (_size!2574 (_ BitVec 32)) (_keys!11012 array!63681) (_values!5894 array!63683) (_vacant!2574 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15564 0))(
  ( (tuple2!15565 (_1!7793 Bool) (_2!7793 LongMapFixedSize!5038)) )
))
(declare-fun lt!449802 () tuple2!15564)

(assert (=> b!1021097 (= c!103480 (_1!7793 lt!449802))))

(declare-fun b!1021098 () Bool)

(declare-fun e!575040 () Bool)

(assert (=> b!1021098 (= e!575040 e!575043)))

(declare-fun res!684285 () Bool)

(assert (=> b!1021098 (=> res!684285 e!575043)))

(declare-datatypes ((Cell!1104 0))(
  ( (Cell!1105 (v!14539 LongMapFixedSize!5038)) )
))
(declare-datatypes ((LongMap!1104 0))(
  ( (LongMap!1105 (underlying!563 Cell!1104)) )
))
(declare-fun lt!449803 () LongMap!1104)

(declare-fun valid!1923 (LongMap!1104) Bool)

(assert (=> b!1021098 (= res!684285 (not (valid!1923 lt!449803)))))

(assert (=> b!1021098 (= lt!449803 (LongMap!1105 (Cell!1105 (_2!7793 lt!449802))))))

(declare-fun thiss!908 () LongMap!1104)

(declare-fun key!697 () (_ BitVec 64))

(declare-fun remove!9 (LongMapFixedSize!5038 (_ BitVec 64)) tuple2!15564)

(assert (=> b!1021098 (= lt!449802 (remove!9 (v!14539 (underlying!563 thiss!908)) key!697))))

(declare-fun b!1021099 () Bool)

(declare-fun e!575045 () Bool)

(declare-fun mapRes!37188 () Bool)

(assert (=> b!1021099 (= e!575045 (and e!575037 mapRes!37188))))

(declare-fun condMapEmpty!37188 () Bool)

(declare-fun mapDefault!37188 () ValueCell!11222)

(assert (=> b!1021099 (= condMapEmpty!37188 (= (arr!30655 (_values!5894 (v!14539 (underlying!563 thiss!908)))) ((as const (Array (_ BitVec 32) ValueCell!11222)) mapDefault!37188)))))

(declare-fun b!1021100 () Bool)

(declare-fun e!575041 () Bool)

(declare-fun e!575039 () Bool)

(assert (=> b!1021100 (= e!575041 e!575039)))

(declare-fun res!684286 () Bool)

(assert (=> start!89068 (=> (not res!684286) (not e!575040))))

(assert (=> start!89068 (= res!684286 (valid!1923 thiss!908))))

(assert (=> start!89068 e!575040))

(assert (=> start!89068 e!575041))

(assert (=> start!89068 true))

(declare-fun e!575036 () Bool)

(declare-fun array_inv!23785 (array!63681) Bool)

(declare-fun array_inv!23786 (array!63683) Bool)

(assert (=> b!1021101 (= e!575036 (and tp!71421 tp_is_empty!23851 (array_inv!23785 (_keys!11012 (v!14539 (underlying!563 thiss!908)))) (array_inv!23786 (_values!5894 (v!14539 (underlying!563 thiss!908)))) e!575045))))

(declare-fun mapNonEmpty!37188 () Bool)

(declare-fun tp!71422 () Bool)

(declare-fun e!575038 () Bool)

(assert (=> mapNonEmpty!37188 (= mapRes!37188 (and tp!71422 e!575038))))

(declare-fun mapValue!37188 () ValueCell!11222)

(declare-fun mapRest!37188 () (Array (_ BitVec 32) ValueCell!11222))

(declare-fun mapKey!37188 () (_ BitVec 32))

(assert (=> mapNonEmpty!37188 (= (arr!30655 (_values!5894 (v!14539 (underlying!563 thiss!908)))) (store mapRest!37188 mapKey!37188 mapValue!37188))))

(declare-fun b!1021102 () Bool)

(assert (=> b!1021102 (= e!575038 tp_is_empty!23851)))

(declare-fun b!1021103 () Bool)

(assert (=> b!1021103 (= e!575039 e!575036)))

(declare-fun bm!43161 () Bool)

(declare-fun map!14461 (LongMap!1104) ListLongMap!13701)

(assert (=> bm!43161 (= call!43164 (map!14461 (ite c!103480 lt!449803 thiss!908)))))

(declare-fun mapIsEmpty!37188 () Bool)

(assert (=> mapIsEmpty!37188 mapRes!37188))

(declare-fun bm!43162 () Bool)

(assert (=> bm!43162 (= call!43165 (map!14461 (ite c!103480 thiss!908 lt!449803)))))

(declare-fun b!1021104 () Bool)

(declare-fun -!459 (ListLongMap!13701 (_ BitVec 64)) ListLongMap!13701)

(assert (=> b!1021104 (= e!575042 (not (= call!43164 (-!459 call!43165 key!697))))))

(assert (= (and start!89068 res!684286) b!1021098))

(assert (= (and b!1021098 (not res!684285)) b!1021097))

(assert (= (and b!1021097 c!103480) b!1021104))

(assert (= (and b!1021097 (not c!103480)) b!1021095))

(assert (= (or b!1021104 b!1021095) bm!43161))

(assert (= (or b!1021104 b!1021095) bm!43162))

(assert (= (and b!1021099 condMapEmpty!37188) mapIsEmpty!37188))

(assert (= (and b!1021099 (not condMapEmpty!37188)) mapNonEmpty!37188))

(get-info :version)

(assert (= (and mapNonEmpty!37188 ((_ is ValueCellFull!11222) mapValue!37188)) b!1021102))

(assert (= (and b!1021099 ((_ is ValueCellFull!11222) mapDefault!37188)) b!1021096))

(assert (= b!1021101 b!1021099))

(assert (= b!1021103 b!1021101))

(assert (= b!1021100 b!1021103))

(assert (= start!89068 b!1021100))

(declare-fun m!940197 () Bool)

(assert (=> b!1021101 m!940197))

(declare-fun m!940199 () Bool)

(assert (=> b!1021101 m!940199))

(declare-fun m!940201 () Bool)

(assert (=> bm!43161 m!940201))

(declare-fun m!940203 () Bool)

(assert (=> start!89068 m!940203))

(declare-fun m!940205 () Bool)

(assert (=> mapNonEmpty!37188 m!940205))

(declare-fun m!940207 () Bool)

(assert (=> bm!43162 m!940207))

(declare-fun m!940209 () Bool)

(assert (=> b!1021098 m!940209))

(declare-fun m!940211 () Bool)

(assert (=> b!1021098 m!940211))

(declare-fun m!940213 () Bool)

(assert (=> b!1021104 m!940213))

(check-sat (not b!1021104) (not bm!43162) (not b_next!20131) tp_is_empty!23851 b_and!32293 (not start!89068) (not b!1021098) (not mapNonEmpty!37188) (not b!1021101) (not bm!43161))
(check-sat b_and!32293 (not b_next!20131))
(get-model)

(declare-fun d!122345 () Bool)

(declare-fun map!14464 (LongMapFixedSize!5038) ListLongMap!13701)

(assert (=> d!122345 (= (map!14461 (ite c!103480 lt!449803 thiss!908)) (map!14464 (v!14539 (underlying!563 (ite c!103480 lt!449803 thiss!908)))))))

(declare-fun bs!29736 () Bool)

(assert (= bs!29736 d!122345))

(declare-fun m!940251 () Bool)

(assert (=> bs!29736 m!940251))

(assert (=> bm!43161 d!122345))

(declare-fun d!122347 () Bool)

(assert (=> d!122347 (= (array_inv!23785 (_keys!11012 (v!14539 (underlying!563 thiss!908)))) (bvsge (size!31167 (_keys!11012 (v!14539 (underlying!563 thiss!908)))) #b00000000000000000000000000000000))))

(assert (=> b!1021101 d!122347))

(declare-fun d!122349 () Bool)

(assert (=> d!122349 (= (array_inv!23786 (_values!5894 (v!14539 (underlying!563 thiss!908)))) (bvsge (size!31168 (_values!5894 (v!14539 (underlying!563 thiss!908)))) #b00000000000000000000000000000000))))

(assert (=> b!1021101 d!122349))

(declare-fun d!122351 () Bool)

(declare-fun valid!1925 (LongMapFixedSize!5038) Bool)

(assert (=> d!122351 (= (valid!1923 thiss!908) (valid!1925 (v!14539 (underlying!563 thiss!908))))))

(declare-fun bs!29737 () Bool)

(assert (= bs!29737 d!122351))

(declare-fun m!940253 () Bool)

(assert (=> bs!29737 m!940253))

(assert (=> start!89068 d!122351))

(declare-fun d!122353 () Bool)

(assert (=> d!122353 (= (map!14461 (ite c!103480 thiss!908 lt!449803)) (map!14464 (v!14539 (underlying!563 (ite c!103480 thiss!908 lt!449803)))))))

(declare-fun bs!29738 () Bool)

(assert (= bs!29738 d!122353))

(declare-fun m!940255 () Bool)

(assert (=> bs!29738 m!940255))

(assert (=> bm!43162 d!122353))

(declare-fun d!122355 () Bool)

(declare-fun lt!449818 () ListLongMap!13701)

(declare-fun contains!5916 (ListLongMap!13701 (_ BitVec 64)) Bool)

(assert (=> d!122355 (not (contains!5916 lt!449818 key!697))))

(declare-fun removeStrictlySorted!48 (List!21685 (_ BitVec 64)) List!21685)

(assert (=> d!122355 (= lt!449818 (ListLongMap!13702 (removeStrictlySorted!48 (toList!6866 call!43165) key!697)))))

(assert (=> d!122355 (= (-!459 call!43165 key!697) lt!449818)))

(declare-fun bs!29739 () Bool)

(assert (= bs!29739 d!122355))

(declare-fun m!940257 () Bool)

(assert (=> bs!29739 m!940257))

(declare-fun m!940259 () Bool)

(assert (=> bs!29739 m!940259))

(assert (=> b!1021104 d!122355))

(declare-fun d!122357 () Bool)

(assert (=> d!122357 (= (valid!1923 lt!449803) (valid!1925 (v!14539 (underlying!563 lt!449803))))))

(declare-fun bs!29740 () Bool)

(assert (= bs!29740 d!122357))

(declare-fun m!940261 () Bool)

(assert (=> bs!29740 m!940261))

(assert (=> b!1021098 d!122357))

(declare-fun d!122359 () Bool)

(declare-fun e!575123 () Bool)

(assert (=> d!122359 e!575123))

(declare-fun res!684301 () Bool)

(assert (=> d!122359 (=> (not res!684301) (not e!575123))))

(declare-fun lt!449880 () tuple2!15564)

(assert (=> d!122359 (= res!684301 (valid!1925 (_2!7793 lt!449880)))))

(declare-fun e!575124 () tuple2!15564)

(assert (=> d!122359 (= lt!449880 e!575124)))

(declare-fun c!103502 () Bool)

(assert (=> d!122359 (= c!103502 (= key!697 (bvneg key!697)))))

(assert (=> d!122359 (valid!1925 (v!14539 (underlying!563 thiss!908)))))

(assert (=> d!122359 (= (remove!9 (v!14539 (underlying!563 thiss!908)) key!697) lt!449880)))

(declare-fun bm!43191 () Bool)

(declare-fun call!43200 () ListLongMap!13701)

(declare-fun c!103504 () Bool)

(declare-fun call!43199 () ListLongMap!13701)

(declare-fun call!43201 () ListLongMap!13701)

(assert (=> bm!43191 (= call!43199 (-!459 (ite c!103502 call!43200 call!43201) (ite c!103502 (ite c!103504 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) key!697)))))

(declare-fun b!1021195 () Bool)

(declare-fun e!575126 () Bool)

(declare-datatypes ((Unit!33201 0))(
  ( (Unit!33202) )
))
(declare-datatypes ((tuple2!15572 0))(
  ( (tuple2!15573 (_1!7797 Unit!33201) (_2!7797 LongMapFixedSize!5038)) )
))
(declare-fun lt!449894 () tuple2!15572)

(assert (=> b!1021195 (= e!575126 (ite (= key!697 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5603 (_2!7797 lt!449894)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5603 (_2!7797 lt!449894)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1021196 () Bool)

(declare-fun e!575122 () tuple2!15564)

(assert (=> b!1021196 (= e!575124 e!575122)))

(assert (=> b!1021196 (= c!103504 (= key!697 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1021197 () Bool)

(declare-fun e!575129 () Bool)

(assert (=> b!1021197 (= e!575123 e!575129)))

(declare-fun c!103501 () Bool)

(assert (=> b!1021197 (= c!103501 (_1!7793 lt!449880))))

(declare-fun b!1021198 () Bool)

(declare-fun e!575128 () Unit!33201)

(declare-fun Unit!33203 () Unit!33201)

(assert (=> b!1021198 (= e!575128 Unit!33203)))

(declare-fun b!1021199 () Bool)

(declare-fun call!43198 () ListLongMap!13701)

(declare-fun call!43194 () ListLongMap!13701)

(assert (=> b!1021199 (= e!575129 (= call!43198 call!43194))))

(declare-fun b!1021200 () Bool)

(declare-fun lt!449900 () Unit!33201)

(declare-fun lt!449905 () Unit!33201)

(assert (=> b!1021200 (= lt!449900 lt!449905)))

(declare-fun call!43195 () ListLongMap!13701)

(declare-fun call!43197 () ListLongMap!13701)

(assert (=> b!1021200 (= call!43195 call!43197)))

(declare-fun lt!449885 () V!36675)

(declare-fun lt!449884 () (_ BitVec 32))

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!1 (array!63681 array!63683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36675 V!36675 V!36675 Int) Unit!33201)

(assert (=> b!1021200 (= lt!449905 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!1 (_keys!11012 (v!14539 (underlying!563 thiss!908))) (_values!5894 (v!14539 (underlying!563 thiss!908))) (mask!29433 (v!14539 (underlying!563 thiss!908))) (extraKeys!5603 (v!14539 (underlying!563 thiss!908))) lt!449884 (zeroValue!5707 (v!14539 (underlying!563 thiss!908))) (minValue!5707 (v!14539 (underlying!563 thiss!908))) lt!449885 (defaultEntry!5871 (v!14539 (underlying!563 thiss!908)))))))

(declare-fun dynLambda!1922 (Int (_ BitVec 64)) V!36675)

(assert (=> b!1021200 (= lt!449885 (dynLambda!1922 (defaultEntry!5871 (v!14539 (underlying!563 thiss!908))) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1021200 (= lt!449884 (bvand (extraKeys!5603 (v!14539 (underlying!563 thiss!908))) #b00000000000000000000000000000001))))

(assert (=> b!1021200 (= e!575122 (tuple2!15565 true (LongMapFixedSize!5039 (defaultEntry!5871 (v!14539 (underlying!563 thiss!908))) (mask!29433 (v!14539 (underlying!563 thiss!908))) (bvand (extraKeys!5603 (v!14539 (underlying!563 thiss!908))) #b00000000000000000000000000000001) (zeroValue!5707 (v!14539 (underlying!563 thiss!908))) (dynLambda!1922 (defaultEntry!5871 (v!14539 (underlying!563 thiss!908))) #b1000000000000000000000000000000000000000000000000000000000000000) (_size!2574 (v!14539 (underlying!563 thiss!908))) (_keys!11012 (v!14539 (underlying!563 thiss!908))) (_values!5894 (v!14539 (underlying!563 thiss!908))) (_vacant!2574 (v!14539 (underlying!563 thiss!908))))))))

(declare-fun b!1021201 () Bool)

(declare-fun Unit!33204 () Unit!33201)

(assert (=> b!1021201 (= e!575128 Unit!33204)))

(declare-fun lt!449879 () Unit!33201)

(declare-fun lemmaKeyInListMapIsInArray!324 (array!63681 array!63683 (_ BitVec 32) (_ BitVec 32) V!36675 V!36675 (_ BitVec 64) Int) Unit!33201)

(assert (=> b!1021201 (= lt!449879 (lemmaKeyInListMapIsInArray!324 (_keys!11012 (_2!7797 lt!449894)) (_values!5894 (_2!7797 lt!449894)) (mask!29433 (_2!7797 lt!449894)) (extraKeys!5603 (_2!7797 lt!449894)) (zeroValue!5707 (_2!7797 lt!449894)) (minValue!5707 (_2!7797 lt!449894)) key!697 (defaultEntry!5871 (_2!7797 lt!449894))))))

(declare-fun c!103503 () Bool)

(assert (=> b!1021201 (= c!103503 (and (not (= key!697 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!697 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1021201 e!575126))

(declare-fun lt!449878 () Unit!33201)

(assert (=> b!1021201 (= lt!449878 lt!449879)))

(assert (=> b!1021201 false))

(declare-fun bm!43192 () Bool)

(assert (=> bm!43192 (= call!43198 (map!14464 (_2!7793 lt!449880)))))

(declare-fun b!1021202 () Bool)

(declare-fun arrayContainsKey!0 (array!63681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1021202 (= e!575126 (arrayContainsKey!0 (_keys!11012 (_2!7797 lt!449894)) key!697 #b00000000000000000000000000000000))))

(declare-fun call!43196 () ListLongMap!13701)

(declare-fun bm!43193 () Bool)

(declare-fun lt!449889 () (_ BitVec 32))

(declare-fun lt!449877 () V!36675)

(declare-fun getCurrentListMap!3835 (array!63681 array!63683 (_ BitVec 32) (_ BitVec 32) V!36675 V!36675 (_ BitVec 32) Int) ListLongMap!13701)

(assert (=> bm!43193 (= call!43196 (getCurrentListMap!3835 (ite c!103502 (_keys!11012 (v!14539 (underlying!563 thiss!908))) (_keys!11012 (_2!7797 lt!449894))) (ite c!103502 (_values!5894 (v!14539 (underlying!563 thiss!908))) (_values!5894 (_2!7797 lt!449894))) (ite c!103502 (mask!29433 (v!14539 (underlying!563 thiss!908))) (mask!29433 (_2!7797 lt!449894))) (ite c!103502 (ite c!103504 lt!449889 lt!449884) (extraKeys!5603 (_2!7797 lt!449894))) (ite c!103502 (ite c!103504 lt!449877 (zeroValue!5707 (v!14539 (underlying!563 thiss!908)))) (zeroValue!5707 (_2!7797 lt!449894))) (ite c!103502 (ite c!103504 (minValue!5707 (v!14539 (underlying!563 thiss!908))) lt!449885) (minValue!5707 (_2!7797 lt!449894))) #b00000000000000000000000000000000 (ite c!103502 (defaultEntry!5871 (v!14539 (underlying!563 thiss!908))) (defaultEntry!5871 (_2!7797 lt!449894)))))))

(declare-fun bm!43194 () Bool)

(assert (=> bm!43194 (= call!43197 call!43196)))

(declare-fun b!1021203 () Bool)

(declare-fun lt!449895 () Unit!33201)

(assert (=> b!1021203 (= lt!449895 e!575128)))

(declare-fun c!103507 () Bool)

(assert (=> b!1021203 (= c!103507 (contains!5916 call!43196 key!697))))

(declare-fun e!575125 () tuple2!15572)

(assert (=> b!1021203 (= lt!449894 e!575125)))

(declare-fun c!103506 () Bool)

(declare-fun lt!449903 () (_ BitVec 32))

(assert (=> b!1021203 (= c!103506 (bvsgt lt!449903 #b00000000000000000000000000000000))))

(assert (=> b!1021203 (= lt!449903 (bvadd (_vacant!2574 (v!14539 (underlying!563 thiss!908))) #b00000000000000000000000000000001))))

(declare-fun lt!449904 () Unit!33201)

(declare-fun lt!449902 () Unit!33201)

(assert (=> b!1021203 (= lt!449904 lt!449902)))

(declare-datatypes ((SeekEntryResult!9581 0))(
  ( (MissingZero!9581 (index!40695 (_ BitVec 32))) (Found!9581 (index!40696 (_ BitVec 32))) (Intermediate!9581 (undefined!10393 Bool) (index!40697 (_ BitVec 32)) (x!90660 (_ BitVec 32))) (Undefined!9581) (MissingVacant!9581 (index!40698 (_ BitVec 32))) )
))
(declare-fun lt!449899 () SeekEntryResult!9581)

(assert (=> b!1021203 (= call!43199 (getCurrentListMap!3835 (array!63682 (store (arr!30654 (_keys!11012 (v!14539 (underlying!563 thiss!908)))) (index!40696 lt!449899) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31167 (_keys!11012 (v!14539 (underlying!563 thiss!908))))) (array!63684 (store (arr!30655 (_values!5894 (v!14539 (underlying!563 thiss!908)))) (index!40696 lt!449899) (ValueCellFull!11222 (dynLambda!1922 (defaultEntry!5871 (v!14539 (underlying!563 thiss!908))) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31168 (_values!5894 (v!14539 (underlying!563 thiss!908))))) (mask!29433 (v!14539 (underlying!563 thiss!908))) (extraKeys!5603 (v!14539 (underlying!563 thiss!908))) (zeroValue!5707 (v!14539 (underlying!563 thiss!908))) (minValue!5707 (v!14539 (underlying!563 thiss!908))) #b00000000000000000000000000000000 (defaultEntry!5871 (v!14539 (underlying!563 thiss!908)))))))

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!1 (array!63681 array!63683 (_ BitVec 32) (_ BitVec 32) V!36675 V!36675 (_ BitVec 32) (_ BitVec 64) Int) Unit!33201)

(assert (=> b!1021203 (= lt!449902 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!1 (_keys!11012 (v!14539 (underlying!563 thiss!908))) (_values!5894 (v!14539 (underlying!563 thiss!908))) (mask!29433 (v!14539 (underlying!563 thiss!908))) (extraKeys!5603 (v!14539 (underlying!563 thiss!908))) (zeroValue!5707 (v!14539 (underlying!563 thiss!908))) (minValue!5707 (v!14539 (underlying!563 thiss!908))) (index!40696 lt!449899) key!697 (defaultEntry!5871 (v!14539 (underlying!563 thiss!908)))))))

(declare-fun lt!449892 () Unit!33201)

(declare-fun lt!449890 () Unit!33201)

(assert (=> b!1021203 (= lt!449892 lt!449890)))

(assert (=> b!1021203 (not (arrayContainsKey!0 (array!63682 (store (arr!30654 (_keys!11012 (v!14539 (underlying!563 thiss!908)))) (index!40696 lt!449899) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31167 (_keys!11012 (v!14539 (underlying!563 thiss!908))))) key!697 #b00000000000000000000000000000000))))

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!63681 (_ BitVec 32) (_ BitVec 64)) Unit!33201)

(assert (=> b!1021203 (= lt!449890 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11012 (v!14539 (underlying!563 thiss!908))) (index!40696 lt!449899) key!697))))

(declare-fun lt!449896 () Unit!33201)

(declare-fun lt!449891 () Unit!33201)

(assert (=> b!1021203 (= lt!449896 lt!449891)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63681 (_ BitVec 32)) Bool)

(assert (=> b!1021203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!63682 (store (arr!30654 (_keys!11012 (v!14539 (underlying!563 thiss!908)))) (index!40696 lt!449899) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31167 (_keys!11012 (v!14539 (underlying!563 thiss!908))))) (mask!29433 (v!14539 (underlying!563 thiss!908))))))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!63681 (_ BitVec 32) (_ BitVec 32)) Unit!33201)

(assert (=> b!1021203 (= lt!449891 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11012 (v!14539 (underlying!563 thiss!908))) (index!40696 lt!449899) (mask!29433 (v!14539 (underlying!563 thiss!908)))))))

(declare-fun lt!449897 () Unit!33201)

(declare-fun lt!449901 () Unit!33201)

(assert (=> b!1021203 (= lt!449897 lt!449901)))

(declare-fun lt!449893 () (_ BitVec 32))

(declare-fun lt!449898 () (_ BitVec 64))

(declare-datatypes ((List!21688 0))(
  ( (Nil!21685) (Cons!21684 (h!22882 (_ BitVec 64)) (t!30693 List!21688)) )
))
(declare-fun lt!449882 () List!21688)

(declare-fun arrayNoDuplicates!0 (array!63681 (_ BitVec 32) List!21688) Bool)

(assert (=> b!1021203 (arrayNoDuplicates!0 (array!63682 (store (arr!30654 (_keys!11012 (v!14539 (underlying!563 thiss!908)))) (index!40696 lt!449899) lt!449898) (size!31167 (_keys!11012 (v!14539 (underlying!563 thiss!908))))) lt!449893 lt!449882)))

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!63681 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21688) Unit!33201)

(assert (=> b!1021203 (= lt!449901 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11012 (v!14539 (underlying!563 thiss!908))) lt!449898 (index!40696 lt!449899) lt!449893 lt!449882))))

(assert (=> b!1021203 (= lt!449882 Nil!21685)))

(assert (=> b!1021203 (= lt!449893 #b00000000000000000000000000000000)))

(assert (=> b!1021203 (= lt!449898 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!449883 () Unit!33201)

(declare-fun lt!449888 () Unit!33201)

(assert (=> b!1021203 (= lt!449883 lt!449888)))

(declare-fun lt!449881 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!63681 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1021203 (= (arrayCountValidKeys!0 (array!63682 (store (arr!30654 (_keys!11012 (v!14539 (underlying!563 thiss!908)))) (index!40696 lt!449899) lt!449881) (size!31167 (_keys!11012 (v!14539 (underlying!563 thiss!908))))) #b00000000000000000000000000000000 (size!31167 (_keys!11012 (v!14539 (underlying!563 thiss!908))))) (bvsub (arrayCountValidKeys!0 (_keys!11012 (v!14539 (underlying!563 thiss!908))) #b00000000000000000000000000000000 (size!31167 (_keys!11012 (v!14539 (underlying!563 thiss!908))))) #b00000000000000000000000000000001))))

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!63681 (_ BitVec 32) (_ BitVec 64)) Unit!33201)

(assert (=> b!1021203 (= lt!449888 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11012 (v!14539 (underlying!563 thiss!908))) (index!40696 lt!449899) lt!449881))))

(assert (=> b!1021203 (= lt!449881 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun e!575127 () tuple2!15564)

(assert (=> b!1021203 (= e!575127 (tuple2!15565 true (_2!7797 lt!449894)))))

(declare-fun bm!43195 () Bool)

(assert (=> bm!43195 (= call!43194 (map!14464 (v!14539 (underlying!563 thiss!908))))))

(declare-fun b!1021204 () Bool)

(declare-fun Unit!33205 () Unit!33201)

(assert (=> b!1021204 (= e!575125 (tuple2!15573 Unit!33205 (LongMapFixedSize!5039 (defaultEntry!5871 (v!14539 (underlying!563 thiss!908))) (mask!29433 (v!14539 (underlying!563 thiss!908))) (extraKeys!5603 (v!14539 (underlying!563 thiss!908))) (zeroValue!5707 (v!14539 (underlying!563 thiss!908))) (minValue!5707 (v!14539 (underlying!563 thiss!908))) (bvsub (_size!2574 (v!14539 (underlying!563 thiss!908))) #b00000000000000000000000000000001) (array!63682 (store (arr!30654 (_keys!11012 (v!14539 (underlying!563 thiss!908)))) (index!40696 lt!449899) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31167 (_keys!11012 (v!14539 (underlying!563 thiss!908))))) (array!63684 (store (arr!30655 (_values!5894 (v!14539 (underlying!563 thiss!908)))) (index!40696 lt!449899) (ValueCellFull!11222 (dynLambda!1922 (defaultEntry!5871 (v!14539 (underlying!563 thiss!908))) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31168 (_values!5894 (v!14539 (underlying!563 thiss!908))))) lt!449903)))))

(declare-fun b!1021205 () Bool)

(declare-fun lt!449887 () Unit!33201)

(declare-fun lt!449886 () Unit!33201)

(assert (=> b!1021205 (= lt!449887 lt!449886)))

(assert (=> b!1021205 (= call!43195 call!43197)))

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!1 (array!63681 array!63683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36675 V!36675 V!36675 Int) Unit!33201)

(assert (=> b!1021205 (= lt!449886 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!1 (_keys!11012 (v!14539 (underlying!563 thiss!908))) (_values!5894 (v!14539 (underlying!563 thiss!908))) (mask!29433 (v!14539 (underlying!563 thiss!908))) (extraKeys!5603 (v!14539 (underlying!563 thiss!908))) lt!449889 (zeroValue!5707 (v!14539 (underlying!563 thiss!908))) lt!449877 (minValue!5707 (v!14539 (underlying!563 thiss!908))) (defaultEntry!5871 (v!14539 (underlying!563 thiss!908)))))))

(assert (=> b!1021205 (= lt!449877 (dynLambda!1922 (defaultEntry!5871 (v!14539 (underlying!563 thiss!908))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1021205 (= lt!449889 (bvand (extraKeys!5603 (v!14539 (underlying!563 thiss!908))) #b00000000000000000000000000000010))))

(assert (=> b!1021205 (= e!575122 (tuple2!15565 true (LongMapFixedSize!5039 (defaultEntry!5871 (v!14539 (underlying!563 thiss!908))) (mask!29433 (v!14539 (underlying!563 thiss!908))) (bvand (extraKeys!5603 (v!14539 (underlying!563 thiss!908))) #b00000000000000000000000000000010) (dynLambda!1922 (defaultEntry!5871 (v!14539 (underlying!563 thiss!908))) #b0000000000000000000000000000000000000000000000000000000000000000) (minValue!5707 (v!14539 (underlying!563 thiss!908))) (_size!2574 (v!14539 (underlying!563 thiss!908))) (_keys!11012 (v!14539 (underlying!563 thiss!908))) (_values!5894 (v!14539 (underlying!563 thiss!908))) (_vacant!2574 (v!14539 (underlying!563 thiss!908))))))))

(declare-fun b!1021206 () Bool)

(assert (=> b!1021206 (= e!575127 (tuple2!15565 false (v!14539 (underlying!563 thiss!908))))))

(declare-fun b!1021207 () Bool)

(assert (=> b!1021207 (= e!575129 (= call!43198 (-!459 call!43194 key!697)))))

(declare-fun b!1021208 () Bool)

(assert (=> b!1021208 (= e!575124 e!575127)))

(declare-fun seekEntry!0 ((_ BitVec 64) array!63681 (_ BitVec 32)) SeekEntryResult!9581)

(assert (=> b!1021208 (= lt!449899 (seekEntry!0 key!697 (_keys!11012 (v!14539 (underlying!563 thiss!908))) (mask!29433 (v!14539 (underlying!563 thiss!908)))))))

(declare-fun c!103505 () Bool)

(assert (=> b!1021208 (= c!103505 ((_ is Found!9581) lt!449899))))

(declare-fun bm!43196 () Bool)

(assert (=> bm!43196 (= call!43200 call!43201)))

(declare-fun bm!43197 () Bool)

(assert (=> bm!43197 (= call!43201 (getCurrentListMap!3835 (_keys!11012 (v!14539 (underlying!563 thiss!908))) (_values!5894 (v!14539 (underlying!563 thiss!908))) (mask!29433 (v!14539 (underlying!563 thiss!908))) (extraKeys!5603 (v!14539 (underlying!563 thiss!908))) (zeroValue!5707 (v!14539 (underlying!563 thiss!908))) (minValue!5707 (v!14539 (underlying!563 thiss!908))) #b00000000000000000000000000000000 (defaultEntry!5871 (v!14539 (underlying!563 thiss!908)))))))

(declare-fun b!1021209 () Bool)

(declare-fun Unit!33206 () Unit!33201)

(assert (=> b!1021209 (= e!575125 (tuple2!15573 Unit!33206 (LongMapFixedSize!5039 (defaultEntry!5871 (v!14539 (underlying!563 thiss!908))) (mask!29433 (v!14539 (underlying!563 thiss!908))) (extraKeys!5603 (v!14539 (underlying!563 thiss!908))) (zeroValue!5707 (v!14539 (underlying!563 thiss!908))) (minValue!5707 (v!14539 (underlying!563 thiss!908))) (bvsub (_size!2574 (v!14539 (underlying!563 thiss!908))) #b00000000000000000000000000000001) (array!63682 (store (arr!30654 (_keys!11012 (v!14539 (underlying!563 thiss!908)))) (index!40696 lt!449899) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31167 (_keys!11012 (v!14539 (underlying!563 thiss!908))))) (array!63684 (store (arr!30655 (_values!5894 (v!14539 (underlying!563 thiss!908)))) (index!40696 lt!449899) (ValueCellFull!11222 (dynLambda!1922 (defaultEntry!5871 (v!14539 (underlying!563 thiss!908))) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31168 (_values!5894 (v!14539 (underlying!563 thiss!908))))) (_vacant!2574 (v!14539 (underlying!563 thiss!908))))))))

(declare-fun bm!43198 () Bool)

(assert (=> bm!43198 (= call!43195 call!43199)))

(assert (= (and d!122359 c!103502) b!1021196))

(assert (= (and d!122359 (not c!103502)) b!1021208))

(assert (= (and b!1021196 c!103504) b!1021205))

(assert (= (and b!1021196 (not c!103504)) b!1021200))

(assert (= (or b!1021205 b!1021200) bm!43194))

(assert (= (or b!1021205 b!1021200) bm!43196))

(assert (= (or b!1021205 b!1021200) bm!43198))

(assert (= (and b!1021208 c!103505) b!1021203))

(assert (= (and b!1021208 (not c!103505)) b!1021206))

(assert (= (and b!1021203 c!103506) b!1021204))

(assert (= (and b!1021203 (not c!103506)) b!1021209))

(assert (= (and b!1021203 c!103507) b!1021201))

(assert (= (and b!1021203 (not c!103507)) b!1021198))

(assert (= (and b!1021201 c!103503) b!1021202))

(assert (= (and b!1021201 (not c!103503)) b!1021195))

(assert (= (or bm!43194 b!1021203) bm!43193))

(assert (= (or bm!43196 b!1021203) bm!43197))

(assert (= (or bm!43198 b!1021203) bm!43191))

(assert (= (and d!122359 res!684301) b!1021197))

(assert (= (and b!1021197 c!103501) b!1021207))

(assert (= (and b!1021197 (not c!103501)) b!1021199))

(assert (= (or b!1021207 b!1021199) bm!43192))

(assert (= (or b!1021207 b!1021199) bm!43195))

(declare-fun b_lambda!15629 () Bool)

(assert (=> (not b_lambda!15629) (not b!1021204)))

(declare-fun t!30690 () Bool)

(declare-fun tb!6827 () Bool)

(assert (=> (and b!1021101 (= (defaultEntry!5871 (v!14539 (underlying!563 thiss!908))) (defaultEntry!5871 (v!14539 (underlying!563 thiss!908)))) t!30690) tb!6827))

(declare-fun result!13969 () Bool)

(assert (=> tb!6827 (= result!13969 tp_is_empty!23851)))

(assert (=> b!1021204 t!30690))

(declare-fun b_and!32299 () Bool)

(assert (= b_and!32293 (and (=> t!30690 result!13969) b_and!32299)))

(declare-fun b_lambda!15631 () Bool)

(assert (=> (not b_lambda!15631) (not b!1021203)))

(assert (=> b!1021203 t!30690))

(declare-fun b_and!32301 () Bool)

(assert (= b_and!32299 (and (=> t!30690 result!13969) b_and!32301)))

(declare-fun b_lambda!15633 () Bool)

(assert (=> (not b_lambda!15633) (not b!1021209)))

(assert (=> b!1021209 t!30690))

(declare-fun b_and!32303 () Bool)

(assert (= b_and!32301 (and (=> t!30690 result!13969) b_and!32303)))

(declare-fun b_lambda!15635 () Bool)

(assert (=> (not b_lambda!15635) (not b!1021205)))

(assert (=> b!1021205 t!30690))

(declare-fun b_and!32305 () Bool)

(assert (= b_and!32303 (and (=> t!30690 result!13969) b_and!32305)))

(declare-fun b_lambda!15637 () Bool)

(assert (=> (not b_lambda!15637) (not b!1021200)))

(declare-fun t!30692 () Bool)

(declare-fun tb!6829 () Bool)

(assert (=> (and b!1021101 (= (defaultEntry!5871 (v!14539 (underlying!563 thiss!908))) (defaultEntry!5871 (v!14539 (underlying!563 thiss!908)))) t!30692) tb!6829))

(declare-fun result!13973 () Bool)

(assert (=> tb!6829 (= result!13973 tp_is_empty!23851)))

(assert (=> b!1021200 t!30692))

(declare-fun b_and!32307 () Bool)

(assert (= b_and!32305 (and (=> t!30692 result!13973) b_and!32307)))

(declare-fun m!940263 () Bool)

(assert (=> b!1021207 m!940263))

(declare-fun m!940265 () Bool)

(assert (=> b!1021209 m!940265))

(declare-fun m!940267 () Bool)

(assert (=> b!1021209 m!940267))

(declare-fun m!940269 () Bool)

(assert (=> b!1021209 m!940269))

(declare-fun m!940271 () Bool)

(assert (=> bm!43197 m!940271))

(declare-fun m!940273 () Bool)

(assert (=> b!1021205 m!940273))

(assert (=> b!1021205 m!940267))

(declare-fun m!940275 () Bool)

(assert (=> bm!43191 m!940275))

(declare-fun m!940277 () Bool)

(assert (=> b!1021201 m!940277))

(declare-fun m!940279 () Bool)

(assert (=> bm!43195 m!940279))

(declare-fun m!940281 () Bool)

(assert (=> b!1021202 m!940281))

(declare-fun m!940283 () Bool)

(assert (=> b!1021208 m!940283))

(declare-fun m!940285 () Bool)

(assert (=> bm!43192 m!940285))

(declare-fun m!940287 () Bool)

(assert (=> bm!43193 m!940287))

(assert (=> b!1021203 m!940267))

(declare-fun m!940289 () Bool)

(assert (=> b!1021203 m!940289))

(declare-fun m!940291 () Bool)

(assert (=> b!1021203 m!940291))

(declare-fun m!940293 () Bool)

(assert (=> b!1021203 m!940293))

(declare-fun m!940295 () Bool)

(assert (=> b!1021203 m!940295))

(assert (=> b!1021203 m!940269))

(declare-fun m!940297 () Bool)

(assert (=> b!1021203 m!940297))

(declare-fun m!940299 () Bool)

(assert (=> b!1021203 m!940299))

(declare-fun m!940301 () Bool)

(assert (=> b!1021203 m!940301))

(declare-fun m!940303 () Bool)

(assert (=> b!1021203 m!940303))

(assert (=> b!1021203 m!940265))

(declare-fun m!940305 () Bool)

(assert (=> b!1021203 m!940305))

(declare-fun m!940307 () Bool)

(assert (=> b!1021203 m!940307))

(declare-fun m!940309 () Bool)

(assert (=> b!1021203 m!940309))

(declare-fun m!940311 () Bool)

(assert (=> b!1021203 m!940311))

(declare-fun m!940313 () Bool)

(assert (=> b!1021203 m!940313))

(declare-fun m!940315 () Bool)

(assert (=> b!1021203 m!940315))

(assert (=> b!1021204 m!940265))

(assert (=> b!1021204 m!940267))

(assert (=> b!1021204 m!940269))

(declare-fun m!940317 () Bool)

(assert (=> b!1021200 m!940317))

(declare-fun m!940319 () Bool)

(assert (=> b!1021200 m!940319))

(declare-fun m!940321 () Bool)

(assert (=> d!122359 m!940321))

(assert (=> d!122359 m!940253))

(assert (=> b!1021098 d!122359))

(declare-fun mapIsEmpty!37197 () Bool)

(declare-fun mapRes!37197 () Bool)

(assert (=> mapIsEmpty!37197 mapRes!37197))

(declare-fun condMapEmpty!37197 () Bool)

(declare-fun mapDefault!37197 () ValueCell!11222)

(assert (=> mapNonEmpty!37188 (= condMapEmpty!37197 (= mapRest!37188 ((as const (Array (_ BitVec 32) ValueCell!11222)) mapDefault!37197)))))

(declare-fun e!575135 () Bool)

(assert (=> mapNonEmpty!37188 (= tp!71422 (and e!575135 mapRes!37197))))

(declare-fun mapNonEmpty!37197 () Bool)

(declare-fun tp!71437 () Bool)

(declare-fun e!575134 () Bool)

(assert (=> mapNonEmpty!37197 (= mapRes!37197 (and tp!71437 e!575134))))

(declare-fun mapKey!37197 () (_ BitVec 32))

(declare-fun mapValue!37197 () ValueCell!11222)

(declare-fun mapRest!37197 () (Array (_ BitVec 32) ValueCell!11222))

(assert (=> mapNonEmpty!37197 (= mapRest!37188 (store mapRest!37197 mapKey!37197 mapValue!37197))))

(declare-fun b!1021218 () Bool)

(assert (=> b!1021218 (= e!575134 tp_is_empty!23851)))

(declare-fun b!1021219 () Bool)

(assert (=> b!1021219 (= e!575135 tp_is_empty!23851)))

(assert (= (and mapNonEmpty!37188 condMapEmpty!37197) mapIsEmpty!37197))

(assert (= (and mapNonEmpty!37188 (not condMapEmpty!37197)) mapNonEmpty!37197))

(assert (= (and mapNonEmpty!37197 ((_ is ValueCellFull!11222) mapValue!37197)) b!1021218))

(assert (= (and mapNonEmpty!37188 ((_ is ValueCellFull!11222) mapDefault!37197)) b!1021219))

(declare-fun m!940323 () Bool)

(assert (=> mapNonEmpty!37197 m!940323))

(declare-fun b_lambda!15639 () Bool)

(assert (= b_lambda!15635 (or (and b!1021101 b_free!20131) b_lambda!15639)))

(declare-fun b_lambda!15641 () Bool)

(assert (= b_lambda!15637 (or (and b!1021101 b_free!20131) b_lambda!15641)))

(declare-fun b_lambda!15643 () Bool)

(assert (= b_lambda!15629 (or (and b!1021101 b_free!20131) b_lambda!15643)))

(declare-fun b_lambda!15645 () Bool)

(assert (= b_lambda!15633 (or (and b!1021101 b_free!20131) b_lambda!15645)))

(declare-fun b_lambda!15647 () Bool)

(assert (= b_lambda!15631 (or (and b!1021101 b_free!20131) b_lambda!15647)))

(check-sat (not bm!43197) (not bm!43195) (not d!122357) b_and!32307 (not d!122351) (not b!1021208) (not b!1021205) (not bm!43193) (not b_lambda!15645) (not b!1021202) (not b!1021203) (not b!1021200) (not d!122345) (not b_lambda!15639) (not d!122355) (not b_lambda!15643) (not bm!43191) (not d!122359) (not bm!43192) (not d!122353) (not b!1021201) (not b_next!20131) (not b_lambda!15647) (not mapNonEmpty!37197) (not b_lambda!15641) (not b!1021207) tp_is_empty!23851)
(check-sat b_and!32307 (not b_next!20131))
