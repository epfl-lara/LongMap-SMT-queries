; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77116 () Bool)

(assert start!77116)

(declare-fun b!900144 () Bool)

(declare-fun b_free!16027 () Bool)

(declare-fun b_next!16027 () Bool)

(assert (=> b!900144 (= b_free!16027 (not b_next!16027))))

(declare-fun tp!56158 () Bool)

(declare-fun b_and!26343 () Bool)

(assert (=> b!900144 (= tp!56158 b_and!26343)))

(declare-fun b!900141 () Bool)

(declare-fun e!503709 () Bool)

(declare-datatypes ((SeekEntryResult!8884 0))(
  ( (MissingZero!8884 (index!37907 (_ BitVec 32))) (Found!8884 (index!37908 (_ BitVec 32))) (Intermediate!8884 (undefined!9696 Bool) (index!37909 (_ BitVec 32)) (x!76597 (_ BitVec 32))) (Undefined!8884) (MissingVacant!8884 (index!37910 (_ BitVec 32))) )
))
(declare-fun lt!406458 () SeekEntryResult!8884)

(declare-datatypes ((array!52791 0))(
  ( (array!52792 (arr!25366 (Array (_ BitVec 32) (_ BitVec 64))) (size!25824 (_ BitVec 32))) )
))
(declare-datatypes ((V!29439 0))(
  ( (V!29440 (val!9228 Int)) )
))
(declare-datatypes ((ValueCell!8696 0))(
  ( (ValueCellFull!8696 (v!11718 V!29439)) (EmptyCell!8696) )
))
(declare-datatypes ((array!52793 0))(
  ( (array!52794 (arr!25367 (Array (_ BitVec 32) ValueCell!8696)) (size!25825 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4408 0))(
  ( (LongMapFixedSize!4409 (defaultEntry!5426 Int) (mask!26221 (_ BitVec 32)) (extraKeys!5146 (_ BitVec 32)) (zeroValue!5250 V!29439) (minValue!5250 V!29439) (_size!2259 (_ BitVec 32)) (_keys!10241 array!52791) (_values!5437 array!52793) (_vacant!2259 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4408)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!900141 (= e!503709 (inRange!0 (index!37908 lt!406458) (mask!26221 thiss!1181)))))

(declare-fun b!900142 () Bool)

(declare-fun e!503706 () Bool)

(declare-fun tp_is_empty!18355 () Bool)

(assert (=> b!900142 (= e!503706 tp_is_empty!18355)))

(declare-fun b!900143 () Bool)

(declare-fun e!503705 () Bool)

(assert (=> b!900143 (= e!503705 tp_is_empty!18355)))

(declare-fun e!503702 () Bool)

(declare-fun e!503708 () Bool)

(declare-fun array_inv!19958 (array!52791) Bool)

(declare-fun array_inv!19959 (array!52793) Bool)

(assert (=> b!900144 (= e!503708 (and tp!56158 tp_is_empty!18355 (array_inv!19958 (_keys!10241 thiss!1181)) (array_inv!19959 (_values!5437 thiss!1181)) e!503702))))

(declare-fun b!900145 () Bool)

(declare-fun res!607862 () Bool)

(declare-fun e!503707 () Bool)

(assert (=> b!900145 (=> (not res!607862) (not e!503707))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!900145 (= res!607862 (not (= key!785 (bvneg key!785))))))

(declare-fun res!607860 () Bool)

(assert (=> start!77116 (=> (not res!607860) (not e!503707))))

(declare-fun valid!1707 (LongMapFixedSize!4408) Bool)

(assert (=> start!77116 (= res!607860 (valid!1707 thiss!1181))))

(assert (=> start!77116 e!503707))

(assert (=> start!77116 e!503708))

(assert (=> start!77116 true))

(declare-fun b!900146 () Bool)

(declare-fun e!503703 () Bool)

(assert (=> b!900146 (= e!503703 (or (not (= (size!25825 (_values!5437 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26221 thiss!1181)))) (not (= (size!25824 (_keys!10241 thiss!1181)) (size!25825 (_values!5437 thiss!1181)))) (bvsge (mask!26221 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!900147 () Bool)

(declare-fun e!503710 () Bool)

(assert (=> b!900147 (= e!503707 (not e!503710))))

(declare-fun res!607864 () Bool)

(assert (=> b!900147 (=> res!607864 e!503710)))

(get-info :version)

(assert (=> b!900147 (= res!607864 (not ((_ is Found!8884) lt!406458)))))

(assert (=> b!900147 e!503709))

(declare-fun res!607861 () Bool)

(assert (=> b!900147 (=> res!607861 e!503709)))

(assert (=> b!900147 (= res!607861 (not ((_ is Found!8884) lt!406458)))))

(declare-datatypes ((Unit!30550 0))(
  ( (Unit!30551) )
))
(declare-fun lt!406455 () Unit!30550)

(declare-fun lemmaSeekEntryGivesInRangeIndex!104 (array!52791 array!52793 (_ BitVec 32) (_ BitVec 32) V!29439 V!29439 (_ BitVec 64)) Unit!30550)

(assert (=> b!900147 (= lt!406455 (lemmaSeekEntryGivesInRangeIndex!104 (_keys!10241 thiss!1181) (_values!5437 thiss!1181) (mask!26221 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52791 (_ BitVec 32)) SeekEntryResult!8884)

(assert (=> b!900147 (= lt!406458 (seekEntry!0 key!785 (_keys!10241 thiss!1181) (mask!26221 thiss!1181)))))

(declare-fun b!900148 () Bool)

(declare-fun mapRes!29195 () Bool)

(assert (=> b!900148 (= e!503702 (and e!503706 mapRes!29195))))

(declare-fun condMapEmpty!29195 () Bool)

(declare-fun mapDefault!29195 () ValueCell!8696)

(assert (=> b!900148 (= condMapEmpty!29195 (= (arr!25367 (_values!5437 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8696)) mapDefault!29195)))))

(declare-fun mapNonEmpty!29195 () Bool)

(declare-fun tp!56159 () Bool)

(assert (=> mapNonEmpty!29195 (= mapRes!29195 (and tp!56159 e!503705))))

(declare-fun mapRest!29195 () (Array (_ BitVec 32) ValueCell!8696))

(declare-fun mapKey!29195 () (_ BitVec 32))

(declare-fun mapValue!29195 () ValueCell!8696)

(assert (=> mapNonEmpty!29195 (= (arr!25367 (_values!5437 thiss!1181)) (store mapRest!29195 mapKey!29195 mapValue!29195))))

(declare-fun mapIsEmpty!29195 () Bool)

(assert (=> mapIsEmpty!29195 mapRes!29195))

(declare-fun b!900149 () Bool)

(assert (=> b!900149 (= e!503710 e!503703)))

(declare-fun res!607863 () Bool)

(assert (=> b!900149 (=> res!607863 e!503703)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!900149 (= res!607863 (not (validMask!0 (mask!26221 thiss!1181))))))

(declare-datatypes ((tuple2!11958 0))(
  ( (tuple2!11959 (_1!5990 (_ BitVec 64)) (_2!5990 V!29439)) )
))
(declare-datatypes ((List!17796 0))(
  ( (Nil!17793) (Cons!17792 (h!18942 tuple2!11958) (t!25133 List!17796)) )
))
(declare-datatypes ((ListLongMap!10657 0))(
  ( (ListLongMap!10658 (toList!5344 List!17796)) )
))
(declare-fun contains!4389 (ListLongMap!10657 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2616 (array!52791 array!52793 (_ BitVec 32) (_ BitVec 32) V!29439 V!29439 (_ BitVec 32) Int) ListLongMap!10657)

(assert (=> b!900149 (contains!4389 (getCurrentListMap!2616 (_keys!10241 thiss!1181) (_values!5437 thiss!1181) (mask!26221 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181)) (select (arr!25366 (_keys!10241 thiss!1181)) (index!37908 lt!406458)))))

(declare-fun lt!406457 () Unit!30550)

(declare-fun lemmaValidKeyInArrayIsInListMap!246 (array!52791 array!52793 (_ BitVec 32) (_ BitVec 32) V!29439 V!29439 (_ BitVec 32) Int) Unit!30550)

(assert (=> b!900149 (= lt!406457 (lemmaValidKeyInArrayIsInListMap!246 (_keys!10241 thiss!1181) (_values!5437 thiss!1181) (mask!26221 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) (index!37908 lt!406458) (defaultEntry!5426 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!900149 (arrayContainsKey!0 (_keys!10241 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406456 () Unit!30550)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52791 (_ BitVec 64) (_ BitVec 32)) Unit!30550)

(assert (=> b!900149 (= lt!406456 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10241 thiss!1181) key!785 (index!37908 lt!406458)))))

(assert (= (and start!77116 res!607860) b!900145))

(assert (= (and b!900145 res!607862) b!900147))

(assert (= (and b!900147 (not res!607861)) b!900141))

(assert (= (and b!900147 (not res!607864)) b!900149))

(assert (= (and b!900149 (not res!607863)) b!900146))

(assert (= (and b!900148 condMapEmpty!29195) mapIsEmpty!29195))

(assert (= (and b!900148 (not condMapEmpty!29195)) mapNonEmpty!29195))

(assert (= (and mapNonEmpty!29195 ((_ is ValueCellFull!8696) mapValue!29195)) b!900143))

(assert (= (and b!900148 ((_ is ValueCellFull!8696) mapDefault!29195)) b!900142))

(assert (= b!900144 b!900148))

(assert (= start!77116 b!900144))

(declare-fun m!837031 () Bool)

(assert (=> b!900141 m!837031))

(declare-fun m!837033 () Bool)

(assert (=> mapNonEmpty!29195 m!837033))

(declare-fun m!837035 () Bool)

(assert (=> start!77116 m!837035))

(declare-fun m!837037 () Bool)

(assert (=> b!900144 m!837037))

(declare-fun m!837039 () Bool)

(assert (=> b!900144 m!837039))

(declare-fun m!837041 () Bool)

(assert (=> b!900149 m!837041))

(declare-fun m!837043 () Bool)

(assert (=> b!900149 m!837043))

(declare-fun m!837045 () Bool)

(assert (=> b!900149 m!837045))

(declare-fun m!837047 () Bool)

(assert (=> b!900149 m!837047))

(declare-fun m!837049 () Bool)

(assert (=> b!900149 m!837049))

(declare-fun m!837051 () Bool)

(assert (=> b!900149 m!837051))

(assert (=> b!900149 m!837045))

(declare-fun m!837053 () Bool)

(assert (=> b!900149 m!837053))

(assert (=> b!900149 m!837043))

(declare-fun m!837055 () Bool)

(assert (=> b!900147 m!837055))

(declare-fun m!837057 () Bool)

(assert (=> b!900147 m!837057))

(check-sat (not b!900149) (not b!900141) (not mapNonEmpty!29195) (not b!900147) b_and!26343 (not start!77116) tp_is_empty!18355 (not b!900144) (not b_next!16027))
(check-sat b_and!26343 (not b_next!16027))
(get-model)

(declare-fun d!111781 () Bool)

(assert (=> d!111781 (arrayContainsKey!0 (_keys!10241 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406485 () Unit!30550)

(declare-fun choose!13 (array!52791 (_ BitVec 64) (_ BitVec 32)) Unit!30550)

(assert (=> d!111781 (= lt!406485 (choose!13 (_keys!10241 thiss!1181) key!785 (index!37908 lt!406458)))))

(assert (=> d!111781 (bvsge (index!37908 lt!406458) #b00000000000000000000000000000000)))

(assert (=> d!111781 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10241 thiss!1181) key!785 (index!37908 lt!406458)) lt!406485)))

(declare-fun bs!25261 () Bool)

(assert (= bs!25261 d!111781))

(assert (=> bs!25261 m!837051))

(declare-fun m!837115 () Bool)

(assert (=> bs!25261 m!837115))

(assert (=> b!900149 d!111781))

(declare-fun d!111783 () Bool)

(assert (=> d!111783 (= (validMask!0 (mask!26221 thiss!1181)) (and (or (= (mask!26221 thiss!1181) #b00000000000000000000000000000111) (= (mask!26221 thiss!1181) #b00000000000000000000000000001111) (= (mask!26221 thiss!1181) #b00000000000000000000000000011111) (= (mask!26221 thiss!1181) #b00000000000000000000000000111111) (= (mask!26221 thiss!1181) #b00000000000000000000000001111111) (= (mask!26221 thiss!1181) #b00000000000000000000000011111111) (= (mask!26221 thiss!1181) #b00000000000000000000000111111111) (= (mask!26221 thiss!1181) #b00000000000000000000001111111111) (= (mask!26221 thiss!1181) #b00000000000000000000011111111111) (= (mask!26221 thiss!1181) #b00000000000000000000111111111111) (= (mask!26221 thiss!1181) #b00000000000000000001111111111111) (= (mask!26221 thiss!1181) #b00000000000000000011111111111111) (= (mask!26221 thiss!1181) #b00000000000000000111111111111111) (= (mask!26221 thiss!1181) #b00000000000000001111111111111111) (= (mask!26221 thiss!1181) #b00000000000000011111111111111111) (= (mask!26221 thiss!1181) #b00000000000000111111111111111111) (= (mask!26221 thiss!1181) #b00000000000001111111111111111111) (= (mask!26221 thiss!1181) #b00000000000011111111111111111111) (= (mask!26221 thiss!1181) #b00000000000111111111111111111111) (= (mask!26221 thiss!1181) #b00000000001111111111111111111111) (= (mask!26221 thiss!1181) #b00000000011111111111111111111111) (= (mask!26221 thiss!1181) #b00000000111111111111111111111111) (= (mask!26221 thiss!1181) #b00000001111111111111111111111111) (= (mask!26221 thiss!1181) #b00000011111111111111111111111111) (= (mask!26221 thiss!1181) #b00000111111111111111111111111111) (= (mask!26221 thiss!1181) #b00001111111111111111111111111111) (= (mask!26221 thiss!1181) #b00011111111111111111111111111111) (= (mask!26221 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26221 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!900149 d!111783))

(declare-fun d!111785 () Bool)

(declare-fun res!607899 () Bool)

(declare-fun e!503769 () Bool)

(assert (=> d!111785 (=> res!607899 e!503769)))

(assert (=> d!111785 (= res!607899 (= (select (arr!25366 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111785 (= (arrayContainsKey!0 (_keys!10241 thiss!1181) key!785 #b00000000000000000000000000000000) e!503769)))

(declare-fun b!900208 () Bool)

(declare-fun e!503770 () Bool)

(assert (=> b!900208 (= e!503769 e!503770)))

(declare-fun res!607900 () Bool)

(assert (=> b!900208 (=> (not res!607900) (not e!503770))))

(assert (=> b!900208 (= res!607900 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25824 (_keys!10241 thiss!1181))))))

(declare-fun b!900209 () Bool)

(assert (=> b!900209 (= e!503770 (arrayContainsKey!0 (_keys!10241 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111785 (not res!607899)) b!900208))

(assert (= (and b!900208 res!607900) b!900209))

(declare-fun m!837117 () Bool)

(assert (=> d!111785 m!837117))

(declare-fun m!837119 () Bool)

(assert (=> b!900209 m!837119))

(assert (=> b!900149 d!111785))

(declare-fun b!900252 () Bool)

(declare-fun e!503801 () Bool)

(declare-fun call!39982 () Bool)

(assert (=> b!900252 (= e!503801 (not call!39982))))

(declare-fun b!900253 () Bool)

(declare-fun res!607921 () Bool)

(declare-fun e!503798 () Bool)

(assert (=> b!900253 (=> (not res!607921) (not e!503798))))

(declare-fun e!503807 () Bool)

(assert (=> b!900253 (= res!607921 e!503807)))

(declare-fun c!95408 () Bool)

(assert (=> b!900253 (= c!95408 (not (= (bvand (extraKeys!5146 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!900254 () Bool)

(declare-fun c!95412 () Bool)

(assert (=> b!900254 (= c!95412 (and (not (= (bvand (extraKeys!5146 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5146 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!503800 () ListLongMap!10657)

(declare-fun e!503797 () ListLongMap!10657)

(assert (=> b!900254 (= e!503800 e!503797)))

(declare-fun b!900255 () Bool)

(declare-fun e!503809 () ListLongMap!10657)

(declare-fun call!39985 () ListLongMap!10657)

(declare-fun +!2603 (ListLongMap!10657 tuple2!11958) ListLongMap!10657)

(assert (=> b!900255 (= e!503809 (+!2603 call!39985 (tuple2!11959 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5250 thiss!1181))))))

(declare-fun bm!39979 () Bool)

(declare-fun call!39987 () ListLongMap!10657)

(declare-fun call!39984 () ListLongMap!10657)

(assert (=> bm!39979 (= call!39987 call!39984)))

(declare-fun b!900256 () Bool)

(declare-fun e!503806 () Bool)

(declare-fun e!503805 () Bool)

(assert (=> b!900256 (= e!503806 e!503805)))

(declare-fun res!607926 () Bool)

(assert (=> b!900256 (=> (not res!607926) (not e!503805))))

(declare-fun lt!406539 () ListLongMap!10657)

(assert (=> b!900256 (= res!607926 (contains!4389 lt!406539 (select (arr!25366 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!900256 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25824 (_keys!10241 thiss!1181))))))

(declare-fun b!900257 () Bool)

(declare-fun apply!408 (ListLongMap!10657 (_ BitVec 64)) V!29439)

(declare-fun get!13355 (ValueCell!8696 V!29439) V!29439)

(declare-fun dynLambda!1323 (Int (_ BitVec 64)) V!29439)

(assert (=> b!900257 (= e!503805 (= (apply!408 lt!406539 (select (arr!25366 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000)) (get!13355 (select (arr!25367 (_values!5437 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1323 (defaultEntry!5426 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!900257 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25825 (_values!5437 thiss!1181))))))

(assert (=> b!900257 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25824 (_keys!10241 thiss!1181))))))

(declare-fun b!900258 () Bool)

(declare-fun e!503799 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!900258 (= e!503799 (validKeyInArray!0 (select (arr!25366 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900259 () Bool)

(assert (=> b!900259 (= e!503797 call!39987)))

(declare-fun b!900260 () Bool)

(declare-fun call!39988 () ListLongMap!10657)

(assert (=> b!900260 (= e!503797 call!39988)))

(declare-fun b!900261 () Bool)

(declare-fun call!39983 () Bool)

(assert (=> b!900261 (= e!503807 (not call!39983))))

(declare-fun b!900262 () Bool)

(declare-fun e!503802 () Unit!30550)

(declare-fun lt!406531 () Unit!30550)

(assert (=> b!900262 (= e!503802 lt!406531)))

(declare-fun lt!406544 () ListLongMap!10657)

(declare-fun getCurrentListMapNoExtraKeys!3324 (array!52791 array!52793 (_ BitVec 32) (_ BitVec 32) V!29439 V!29439 (_ BitVec 32) Int) ListLongMap!10657)

(assert (=> b!900262 (= lt!406544 (getCurrentListMapNoExtraKeys!3324 (_keys!10241 thiss!1181) (_values!5437 thiss!1181) (mask!26221 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181)))))

(declare-fun lt!406549 () (_ BitVec 64))

(assert (=> b!900262 (= lt!406549 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406545 () (_ BitVec 64))

(assert (=> b!900262 (= lt!406545 (select (arr!25366 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406548 () Unit!30550)

(declare-fun addStillContains!334 (ListLongMap!10657 (_ BitVec 64) V!29439 (_ BitVec 64)) Unit!30550)

(assert (=> b!900262 (= lt!406548 (addStillContains!334 lt!406544 lt!406549 (zeroValue!5250 thiss!1181) lt!406545))))

(assert (=> b!900262 (contains!4389 (+!2603 lt!406544 (tuple2!11959 lt!406549 (zeroValue!5250 thiss!1181))) lt!406545)))

(declare-fun lt!406546 () Unit!30550)

(assert (=> b!900262 (= lt!406546 lt!406548)))

(declare-fun lt!406537 () ListLongMap!10657)

(assert (=> b!900262 (= lt!406537 (getCurrentListMapNoExtraKeys!3324 (_keys!10241 thiss!1181) (_values!5437 thiss!1181) (mask!26221 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181)))))

(declare-fun lt!406533 () (_ BitVec 64))

(assert (=> b!900262 (= lt!406533 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406541 () (_ BitVec 64))

(assert (=> b!900262 (= lt!406541 (select (arr!25366 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406540 () Unit!30550)

(declare-fun addApplyDifferent!334 (ListLongMap!10657 (_ BitVec 64) V!29439 (_ BitVec 64)) Unit!30550)

(assert (=> b!900262 (= lt!406540 (addApplyDifferent!334 lt!406537 lt!406533 (minValue!5250 thiss!1181) lt!406541))))

(assert (=> b!900262 (= (apply!408 (+!2603 lt!406537 (tuple2!11959 lt!406533 (minValue!5250 thiss!1181))) lt!406541) (apply!408 lt!406537 lt!406541))))

(declare-fun lt!406530 () Unit!30550)

(assert (=> b!900262 (= lt!406530 lt!406540)))

(declare-fun lt!406547 () ListLongMap!10657)

(assert (=> b!900262 (= lt!406547 (getCurrentListMapNoExtraKeys!3324 (_keys!10241 thiss!1181) (_values!5437 thiss!1181) (mask!26221 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181)))))

(declare-fun lt!406543 () (_ BitVec 64))

(assert (=> b!900262 (= lt!406543 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406534 () (_ BitVec 64))

(assert (=> b!900262 (= lt!406534 (select (arr!25366 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406551 () Unit!30550)

(assert (=> b!900262 (= lt!406551 (addApplyDifferent!334 lt!406547 lt!406543 (zeroValue!5250 thiss!1181) lt!406534))))

(assert (=> b!900262 (= (apply!408 (+!2603 lt!406547 (tuple2!11959 lt!406543 (zeroValue!5250 thiss!1181))) lt!406534) (apply!408 lt!406547 lt!406534))))

(declare-fun lt!406538 () Unit!30550)

(assert (=> b!900262 (= lt!406538 lt!406551)))

(declare-fun lt!406535 () ListLongMap!10657)

(assert (=> b!900262 (= lt!406535 (getCurrentListMapNoExtraKeys!3324 (_keys!10241 thiss!1181) (_values!5437 thiss!1181) (mask!26221 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181)))))

(declare-fun lt!406532 () (_ BitVec 64))

(assert (=> b!900262 (= lt!406532 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406542 () (_ BitVec 64))

(assert (=> b!900262 (= lt!406542 (select (arr!25366 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900262 (= lt!406531 (addApplyDifferent!334 lt!406535 lt!406532 (minValue!5250 thiss!1181) lt!406542))))

(assert (=> b!900262 (= (apply!408 (+!2603 lt!406535 (tuple2!11959 lt!406532 (minValue!5250 thiss!1181))) lt!406542) (apply!408 lt!406535 lt!406542))))

(declare-fun d!111787 () Bool)

(assert (=> d!111787 e!503798))

(declare-fun res!607919 () Bool)

(assert (=> d!111787 (=> (not res!607919) (not e!503798))))

(assert (=> d!111787 (= res!607919 (or (bvsge #b00000000000000000000000000000000 (size!25824 (_keys!10241 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25824 (_keys!10241 thiss!1181))))))))

(declare-fun lt!406550 () ListLongMap!10657)

(assert (=> d!111787 (= lt!406539 lt!406550)))

(declare-fun lt!406536 () Unit!30550)

(assert (=> d!111787 (= lt!406536 e!503802)))

(declare-fun c!95411 () Bool)

(assert (=> d!111787 (= c!95411 e!503799)))

(declare-fun res!607925 () Bool)

(assert (=> d!111787 (=> (not res!607925) (not e!503799))))

(assert (=> d!111787 (= res!607925 (bvslt #b00000000000000000000000000000000 (size!25824 (_keys!10241 thiss!1181))))))

(assert (=> d!111787 (= lt!406550 e!503809)))

(declare-fun c!95413 () Bool)

(assert (=> d!111787 (= c!95413 (and (not (= (bvand (extraKeys!5146 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5146 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111787 (validMask!0 (mask!26221 thiss!1181))))

(assert (=> d!111787 (= (getCurrentListMap!2616 (_keys!10241 thiss!1181) (_values!5437 thiss!1181) (mask!26221 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181)) lt!406539)))

(declare-fun b!900263 () Bool)

(assert (=> b!900263 (= e!503798 e!503801)))

(declare-fun c!95410 () Bool)

(assert (=> b!900263 (= c!95410 (not (= (bvand (extraKeys!5146 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!900264 () Bool)

(declare-fun e!503804 () Bool)

(assert (=> b!900264 (= e!503804 (validKeyInArray!0 (select (arr!25366 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39980 () Bool)

(assert (=> bm!39980 (= call!39983 (contains!4389 lt!406539 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!39981 () Bool)

(declare-fun call!39986 () ListLongMap!10657)

(assert (=> bm!39981 (= call!39984 call!39986)))

(declare-fun b!900265 () Bool)

(declare-fun e!503808 () Bool)

(assert (=> b!900265 (= e!503808 (= (apply!408 lt!406539 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5250 thiss!1181)))))

(declare-fun bm!39982 () Bool)

(assert (=> bm!39982 (= call!39986 (getCurrentListMapNoExtraKeys!3324 (_keys!10241 thiss!1181) (_values!5437 thiss!1181) (mask!26221 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181)))))

(declare-fun bm!39983 () Bool)

(assert (=> bm!39983 (= call!39982 (contains!4389 lt!406539 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900266 () Bool)

(declare-fun Unit!30554 () Unit!30550)

(assert (=> b!900266 (= e!503802 Unit!30554)))

(declare-fun b!900267 () Bool)

(assert (=> b!900267 (= e!503807 e!503808)))

(declare-fun res!607923 () Bool)

(assert (=> b!900267 (= res!607923 call!39983)))

(assert (=> b!900267 (=> (not res!607923) (not e!503808))))

(declare-fun b!900268 () Bool)

(assert (=> b!900268 (= e!503809 e!503800)))

(declare-fun c!95409 () Bool)

(assert (=> b!900268 (= c!95409 (and (not (= (bvand (extraKeys!5146 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5146 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!900269 () Bool)

(declare-fun e!503803 () Bool)

(assert (=> b!900269 (= e!503801 e!503803)))

(declare-fun res!607922 () Bool)

(assert (=> b!900269 (= res!607922 call!39982)))

(assert (=> b!900269 (=> (not res!607922) (not e!503803))))

(declare-fun b!900270 () Bool)

(declare-fun res!607927 () Bool)

(assert (=> b!900270 (=> (not res!607927) (not e!503798))))

(assert (=> b!900270 (= res!607927 e!503806)))

(declare-fun res!607924 () Bool)

(assert (=> b!900270 (=> res!607924 e!503806)))

(assert (=> b!900270 (= res!607924 (not e!503804))))

(declare-fun res!607920 () Bool)

(assert (=> b!900270 (=> (not res!607920) (not e!503804))))

(assert (=> b!900270 (= res!607920 (bvslt #b00000000000000000000000000000000 (size!25824 (_keys!10241 thiss!1181))))))

(declare-fun bm!39984 () Bool)

(assert (=> bm!39984 (= call!39988 call!39985)))

(declare-fun bm!39985 () Bool)

(assert (=> bm!39985 (= call!39985 (+!2603 (ite c!95413 call!39986 (ite c!95409 call!39984 call!39987)) (ite (or c!95413 c!95409) (tuple2!11959 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5250 thiss!1181)) (tuple2!11959 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5250 thiss!1181)))))))

(declare-fun b!900271 () Bool)

(assert (=> b!900271 (= e!503803 (= (apply!408 lt!406539 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5250 thiss!1181)))))

(declare-fun b!900272 () Bool)

(assert (=> b!900272 (= e!503800 call!39988)))

(assert (= (and d!111787 c!95413) b!900255))

(assert (= (and d!111787 (not c!95413)) b!900268))

(assert (= (and b!900268 c!95409) b!900272))

(assert (= (and b!900268 (not c!95409)) b!900254))

(assert (= (and b!900254 c!95412) b!900260))

(assert (= (and b!900254 (not c!95412)) b!900259))

(assert (= (or b!900260 b!900259) bm!39979))

(assert (= (or b!900272 bm!39979) bm!39981))

(assert (= (or b!900272 b!900260) bm!39984))

(assert (= (or b!900255 bm!39981) bm!39982))

(assert (= (or b!900255 bm!39984) bm!39985))

(assert (= (and d!111787 res!607925) b!900258))

(assert (= (and d!111787 c!95411) b!900262))

(assert (= (and d!111787 (not c!95411)) b!900266))

(assert (= (and d!111787 res!607919) b!900270))

(assert (= (and b!900270 res!607920) b!900264))

(assert (= (and b!900270 (not res!607924)) b!900256))

(assert (= (and b!900256 res!607926) b!900257))

(assert (= (and b!900270 res!607927) b!900253))

(assert (= (and b!900253 c!95408) b!900267))

(assert (= (and b!900253 (not c!95408)) b!900261))

(assert (= (and b!900267 res!607923) b!900265))

(assert (= (or b!900267 b!900261) bm!39980))

(assert (= (and b!900253 res!607921) b!900263))

(assert (= (and b!900263 c!95410) b!900269))

(assert (= (and b!900263 (not c!95410)) b!900252))

(assert (= (and b!900269 res!607922) b!900271))

(assert (= (or b!900269 b!900252) bm!39983))

(declare-fun b_lambda!13001 () Bool)

(assert (=> (not b_lambda!13001) (not b!900257)))

(declare-fun t!25136 () Bool)

(declare-fun tb!5189 () Bool)

(assert (=> (and b!900144 (= (defaultEntry!5426 thiss!1181) (defaultEntry!5426 thiss!1181)) t!25136) tb!5189))

(declare-fun result!10155 () Bool)

(assert (=> tb!5189 (= result!10155 tp_is_empty!18355)))

(assert (=> b!900257 t!25136))

(declare-fun b_and!26349 () Bool)

(assert (= b_and!26343 (and (=> t!25136 result!10155) b_and!26349)))

(declare-fun m!837121 () Bool)

(assert (=> bm!39983 m!837121))

(assert (=> d!111787 m!837053))

(declare-fun m!837123 () Bool)

(assert (=> b!900265 m!837123))

(declare-fun m!837125 () Bool)

(assert (=> b!900262 m!837125))

(declare-fun m!837127 () Bool)

(assert (=> b!900262 m!837127))

(declare-fun m!837129 () Bool)

(assert (=> b!900262 m!837129))

(declare-fun m!837131 () Bool)

(assert (=> b!900262 m!837131))

(declare-fun m!837133 () Bool)

(assert (=> b!900262 m!837133))

(assert (=> b!900262 m!837127))

(declare-fun m!837135 () Bool)

(assert (=> b!900262 m!837135))

(declare-fun m!837137 () Bool)

(assert (=> b!900262 m!837137))

(declare-fun m!837139 () Bool)

(assert (=> b!900262 m!837139))

(declare-fun m!837141 () Bool)

(assert (=> b!900262 m!837141))

(declare-fun m!837143 () Bool)

(assert (=> b!900262 m!837143))

(declare-fun m!837145 () Bool)

(assert (=> b!900262 m!837145))

(assert (=> b!900262 m!837131))

(declare-fun m!837147 () Bool)

(assert (=> b!900262 m!837147))

(assert (=> b!900262 m!837137))

(assert (=> b!900262 m!837117))

(declare-fun m!837149 () Bool)

(assert (=> b!900262 m!837149))

(declare-fun m!837151 () Bool)

(assert (=> b!900262 m!837151))

(declare-fun m!837153 () Bool)

(assert (=> b!900262 m!837153))

(assert (=> b!900262 m!837143))

(declare-fun m!837155 () Bool)

(assert (=> b!900262 m!837155))

(assert (=> b!900264 m!837117))

(assert (=> b!900264 m!837117))

(declare-fun m!837157 () Bool)

(assert (=> b!900264 m!837157))

(declare-fun m!837159 () Bool)

(assert (=> bm!39985 m!837159))

(declare-fun m!837161 () Bool)

(assert (=> b!900255 m!837161))

(assert (=> b!900258 m!837117))

(assert (=> b!900258 m!837117))

(assert (=> b!900258 m!837157))

(declare-fun m!837163 () Bool)

(assert (=> b!900257 m!837163))

(declare-fun m!837165 () Bool)

(assert (=> b!900257 m!837165))

(declare-fun m!837167 () Bool)

(assert (=> b!900257 m!837167))

(assert (=> b!900257 m!837117))

(declare-fun m!837169 () Bool)

(assert (=> b!900257 m!837169))

(assert (=> b!900257 m!837163))

(assert (=> b!900257 m!837117))

(assert (=> b!900257 m!837165))

(assert (=> b!900256 m!837117))

(assert (=> b!900256 m!837117))

(declare-fun m!837171 () Bool)

(assert (=> b!900256 m!837171))

(declare-fun m!837173 () Bool)

(assert (=> bm!39980 m!837173))

(declare-fun m!837175 () Bool)

(assert (=> b!900271 m!837175))

(assert (=> bm!39982 m!837147))

(assert (=> b!900149 d!111787))

(declare-fun d!111789 () Bool)

(declare-fun e!503814 () Bool)

(assert (=> d!111789 e!503814))

(declare-fun res!607930 () Bool)

(assert (=> d!111789 (=> res!607930 e!503814)))

(declare-fun lt!406562 () Bool)

(assert (=> d!111789 (= res!607930 (not lt!406562))))

(declare-fun lt!406560 () Bool)

(assert (=> d!111789 (= lt!406562 lt!406560)))

(declare-fun lt!406563 () Unit!30550)

(declare-fun e!503815 () Unit!30550)

(assert (=> d!111789 (= lt!406563 e!503815)))

(declare-fun c!95416 () Bool)

(assert (=> d!111789 (= c!95416 lt!406560)))

(declare-fun containsKey!429 (List!17796 (_ BitVec 64)) Bool)

(assert (=> d!111789 (= lt!406560 (containsKey!429 (toList!5344 (getCurrentListMap!2616 (_keys!10241 thiss!1181) (_values!5437 thiss!1181) (mask!26221 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181))) (select (arr!25366 (_keys!10241 thiss!1181)) (index!37908 lt!406458))))))

(assert (=> d!111789 (= (contains!4389 (getCurrentListMap!2616 (_keys!10241 thiss!1181) (_values!5437 thiss!1181) (mask!26221 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181)) (select (arr!25366 (_keys!10241 thiss!1181)) (index!37908 lt!406458))) lt!406562)))

(declare-fun b!900281 () Bool)

(declare-fun lt!406561 () Unit!30550)

(assert (=> b!900281 (= e!503815 lt!406561)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!323 (List!17796 (_ BitVec 64)) Unit!30550)

(assert (=> b!900281 (= lt!406561 (lemmaContainsKeyImpliesGetValueByKeyDefined!323 (toList!5344 (getCurrentListMap!2616 (_keys!10241 thiss!1181) (_values!5437 thiss!1181) (mask!26221 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181))) (select (arr!25366 (_keys!10241 thiss!1181)) (index!37908 lt!406458))))))

(declare-datatypes ((Option!462 0))(
  ( (Some!461 (v!11721 V!29439)) (None!460) )
))
(declare-fun isDefined!331 (Option!462) Bool)

(declare-fun getValueByKey!456 (List!17796 (_ BitVec 64)) Option!462)

(assert (=> b!900281 (isDefined!331 (getValueByKey!456 (toList!5344 (getCurrentListMap!2616 (_keys!10241 thiss!1181) (_values!5437 thiss!1181) (mask!26221 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181))) (select (arr!25366 (_keys!10241 thiss!1181)) (index!37908 lt!406458))))))

(declare-fun b!900282 () Bool)

(declare-fun Unit!30555 () Unit!30550)

(assert (=> b!900282 (= e!503815 Unit!30555)))

(declare-fun b!900283 () Bool)

(assert (=> b!900283 (= e!503814 (isDefined!331 (getValueByKey!456 (toList!5344 (getCurrentListMap!2616 (_keys!10241 thiss!1181) (_values!5437 thiss!1181) (mask!26221 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181))) (select (arr!25366 (_keys!10241 thiss!1181)) (index!37908 lt!406458)))))))

(assert (= (and d!111789 c!95416) b!900281))

(assert (= (and d!111789 (not c!95416)) b!900282))

(assert (= (and d!111789 (not res!607930)) b!900283))

(assert (=> d!111789 m!837045))

(declare-fun m!837177 () Bool)

(assert (=> d!111789 m!837177))

(assert (=> b!900281 m!837045))

(declare-fun m!837179 () Bool)

(assert (=> b!900281 m!837179))

(assert (=> b!900281 m!837045))

(declare-fun m!837181 () Bool)

(assert (=> b!900281 m!837181))

(assert (=> b!900281 m!837181))

(declare-fun m!837183 () Bool)

(assert (=> b!900281 m!837183))

(assert (=> b!900283 m!837045))

(assert (=> b!900283 m!837181))

(assert (=> b!900283 m!837181))

(assert (=> b!900283 m!837183))

(assert (=> b!900149 d!111789))

(declare-fun d!111791 () Bool)

(declare-fun e!503818 () Bool)

(assert (=> d!111791 e!503818))

(declare-fun res!607933 () Bool)

(assert (=> d!111791 (=> (not res!607933) (not e!503818))))

(assert (=> d!111791 (= res!607933 (and (bvsge (index!37908 lt!406458) #b00000000000000000000000000000000) (bvslt (index!37908 lt!406458) (size!25824 (_keys!10241 thiss!1181)))))))

(declare-fun lt!406566 () Unit!30550)

(declare-fun choose!1506 (array!52791 array!52793 (_ BitVec 32) (_ BitVec 32) V!29439 V!29439 (_ BitVec 32) Int) Unit!30550)

(assert (=> d!111791 (= lt!406566 (choose!1506 (_keys!10241 thiss!1181) (_values!5437 thiss!1181) (mask!26221 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) (index!37908 lt!406458) (defaultEntry!5426 thiss!1181)))))

(assert (=> d!111791 (validMask!0 (mask!26221 thiss!1181))))

(assert (=> d!111791 (= (lemmaValidKeyInArrayIsInListMap!246 (_keys!10241 thiss!1181) (_values!5437 thiss!1181) (mask!26221 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) (index!37908 lt!406458) (defaultEntry!5426 thiss!1181)) lt!406566)))

(declare-fun b!900286 () Bool)

(assert (=> b!900286 (= e!503818 (contains!4389 (getCurrentListMap!2616 (_keys!10241 thiss!1181) (_values!5437 thiss!1181) (mask!26221 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181)) (select (arr!25366 (_keys!10241 thiss!1181)) (index!37908 lt!406458))))))

(assert (= (and d!111791 res!607933) b!900286))

(declare-fun m!837185 () Bool)

(assert (=> d!111791 m!837185))

(assert (=> d!111791 m!837053))

(assert (=> b!900286 m!837043))

(assert (=> b!900286 m!837045))

(assert (=> b!900286 m!837043))

(assert (=> b!900286 m!837045))

(assert (=> b!900286 m!837047))

(assert (=> b!900149 d!111791))

(declare-fun d!111793 () Bool)

(declare-fun e!503821 () Bool)

(assert (=> d!111793 e!503821))

(declare-fun res!607936 () Bool)

(assert (=> d!111793 (=> res!607936 e!503821)))

(declare-fun lt!406572 () SeekEntryResult!8884)

(assert (=> d!111793 (= res!607936 (not ((_ is Found!8884) lt!406572)))))

(assert (=> d!111793 (= lt!406572 (seekEntry!0 key!785 (_keys!10241 thiss!1181) (mask!26221 thiss!1181)))))

(declare-fun lt!406571 () Unit!30550)

(declare-fun choose!1507 (array!52791 array!52793 (_ BitVec 32) (_ BitVec 32) V!29439 V!29439 (_ BitVec 64)) Unit!30550)

(assert (=> d!111793 (= lt!406571 (choose!1507 (_keys!10241 thiss!1181) (_values!5437 thiss!1181) (mask!26221 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) key!785))))

(assert (=> d!111793 (validMask!0 (mask!26221 thiss!1181))))

(assert (=> d!111793 (= (lemmaSeekEntryGivesInRangeIndex!104 (_keys!10241 thiss!1181) (_values!5437 thiss!1181) (mask!26221 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) key!785) lt!406571)))

(declare-fun b!900289 () Bool)

(assert (=> b!900289 (= e!503821 (inRange!0 (index!37908 lt!406572) (mask!26221 thiss!1181)))))

(assert (= (and d!111793 (not res!607936)) b!900289))

(assert (=> d!111793 m!837057))

(declare-fun m!837187 () Bool)

(assert (=> d!111793 m!837187))

(assert (=> d!111793 m!837053))

(declare-fun m!837189 () Bool)

(assert (=> b!900289 m!837189))

(assert (=> b!900147 d!111793))

(declare-fun b!900302 () Bool)

(declare-fun e!503829 () SeekEntryResult!8884)

(declare-fun e!503828 () SeekEntryResult!8884)

(assert (=> b!900302 (= e!503829 e!503828)))

(declare-fun lt!406581 () (_ BitVec 64))

(declare-fun lt!406582 () SeekEntryResult!8884)

(assert (=> b!900302 (= lt!406581 (select (arr!25366 (_keys!10241 thiss!1181)) (index!37909 lt!406582)))))

(declare-fun c!95423 () Bool)

(assert (=> b!900302 (= c!95423 (= lt!406581 key!785))))

(declare-fun b!900303 () Bool)

(assert (=> b!900303 (= e!503828 (Found!8884 (index!37909 lt!406582)))))

(declare-fun b!900304 () Bool)

(declare-fun e!503830 () SeekEntryResult!8884)

(declare-fun lt!406583 () SeekEntryResult!8884)

(assert (=> b!900304 (= e!503830 (ite ((_ is MissingVacant!8884) lt!406583) (MissingZero!8884 (index!37910 lt!406583)) lt!406583))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52791 (_ BitVec 32)) SeekEntryResult!8884)

(assert (=> b!900304 (= lt!406583 (seekKeyOrZeroReturnVacant!0 (x!76597 lt!406582) (index!37909 lt!406582) (index!37909 lt!406582) key!785 (_keys!10241 thiss!1181) (mask!26221 thiss!1181)))))

(declare-fun b!900306 () Bool)

(declare-fun c!95424 () Bool)

(assert (=> b!900306 (= c!95424 (= lt!406581 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!900306 (= e!503828 e!503830)))

(declare-fun b!900307 () Bool)

(assert (=> b!900307 (= e!503829 Undefined!8884)))

(declare-fun b!900305 () Bool)

(assert (=> b!900305 (= e!503830 (MissingZero!8884 (index!37909 lt!406582)))))

(declare-fun d!111795 () Bool)

(declare-fun lt!406584 () SeekEntryResult!8884)

(assert (=> d!111795 (and (or ((_ is MissingVacant!8884) lt!406584) (not ((_ is Found!8884) lt!406584)) (and (bvsge (index!37908 lt!406584) #b00000000000000000000000000000000) (bvslt (index!37908 lt!406584) (size!25824 (_keys!10241 thiss!1181))))) (not ((_ is MissingVacant!8884) lt!406584)) (or (not ((_ is Found!8884) lt!406584)) (= (select (arr!25366 (_keys!10241 thiss!1181)) (index!37908 lt!406584)) key!785)))))

(assert (=> d!111795 (= lt!406584 e!503829)))

(declare-fun c!95425 () Bool)

(assert (=> d!111795 (= c!95425 (and ((_ is Intermediate!8884) lt!406582) (undefined!9696 lt!406582)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52791 (_ BitVec 32)) SeekEntryResult!8884)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111795 (= lt!406582 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26221 thiss!1181)) key!785 (_keys!10241 thiss!1181) (mask!26221 thiss!1181)))))

(assert (=> d!111795 (validMask!0 (mask!26221 thiss!1181))))

(assert (=> d!111795 (= (seekEntry!0 key!785 (_keys!10241 thiss!1181) (mask!26221 thiss!1181)) lt!406584)))

(assert (= (and d!111795 c!95425) b!900307))

(assert (= (and d!111795 (not c!95425)) b!900302))

(assert (= (and b!900302 c!95423) b!900303))

(assert (= (and b!900302 (not c!95423)) b!900306))

(assert (= (and b!900306 c!95424) b!900305))

(assert (= (and b!900306 (not c!95424)) b!900304))

(declare-fun m!837191 () Bool)

(assert (=> b!900302 m!837191))

(declare-fun m!837193 () Bool)

(assert (=> b!900304 m!837193))

(declare-fun m!837195 () Bool)

(assert (=> d!111795 m!837195))

(declare-fun m!837197 () Bool)

(assert (=> d!111795 m!837197))

(assert (=> d!111795 m!837197))

(declare-fun m!837199 () Bool)

(assert (=> d!111795 m!837199))

(assert (=> d!111795 m!837053))

(assert (=> b!900147 d!111795))

(declare-fun d!111797 () Bool)

(assert (=> d!111797 (= (inRange!0 (index!37908 lt!406458) (mask!26221 thiss!1181)) (and (bvsge (index!37908 lt!406458) #b00000000000000000000000000000000) (bvslt (index!37908 lt!406458) (bvadd (mask!26221 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!900141 d!111797))

(declare-fun d!111799 () Bool)

(declare-fun res!607943 () Bool)

(declare-fun e!503833 () Bool)

(assert (=> d!111799 (=> (not res!607943) (not e!503833))))

(declare-fun simpleValid!326 (LongMapFixedSize!4408) Bool)

(assert (=> d!111799 (= res!607943 (simpleValid!326 thiss!1181))))

(assert (=> d!111799 (= (valid!1707 thiss!1181) e!503833)))

(declare-fun b!900314 () Bool)

(declare-fun res!607944 () Bool)

(assert (=> b!900314 (=> (not res!607944) (not e!503833))))

(declare-fun arrayCountValidKeys!0 (array!52791 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!900314 (= res!607944 (= (arrayCountValidKeys!0 (_keys!10241 thiss!1181) #b00000000000000000000000000000000 (size!25824 (_keys!10241 thiss!1181))) (_size!2259 thiss!1181)))))

(declare-fun b!900315 () Bool)

(declare-fun res!607945 () Bool)

(assert (=> b!900315 (=> (not res!607945) (not e!503833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52791 (_ BitVec 32)) Bool)

(assert (=> b!900315 (= res!607945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10241 thiss!1181) (mask!26221 thiss!1181)))))

(declare-fun b!900316 () Bool)

(declare-datatypes ((List!17798 0))(
  ( (Nil!17795) (Cons!17794 (h!18944 (_ BitVec 64)) (t!25137 List!17798)) )
))
(declare-fun arrayNoDuplicates!0 (array!52791 (_ BitVec 32) List!17798) Bool)

(assert (=> b!900316 (= e!503833 (arrayNoDuplicates!0 (_keys!10241 thiss!1181) #b00000000000000000000000000000000 Nil!17795))))

(assert (= (and d!111799 res!607943) b!900314))

(assert (= (and b!900314 res!607944) b!900315))

(assert (= (and b!900315 res!607945) b!900316))

(declare-fun m!837201 () Bool)

(assert (=> d!111799 m!837201))

(declare-fun m!837203 () Bool)

(assert (=> b!900314 m!837203))

(declare-fun m!837205 () Bool)

(assert (=> b!900315 m!837205))

(declare-fun m!837207 () Bool)

(assert (=> b!900316 m!837207))

(assert (=> start!77116 d!111799))

(declare-fun d!111801 () Bool)

(assert (=> d!111801 (= (array_inv!19958 (_keys!10241 thiss!1181)) (bvsge (size!25824 (_keys!10241 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900144 d!111801))

(declare-fun d!111803 () Bool)

(assert (=> d!111803 (= (array_inv!19959 (_values!5437 thiss!1181)) (bvsge (size!25825 (_values!5437 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900144 d!111803))

(declare-fun mapNonEmpty!29204 () Bool)

(declare-fun mapRes!29204 () Bool)

(declare-fun tp!56174 () Bool)

(declare-fun e!503839 () Bool)

(assert (=> mapNonEmpty!29204 (= mapRes!29204 (and tp!56174 e!503839))))

(declare-fun mapKey!29204 () (_ BitVec 32))

(declare-fun mapRest!29204 () (Array (_ BitVec 32) ValueCell!8696))

(declare-fun mapValue!29204 () ValueCell!8696)

(assert (=> mapNonEmpty!29204 (= mapRest!29195 (store mapRest!29204 mapKey!29204 mapValue!29204))))

(declare-fun b!900323 () Bool)

(assert (=> b!900323 (= e!503839 tp_is_empty!18355)))

(declare-fun b!900324 () Bool)

(declare-fun e!503838 () Bool)

(assert (=> b!900324 (= e!503838 tp_is_empty!18355)))

(declare-fun condMapEmpty!29204 () Bool)

(declare-fun mapDefault!29204 () ValueCell!8696)

(assert (=> mapNonEmpty!29195 (= condMapEmpty!29204 (= mapRest!29195 ((as const (Array (_ BitVec 32) ValueCell!8696)) mapDefault!29204)))))

(assert (=> mapNonEmpty!29195 (= tp!56159 (and e!503838 mapRes!29204))))

(declare-fun mapIsEmpty!29204 () Bool)

(assert (=> mapIsEmpty!29204 mapRes!29204))

(assert (= (and mapNonEmpty!29195 condMapEmpty!29204) mapIsEmpty!29204))

(assert (= (and mapNonEmpty!29195 (not condMapEmpty!29204)) mapNonEmpty!29204))

(assert (= (and mapNonEmpty!29204 ((_ is ValueCellFull!8696) mapValue!29204)) b!900323))

(assert (= (and mapNonEmpty!29195 ((_ is ValueCellFull!8696) mapDefault!29204)) b!900324))

(declare-fun m!837209 () Bool)

(assert (=> mapNonEmpty!29204 m!837209))

(declare-fun b_lambda!13003 () Bool)

(assert (= b_lambda!13001 (or (and b!900144 b_free!16027) b_lambda!13003)))

(check-sat (not b!900286) (not b!900304) (not b!900257) (not b!900264) (not bm!39985) (not bm!39980) (not b_next!16027) (not b!900315) (not b!900316) (not b!900256) (not mapNonEmpty!29204) (not d!111791) (not bm!39983) (not d!111799) (not b!900262) (not bm!39982) b_and!26349 (not b!900314) (not b!900255) (not b!900265) (not b!900281) (not b_lambda!13003) (not b!900271) (not b!900258) (not d!111787) (not d!111793) (not b!900289) (not d!111795) tp_is_empty!18355 (not b!900209) (not d!111789) (not d!111781) (not b!900283))
(check-sat b_and!26349 (not b_next!16027))
