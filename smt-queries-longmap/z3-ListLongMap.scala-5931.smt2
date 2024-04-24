; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77506 () Bool)

(assert start!77506)

(declare-fun b!902888 () Bool)

(declare-fun b_free!16087 () Bool)

(declare-fun b_next!16087 () Bool)

(assert (=> b!902888 (= b_free!16087 (not b_next!16087))))

(declare-fun tp!56367 () Bool)

(declare-fun b_and!26457 () Bool)

(assert (=> b!902888 (= tp!56367 b_and!26457)))

(declare-datatypes ((array!52929 0))(
  ( (array!52930 (arr!25426 (Array (_ BitVec 32) (_ BitVec 64))) (size!25886 (_ BitVec 32))) )
))
(declare-datatypes ((V!29519 0))(
  ( (V!29520 (val!9258 Int)) )
))
(declare-datatypes ((ValueCell!8726 0))(
  ( (ValueCellFull!8726 (v!11757 V!29519)) (EmptyCell!8726) )
))
(declare-datatypes ((array!52931 0))(
  ( (array!52932 (arr!25427 (Array (_ BitVec 32) ValueCell!8726)) (size!25887 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4468 0))(
  ( (LongMapFixedSize!4469 (defaultEntry!5480 Int) (mask!26343 (_ BitVec 32)) (extraKeys!5211 (_ BitVec 32)) (zeroValue!5315 V!29519) (minValue!5315 V!29519) (_size!2289 (_ BitVec 32)) (_keys!10325 array!52929) (_values!5502 array!52931) (_vacant!2289 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4468)

(declare-fun e!505624 () Bool)

(declare-fun e!505628 () Bool)

(declare-fun tp_is_empty!18415 () Bool)

(declare-fun array_inv!20000 (array!52929) Bool)

(declare-fun array_inv!20001 (array!52931) Bool)

(assert (=> b!902888 (= e!505628 (and tp!56367 tp_is_empty!18415 (array_inv!20000 (_keys!10325 thiss!1181)) (array_inv!20001 (_values!5502 thiss!1181)) e!505624))))

(declare-fun b!902889 () Bool)

(declare-fun e!505623 () Bool)

(declare-datatypes ((SeekEntryResult!8910 0))(
  ( (MissingZero!8910 (index!38011 (_ BitVec 32))) (Found!8910 (index!38012 (_ BitVec 32))) (Intermediate!8910 (undefined!9722 Bool) (index!38013 (_ BitVec 32)) (x!76823 (_ BitVec 32))) (Undefined!8910) (MissingVacant!8910 (index!38014 (_ BitVec 32))) )
))
(declare-fun lt!408122 () SeekEntryResult!8910)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!902889 (= e!505623 (inRange!0 (index!38012 lt!408122) (mask!26343 thiss!1181)))))

(declare-fun mapNonEmpty!29314 () Bool)

(declare-fun mapRes!29314 () Bool)

(declare-fun tp!56368 () Bool)

(declare-fun e!505627 () Bool)

(assert (=> mapNonEmpty!29314 (= mapRes!29314 (and tp!56368 e!505627))))

(declare-fun mapValue!29314 () ValueCell!8726)

(declare-fun mapRest!29314 () (Array (_ BitVec 32) ValueCell!8726))

(declare-fun mapKey!29314 () (_ BitVec 32))

(assert (=> mapNonEmpty!29314 (= (arr!25427 (_values!5502 thiss!1181)) (store mapRest!29314 mapKey!29314 mapValue!29314))))

(declare-fun b!902891 () Bool)

(declare-fun res!609171 () Bool)

(declare-fun e!505630 () Bool)

(assert (=> b!902891 (=> (not res!609171) (not e!505630))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!902891 (= res!609171 (not (= key!785 (bvneg key!785))))))

(declare-fun b!902892 () Bool)

(declare-fun res!609169 () Bool)

(declare-fun e!505626 () Bool)

(assert (=> b!902892 (=> res!609169 e!505626)))

(declare-fun contains!4420 (LongMapFixedSize!4468 (_ BitVec 64)) Bool)

(assert (=> b!902892 (= res!609169 (not (contains!4420 thiss!1181 key!785)))))

(declare-fun b!902893 () Bool)

(assert (=> b!902893 (= e!505630 (not e!505626))))

(declare-fun res!609170 () Bool)

(assert (=> b!902893 (=> res!609170 e!505626)))

(get-info :version)

(assert (=> b!902893 (= res!609170 ((_ is Found!8910) lt!408122))))

(assert (=> b!902893 e!505623))

(declare-fun res!609172 () Bool)

(assert (=> b!902893 (=> res!609172 e!505623)))

(assert (=> b!902893 (= res!609172 (not ((_ is Found!8910) lt!408122)))))

(declare-datatypes ((Unit!30630 0))(
  ( (Unit!30631) )
))
(declare-fun lt!408123 () Unit!30630)

(declare-fun lemmaSeekEntryGivesInRangeIndex!126 (array!52929 array!52931 (_ BitVec 32) (_ BitVec 32) V!29519 V!29519 (_ BitVec 64)) Unit!30630)

(assert (=> b!902893 (= lt!408123 (lemmaSeekEntryGivesInRangeIndex!126 (_keys!10325 thiss!1181) (_values!5502 thiss!1181) (mask!26343 thiss!1181) (extraKeys!5211 thiss!1181) (zeroValue!5315 thiss!1181) (minValue!5315 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52929 (_ BitVec 32)) SeekEntryResult!8910)

(assert (=> b!902893 (= lt!408122 (seekEntry!0 key!785 (_keys!10325 thiss!1181) (mask!26343 thiss!1181)))))

(declare-fun b!902894 () Bool)

(declare-fun e!505625 () Bool)

(assert (=> b!902894 (= e!505625 tp_is_empty!18415)))

(declare-fun mapIsEmpty!29314 () Bool)

(assert (=> mapIsEmpty!29314 mapRes!29314))

(declare-fun b!902895 () Bool)

(declare-fun dynLambda!1335 (Int (_ BitVec 64)) V!29519)

(declare-datatypes ((Option!471 0))(
  ( (Some!470 (v!11758 V!29519)) (None!469) )
))
(declare-fun get!13399 (Option!471) V!29519)

(declare-datatypes ((tuple2!12006 0))(
  ( (tuple2!12007 (_1!6014 (_ BitVec 64)) (_2!6014 V!29519)) )
))
(declare-datatypes ((List!17834 0))(
  ( (Nil!17831) (Cons!17830 (h!18982 tuple2!12006) (t!25205 List!17834)) )
))
(declare-fun getValueByKey!465 (List!17834 (_ BitVec 64)) Option!471)

(declare-datatypes ((ListLongMap!10705 0))(
  ( (ListLongMap!10706 (toList!5368 List!17834)) )
))
(declare-fun map!12287 (LongMapFixedSize!4468) ListLongMap!10705)

(assert (=> b!902895 (= e!505626 (= (dynLambda!1335 (defaultEntry!5480 thiss!1181) key!785) (get!13399 (getValueByKey!465 (toList!5368 (map!12287 thiss!1181)) key!785))))))

(declare-fun b!902896 () Bool)

(assert (=> b!902896 (= e!505624 (and e!505625 mapRes!29314))))

(declare-fun condMapEmpty!29314 () Bool)

(declare-fun mapDefault!29314 () ValueCell!8726)

(assert (=> b!902896 (= condMapEmpty!29314 (= (arr!25427 (_values!5502 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8726)) mapDefault!29314)))))

(declare-fun res!609173 () Bool)

(assert (=> start!77506 (=> (not res!609173) (not e!505630))))

(declare-fun valid!1727 (LongMapFixedSize!4468) Bool)

(assert (=> start!77506 (= res!609173 (valid!1727 thiss!1181))))

(assert (=> start!77506 e!505630))

(assert (=> start!77506 e!505628))

(assert (=> start!77506 true))

(declare-fun b!902890 () Bool)

(assert (=> b!902890 (= e!505627 tp_is_empty!18415)))

(assert (= (and start!77506 res!609173) b!902891))

(assert (= (and b!902891 res!609171) b!902893))

(assert (= (and b!902893 (not res!609172)) b!902889))

(assert (= (and b!902893 (not res!609170)) b!902892))

(assert (= (and b!902892 (not res!609169)) b!902895))

(assert (= (and b!902896 condMapEmpty!29314) mapIsEmpty!29314))

(assert (= (and b!902896 (not condMapEmpty!29314)) mapNonEmpty!29314))

(assert (= (and mapNonEmpty!29314 ((_ is ValueCellFull!8726) mapValue!29314)) b!902890))

(assert (= (and b!902896 ((_ is ValueCellFull!8726) mapDefault!29314)) b!902894))

(assert (= b!902888 b!902896))

(assert (= start!77506 b!902888))

(declare-fun b_lambda!13093 () Bool)

(assert (=> (not b_lambda!13093) (not b!902895)))

(declare-fun t!25204 () Bool)

(declare-fun tb!5221 () Bool)

(assert (=> (and b!902888 (= (defaultEntry!5480 thiss!1181) (defaultEntry!5480 thiss!1181)) t!25204) tb!5221))

(declare-fun result!10231 () Bool)

(assert (=> tb!5221 (= result!10231 tp_is_empty!18415)))

(assert (=> b!902895 t!25204))

(declare-fun b_and!26459 () Bool)

(assert (= b_and!26457 (and (=> t!25204 result!10231) b_and!26459)))

(declare-fun m!839433 () Bool)

(assert (=> b!902895 m!839433))

(declare-fun m!839435 () Bool)

(assert (=> b!902895 m!839435))

(declare-fun m!839437 () Bool)

(assert (=> b!902895 m!839437))

(assert (=> b!902895 m!839437))

(declare-fun m!839439 () Bool)

(assert (=> b!902895 m!839439))

(declare-fun m!839441 () Bool)

(assert (=> mapNonEmpty!29314 m!839441))

(declare-fun m!839443 () Bool)

(assert (=> b!902888 m!839443))

(declare-fun m!839445 () Bool)

(assert (=> b!902888 m!839445))

(declare-fun m!839447 () Bool)

(assert (=> b!902892 m!839447))

(declare-fun m!839449 () Bool)

(assert (=> start!77506 m!839449))

(declare-fun m!839451 () Bool)

(assert (=> b!902893 m!839451))

(declare-fun m!839453 () Bool)

(assert (=> b!902893 m!839453))

(declare-fun m!839455 () Bool)

(assert (=> b!902889 m!839455))

(check-sat (not mapNonEmpty!29314) (not b!902893) (not b!902895) (not b!902888) (not b!902889) tp_is_empty!18415 (not b!902892) b_and!26459 (not b_next!16087) (not b_lambda!13093) (not start!77506))
(check-sat b_and!26459 (not b_next!16087))
(get-model)

(declare-fun b_lambda!13099 () Bool)

(assert (= b_lambda!13093 (or (and b!902888 b_free!16087) b_lambda!13099)))

(check-sat (not b_lambda!13099) (not mapNonEmpty!29314) (not b!902893) (not b!902895) (not start!77506) (not b!902888) (not b!902889) tp_is_empty!18415 (not b!902892) b_and!26459 (not b_next!16087))
(check-sat b_and!26459 (not b_next!16087))
(get-model)

(declare-fun d!112219 () Bool)

(assert (=> d!112219 (= (array_inv!20000 (_keys!10325 thiss!1181)) (bvsge (size!25886 (_keys!10325 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!902888 d!112219))

(declare-fun d!112221 () Bool)

(assert (=> d!112221 (= (array_inv!20001 (_values!5502 thiss!1181)) (bvsge (size!25887 (_values!5502 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!902888 d!112221))

(declare-fun b!902977 () Bool)

(declare-fun e!505691 () Bool)

(assert (=> b!902977 (= e!505691 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5211 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5211 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!902978 () Bool)

(declare-fun e!505693 () Unit!30630)

(declare-fun Unit!30634 () Unit!30630)

(assert (=> b!902978 (= e!505693 Unit!30634)))

(declare-fun b!902980 () Bool)

(declare-fun e!505689 () Bool)

(declare-fun e!505692 () Bool)

(assert (=> b!902980 (= e!505689 e!505692)))

(declare-fun c!95893 () Bool)

(assert (=> b!902980 (= c!95893 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!902981 () Bool)

(declare-fun call!40278 () Bool)

(assert (=> b!902981 (= e!505691 call!40278)))

(declare-fun bm!40274 () Bool)

(declare-fun call!40279 () ListLongMap!10705)

(declare-fun getCurrentListMap!2638 (array!52929 array!52931 (_ BitVec 32) (_ BitVec 32) V!29519 V!29519 (_ BitVec 32) Int) ListLongMap!10705)

(assert (=> bm!40274 (= call!40279 (getCurrentListMap!2638 (_keys!10325 thiss!1181) (_values!5502 thiss!1181) (mask!26343 thiss!1181) (extraKeys!5211 thiss!1181) (zeroValue!5315 thiss!1181) (minValue!5315 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5480 thiss!1181)))))

(declare-fun bm!40275 () Bool)

(declare-fun arrayContainsKey!0 (array!52929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!40275 (= call!40278 (arrayContainsKey!0 (_keys!10325 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!902982 () Bool)

(assert (=> b!902982 false))

(declare-fun lt!408166 () Unit!30630)

(declare-fun lt!408169 () Unit!30630)

(assert (=> b!902982 (= lt!408166 lt!408169)))

(declare-fun lt!408180 () SeekEntryResult!8910)

(declare-fun lt!408179 () (_ BitVec 32))

(assert (=> b!902982 (and ((_ is Found!8910) lt!408180) (= (index!38012 lt!408180) lt!408179))))

(assert (=> b!902982 (= lt!408180 (seekEntry!0 key!785 (_keys!10325 thiss!1181) (mask!26343 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52929 (_ BitVec 32)) Unit!30630)

(assert (=> b!902982 (= lt!408169 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!408179 (_keys!10325 thiss!1181) (mask!26343 thiss!1181)))))

(declare-fun lt!408177 () Unit!30630)

(declare-fun lt!408174 () Unit!30630)

(assert (=> b!902982 (= lt!408177 lt!408174)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52929 (_ BitVec 32)) Bool)

(assert (=> b!902982 (arrayForallSeekEntryOrOpenFound!0 lt!408179 (_keys!10325 thiss!1181) (mask!26343 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52929 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30630)

(assert (=> b!902982 (= lt!408174 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10325 thiss!1181) (mask!26343 thiss!1181) #b00000000000000000000000000000000 lt!408179))))

(declare-fun arrayScanForKey!0 (array!52929 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!902982 (= lt!408179 (arrayScanForKey!0 (_keys!10325 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!408170 () Unit!30630)

(declare-fun lt!408175 () Unit!30630)

(assert (=> b!902982 (= lt!408170 lt!408175)))

(assert (=> b!902982 e!505691))

(declare-fun c!95896 () Bool)

(assert (=> b!902982 (= c!95896 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!169 (array!52929 array!52931 (_ BitVec 32) (_ BitVec 32) V!29519 V!29519 (_ BitVec 64) Int) Unit!30630)

(assert (=> b!902982 (= lt!408175 (lemmaKeyInListMapIsInArray!169 (_keys!10325 thiss!1181) (_values!5502 thiss!1181) (mask!26343 thiss!1181) (extraKeys!5211 thiss!1181) (zeroValue!5315 thiss!1181) (minValue!5315 thiss!1181) key!785 (defaultEntry!5480 thiss!1181)))))

(declare-fun Unit!30635 () Unit!30630)

(assert (=> b!902982 (= e!505693 Unit!30635)))

(declare-fun b!902983 () Bool)

(declare-fun e!505690 () Bool)

(assert (=> b!902983 (= e!505690 false)))

(declare-fun c!95897 () Bool)

(declare-fun call!40277 () Bool)

(assert (=> b!902983 (= c!95897 call!40277)))

(declare-fun lt!408173 () Unit!30630)

(assert (=> b!902983 (= lt!408173 e!505693)))

(declare-fun b!902984 () Bool)

(assert (=> b!902984 (= e!505689 (not (= (bvand (extraKeys!5211 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!902985 () Bool)

(assert (=> b!902985 (= e!505690 true)))

(declare-fun lt!408168 () SeekEntryResult!8910)

(declare-fun lt!408171 () Unit!30630)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52929 (_ BitVec 64) (_ BitVec 32)) Unit!30630)

(assert (=> b!902985 (= lt!408171 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10325 thiss!1181) key!785 (index!38012 lt!408168)))))

(assert (=> b!902985 call!40278))

(declare-fun lt!408167 () Unit!30630)

(assert (=> b!902985 (= lt!408167 lt!408171)))

(declare-fun lt!408172 () Unit!30630)

(declare-fun lemmaValidKeyInArrayIsInListMap!268 (array!52929 array!52931 (_ BitVec 32) (_ BitVec 32) V!29519 V!29519 (_ BitVec 32) Int) Unit!30630)

(assert (=> b!902985 (= lt!408172 (lemmaValidKeyInArrayIsInListMap!268 (_keys!10325 thiss!1181) (_values!5502 thiss!1181) (mask!26343 thiss!1181) (extraKeys!5211 thiss!1181) (zeroValue!5315 thiss!1181) (minValue!5315 thiss!1181) (index!38012 lt!408168) (defaultEntry!5480 thiss!1181)))))

(assert (=> b!902985 call!40277))

(declare-fun lt!408178 () Unit!30630)

(assert (=> b!902985 (= lt!408178 lt!408172)))

(declare-fun c!95895 () Bool)

(declare-fun bm!40276 () Bool)

(declare-fun contains!4422 (ListLongMap!10705 (_ BitVec 64)) Bool)

(assert (=> bm!40276 (= call!40277 (contains!4422 call!40279 (ite c!95895 (select (arr!25426 (_keys!10325 thiss!1181)) (index!38012 lt!408168)) key!785)))))

(declare-fun b!902986 () Bool)

(assert (=> b!902986 (= c!95895 ((_ is Found!8910) lt!408168))))

(assert (=> b!902986 (= lt!408168 (seekEntry!0 key!785 (_keys!10325 thiss!1181) (mask!26343 thiss!1181)))))

(assert (=> b!902986 (= e!505692 e!505690)))

(declare-fun d!112223 () Bool)

(declare-fun lt!408176 () Bool)

(assert (=> d!112223 (= lt!408176 (contains!4422 (map!12287 thiss!1181) key!785))))

(assert (=> d!112223 (= lt!408176 e!505689)))

(declare-fun c!95894 () Bool)

(assert (=> d!112223 (= c!95894 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!112223 (valid!1727 thiss!1181)))

(assert (=> d!112223 (= (contains!4420 thiss!1181 key!785) lt!408176)))

(declare-fun b!902979 () Bool)

(assert (=> b!902979 (= e!505692 (not (= (bvand (extraKeys!5211 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!112223 c!95894) b!902984))

(assert (= (and d!112223 (not c!95894)) b!902980))

(assert (= (and b!902980 c!95893) b!902979))

(assert (= (and b!902980 (not c!95893)) b!902986))

(assert (= (and b!902986 c!95895) b!902985))

(assert (= (and b!902986 (not c!95895)) b!902983))

(assert (= (and b!902983 c!95897) b!902982))

(assert (= (and b!902983 (not c!95897)) b!902978))

(assert (= (and b!902982 c!95896) b!902981))

(assert (= (and b!902982 (not c!95896)) b!902977))

(assert (= (or b!902985 b!902981) bm!40275))

(assert (= (or b!902985 b!902983) bm!40274))

(assert (= (or b!902985 b!902983) bm!40276))

(declare-fun m!839505 () Bool)

(assert (=> b!902985 m!839505))

(declare-fun m!839507 () Bool)

(assert (=> b!902985 m!839507))

(declare-fun m!839509 () Bool)

(assert (=> b!902982 m!839509))

(assert (=> b!902982 m!839453))

(declare-fun m!839511 () Bool)

(assert (=> b!902982 m!839511))

(declare-fun m!839513 () Bool)

(assert (=> b!902982 m!839513))

(declare-fun m!839515 () Bool)

(assert (=> b!902982 m!839515))

(declare-fun m!839517 () Bool)

(assert (=> b!902982 m!839517))

(declare-fun m!839519 () Bool)

(assert (=> bm!40276 m!839519))

(declare-fun m!839521 () Bool)

(assert (=> bm!40276 m!839521))

(declare-fun m!839523 () Bool)

(assert (=> bm!40275 m!839523))

(assert (=> b!902986 m!839453))

(assert (=> d!112223 m!839435))

(assert (=> d!112223 m!839435))

(declare-fun m!839525 () Bool)

(assert (=> d!112223 m!839525))

(assert (=> d!112223 m!839449))

(declare-fun m!839527 () Bool)

(assert (=> bm!40274 m!839527))

(assert (=> b!902892 d!112223))

(declare-fun d!112225 () Bool)

(declare-fun e!505696 () Bool)

(assert (=> d!112225 e!505696))

(declare-fun res!609206 () Bool)

(assert (=> d!112225 (=> res!609206 e!505696)))

(declare-fun lt!408186 () SeekEntryResult!8910)

(assert (=> d!112225 (= res!609206 (not ((_ is Found!8910) lt!408186)))))

(assert (=> d!112225 (= lt!408186 (seekEntry!0 key!785 (_keys!10325 thiss!1181) (mask!26343 thiss!1181)))))

(declare-fun lt!408185 () Unit!30630)

(declare-fun choose!1532 (array!52929 array!52931 (_ BitVec 32) (_ BitVec 32) V!29519 V!29519 (_ BitVec 64)) Unit!30630)

(assert (=> d!112225 (= lt!408185 (choose!1532 (_keys!10325 thiss!1181) (_values!5502 thiss!1181) (mask!26343 thiss!1181) (extraKeys!5211 thiss!1181) (zeroValue!5315 thiss!1181) (minValue!5315 thiss!1181) key!785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!112225 (validMask!0 (mask!26343 thiss!1181))))

(assert (=> d!112225 (= (lemmaSeekEntryGivesInRangeIndex!126 (_keys!10325 thiss!1181) (_values!5502 thiss!1181) (mask!26343 thiss!1181) (extraKeys!5211 thiss!1181) (zeroValue!5315 thiss!1181) (minValue!5315 thiss!1181) key!785) lt!408185)))

(declare-fun b!902989 () Bool)

(assert (=> b!902989 (= e!505696 (inRange!0 (index!38012 lt!408186) (mask!26343 thiss!1181)))))

(assert (= (and d!112225 (not res!609206)) b!902989))

(assert (=> d!112225 m!839453))

(declare-fun m!839529 () Bool)

(assert (=> d!112225 m!839529))

(declare-fun m!839531 () Bool)

(assert (=> d!112225 m!839531))

(declare-fun m!839533 () Bool)

(assert (=> b!902989 m!839533))

(assert (=> b!902893 d!112225))

(declare-fun d!112227 () Bool)

(declare-fun lt!408196 () SeekEntryResult!8910)

(assert (=> d!112227 (and (or ((_ is MissingVacant!8910) lt!408196) (not ((_ is Found!8910) lt!408196)) (and (bvsge (index!38012 lt!408196) #b00000000000000000000000000000000) (bvslt (index!38012 lt!408196) (size!25886 (_keys!10325 thiss!1181))))) (not ((_ is MissingVacant!8910) lt!408196)) (or (not ((_ is Found!8910) lt!408196)) (= (select (arr!25426 (_keys!10325 thiss!1181)) (index!38012 lt!408196)) key!785)))))

(declare-fun e!505703 () SeekEntryResult!8910)

(assert (=> d!112227 (= lt!408196 e!505703)))

(declare-fun c!95904 () Bool)

(declare-fun lt!408198 () SeekEntryResult!8910)

(assert (=> d!112227 (= c!95904 (and ((_ is Intermediate!8910) lt!408198) (undefined!9722 lt!408198)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52929 (_ BitVec 32)) SeekEntryResult!8910)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!112227 (= lt!408198 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26343 thiss!1181)) key!785 (_keys!10325 thiss!1181) (mask!26343 thiss!1181)))))

(assert (=> d!112227 (validMask!0 (mask!26343 thiss!1181))))

(assert (=> d!112227 (= (seekEntry!0 key!785 (_keys!10325 thiss!1181) (mask!26343 thiss!1181)) lt!408196)))

(declare-fun b!903002 () Bool)

(declare-fun e!505705 () SeekEntryResult!8910)

(assert (=> b!903002 (= e!505703 e!505705)))

(declare-fun lt!408195 () (_ BitVec 64))

(assert (=> b!903002 (= lt!408195 (select (arr!25426 (_keys!10325 thiss!1181)) (index!38013 lt!408198)))))

(declare-fun c!95905 () Bool)

(assert (=> b!903002 (= c!95905 (= lt!408195 key!785))))

(declare-fun b!903003 () Bool)

(assert (=> b!903003 (= e!505703 Undefined!8910)))

(declare-fun b!903004 () Bool)

(declare-fun e!505704 () SeekEntryResult!8910)

(declare-fun lt!408197 () SeekEntryResult!8910)

(assert (=> b!903004 (= e!505704 (ite ((_ is MissingVacant!8910) lt!408197) (MissingZero!8910 (index!38014 lt!408197)) lt!408197))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52929 (_ BitVec 32)) SeekEntryResult!8910)

(assert (=> b!903004 (= lt!408197 (seekKeyOrZeroReturnVacant!0 (x!76823 lt!408198) (index!38013 lt!408198) (index!38013 lt!408198) key!785 (_keys!10325 thiss!1181) (mask!26343 thiss!1181)))))

(declare-fun b!903005 () Bool)

(assert (=> b!903005 (= e!505705 (Found!8910 (index!38013 lt!408198)))))

(declare-fun b!903006 () Bool)

(declare-fun c!95906 () Bool)

(assert (=> b!903006 (= c!95906 (= lt!408195 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!903006 (= e!505705 e!505704)))

(declare-fun b!903007 () Bool)

(assert (=> b!903007 (= e!505704 (MissingZero!8910 (index!38013 lt!408198)))))

(assert (= (and d!112227 c!95904) b!903003))

(assert (= (and d!112227 (not c!95904)) b!903002))

(assert (= (and b!903002 c!95905) b!903005))

(assert (= (and b!903002 (not c!95905)) b!903006))

(assert (= (and b!903006 c!95906) b!903007))

(assert (= (and b!903006 (not c!95906)) b!903004))

(declare-fun m!839535 () Bool)

(assert (=> d!112227 m!839535))

(declare-fun m!839537 () Bool)

(assert (=> d!112227 m!839537))

(assert (=> d!112227 m!839537))

(declare-fun m!839539 () Bool)

(assert (=> d!112227 m!839539))

(assert (=> d!112227 m!839531))

(declare-fun m!839541 () Bool)

(assert (=> b!903002 m!839541))

(declare-fun m!839543 () Bool)

(assert (=> b!903004 m!839543))

(assert (=> b!902893 d!112227))

(declare-fun d!112229 () Bool)

(assert (=> d!112229 (= (inRange!0 (index!38012 lt!408122) (mask!26343 thiss!1181)) (and (bvsge (index!38012 lt!408122) #b00000000000000000000000000000000) (bvslt (index!38012 lt!408122) (bvadd (mask!26343 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!902889 d!112229))

(declare-fun d!112231 () Bool)

(declare-fun res!609213 () Bool)

(declare-fun e!505708 () Bool)

(assert (=> d!112231 (=> (not res!609213) (not e!505708))))

(declare-fun simpleValid!335 (LongMapFixedSize!4468) Bool)

(assert (=> d!112231 (= res!609213 (simpleValid!335 thiss!1181))))

(assert (=> d!112231 (= (valid!1727 thiss!1181) e!505708)))

(declare-fun b!903014 () Bool)

(declare-fun res!609214 () Bool)

(assert (=> b!903014 (=> (not res!609214) (not e!505708))))

(declare-fun arrayCountValidKeys!0 (array!52929 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!903014 (= res!609214 (= (arrayCountValidKeys!0 (_keys!10325 thiss!1181) #b00000000000000000000000000000000 (size!25886 (_keys!10325 thiss!1181))) (_size!2289 thiss!1181)))))

(declare-fun b!903015 () Bool)

(declare-fun res!609215 () Bool)

(assert (=> b!903015 (=> (not res!609215) (not e!505708))))

(assert (=> b!903015 (= res!609215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10325 thiss!1181) (mask!26343 thiss!1181)))))

(declare-fun b!903016 () Bool)

(declare-datatypes ((List!17836 0))(
  ( (Nil!17833) (Cons!17832 (h!18984 (_ BitVec 64)) (t!25211 List!17836)) )
))
(declare-fun arrayNoDuplicates!0 (array!52929 (_ BitVec 32) List!17836) Bool)

(assert (=> b!903016 (= e!505708 (arrayNoDuplicates!0 (_keys!10325 thiss!1181) #b00000000000000000000000000000000 Nil!17833))))

(assert (= (and d!112231 res!609213) b!903014))

(assert (= (and b!903014 res!609214) b!903015))

(assert (= (and b!903015 res!609215) b!903016))

(declare-fun m!839545 () Bool)

(assert (=> d!112231 m!839545))

(declare-fun m!839547 () Bool)

(assert (=> b!903014 m!839547))

(declare-fun m!839549 () Bool)

(assert (=> b!903015 m!839549))

(declare-fun m!839551 () Bool)

(assert (=> b!903016 m!839551))

(assert (=> start!77506 d!112231))

(declare-fun d!112233 () Bool)

(assert (=> d!112233 (= (get!13399 (getValueByKey!465 (toList!5368 (map!12287 thiss!1181)) key!785)) (v!11758 (getValueByKey!465 (toList!5368 (map!12287 thiss!1181)) key!785)))))

(assert (=> b!902895 d!112233))

(declare-fun b!903025 () Bool)

(declare-fun e!505713 () Option!471)

(assert (=> b!903025 (= e!505713 (Some!470 (_2!6014 (h!18982 (toList!5368 (map!12287 thiss!1181))))))))

(declare-fun b!903026 () Bool)

(declare-fun e!505714 () Option!471)

(assert (=> b!903026 (= e!505713 e!505714)))

(declare-fun c!95912 () Bool)

(assert (=> b!903026 (= c!95912 (and ((_ is Cons!17830) (toList!5368 (map!12287 thiss!1181))) (not (= (_1!6014 (h!18982 (toList!5368 (map!12287 thiss!1181)))) key!785))))))

(declare-fun b!903027 () Bool)

(assert (=> b!903027 (= e!505714 (getValueByKey!465 (t!25205 (toList!5368 (map!12287 thiss!1181))) key!785))))

(declare-fun d!112235 () Bool)

(declare-fun c!95911 () Bool)

(assert (=> d!112235 (= c!95911 (and ((_ is Cons!17830) (toList!5368 (map!12287 thiss!1181))) (= (_1!6014 (h!18982 (toList!5368 (map!12287 thiss!1181)))) key!785)))))

(assert (=> d!112235 (= (getValueByKey!465 (toList!5368 (map!12287 thiss!1181)) key!785) e!505713)))

(declare-fun b!903028 () Bool)

(assert (=> b!903028 (= e!505714 None!469)))

(assert (= (and d!112235 c!95911) b!903025))

(assert (= (and d!112235 (not c!95911)) b!903026))

(assert (= (and b!903026 c!95912) b!903027))

(assert (= (and b!903026 (not c!95912)) b!903028))

(declare-fun m!839553 () Bool)

(assert (=> b!903027 m!839553))

(assert (=> b!902895 d!112235))

(declare-fun d!112237 () Bool)

(assert (=> d!112237 (= (map!12287 thiss!1181) (getCurrentListMap!2638 (_keys!10325 thiss!1181) (_values!5502 thiss!1181) (mask!26343 thiss!1181) (extraKeys!5211 thiss!1181) (zeroValue!5315 thiss!1181) (minValue!5315 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5480 thiss!1181)))))

(declare-fun bs!25329 () Bool)

(assert (= bs!25329 d!112237))

(assert (=> bs!25329 m!839527))

(assert (=> b!902895 d!112237))

(declare-fun condMapEmpty!29323 () Bool)

(declare-fun mapDefault!29323 () ValueCell!8726)

(assert (=> mapNonEmpty!29314 (= condMapEmpty!29323 (= mapRest!29314 ((as const (Array (_ BitVec 32) ValueCell!8726)) mapDefault!29323)))))

(declare-fun e!505720 () Bool)

(declare-fun mapRes!29323 () Bool)

(assert (=> mapNonEmpty!29314 (= tp!56368 (and e!505720 mapRes!29323))))

(declare-fun mapIsEmpty!29323 () Bool)

(assert (=> mapIsEmpty!29323 mapRes!29323))

(declare-fun mapNonEmpty!29323 () Bool)

(declare-fun tp!56383 () Bool)

(declare-fun e!505719 () Bool)

(assert (=> mapNonEmpty!29323 (= mapRes!29323 (and tp!56383 e!505719))))

(declare-fun mapRest!29323 () (Array (_ BitVec 32) ValueCell!8726))

(declare-fun mapValue!29323 () ValueCell!8726)

(declare-fun mapKey!29323 () (_ BitVec 32))

(assert (=> mapNonEmpty!29323 (= mapRest!29314 (store mapRest!29323 mapKey!29323 mapValue!29323))))

(declare-fun b!903036 () Bool)

(assert (=> b!903036 (= e!505720 tp_is_empty!18415)))

(declare-fun b!903035 () Bool)

(assert (=> b!903035 (= e!505719 tp_is_empty!18415)))

(assert (= (and mapNonEmpty!29314 condMapEmpty!29323) mapIsEmpty!29323))

(assert (= (and mapNonEmpty!29314 (not condMapEmpty!29323)) mapNonEmpty!29323))

(assert (= (and mapNonEmpty!29323 ((_ is ValueCellFull!8726) mapValue!29323)) b!903035))

(assert (= (and mapNonEmpty!29314 ((_ is ValueCellFull!8726) mapDefault!29323)) b!903036))

(declare-fun m!839555 () Bool)

(assert (=> mapNonEmpty!29323 m!839555))

(check-sat (not b!903027) (not b_lambda!13099) (not bm!40276) (not d!112225) (not d!112231) tp_is_empty!18415 (not b!902982) (not b!903016) (not b!902986) (not b!903004) (not bm!40274) (not d!112223) (not b!903014) (not b!902989) (not b!902985) (not b!903015) (not d!112237) (not bm!40275) b_and!26459 (not mapNonEmpty!29323) (not d!112227) (not b_next!16087))
(check-sat b_and!26459 (not b_next!16087))
