; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90808 () Bool)

(assert start!90808)

(declare-fun b!1037199 () Bool)

(declare-fun b_free!20875 () Bool)

(declare-fun b_next!20875 () Bool)

(assert (=> b!1037199 (= b_free!20875 (not b_next!20875))))

(declare-fun tp!73759 () Bool)

(declare-fun b_and!33385 () Bool)

(assert (=> b!1037199 (= tp!73759 b_and!33385)))

(declare-fun b!1037193 () Bool)

(declare-fun e!586659 () Bool)

(declare-fun tp_is_empty!24595 () Bool)

(assert (=> b!1037193 (= e!586659 tp_is_empty!24595)))

(declare-fun b!1037194 () Bool)

(declare-fun e!586662 () Bool)

(declare-fun e!586661 () Bool)

(assert (=> b!1037194 (= e!586662 (not e!586661))))

(declare-fun res!692079 () Bool)

(assert (=> b!1037194 (=> (not res!692079) (not e!586661))))

(declare-datatypes ((V!37667 0))(
  ( (V!37668 (val!12348 Int)) )
))
(declare-datatypes ((ValueCell!11594 0))(
  ( (ValueCellFull!11594 (v!14924 V!37667)) (EmptyCell!11594) )
))
(declare-datatypes ((array!65337 0))(
  ( (array!65338 (arr!31447 (Array (_ BitVec 32) (_ BitVec 64))) (size!31976 (_ BitVec 32))) )
))
(declare-datatypes ((array!65339 0))(
  ( (array!65340 (arr!31448 (Array (_ BitVec 32) ValueCell!11594)) (size!31977 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5782 0))(
  ( (LongMapFixedSize!5783 (defaultEntry!6269 Int) (mask!30230 (_ BitVec 32)) (extraKeys!5999 (_ BitVec 32)) (zeroValue!6103 V!37667) (minValue!6105 V!37667) (_size!2946 (_ BitVec 32)) (_keys!11496 array!65337) (_values!6292 array!65339) (_vacant!2946 (_ BitVec 32))) )
))
(declare-fun lt!457298 () LongMapFixedSize!5782)

(declare-fun valid!2187 (LongMapFixedSize!5782) Bool)

(assert (=> b!1037194 (= res!692079 (valid!2187 lt!457298))))

(declare-fun thiss!1427 () LongMapFixedSize!5782)

(declare-fun lt!457297 () V!37667)

(assert (=> b!1037194 (= lt!457298 (LongMapFixedSize!5783 (defaultEntry!6269 thiss!1427) (mask!30230 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!457297 (_size!2946 thiss!1427) (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (_vacant!2946 thiss!1427)))))

(declare-datatypes ((tuple2!15728 0))(
  ( (tuple2!15729 (_1!7875 (_ BitVec 64)) (_2!7875 V!37667)) )
))
(declare-datatypes ((List!21902 0))(
  ( (Nil!21899) (Cons!21898 (h!23109 tuple2!15728) (t!31099 List!21902)) )
))
(declare-datatypes ((ListLongMap!13763 0))(
  ( (ListLongMap!13764 (toList!6897 List!21902)) )
))
(declare-fun -!520 (ListLongMap!13763 (_ BitVec 64)) ListLongMap!13763)

(declare-fun getCurrentListMap!3943 (array!65337 array!65339 (_ BitVec 32) (_ BitVec 32) V!37667 V!37667 (_ BitVec 32) Int) ListLongMap!13763)

(assert (=> b!1037194 (= (-!520 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!457297 #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-datatypes ((Unit!33898 0))(
  ( (Unit!33899) )
))
(declare-fun lt!457296 () Unit!33898)

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!10 (array!65337 array!65339 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!37667 V!37667 V!37667 Int) Unit!33898)

(assert (=> b!1037194 (= lt!457296 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!10 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) lt!457297 (defaultEntry!6269 thiss!1427)))))

(declare-fun dynLambda!2014 (Int (_ BitVec 64)) V!37667)

(assert (=> b!1037194 (= lt!457297 (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38409 () Bool)

(declare-fun mapRes!38409 () Bool)

(assert (=> mapIsEmpty!38409 mapRes!38409))

(declare-fun b!1037195 () Bool)

(declare-fun e!586657 () Bool)

(assert (=> b!1037195 (= e!586657 (and e!586659 mapRes!38409))))

(declare-fun condMapEmpty!38409 () Bool)

(declare-fun mapDefault!38409 () ValueCell!11594)

(assert (=> b!1037195 (= condMapEmpty!38409 (= (arr!31448 (_values!6292 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11594)) mapDefault!38409)))))

(declare-fun b!1037196 () Bool)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun map!14712 (LongMapFixedSize!5782) ListLongMap!13763)

(assert (=> b!1037196 (= e!586661 (= (map!14712 lt!457298) (-!520 (map!14712 thiss!1427) key!909)))))

(declare-fun res!692081 () Bool)

(assert (=> start!90808 (=> (not res!692081) (not e!586662))))

(assert (=> start!90808 (= res!692081 (valid!2187 thiss!1427))))

(assert (=> start!90808 e!586662))

(declare-fun e!586658 () Bool)

(assert (=> start!90808 e!586658))

(assert (=> start!90808 true))

(declare-fun mapNonEmpty!38409 () Bool)

(declare-fun tp!73758 () Bool)

(declare-fun e!586663 () Bool)

(assert (=> mapNonEmpty!38409 (= mapRes!38409 (and tp!73758 e!586663))))

(declare-fun mapRest!38409 () (Array (_ BitVec 32) ValueCell!11594))

(declare-fun mapKey!38409 () (_ BitVec 32))

(declare-fun mapValue!38409 () ValueCell!11594)

(assert (=> mapNonEmpty!38409 (= (arr!31448 (_values!6292 thiss!1427)) (store mapRest!38409 mapKey!38409 mapValue!38409))))

(declare-fun b!1037197 () Bool)

(assert (=> b!1037197 (= e!586663 tp_is_empty!24595)))

(declare-fun b!1037198 () Bool)

(declare-fun res!692080 () Bool)

(assert (=> b!1037198 (=> (not res!692080) (not e!586662))))

(assert (=> b!1037198 (= res!692080 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun array_inv!24333 (array!65337) Bool)

(declare-fun array_inv!24334 (array!65339) Bool)

(assert (=> b!1037199 (= e!586658 (and tp!73759 tp_is_empty!24595 (array_inv!24333 (_keys!11496 thiss!1427)) (array_inv!24334 (_values!6292 thiss!1427)) e!586657))))

(assert (= (and start!90808 res!692081) b!1037198))

(assert (= (and b!1037198 res!692080) b!1037194))

(assert (= (and b!1037194 res!692079) b!1037196))

(assert (= (and b!1037195 condMapEmpty!38409) mapIsEmpty!38409))

(assert (= (and b!1037195 (not condMapEmpty!38409)) mapNonEmpty!38409))

(get-info :version)

(assert (= (and mapNonEmpty!38409 ((_ is ValueCellFull!11594) mapValue!38409)) b!1037197))

(assert (= (and b!1037195 ((_ is ValueCellFull!11594) mapDefault!38409)) b!1037193))

(assert (= b!1037199 b!1037195))

(assert (= start!90808 b!1037199))

(declare-fun b_lambda!16111 () Bool)

(assert (=> (not b_lambda!16111) (not b!1037194)))

(declare-fun t!31098 () Bool)

(declare-fun tb!7019 () Bool)

(assert (=> (and b!1037199 (= (defaultEntry!6269 thiss!1427) (defaultEntry!6269 thiss!1427)) t!31098) tb!7019))

(declare-fun result!14407 () Bool)

(assert (=> tb!7019 (= result!14407 tp_is_empty!24595)))

(assert (=> b!1037194 t!31098))

(declare-fun b_and!33387 () Bool)

(assert (= b_and!33385 (and (=> t!31098 result!14407) b_and!33387)))

(declare-fun m!957267 () Bool)

(assert (=> b!1037199 m!957267))

(declare-fun m!957269 () Bool)

(assert (=> b!1037199 m!957269))

(declare-fun m!957271 () Bool)

(assert (=> b!1037194 m!957271))

(declare-fun m!957273 () Bool)

(assert (=> b!1037194 m!957273))

(declare-fun m!957275 () Bool)

(assert (=> b!1037194 m!957275))

(declare-fun m!957277 () Bool)

(assert (=> b!1037194 m!957277))

(declare-fun m!957279 () Bool)

(assert (=> b!1037194 m!957279))

(assert (=> b!1037194 m!957275))

(declare-fun m!957281 () Bool)

(assert (=> b!1037194 m!957281))

(declare-fun m!957283 () Bool)

(assert (=> b!1037196 m!957283))

(declare-fun m!957285 () Bool)

(assert (=> b!1037196 m!957285))

(assert (=> b!1037196 m!957285))

(declare-fun m!957287 () Bool)

(assert (=> b!1037196 m!957287))

(declare-fun m!957289 () Bool)

(assert (=> mapNonEmpty!38409 m!957289))

(declare-fun m!957291 () Bool)

(assert (=> start!90808 m!957291))

(check-sat (not b_lambda!16111) (not b!1037194) (not b_next!20875) (not mapNonEmpty!38409) tp_is_empty!24595 (not b!1037199) (not start!90808) (not b!1037196) b_and!33387)
(check-sat b_and!33387 (not b_next!20875))
(get-model)

(declare-fun b_lambda!16117 () Bool)

(assert (= b_lambda!16111 (or (and b!1037199 b_free!20875) b_lambda!16117)))

(check-sat (not b!1037194) (not b_next!20875) (not mapNonEmpty!38409) tp_is_empty!24595 (not b!1037199) (not b_lambda!16117) (not start!90808) (not b!1037196) b_and!33387)
(check-sat b_and!33387 (not b_next!20875))
(get-model)

(declare-fun d!125021 () Bool)

(assert (=> d!125021 (= (array_inv!24333 (_keys!11496 thiss!1427)) (bvsge (size!31976 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037199 d!125021))

(declare-fun d!125023 () Bool)

(assert (=> d!125023 (= (array_inv!24334 (_values!6292 thiss!1427)) (bvsge (size!31977 (_values!6292 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037199 d!125023))

(declare-fun d!125025 () Bool)

(assert (=> d!125025 (= (map!14712 lt!457298) (getCurrentListMap!3943 (_keys!11496 lt!457298) (_values!6292 lt!457298) (mask!30230 lt!457298) (extraKeys!5999 lt!457298) (zeroValue!6103 lt!457298) (minValue!6105 lt!457298) #b00000000000000000000000000000000 (defaultEntry!6269 lt!457298)))))

(declare-fun bs!30330 () Bool)

(assert (= bs!30330 d!125025))

(declare-fun m!957345 () Bool)

(assert (=> bs!30330 m!957345))

(assert (=> b!1037196 d!125025))

(declare-fun d!125027 () Bool)

(declare-fun lt!457319 () ListLongMap!13763)

(declare-fun contains!6046 (ListLongMap!13763 (_ BitVec 64)) Bool)

(assert (=> d!125027 (not (contains!6046 lt!457319 key!909))))

(declare-fun removeStrictlySorted!56 (List!21902 (_ BitVec 64)) List!21902)

(assert (=> d!125027 (= lt!457319 (ListLongMap!13764 (removeStrictlySorted!56 (toList!6897 (map!14712 thiss!1427)) key!909)))))

(assert (=> d!125027 (= (-!520 (map!14712 thiss!1427) key!909) lt!457319)))

(declare-fun bs!30331 () Bool)

(assert (= bs!30331 d!125027))

(declare-fun m!957347 () Bool)

(assert (=> bs!30331 m!957347))

(declare-fun m!957349 () Bool)

(assert (=> bs!30331 m!957349))

(assert (=> b!1037196 d!125027))

(declare-fun d!125029 () Bool)

(assert (=> d!125029 (= (map!14712 thiss!1427) (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun bs!30332 () Bool)

(assert (= bs!30332 d!125029))

(assert (=> bs!30332 m!957275))

(assert (=> b!1037196 d!125029))

(declare-fun d!125031 () Bool)

(declare-fun res!692106 () Bool)

(declare-fun e!586708 () Bool)

(assert (=> d!125031 (=> (not res!692106) (not e!586708))))

(declare-fun simpleValid!414 (LongMapFixedSize!5782) Bool)

(assert (=> d!125031 (= res!692106 (simpleValid!414 thiss!1427))))

(assert (=> d!125031 (= (valid!2187 thiss!1427) e!586708)))

(declare-fun b!1037254 () Bool)

(declare-fun res!692107 () Bool)

(assert (=> b!1037254 (=> (not res!692107) (not e!586708))))

(declare-fun arrayCountValidKeys!0 (array!65337 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037254 (= res!692107 (= (arrayCountValidKeys!0 (_keys!11496 thiss!1427) #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))) (_size!2946 thiss!1427)))))

(declare-fun b!1037255 () Bool)

(declare-fun res!692108 () Bool)

(assert (=> b!1037255 (=> (not res!692108) (not e!586708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65337 (_ BitVec 32)) Bool)

(assert (=> b!1037255 (= res!692108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11496 thiss!1427) (mask!30230 thiss!1427)))))

(declare-fun b!1037256 () Bool)

(declare-datatypes ((List!21905 0))(
  ( (Nil!21902) (Cons!21901 (h!23112 (_ BitVec 64)) (t!31108 List!21905)) )
))
(declare-fun arrayNoDuplicates!0 (array!65337 (_ BitVec 32) List!21905) Bool)

(assert (=> b!1037256 (= e!586708 (arrayNoDuplicates!0 (_keys!11496 thiss!1427) #b00000000000000000000000000000000 Nil!21902))))

(assert (= (and d!125031 res!692106) b!1037254))

(assert (= (and b!1037254 res!692107) b!1037255))

(assert (= (and b!1037255 res!692108) b!1037256))

(declare-fun m!957351 () Bool)

(assert (=> d!125031 m!957351))

(declare-fun m!957353 () Bool)

(assert (=> b!1037254 m!957353))

(declare-fun m!957355 () Bool)

(assert (=> b!1037255 m!957355))

(declare-fun m!957357 () Bool)

(assert (=> b!1037256 m!957357))

(assert (=> start!90808 d!125031))

(declare-fun b!1037299 () Bool)

(declare-fun e!586737 () ListLongMap!13763)

(declare-fun e!586747 () ListLongMap!13763)

(assert (=> b!1037299 (= e!586737 e!586747)))

(declare-fun c!105171 () Bool)

(assert (=> b!1037299 (= c!105171 (and (not (= (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43879 () Bool)

(declare-fun call!43887 () ListLongMap!13763)

(declare-fun getCurrentListMapNoExtraKeys!3567 (array!65337 array!65339 (_ BitVec 32) (_ BitVec 32) V!37667 V!37667 (_ BitVec 32) Int) ListLongMap!13763)

(assert (=> bm!43879 (= call!43887 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun b!1037300 () Bool)

(declare-fun e!586745 () Bool)

(declare-fun lt!457385 () ListLongMap!13763)

(declare-fun apply!916 (ListLongMap!13763 (_ BitVec 64)) V!37667)

(assert (=> b!1037300 (= e!586745 (= (apply!916 lt!457385 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6103 thiss!1427)))))

(declare-fun b!1037301 () Bool)

(declare-fun e!586742 () ListLongMap!13763)

(declare-fun call!43884 () ListLongMap!13763)

(assert (=> b!1037301 (= e!586742 call!43884)))

(declare-fun b!1037302 () Bool)

(declare-fun e!586738 () Bool)

(declare-fun e!586736 () Bool)

(assert (=> b!1037302 (= e!586738 e!586736)))

(declare-fun res!692135 () Bool)

(assert (=> b!1037302 (=> (not res!692135) (not e!586736))))

(assert (=> b!1037302 (= res!692135 (contains!6046 lt!457385 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1037302 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun bm!43880 () Bool)

(declare-fun call!43885 () ListLongMap!13763)

(assert (=> bm!43880 (= call!43884 call!43885)))

(declare-fun b!1037303 () Bool)

(declare-fun e!586740 () Bool)

(assert (=> b!1037303 (= e!586740 e!586745)))

(declare-fun res!692128 () Bool)

(declare-fun call!43886 () Bool)

(assert (=> b!1037303 (= res!692128 call!43886)))

(assert (=> b!1037303 (=> (not res!692128) (not e!586745))))

(declare-fun b!1037304 () Bool)

(declare-fun get!16492 (ValueCell!11594 V!37667) V!37667)

(assert (=> b!1037304 (= e!586736 (= (apply!916 lt!457385 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1037304 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31977 (_values!6292 thiss!1427))))))

(assert (=> b!1037304 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun b!1037305 () Bool)

(declare-fun call!43888 () ListLongMap!13763)

(assert (=> b!1037305 (= e!586742 call!43888)))

(declare-fun b!1037306 () Bool)

(declare-fun res!692130 () Bool)

(declare-fun e!586739 () Bool)

(assert (=> b!1037306 (=> (not res!692130) (not e!586739))))

(assert (=> b!1037306 (= res!692130 e!586738)))

(declare-fun res!692131 () Bool)

(assert (=> b!1037306 (=> res!692131 e!586738)))

(declare-fun e!586743 () Bool)

(assert (=> b!1037306 (= res!692131 (not e!586743))))

(declare-fun res!692127 () Bool)

(assert (=> b!1037306 (=> (not res!692127) (not e!586743))))

(assert (=> b!1037306 (= res!692127 (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun b!1037307 () Bool)

(declare-fun res!692129 () Bool)

(assert (=> b!1037307 (=> (not res!692129) (not e!586739))))

(assert (=> b!1037307 (= res!692129 e!586740)))

(declare-fun c!105168 () Bool)

(assert (=> b!1037307 (= c!105168 (not (= (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!43881 () Bool)

(assert (=> bm!43881 (= call!43885 call!43887)))

(declare-fun b!1037308 () Bool)

(declare-fun e!586741 () Unit!33898)

(declare-fun Unit!33900 () Unit!33898)

(assert (=> b!1037308 (= e!586741 Unit!33900)))

(declare-fun bm!43882 () Bool)

(declare-fun call!43883 () ListLongMap!13763)

(declare-fun c!105170 () Bool)

(declare-fun +!3127 (ListLongMap!13763 tuple2!15728) ListLongMap!13763)

(assert (=> bm!43882 (= call!43883 (+!3127 (ite c!105170 call!43887 (ite c!105171 call!43885 call!43884)) (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun b!1037309 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1037309 (= e!586743 (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43883 () Bool)

(assert (=> bm!43883 (= call!43888 call!43883)))

(declare-fun b!1037310 () Bool)

(declare-fun lt!457366 () Unit!33898)

(assert (=> b!1037310 (= e!586741 lt!457366)))

(declare-fun lt!457370 () ListLongMap!13763)

(assert (=> b!1037310 (= lt!457370 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun lt!457374 () (_ BitVec 64))

(assert (=> b!1037310 (= lt!457374 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!457379 () (_ BitVec 64))

(assert (=> b!1037310 (= lt!457379 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!457378 () Unit!33898)

(declare-fun addStillContains!626 (ListLongMap!13763 (_ BitVec 64) V!37667 (_ BitVec 64)) Unit!33898)

(assert (=> b!1037310 (= lt!457378 (addStillContains!626 lt!457370 lt!457374 (zeroValue!6103 thiss!1427) lt!457379))))

(assert (=> b!1037310 (contains!6046 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))) lt!457379)))

(declare-fun lt!457381 () Unit!33898)

(assert (=> b!1037310 (= lt!457381 lt!457378)))

(declare-fun lt!457364 () ListLongMap!13763)

(assert (=> b!1037310 (= lt!457364 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun lt!457371 () (_ BitVec 64))

(assert (=> b!1037310 (= lt!457371 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!457369 () (_ BitVec 64))

(assert (=> b!1037310 (= lt!457369 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!457368 () Unit!33898)

(declare-fun addApplyDifferent!482 (ListLongMap!13763 (_ BitVec 64) V!37667 (_ BitVec 64)) Unit!33898)

(assert (=> b!1037310 (= lt!457368 (addApplyDifferent!482 lt!457364 lt!457371 (minValue!6105 thiss!1427) lt!457369))))

(assert (=> b!1037310 (= (apply!916 (+!3127 lt!457364 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))) lt!457369) (apply!916 lt!457364 lt!457369))))

(declare-fun lt!457367 () Unit!33898)

(assert (=> b!1037310 (= lt!457367 lt!457368)))

(declare-fun lt!457375 () ListLongMap!13763)

(assert (=> b!1037310 (= lt!457375 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun lt!457380 () (_ BitVec 64))

(assert (=> b!1037310 (= lt!457380 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!457373 () (_ BitVec 64))

(assert (=> b!1037310 (= lt!457373 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!457383 () Unit!33898)

(assert (=> b!1037310 (= lt!457383 (addApplyDifferent!482 lt!457375 lt!457380 (zeroValue!6103 thiss!1427) lt!457373))))

(assert (=> b!1037310 (= (apply!916 (+!3127 lt!457375 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))) lt!457373) (apply!916 lt!457375 lt!457373))))

(declare-fun lt!457376 () Unit!33898)

(assert (=> b!1037310 (= lt!457376 lt!457383)))

(declare-fun lt!457382 () ListLongMap!13763)

(assert (=> b!1037310 (= lt!457382 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun lt!457377 () (_ BitVec 64))

(assert (=> b!1037310 (= lt!457377 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!457372 () (_ BitVec 64))

(assert (=> b!1037310 (= lt!457372 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037310 (= lt!457366 (addApplyDifferent!482 lt!457382 lt!457377 (minValue!6105 thiss!1427) lt!457372))))

(assert (=> b!1037310 (= (apply!916 (+!3127 lt!457382 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))) lt!457372) (apply!916 lt!457382 lt!457372))))

(declare-fun b!1037311 () Bool)

(assert (=> b!1037311 (= e!586740 (not call!43886))))

(declare-fun d!125033 () Bool)

(assert (=> d!125033 e!586739))

(declare-fun res!692133 () Bool)

(assert (=> d!125033 (=> (not res!692133) (not e!586739))))

(assert (=> d!125033 (= res!692133 (or (bvsge #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))))

(declare-fun lt!457365 () ListLongMap!13763)

(assert (=> d!125033 (= lt!457385 lt!457365)))

(declare-fun lt!457384 () Unit!33898)

(assert (=> d!125033 (= lt!457384 e!586741)))

(declare-fun c!105172 () Bool)

(declare-fun e!586746 () Bool)

(assert (=> d!125033 (= c!105172 e!586746)))

(declare-fun res!692132 () Bool)

(assert (=> d!125033 (=> (not res!692132) (not e!586746))))

(assert (=> d!125033 (= res!692132 (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(assert (=> d!125033 (= lt!457365 e!586737)))

(assert (=> d!125033 (= c!105170 (and (not (= (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125033 (validMask!0 (mask!30230 thiss!1427))))

(assert (=> d!125033 (= (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)) lt!457385)))

(declare-fun bm!43884 () Bool)

(assert (=> bm!43884 (= call!43886 (contains!6046 lt!457385 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037312 () Bool)

(assert (=> b!1037312 (= e!586746 (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037313 () Bool)

(declare-fun e!586735 () Bool)

(declare-fun e!586744 () Bool)

(assert (=> b!1037313 (= e!586735 e!586744)))

(declare-fun res!692134 () Bool)

(declare-fun call!43882 () Bool)

(assert (=> b!1037313 (= res!692134 call!43882)))

(assert (=> b!1037313 (=> (not res!692134) (not e!586744))))

(declare-fun b!1037314 () Bool)

(assert (=> b!1037314 (= e!586735 (not call!43882))))

(declare-fun b!1037315 () Bool)

(declare-fun c!105173 () Bool)

(assert (=> b!1037315 (= c!105173 (and (not (= (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1037315 (= e!586747 e!586742)))

(declare-fun b!1037316 () Bool)

(assert (=> b!1037316 (= e!586744 (= (apply!916 lt!457385 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6105 thiss!1427)))))

(declare-fun b!1037317 () Bool)

(assert (=> b!1037317 (= e!586737 (+!3127 call!43883 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))

(declare-fun b!1037318 () Bool)

(assert (=> b!1037318 (= e!586739 e!586735)))

(declare-fun c!105169 () Bool)

(assert (=> b!1037318 (= c!105169 (not (= (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1037319 () Bool)

(assert (=> b!1037319 (= e!586747 call!43888)))

(declare-fun bm!43885 () Bool)

(assert (=> bm!43885 (= call!43882 (contains!6046 lt!457385 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125033 c!105170) b!1037317))

(assert (= (and d!125033 (not c!105170)) b!1037299))

(assert (= (and b!1037299 c!105171) b!1037319))

(assert (= (and b!1037299 (not c!105171)) b!1037315))

(assert (= (and b!1037315 c!105173) b!1037305))

(assert (= (and b!1037315 (not c!105173)) b!1037301))

(assert (= (or b!1037305 b!1037301) bm!43880))

(assert (= (or b!1037319 bm!43880) bm!43881))

(assert (= (or b!1037319 b!1037305) bm!43883))

(assert (= (or b!1037317 bm!43881) bm!43879))

(assert (= (or b!1037317 bm!43883) bm!43882))

(assert (= (and d!125033 res!692132) b!1037312))

(assert (= (and d!125033 c!105172) b!1037310))

(assert (= (and d!125033 (not c!105172)) b!1037308))

(assert (= (and d!125033 res!692133) b!1037306))

(assert (= (and b!1037306 res!692127) b!1037309))

(assert (= (and b!1037306 (not res!692131)) b!1037302))

(assert (= (and b!1037302 res!692135) b!1037304))

(assert (= (and b!1037306 res!692130) b!1037307))

(assert (= (and b!1037307 c!105168) b!1037303))

(assert (= (and b!1037307 (not c!105168)) b!1037311))

(assert (= (and b!1037303 res!692128) b!1037300))

(assert (= (or b!1037303 b!1037311) bm!43884))

(assert (= (and b!1037307 res!692129) b!1037318))

(assert (= (and b!1037318 c!105169) b!1037313))

(assert (= (and b!1037318 (not c!105169)) b!1037314))

(assert (= (and b!1037313 res!692134) b!1037316))

(assert (= (or b!1037313 b!1037314) bm!43885))

(declare-fun b_lambda!16119 () Bool)

(assert (=> (not b_lambda!16119) (not b!1037304)))

(declare-fun t!31107 () Bool)

(declare-fun tb!7025 () Bool)

(assert (=> (and b!1037199 (= (defaultEntry!6269 thiss!1427) (defaultEntry!6269 thiss!1427)) t!31107) tb!7025))

(declare-fun result!14419 () Bool)

(assert (=> tb!7025 (= result!14419 tp_is_empty!24595)))

(assert (=> b!1037304 t!31107))

(declare-fun b_and!33397 () Bool)

(assert (= b_and!33387 (and (=> t!31107 result!14419) b_and!33397)))

(declare-fun m!957359 () Bool)

(assert (=> b!1037300 m!957359))

(declare-fun m!957361 () Bool)

(assert (=> b!1037312 m!957361))

(assert (=> b!1037312 m!957361))

(declare-fun m!957363 () Bool)

(assert (=> b!1037312 m!957363))

(declare-fun m!957365 () Bool)

(assert (=> bm!43879 m!957365))

(declare-fun m!957367 () Bool)

(assert (=> d!125033 m!957367))

(assert (=> b!1037309 m!957361))

(assert (=> b!1037309 m!957361))

(assert (=> b!1037309 m!957363))

(declare-fun m!957369 () Bool)

(assert (=> bm!43882 m!957369))

(declare-fun m!957371 () Bool)

(assert (=> bm!43884 m!957371))

(declare-fun m!957373 () Bool)

(assert (=> b!1037304 m!957373))

(declare-fun m!957375 () Bool)

(assert (=> b!1037304 m!957375))

(assert (=> b!1037304 m!957361))

(assert (=> b!1037304 m!957361))

(declare-fun m!957377 () Bool)

(assert (=> b!1037304 m!957377))

(assert (=> b!1037304 m!957375))

(assert (=> b!1037304 m!957373))

(declare-fun m!957379 () Bool)

(assert (=> b!1037304 m!957379))

(declare-fun m!957381 () Bool)

(assert (=> b!1037316 m!957381))

(declare-fun m!957383 () Bool)

(assert (=> bm!43885 m!957383))

(declare-fun m!957385 () Bool)

(assert (=> b!1037317 m!957385))

(declare-fun m!957387 () Bool)

(assert (=> b!1037310 m!957387))

(declare-fun m!957389 () Bool)

(assert (=> b!1037310 m!957389))

(declare-fun m!957391 () Bool)

(assert (=> b!1037310 m!957391))

(declare-fun m!957393 () Bool)

(assert (=> b!1037310 m!957393))

(assert (=> b!1037310 m!957389))

(declare-fun m!957395 () Bool)

(assert (=> b!1037310 m!957395))

(declare-fun m!957397 () Bool)

(assert (=> b!1037310 m!957397))

(assert (=> b!1037310 m!957395))

(declare-fun m!957399 () Bool)

(assert (=> b!1037310 m!957399))

(declare-fun m!957401 () Bool)

(assert (=> b!1037310 m!957401))

(declare-fun m!957403 () Bool)

(assert (=> b!1037310 m!957403))

(declare-fun m!957405 () Bool)

(assert (=> b!1037310 m!957405))

(assert (=> b!1037310 m!957365))

(assert (=> b!1037310 m!957361))

(assert (=> b!1037310 m!957387))

(declare-fun m!957407 () Bool)

(assert (=> b!1037310 m!957407))

(declare-fun m!957409 () Bool)

(assert (=> b!1037310 m!957409))

(declare-fun m!957411 () Bool)

(assert (=> b!1037310 m!957411))

(declare-fun m!957413 () Bool)

(assert (=> b!1037310 m!957413))

(assert (=> b!1037310 m!957405))

(declare-fun m!957415 () Bool)

(assert (=> b!1037310 m!957415))

(assert (=> b!1037302 m!957361))

(assert (=> b!1037302 m!957361))

(declare-fun m!957417 () Bool)

(assert (=> b!1037302 m!957417))

(assert (=> b!1037194 d!125033))

(declare-fun d!125035 () Bool)

(declare-fun lt!457386 () ListLongMap!13763)

(assert (=> d!125035 (not (contains!6046 lt!457386 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125035 (= lt!457386 (ListLongMap!13764 (removeStrictlySorted!56 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125035 (= (-!520 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457386)))

(declare-fun bs!30333 () Bool)

(assert (= bs!30333 d!125035))

(declare-fun m!957419 () Bool)

(assert (=> bs!30333 m!957419))

(declare-fun m!957421 () Bool)

(assert (=> bs!30333 m!957421))

(assert (=> b!1037194 d!125035))

(declare-fun d!125037 () Bool)

(declare-fun res!692136 () Bool)

(declare-fun e!586748 () Bool)

(assert (=> d!125037 (=> (not res!692136) (not e!586748))))

(assert (=> d!125037 (= res!692136 (simpleValid!414 lt!457298))))

(assert (=> d!125037 (= (valid!2187 lt!457298) e!586748)))

(declare-fun b!1037320 () Bool)

(declare-fun res!692137 () Bool)

(assert (=> b!1037320 (=> (not res!692137) (not e!586748))))

(assert (=> b!1037320 (= res!692137 (= (arrayCountValidKeys!0 (_keys!11496 lt!457298) #b00000000000000000000000000000000 (size!31976 (_keys!11496 lt!457298))) (_size!2946 lt!457298)))))

(declare-fun b!1037321 () Bool)

(declare-fun res!692138 () Bool)

(assert (=> b!1037321 (=> (not res!692138) (not e!586748))))

(assert (=> b!1037321 (= res!692138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11496 lt!457298) (mask!30230 lt!457298)))))

(declare-fun b!1037322 () Bool)

(assert (=> b!1037322 (= e!586748 (arrayNoDuplicates!0 (_keys!11496 lt!457298) #b00000000000000000000000000000000 Nil!21902))))

(assert (= (and d!125037 res!692136) b!1037320))

(assert (= (and b!1037320 res!692137) b!1037321))

(assert (= (and b!1037321 res!692138) b!1037322))

(declare-fun m!957423 () Bool)

(assert (=> d!125037 m!957423))

(declare-fun m!957425 () Bool)

(assert (=> b!1037320 m!957425))

(declare-fun m!957427 () Bool)

(assert (=> b!1037321 m!957427))

(declare-fun m!957429 () Bool)

(assert (=> b!1037322 m!957429))

(assert (=> b!1037194 d!125037))

(declare-fun b!1037323 () Bool)

(declare-fun e!586751 () ListLongMap!13763)

(declare-fun e!586761 () ListLongMap!13763)

(assert (=> b!1037323 (= e!586751 e!586761)))

(declare-fun c!105177 () Bool)

(assert (=> b!1037323 (= c!105177 (and (not (= (bvand (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43886 () Bool)

(declare-fun call!43894 () ListLongMap!13763)

(assert (=> bm!43886 (= call!43894 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!457297 #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun b!1037324 () Bool)

(declare-fun e!586759 () Bool)

(declare-fun lt!457408 () ListLongMap!13763)

(assert (=> b!1037324 (= e!586759 (= (apply!916 lt!457408 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6103 thiss!1427)))))

(declare-fun b!1037325 () Bool)

(declare-fun e!586756 () ListLongMap!13763)

(declare-fun call!43891 () ListLongMap!13763)

(assert (=> b!1037325 (= e!586756 call!43891)))

(declare-fun b!1037326 () Bool)

(declare-fun e!586752 () Bool)

(declare-fun e!586750 () Bool)

(assert (=> b!1037326 (= e!586752 e!586750)))

(declare-fun res!692147 () Bool)

(assert (=> b!1037326 (=> (not res!692147) (not e!586750))))

(assert (=> b!1037326 (= res!692147 (contains!6046 lt!457408 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1037326 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun bm!43887 () Bool)

(declare-fun call!43892 () ListLongMap!13763)

(assert (=> bm!43887 (= call!43891 call!43892)))

(declare-fun b!1037327 () Bool)

(declare-fun e!586754 () Bool)

(assert (=> b!1037327 (= e!586754 e!586759)))

(declare-fun res!692140 () Bool)

(declare-fun call!43893 () Bool)

(assert (=> b!1037327 (= res!692140 call!43893)))

(assert (=> b!1037327 (=> (not res!692140) (not e!586759))))

(declare-fun b!1037328 () Bool)

(assert (=> b!1037328 (= e!586750 (= (apply!916 lt!457408 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1037328 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31977 (_values!6292 thiss!1427))))))

(assert (=> b!1037328 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun b!1037329 () Bool)

(declare-fun call!43895 () ListLongMap!13763)

(assert (=> b!1037329 (= e!586756 call!43895)))

(declare-fun b!1037330 () Bool)

(declare-fun res!692142 () Bool)

(declare-fun e!586753 () Bool)

(assert (=> b!1037330 (=> (not res!692142) (not e!586753))))

(assert (=> b!1037330 (= res!692142 e!586752)))

(declare-fun res!692143 () Bool)

(assert (=> b!1037330 (=> res!692143 e!586752)))

(declare-fun e!586757 () Bool)

(assert (=> b!1037330 (= res!692143 (not e!586757))))

(declare-fun res!692139 () Bool)

(assert (=> b!1037330 (=> (not res!692139) (not e!586757))))

(assert (=> b!1037330 (= res!692139 (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun b!1037331 () Bool)

(declare-fun res!692141 () Bool)

(assert (=> b!1037331 (=> (not res!692141) (not e!586753))))

(assert (=> b!1037331 (= res!692141 e!586754)))

(declare-fun c!105174 () Bool)

(assert (=> b!1037331 (= c!105174 (not (= (bvand (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!43888 () Bool)

(assert (=> bm!43888 (= call!43892 call!43894)))

(declare-fun b!1037332 () Bool)

(declare-fun e!586755 () Unit!33898)

(declare-fun Unit!33901 () Unit!33898)

(assert (=> b!1037332 (= e!586755 Unit!33901)))

(declare-fun call!43890 () ListLongMap!13763)

(declare-fun bm!43889 () Bool)

(declare-fun c!105176 () Bool)

(assert (=> bm!43889 (= call!43890 (+!3127 (ite c!105176 call!43894 (ite c!105177 call!43892 call!43891)) (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))

(declare-fun b!1037333 () Bool)

(assert (=> b!1037333 (= e!586757 (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43890 () Bool)

(assert (=> bm!43890 (= call!43895 call!43890)))

(declare-fun b!1037334 () Bool)

(declare-fun lt!457389 () Unit!33898)

(assert (=> b!1037334 (= e!586755 lt!457389)))

(declare-fun lt!457393 () ListLongMap!13763)

(assert (=> b!1037334 (= lt!457393 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!457297 #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun lt!457397 () (_ BitVec 64))

(assert (=> b!1037334 (= lt!457397 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!457402 () (_ BitVec 64))

(assert (=> b!1037334 (= lt!457402 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!457401 () Unit!33898)

(assert (=> b!1037334 (= lt!457401 (addStillContains!626 lt!457393 lt!457397 (zeroValue!6103 thiss!1427) lt!457402))))

(assert (=> b!1037334 (contains!6046 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))) lt!457402)))

(declare-fun lt!457404 () Unit!33898)

(assert (=> b!1037334 (= lt!457404 lt!457401)))

(declare-fun lt!457387 () ListLongMap!13763)

(assert (=> b!1037334 (= lt!457387 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!457297 #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun lt!457394 () (_ BitVec 64))

(assert (=> b!1037334 (= lt!457394 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!457392 () (_ BitVec 64))

(assert (=> b!1037334 (= lt!457392 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!457391 () Unit!33898)

(assert (=> b!1037334 (= lt!457391 (addApplyDifferent!482 lt!457387 lt!457394 lt!457297 lt!457392))))

(assert (=> b!1037334 (= (apply!916 (+!3127 lt!457387 (tuple2!15729 lt!457394 lt!457297)) lt!457392) (apply!916 lt!457387 lt!457392))))

(declare-fun lt!457390 () Unit!33898)

(assert (=> b!1037334 (= lt!457390 lt!457391)))

(declare-fun lt!457398 () ListLongMap!13763)

(assert (=> b!1037334 (= lt!457398 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!457297 #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun lt!457403 () (_ BitVec 64))

(assert (=> b!1037334 (= lt!457403 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!457396 () (_ BitVec 64))

(assert (=> b!1037334 (= lt!457396 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!457406 () Unit!33898)

(assert (=> b!1037334 (= lt!457406 (addApplyDifferent!482 lt!457398 lt!457403 (zeroValue!6103 thiss!1427) lt!457396))))

(assert (=> b!1037334 (= (apply!916 (+!3127 lt!457398 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))) lt!457396) (apply!916 lt!457398 lt!457396))))

(declare-fun lt!457399 () Unit!33898)

(assert (=> b!1037334 (= lt!457399 lt!457406)))

(declare-fun lt!457405 () ListLongMap!13763)

(assert (=> b!1037334 (= lt!457405 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!457297 #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun lt!457400 () (_ BitVec 64))

(assert (=> b!1037334 (= lt!457400 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!457395 () (_ BitVec 64))

(assert (=> b!1037334 (= lt!457395 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037334 (= lt!457389 (addApplyDifferent!482 lt!457405 lt!457400 lt!457297 lt!457395))))

(assert (=> b!1037334 (= (apply!916 (+!3127 lt!457405 (tuple2!15729 lt!457400 lt!457297)) lt!457395) (apply!916 lt!457405 lt!457395))))

(declare-fun b!1037335 () Bool)

(assert (=> b!1037335 (= e!586754 (not call!43893))))

(declare-fun d!125039 () Bool)

(assert (=> d!125039 e!586753))

(declare-fun res!692145 () Bool)

(assert (=> d!125039 (=> (not res!692145) (not e!586753))))

(assert (=> d!125039 (= res!692145 (or (bvsge #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))))

(declare-fun lt!457388 () ListLongMap!13763)

(assert (=> d!125039 (= lt!457408 lt!457388)))

(declare-fun lt!457407 () Unit!33898)

(assert (=> d!125039 (= lt!457407 e!586755)))

(declare-fun c!105178 () Bool)

(declare-fun e!586760 () Bool)

(assert (=> d!125039 (= c!105178 e!586760)))

(declare-fun res!692144 () Bool)

(assert (=> d!125039 (=> (not res!692144) (not e!586760))))

(assert (=> d!125039 (= res!692144 (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(assert (=> d!125039 (= lt!457388 e!586751)))

(assert (=> d!125039 (= c!105176 (and (not (= (bvand (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!125039 (validMask!0 (mask!30230 thiss!1427))))

(assert (=> d!125039 (= (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!457297 #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)) lt!457408)))

(declare-fun bm!43891 () Bool)

(assert (=> bm!43891 (= call!43893 (contains!6046 lt!457408 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037336 () Bool)

(assert (=> b!1037336 (= e!586760 (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037337 () Bool)

(declare-fun e!586749 () Bool)

(declare-fun e!586758 () Bool)

(assert (=> b!1037337 (= e!586749 e!586758)))

(declare-fun res!692146 () Bool)

(declare-fun call!43889 () Bool)

(assert (=> b!1037337 (= res!692146 call!43889)))

(assert (=> b!1037337 (=> (not res!692146) (not e!586758))))

(declare-fun b!1037338 () Bool)

(assert (=> b!1037338 (= e!586749 (not call!43889))))

(declare-fun b!1037339 () Bool)

(declare-fun c!105179 () Bool)

(assert (=> b!1037339 (= c!105179 (and (not (= (bvand (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1037339 (= e!586761 e!586756)))

(declare-fun b!1037340 () Bool)

(assert (=> b!1037340 (= e!586758 (= (apply!916 lt!457408 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457297))))

(declare-fun b!1037341 () Bool)

(assert (=> b!1037341 (= e!586751 (+!3127 call!43890 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))

(declare-fun b!1037342 () Bool)

(assert (=> b!1037342 (= e!586753 e!586749)))

(declare-fun c!105175 () Bool)

(assert (=> b!1037342 (= c!105175 (not (= (bvand (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1037343 () Bool)

(assert (=> b!1037343 (= e!586761 call!43895)))

(declare-fun bm!43892 () Bool)

(assert (=> bm!43892 (= call!43889 (contains!6046 lt!457408 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125039 c!105176) b!1037341))

(assert (= (and d!125039 (not c!105176)) b!1037323))

(assert (= (and b!1037323 c!105177) b!1037343))

(assert (= (and b!1037323 (not c!105177)) b!1037339))

(assert (= (and b!1037339 c!105179) b!1037329))

(assert (= (and b!1037339 (not c!105179)) b!1037325))

(assert (= (or b!1037329 b!1037325) bm!43887))

(assert (= (or b!1037343 bm!43887) bm!43888))

(assert (= (or b!1037343 b!1037329) bm!43890))

(assert (= (or b!1037341 bm!43888) bm!43886))

(assert (= (or b!1037341 bm!43890) bm!43889))

(assert (= (and d!125039 res!692144) b!1037336))

(assert (= (and d!125039 c!105178) b!1037334))

(assert (= (and d!125039 (not c!105178)) b!1037332))

(assert (= (and d!125039 res!692145) b!1037330))

(assert (= (and b!1037330 res!692139) b!1037333))

(assert (= (and b!1037330 (not res!692143)) b!1037326))

(assert (= (and b!1037326 res!692147) b!1037328))

(assert (= (and b!1037330 res!692142) b!1037331))

(assert (= (and b!1037331 c!105174) b!1037327))

(assert (= (and b!1037331 (not c!105174)) b!1037335))

(assert (= (and b!1037327 res!692140) b!1037324))

(assert (= (or b!1037327 b!1037335) bm!43891))

(assert (= (and b!1037331 res!692141) b!1037342))

(assert (= (and b!1037342 c!105175) b!1037337))

(assert (= (and b!1037342 (not c!105175)) b!1037338))

(assert (= (and b!1037337 res!692146) b!1037340))

(assert (= (or b!1037337 b!1037338) bm!43892))

(declare-fun b_lambda!16121 () Bool)

(assert (=> (not b_lambda!16121) (not b!1037328)))

(assert (=> b!1037328 t!31107))

(declare-fun b_and!33399 () Bool)

(assert (= b_and!33397 (and (=> t!31107 result!14419) b_and!33399)))

(declare-fun m!957431 () Bool)

(assert (=> b!1037324 m!957431))

(assert (=> b!1037336 m!957361))

(assert (=> b!1037336 m!957361))

(assert (=> b!1037336 m!957363))

(declare-fun m!957433 () Bool)

(assert (=> bm!43886 m!957433))

(assert (=> d!125039 m!957367))

(assert (=> b!1037333 m!957361))

(assert (=> b!1037333 m!957361))

(assert (=> b!1037333 m!957363))

(declare-fun m!957435 () Bool)

(assert (=> bm!43889 m!957435))

(declare-fun m!957437 () Bool)

(assert (=> bm!43891 m!957437))

(assert (=> b!1037328 m!957373))

(assert (=> b!1037328 m!957375))

(assert (=> b!1037328 m!957361))

(assert (=> b!1037328 m!957361))

(declare-fun m!957439 () Bool)

(assert (=> b!1037328 m!957439))

(assert (=> b!1037328 m!957375))

(assert (=> b!1037328 m!957373))

(assert (=> b!1037328 m!957379))

(declare-fun m!957441 () Bool)

(assert (=> b!1037340 m!957441))

(declare-fun m!957443 () Bool)

(assert (=> bm!43892 m!957443))

(declare-fun m!957445 () Bool)

(assert (=> b!1037341 m!957445))

(declare-fun m!957447 () Bool)

(assert (=> b!1037334 m!957447))

(declare-fun m!957449 () Bool)

(assert (=> b!1037334 m!957449))

(declare-fun m!957451 () Bool)

(assert (=> b!1037334 m!957451))

(declare-fun m!957453 () Bool)

(assert (=> b!1037334 m!957453))

(assert (=> b!1037334 m!957449))

(declare-fun m!957455 () Bool)

(assert (=> b!1037334 m!957455))

(declare-fun m!957457 () Bool)

(assert (=> b!1037334 m!957457))

(assert (=> b!1037334 m!957455))

(declare-fun m!957459 () Bool)

(assert (=> b!1037334 m!957459))

(declare-fun m!957461 () Bool)

(assert (=> b!1037334 m!957461))

(declare-fun m!957463 () Bool)

(assert (=> b!1037334 m!957463))

(declare-fun m!957465 () Bool)

(assert (=> b!1037334 m!957465))

(assert (=> b!1037334 m!957433))

(assert (=> b!1037334 m!957361))

(assert (=> b!1037334 m!957447))

(declare-fun m!957467 () Bool)

(assert (=> b!1037334 m!957467))

(declare-fun m!957469 () Bool)

(assert (=> b!1037334 m!957469))

(declare-fun m!957471 () Bool)

(assert (=> b!1037334 m!957471))

(declare-fun m!957473 () Bool)

(assert (=> b!1037334 m!957473))

(assert (=> b!1037334 m!957465))

(declare-fun m!957475 () Bool)

(assert (=> b!1037334 m!957475))

(assert (=> b!1037326 m!957361))

(assert (=> b!1037326 m!957361))

(declare-fun m!957477 () Bool)

(assert (=> b!1037326 m!957477))

(assert (=> b!1037194 d!125039))

(declare-fun d!125041 () Bool)

(assert (=> d!125041 (= (-!520 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!457297 #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(declare-fun lt!457411 () Unit!33898)

(declare-fun choose!1706 (array!65337 array!65339 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!37667 V!37667 V!37667 Int) Unit!33898)

(assert (=> d!125041 (= lt!457411 (choose!1706 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) lt!457297 (defaultEntry!6269 thiss!1427)))))

(assert (=> d!125041 (validMask!0 (mask!30230 thiss!1427))))

(assert (=> d!125041 (= (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!10 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) lt!457297 (defaultEntry!6269 thiss!1427)) lt!457411)))

(declare-fun bs!30334 () Bool)

(assert (= bs!30334 d!125041))

(assert (=> bs!30334 m!957275))

(assert (=> bs!30334 m!957275))

(assert (=> bs!30334 m!957277))

(assert (=> bs!30334 m!957367))

(declare-fun m!957479 () Bool)

(assert (=> bs!30334 m!957479))

(assert (=> bs!30334 m!957281))

(assert (=> b!1037194 d!125041))

(declare-fun mapNonEmpty!38418 () Bool)

(declare-fun mapRes!38418 () Bool)

(declare-fun tp!73774 () Bool)

(declare-fun e!586767 () Bool)

(assert (=> mapNonEmpty!38418 (= mapRes!38418 (and tp!73774 e!586767))))

(declare-fun mapRest!38418 () (Array (_ BitVec 32) ValueCell!11594))

(declare-fun mapValue!38418 () ValueCell!11594)

(declare-fun mapKey!38418 () (_ BitVec 32))

(assert (=> mapNonEmpty!38418 (= mapRest!38409 (store mapRest!38418 mapKey!38418 mapValue!38418))))

(declare-fun b!1037350 () Bool)

(assert (=> b!1037350 (= e!586767 tp_is_empty!24595)))

(declare-fun mapIsEmpty!38418 () Bool)

(assert (=> mapIsEmpty!38418 mapRes!38418))

(declare-fun b!1037351 () Bool)

(declare-fun e!586766 () Bool)

(assert (=> b!1037351 (= e!586766 tp_is_empty!24595)))

(declare-fun condMapEmpty!38418 () Bool)

(declare-fun mapDefault!38418 () ValueCell!11594)

(assert (=> mapNonEmpty!38409 (= condMapEmpty!38418 (= mapRest!38409 ((as const (Array (_ BitVec 32) ValueCell!11594)) mapDefault!38418)))))

(assert (=> mapNonEmpty!38409 (= tp!73758 (and e!586766 mapRes!38418))))

(assert (= (and mapNonEmpty!38409 condMapEmpty!38418) mapIsEmpty!38418))

(assert (= (and mapNonEmpty!38409 (not condMapEmpty!38418)) mapNonEmpty!38418))

(assert (= (and mapNonEmpty!38418 ((_ is ValueCellFull!11594) mapValue!38418)) b!1037350))

(assert (= (and mapNonEmpty!38409 ((_ is ValueCellFull!11594) mapDefault!38418)) b!1037351))

(declare-fun m!957481 () Bool)

(assert (=> mapNonEmpty!38418 m!957481))

(declare-fun b_lambda!16123 () Bool)

(assert (= b_lambda!16119 (or (and b!1037199 b_free!20875) b_lambda!16123)))

(declare-fun b_lambda!16125 () Bool)

(assert (= b_lambda!16121 (or (and b!1037199 b_free!20875) b_lambda!16125)))

(check-sat (not bm!43889) b_and!33399 (not b!1037320) (not d!125031) (not b!1037321) (not b_next!20875) (not bm!43886) (not mapNonEmpty!38418) (not b!1037324) (not b!1037256) (not b!1037322) (not b!1037334) (not bm!43879) (not bm!43891) (not bm!43882) (not bm!43884) (not b!1037341) (not b_lambda!16125) (not b!1037312) (not d!125029) (not b!1037317) (not d!125041) (not b!1037309) (not b!1037254) (not bm!43892) (not b!1037310) (not d!125025) (not d!125033) (not d!125039) (not b!1037336) (not b!1037316) (not b!1037300) (not b_lambda!16123) (not b!1037304) (not b!1037255) (not b!1037302) (not b!1037333) (not b!1037340) (not b!1037326) (not bm!43885) tp_is_empty!24595 (not d!125037) (not b!1037328) (not d!125027) (not d!125035) (not b_lambda!16117))
(check-sat b_and!33399 (not b_next!20875))
(get-model)

(declare-fun d!125043 () Bool)

(declare-fun e!586772 () Bool)

(assert (=> d!125043 e!586772))

(declare-fun res!692150 () Bool)

(assert (=> d!125043 (=> res!692150 e!586772)))

(declare-fun lt!457423 () Bool)

(assert (=> d!125043 (= res!692150 (not lt!457423))))

(declare-fun lt!457420 () Bool)

(assert (=> d!125043 (= lt!457423 lt!457420)))

(declare-fun lt!457422 () Unit!33898)

(declare-fun e!586773 () Unit!33898)

(assert (=> d!125043 (= lt!457422 e!586773)))

(declare-fun c!105182 () Bool)

(assert (=> d!125043 (= c!105182 lt!457420)))

(declare-fun containsKey!566 (List!21902 (_ BitVec 64)) Bool)

(assert (=> d!125043 (= lt!457420 (containsKey!566 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))) lt!457379))))

(assert (=> d!125043 (= (contains!6046 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))) lt!457379) lt!457423)))

(declare-fun b!1037358 () Bool)

(declare-fun lt!457421 () Unit!33898)

(assert (=> b!1037358 (= e!586773 lt!457421)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!397 (List!21902 (_ BitVec 64)) Unit!33898)

(assert (=> b!1037358 (= lt!457421 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))) lt!457379))))

(declare-datatypes ((Option!636 0))(
  ( (Some!635 (v!14927 V!37667)) (None!634) )
))
(declare-fun isDefined!435 (Option!636) Bool)

(declare-fun getValueByKey!585 (List!21902 (_ BitVec 64)) Option!636)

(assert (=> b!1037358 (isDefined!435 (getValueByKey!585 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))) lt!457379))))

(declare-fun b!1037359 () Bool)

(declare-fun Unit!33902 () Unit!33898)

(assert (=> b!1037359 (= e!586773 Unit!33902)))

(declare-fun b!1037360 () Bool)

(assert (=> b!1037360 (= e!586772 (isDefined!435 (getValueByKey!585 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))) lt!457379)))))

(assert (= (and d!125043 c!105182) b!1037358))

(assert (= (and d!125043 (not c!105182)) b!1037359))

(assert (= (and d!125043 (not res!692150)) b!1037360))

(declare-fun m!957483 () Bool)

(assert (=> d!125043 m!957483))

(declare-fun m!957485 () Bool)

(assert (=> b!1037358 m!957485))

(declare-fun m!957487 () Bool)

(assert (=> b!1037358 m!957487))

(assert (=> b!1037358 m!957487))

(declare-fun m!957489 () Bool)

(assert (=> b!1037358 m!957489))

(assert (=> b!1037360 m!957487))

(assert (=> b!1037360 m!957487))

(assert (=> b!1037360 m!957489))

(assert (=> b!1037310 d!125043))

(declare-fun b!1037385 () Bool)

(declare-fun e!586794 () Bool)

(declare-fun lt!457444 () ListLongMap!13763)

(assert (=> b!1037385 (= e!586794 (= lt!457444 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6269 thiss!1427))))))

(declare-fun b!1037386 () Bool)

(declare-fun isEmpty!933 (ListLongMap!13763) Bool)

(assert (=> b!1037386 (= e!586794 (isEmpty!933 lt!457444))))

(declare-fun d!125045 () Bool)

(declare-fun e!586793 () Bool)

(assert (=> d!125045 e!586793))

(declare-fun res!692162 () Bool)

(assert (=> d!125045 (=> (not res!692162) (not e!586793))))

(assert (=> d!125045 (= res!692162 (not (contains!6046 lt!457444 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!586792 () ListLongMap!13763)

(assert (=> d!125045 (= lt!457444 e!586792)))

(declare-fun c!105191 () Bool)

(assert (=> d!125045 (= c!105191 (bvsge #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(assert (=> d!125045 (validMask!0 (mask!30230 thiss!1427))))

(assert (=> d!125045 (= (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)) lt!457444)))

(declare-fun b!1037387 () Bool)

(declare-fun e!586789 () Bool)

(assert (=> b!1037387 (= e!586789 e!586794)))

(declare-fun c!105192 () Bool)

(assert (=> b!1037387 (= c!105192 (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun b!1037388 () Bool)

(assert (=> b!1037388 (= e!586793 e!586789)))

(declare-fun c!105194 () Bool)

(declare-fun e!586791 () Bool)

(assert (=> b!1037388 (= c!105194 e!586791)))

(declare-fun res!692159 () Bool)

(assert (=> b!1037388 (=> (not res!692159) (not e!586791))))

(assert (=> b!1037388 (= res!692159 (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun b!1037389 () Bool)

(declare-fun lt!457443 () Unit!33898)

(declare-fun lt!457439 () Unit!33898)

(assert (=> b!1037389 (= lt!457443 lt!457439)))

(declare-fun lt!457442 () (_ BitVec 64))

(declare-fun lt!457441 () (_ BitVec 64))

(declare-fun lt!457438 () ListLongMap!13763)

(declare-fun lt!457440 () V!37667)

(assert (=> b!1037389 (not (contains!6046 (+!3127 lt!457438 (tuple2!15729 lt!457442 lt!457440)) lt!457441))))

(declare-fun addStillNotContains!245 (ListLongMap!13763 (_ BitVec 64) V!37667 (_ BitVec 64)) Unit!33898)

(assert (=> b!1037389 (= lt!457439 (addStillNotContains!245 lt!457438 lt!457442 lt!457440 lt!457441))))

(assert (=> b!1037389 (= lt!457441 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1037389 (= lt!457440 (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1037389 (= lt!457442 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun call!43898 () ListLongMap!13763)

(assert (=> b!1037389 (= lt!457438 call!43898)))

(declare-fun e!586790 () ListLongMap!13763)

(assert (=> b!1037389 (= e!586790 (+!3127 call!43898 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1037390 () Bool)

(declare-fun res!692160 () Bool)

(assert (=> b!1037390 (=> (not res!692160) (not e!586793))))

(assert (=> b!1037390 (= res!692160 (not (contains!6046 lt!457444 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1037391 () Bool)

(assert (=> b!1037391 (= e!586792 (ListLongMap!13764 Nil!21899))))

(declare-fun b!1037392 () Bool)

(declare-fun e!586788 () Bool)

(assert (=> b!1037392 (= e!586789 e!586788)))

(assert (=> b!1037392 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun res!692161 () Bool)

(assert (=> b!1037392 (= res!692161 (contains!6046 lt!457444 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1037392 (=> (not res!692161) (not e!586788))))

(declare-fun bm!43895 () Bool)

(assert (=> bm!43895 (= call!43898 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6269 thiss!1427)))))

(declare-fun b!1037393 () Bool)

(assert (=> b!1037393 (= e!586792 e!586790)))

(declare-fun c!105193 () Bool)

(assert (=> b!1037393 (= c!105193 (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037394 () Bool)

(assert (=> b!1037394 (= e!586790 call!43898)))

(declare-fun b!1037395 () Bool)

(assert (=> b!1037395 (= e!586791 (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1037395 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1037396 () Bool)

(assert (=> b!1037396 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(assert (=> b!1037396 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31977 (_values!6292 thiss!1427))))))

(assert (=> b!1037396 (= e!586788 (= (apply!916 lt!457444 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!125045 c!105191) b!1037391))

(assert (= (and d!125045 (not c!105191)) b!1037393))

(assert (= (and b!1037393 c!105193) b!1037389))

(assert (= (and b!1037393 (not c!105193)) b!1037394))

(assert (= (or b!1037389 b!1037394) bm!43895))

(assert (= (and d!125045 res!692162) b!1037390))

(assert (= (and b!1037390 res!692160) b!1037388))

(assert (= (and b!1037388 res!692159) b!1037395))

(assert (= (and b!1037388 c!105194) b!1037392))

(assert (= (and b!1037388 (not c!105194)) b!1037387))

(assert (= (and b!1037392 res!692161) b!1037396))

(assert (= (and b!1037387 c!105192) b!1037385))

(assert (= (and b!1037387 (not c!105192)) b!1037386))

(declare-fun b_lambda!16127 () Bool)

(assert (=> (not b_lambda!16127) (not b!1037389)))

(assert (=> b!1037389 t!31107))

(declare-fun b_and!33401 () Bool)

(assert (= b_and!33399 (and (=> t!31107 result!14419) b_and!33401)))

(declare-fun b_lambda!16129 () Bool)

(assert (=> (not b_lambda!16129) (not b!1037396)))

(assert (=> b!1037396 t!31107))

(declare-fun b_and!33403 () Bool)

(assert (= b_and!33401 (and (=> t!31107 result!14419) b_and!33403)))

(declare-fun m!957491 () Bool)

(assert (=> b!1037385 m!957491))

(declare-fun m!957493 () Bool)

(assert (=> d!125045 m!957493))

(assert (=> d!125045 m!957367))

(declare-fun m!957495 () Bool)

(assert (=> b!1037389 m!957495))

(declare-fun m!957497 () Bool)

(assert (=> b!1037389 m!957497))

(declare-fun m!957499 () Bool)

(assert (=> b!1037389 m!957499))

(assert (=> b!1037389 m!957375))

(assert (=> b!1037389 m!957373))

(assert (=> b!1037389 m!957379))

(assert (=> b!1037389 m!957375))

(declare-fun m!957501 () Bool)

(assert (=> b!1037389 m!957501))

(assert (=> b!1037389 m!957373))

(assert (=> b!1037389 m!957497))

(assert (=> b!1037389 m!957361))

(assert (=> b!1037392 m!957361))

(assert (=> b!1037392 m!957361))

(declare-fun m!957503 () Bool)

(assert (=> b!1037392 m!957503))

(assert (=> b!1037393 m!957361))

(assert (=> b!1037393 m!957361))

(assert (=> b!1037393 m!957363))

(assert (=> b!1037395 m!957361))

(assert (=> b!1037395 m!957361))

(assert (=> b!1037395 m!957363))

(assert (=> bm!43895 m!957491))

(assert (=> b!1037396 m!957375))

(assert (=> b!1037396 m!957373))

(assert (=> b!1037396 m!957379))

(assert (=> b!1037396 m!957375))

(assert (=> b!1037396 m!957361))

(declare-fun m!957505 () Bool)

(assert (=> b!1037396 m!957505))

(assert (=> b!1037396 m!957373))

(assert (=> b!1037396 m!957361))

(declare-fun m!957507 () Bool)

(assert (=> b!1037386 m!957507))

(declare-fun m!957509 () Bool)

(assert (=> b!1037390 m!957509))

(assert (=> b!1037310 d!125045))

(declare-fun d!125047 () Bool)

(assert (=> d!125047 (= (apply!916 (+!3127 lt!457375 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))) lt!457373) (apply!916 lt!457375 lt!457373))))

(declare-fun lt!457447 () Unit!33898)

(declare-fun choose!1707 (ListLongMap!13763 (_ BitVec 64) V!37667 (_ BitVec 64)) Unit!33898)

(assert (=> d!125047 (= lt!457447 (choose!1707 lt!457375 lt!457380 (zeroValue!6103 thiss!1427) lt!457373))))

(declare-fun e!586797 () Bool)

(assert (=> d!125047 e!586797))

(declare-fun res!692165 () Bool)

(assert (=> d!125047 (=> (not res!692165) (not e!586797))))

(assert (=> d!125047 (= res!692165 (contains!6046 lt!457375 lt!457373))))

(assert (=> d!125047 (= (addApplyDifferent!482 lt!457375 lt!457380 (zeroValue!6103 thiss!1427) lt!457373) lt!457447)))

(declare-fun b!1037400 () Bool)

(assert (=> b!1037400 (= e!586797 (not (= lt!457373 lt!457380)))))

(assert (= (and d!125047 res!692165) b!1037400))

(declare-fun m!957511 () Bool)

(assert (=> d!125047 m!957511))

(assert (=> d!125047 m!957405))

(declare-fun m!957513 () Bool)

(assert (=> d!125047 m!957513))

(assert (=> d!125047 m!957401))

(assert (=> d!125047 m!957405))

(assert (=> d!125047 m!957415))

(assert (=> b!1037310 d!125047))

(declare-fun d!125049 () Bool)

(assert (=> d!125049 (contains!6046 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))) lt!457379)))

(declare-fun lt!457450 () Unit!33898)

(declare-fun choose!1708 (ListLongMap!13763 (_ BitVec 64) V!37667 (_ BitVec 64)) Unit!33898)

(assert (=> d!125049 (= lt!457450 (choose!1708 lt!457370 lt!457374 (zeroValue!6103 thiss!1427) lt!457379))))

(assert (=> d!125049 (contains!6046 lt!457370 lt!457379)))

(assert (=> d!125049 (= (addStillContains!626 lt!457370 lt!457374 (zeroValue!6103 thiss!1427) lt!457379) lt!457450)))

(declare-fun bs!30335 () Bool)

(assert (= bs!30335 d!125049))

(assert (=> bs!30335 m!957387))

(assert (=> bs!30335 m!957387))

(assert (=> bs!30335 m!957407))

(declare-fun m!957515 () Bool)

(assert (=> bs!30335 m!957515))

(declare-fun m!957517 () Bool)

(assert (=> bs!30335 m!957517))

(assert (=> b!1037310 d!125049))

(declare-fun d!125051 () Bool)

(assert (=> d!125051 (= (apply!916 (+!3127 lt!457382 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))) lt!457372) (apply!916 lt!457382 lt!457372))))

(declare-fun lt!457451 () Unit!33898)

(assert (=> d!125051 (= lt!457451 (choose!1707 lt!457382 lt!457377 (minValue!6105 thiss!1427) lt!457372))))

(declare-fun e!586798 () Bool)

(assert (=> d!125051 e!586798))

(declare-fun res!692166 () Bool)

(assert (=> d!125051 (=> (not res!692166) (not e!586798))))

(assert (=> d!125051 (= res!692166 (contains!6046 lt!457382 lt!457372))))

(assert (=> d!125051 (= (addApplyDifferent!482 lt!457382 lt!457377 (minValue!6105 thiss!1427) lt!457372) lt!457451)))

(declare-fun b!1037402 () Bool)

(assert (=> b!1037402 (= e!586798 (not (= lt!457372 lt!457377)))))

(assert (= (and d!125051 res!692166) b!1037402))

(declare-fun m!957519 () Bool)

(assert (=> d!125051 m!957519))

(assert (=> d!125051 m!957395))

(declare-fun m!957521 () Bool)

(assert (=> d!125051 m!957521))

(assert (=> d!125051 m!957399))

(assert (=> d!125051 m!957395))

(assert (=> d!125051 m!957397))

(assert (=> b!1037310 d!125051))

(declare-fun d!125053 () Bool)

(declare-fun get!16493 (Option!636) V!37667)

(assert (=> d!125053 (= (apply!916 (+!3127 lt!457382 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))) lt!457372) (get!16493 (getValueByKey!585 (toList!6897 (+!3127 lt!457382 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))) lt!457372)))))

(declare-fun bs!30336 () Bool)

(assert (= bs!30336 d!125053))

(declare-fun m!957523 () Bool)

(assert (=> bs!30336 m!957523))

(assert (=> bs!30336 m!957523))

(declare-fun m!957525 () Bool)

(assert (=> bs!30336 m!957525))

(assert (=> b!1037310 d!125053))

(declare-fun d!125055 () Bool)

(assert (=> d!125055 (= (apply!916 lt!457382 lt!457372) (get!16493 (getValueByKey!585 (toList!6897 lt!457382) lt!457372)))))

(declare-fun bs!30337 () Bool)

(assert (= bs!30337 d!125055))

(declare-fun m!957527 () Bool)

(assert (=> bs!30337 m!957527))

(assert (=> bs!30337 m!957527))

(declare-fun m!957529 () Bool)

(assert (=> bs!30337 m!957529))

(assert (=> b!1037310 d!125055))

(declare-fun d!125057 () Bool)

(assert (=> d!125057 (= (apply!916 (+!3127 lt!457364 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))) lt!457369) (get!16493 (getValueByKey!585 (toList!6897 (+!3127 lt!457364 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))) lt!457369)))))

(declare-fun bs!30338 () Bool)

(assert (= bs!30338 d!125057))

(declare-fun m!957531 () Bool)

(assert (=> bs!30338 m!957531))

(assert (=> bs!30338 m!957531))

(declare-fun m!957533 () Bool)

(assert (=> bs!30338 m!957533))

(assert (=> b!1037310 d!125057))

(declare-fun d!125059 () Bool)

(assert (=> d!125059 (= (apply!916 lt!457375 lt!457373) (get!16493 (getValueByKey!585 (toList!6897 lt!457375) lt!457373)))))

(declare-fun bs!30339 () Bool)

(assert (= bs!30339 d!125059))

(declare-fun m!957535 () Bool)

(assert (=> bs!30339 m!957535))

(assert (=> bs!30339 m!957535))

(declare-fun m!957537 () Bool)

(assert (=> bs!30339 m!957537))

(assert (=> b!1037310 d!125059))

(declare-fun d!125061 () Bool)

(assert (=> d!125061 (= (apply!916 (+!3127 lt!457375 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))) lt!457373) (get!16493 (getValueByKey!585 (toList!6897 (+!3127 lt!457375 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))) lt!457373)))))

(declare-fun bs!30340 () Bool)

(assert (= bs!30340 d!125061))

(declare-fun m!957539 () Bool)

(assert (=> bs!30340 m!957539))

(assert (=> bs!30340 m!957539))

(declare-fun m!957541 () Bool)

(assert (=> bs!30340 m!957541))

(assert (=> b!1037310 d!125061))

(declare-fun d!125063 () Bool)

(declare-fun e!586801 () Bool)

(assert (=> d!125063 e!586801))

(declare-fun res!692171 () Bool)

(assert (=> d!125063 (=> (not res!692171) (not e!586801))))

(declare-fun lt!457461 () ListLongMap!13763)

(assert (=> d!125063 (= res!692171 (contains!6046 lt!457461 (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))))

(declare-fun lt!457463 () List!21902)

(assert (=> d!125063 (= lt!457461 (ListLongMap!13764 lt!457463))))

(declare-fun lt!457462 () Unit!33898)

(declare-fun lt!457460 () Unit!33898)

(assert (=> d!125063 (= lt!457462 lt!457460)))

(assert (=> d!125063 (= (getValueByKey!585 lt!457463 (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!281 (List!21902 (_ BitVec 64) V!37667) Unit!33898)

(assert (=> d!125063 (= lt!457460 (lemmaContainsTupThenGetReturnValue!281 lt!457463 (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))))

(declare-fun insertStrictlySorted!374 (List!21902 (_ BitVec 64) V!37667) List!21902)

(assert (=> d!125063 (= lt!457463 (insertStrictlySorted!374 (toList!6897 lt!457370) (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!125063 (= (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))) lt!457461)))

(declare-fun b!1037407 () Bool)

(declare-fun res!692172 () Bool)

(assert (=> b!1037407 (=> (not res!692172) (not e!586801))))

(assert (=> b!1037407 (= res!692172 (= (getValueByKey!585 (toList!6897 lt!457461) (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))))))

(declare-fun b!1037408 () Bool)

(declare-fun contains!6047 (List!21902 tuple2!15728) Bool)

(assert (=> b!1037408 (= e!586801 (contains!6047 (toList!6897 lt!457461) (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))))

(assert (= (and d!125063 res!692171) b!1037407))

(assert (= (and b!1037407 res!692172) b!1037408))

(declare-fun m!957543 () Bool)

(assert (=> d!125063 m!957543))

(declare-fun m!957545 () Bool)

(assert (=> d!125063 m!957545))

(declare-fun m!957547 () Bool)

(assert (=> d!125063 m!957547))

(declare-fun m!957549 () Bool)

(assert (=> d!125063 m!957549))

(declare-fun m!957551 () Bool)

(assert (=> b!1037407 m!957551))

(declare-fun m!957553 () Bool)

(assert (=> b!1037408 m!957553))

(assert (=> b!1037310 d!125063))

(declare-fun d!125065 () Bool)

(assert (=> d!125065 (= (apply!916 lt!457364 lt!457369) (get!16493 (getValueByKey!585 (toList!6897 lt!457364) lt!457369)))))

(declare-fun bs!30341 () Bool)

(assert (= bs!30341 d!125065))

(declare-fun m!957555 () Bool)

(assert (=> bs!30341 m!957555))

(assert (=> bs!30341 m!957555))

(declare-fun m!957557 () Bool)

(assert (=> bs!30341 m!957557))

(assert (=> b!1037310 d!125065))

(declare-fun d!125067 () Bool)

(declare-fun e!586802 () Bool)

(assert (=> d!125067 e!586802))

(declare-fun res!692173 () Bool)

(assert (=> d!125067 (=> (not res!692173) (not e!586802))))

(declare-fun lt!457465 () ListLongMap!13763)

(assert (=> d!125067 (= res!692173 (contains!6046 lt!457465 (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))))))

(declare-fun lt!457467 () List!21902)

(assert (=> d!125067 (= lt!457465 (ListLongMap!13764 lt!457467))))

(declare-fun lt!457466 () Unit!33898)

(declare-fun lt!457464 () Unit!33898)

(assert (=> d!125067 (= lt!457466 lt!457464)))

(assert (=> d!125067 (= (getValueByKey!585 lt!457467 (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))))))

(assert (=> d!125067 (= lt!457464 (lemmaContainsTupThenGetReturnValue!281 lt!457467 (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))))))

(assert (=> d!125067 (= lt!457467 (insertStrictlySorted!374 (toList!6897 lt!457382) (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))))))

(assert (=> d!125067 (= (+!3127 lt!457382 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))) lt!457465)))

(declare-fun b!1037409 () Bool)

(declare-fun res!692174 () Bool)

(assert (=> b!1037409 (=> (not res!692174) (not e!586802))))

(assert (=> b!1037409 (= res!692174 (= (getValueByKey!585 (toList!6897 lt!457465) (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))))))))

(declare-fun b!1037410 () Bool)

(assert (=> b!1037410 (= e!586802 (contains!6047 (toList!6897 lt!457465) (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))))))

(assert (= (and d!125067 res!692173) b!1037409))

(assert (= (and b!1037409 res!692174) b!1037410))

(declare-fun m!957559 () Bool)

(assert (=> d!125067 m!957559))

(declare-fun m!957561 () Bool)

(assert (=> d!125067 m!957561))

(declare-fun m!957563 () Bool)

(assert (=> d!125067 m!957563))

(declare-fun m!957565 () Bool)

(assert (=> d!125067 m!957565))

(declare-fun m!957567 () Bool)

(assert (=> b!1037409 m!957567))

(declare-fun m!957569 () Bool)

(assert (=> b!1037410 m!957569))

(assert (=> b!1037310 d!125067))

(declare-fun d!125069 () Bool)

(declare-fun e!586803 () Bool)

(assert (=> d!125069 e!586803))

(declare-fun res!692175 () Bool)

(assert (=> d!125069 (=> (not res!692175) (not e!586803))))

(declare-fun lt!457469 () ListLongMap!13763)

(assert (=> d!125069 (= res!692175 (contains!6046 lt!457469 (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))))))

(declare-fun lt!457471 () List!21902)

(assert (=> d!125069 (= lt!457469 (ListLongMap!13764 lt!457471))))

(declare-fun lt!457470 () Unit!33898)

(declare-fun lt!457468 () Unit!33898)

(assert (=> d!125069 (= lt!457470 lt!457468)))

(assert (=> d!125069 (= (getValueByKey!585 lt!457471 (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))))))

(assert (=> d!125069 (= lt!457468 (lemmaContainsTupThenGetReturnValue!281 lt!457471 (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))))))

(assert (=> d!125069 (= lt!457471 (insertStrictlySorted!374 (toList!6897 lt!457364) (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))))))

(assert (=> d!125069 (= (+!3127 lt!457364 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))) lt!457469)))

(declare-fun b!1037411 () Bool)

(declare-fun res!692176 () Bool)

(assert (=> b!1037411 (=> (not res!692176) (not e!586803))))

(assert (=> b!1037411 (= res!692176 (= (getValueByKey!585 (toList!6897 lt!457469) (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))))))))

(declare-fun b!1037412 () Bool)

(assert (=> b!1037412 (= e!586803 (contains!6047 (toList!6897 lt!457469) (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))))))

(assert (= (and d!125069 res!692175) b!1037411))

(assert (= (and b!1037411 res!692176) b!1037412))

(declare-fun m!957571 () Bool)

(assert (=> d!125069 m!957571))

(declare-fun m!957573 () Bool)

(assert (=> d!125069 m!957573))

(declare-fun m!957575 () Bool)

(assert (=> d!125069 m!957575))

(declare-fun m!957577 () Bool)

(assert (=> d!125069 m!957577))

(declare-fun m!957579 () Bool)

(assert (=> b!1037411 m!957579))

(declare-fun m!957581 () Bool)

(assert (=> b!1037412 m!957581))

(assert (=> b!1037310 d!125069))

(declare-fun d!125071 () Bool)

(assert (=> d!125071 (= (apply!916 (+!3127 lt!457364 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))) lt!457369) (apply!916 lt!457364 lt!457369))))

(declare-fun lt!457472 () Unit!33898)

(assert (=> d!125071 (= lt!457472 (choose!1707 lt!457364 lt!457371 (minValue!6105 thiss!1427) lt!457369))))

(declare-fun e!586804 () Bool)

(assert (=> d!125071 e!586804))

(declare-fun res!692177 () Bool)

(assert (=> d!125071 (=> (not res!692177) (not e!586804))))

(assert (=> d!125071 (= res!692177 (contains!6046 lt!457364 lt!457369))))

(assert (=> d!125071 (= (addApplyDifferent!482 lt!457364 lt!457371 (minValue!6105 thiss!1427) lt!457369) lt!457472)))

(declare-fun b!1037413 () Bool)

(assert (=> b!1037413 (= e!586804 (not (= lt!457369 lt!457371)))))

(assert (= (and d!125071 res!692177) b!1037413))

(declare-fun m!957583 () Bool)

(assert (=> d!125071 m!957583))

(assert (=> d!125071 m!957389))

(declare-fun m!957585 () Bool)

(assert (=> d!125071 m!957585))

(assert (=> d!125071 m!957393))

(assert (=> d!125071 m!957389))

(assert (=> d!125071 m!957391))

(assert (=> b!1037310 d!125071))

(declare-fun d!125073 () Bool)

(declare-fun e!586805 () Bool)

(assert (=> d!125073 e!586805))

(declare-fun res!692178 () Bool)

(assert (=> d!125073 (=> (not res!692178) (not e!586805))))

(declare-fun lt!457474 () ListLongMap!13763)

(assert (=> d!125073 (= res!692178 (contains!6046 lt!457474 (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))))))

(declare-fun lt!457476 () List!21902)

(assert (=> d!125073 (= lt!457474 (ListLongMap!13764 lt!457476))))

(declare-fun lt!457475 () Unit!33898)

(declare-fun lt!457473 () Unit!33898)

(assert (=> d!125073 (= lt!457475 lt!457473)))

(assert (=> d!125073 (= (getValueByKey!585 lt!457476 (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!125073 (= lt!457473 (lemmaContainsTupThenGetReturnValue!281 lt!457476 (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!125073 (= lt!457476 (insertStrictlySorted!374 (toList!6897 lt!457375) (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!125073 (= (+!3127 lt!457375 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))) lt!457474)))

(declare-fun b!1037414 () Bool)

(declare-fun res!692179 () Bool)

(assert (=> b!1037414 (=> (not res!692179) (not e!586805))))

(assert (=> b!1037414 (= res!692179 (= (getValueByKey!585 (toList!6897 lt!457474) (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))))))))

(declare-fun b!1037415 () Bool)

(assert (=> b!1037415 (= e!586805 (contains!6047 (toList!6897 lt!457474) (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))))))

(assert (= (and d!125073 res!692178) b!1037414))

(assert (= (and b!1037414 res!692179) b!1037415))

(declare-fun m!957587 () Bool)

(assert (=> d!125073 m!957587))

(declare-fun m!957589 () Bool)

(assert (=> d!125073 m!957589))

(declare-fun m!957591 () Bool)

(assert (=> d!125073 m!957591))

(declare-fun m!957593 () Bool)

(assert (=> d!125073 m!957593))

(declare-fun m!957595 () Bool)

(assert (=> b!1037414 m!957595))

(declare-fun m!957597 () Bool)

(assert (=> b!1037415 m!957597))

(assert (=> b!1037310 d!125073))

(declare-fun d!125075 () Bool)

(declare-fun e!586806 () Bool)

(assert (=> d!125075 e!586806))

(declare-fun res!692180 () Bool)

(assert (=> d!125075 (=> res!692180 e!586806)))

(declare-fun lt!457480 () Bool)

(assert (=> d!125075 (= res!692180 (not lt!457480))))

(declare-fun lt!457477 () Bool)

(assert (=> d!125075 (= lt!457480 lt!457477)))

(declare-fun lt!457479 () Unit!33898)

(declare-fun e!586807 () Unit!33898)

(assert (=> d!125075 (= lt!457479 e!586807)))

(declare-fun c!105195 () Bool)

(assert (=> d!125075 (= c!105195 lt!457477)))

(assert (=> d!125075 (= lt!457477 (containsKey!566 (toList!6897 lt!457408) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125075 (= (contains!6046 lt!457408 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457480)))

(declare-fun b!1037416 () Bool)

(declare-fun lt!457478 () Unit!33898)

(assert (=> b!1037416 (= e!586807 lt!457478)))

(assert (=> b!1037416 (= lt!457478 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457408) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1037416 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457408) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037417 () Bool)

(declare-fun Unit!33903 () Unit!33898)

(assert (=> b!1037417 (= e!586807 Unit!33903)))

(declare-fun b!1037418 () Bool)

(assert (=> b!1037418 (= e!586806 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457408) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125075 c!105195) b!1037416))

(assert (= (and d!125075 (not c!105195)) b!1037417))

(assert (= (and d!125075 (not res!692180)) b!1037418))

(declare-fun m!957599 () Bool)

(assert (=> d!125075 m!957599))

(declare-fun m!957601 () Bool)

(assert (=> b!1037416 m!957601))

(declare-fun m!957603 () Bool)

(assert (=> b!1037416 m!957603))

(assert (=> b!1037416 m!957603))

(declare-fun m!957605 () Bool)

(assert (=> b!1037416 m!957605))

(assert (=> b!1037418 m!957603))

(assert (=> b!1037418 m!957603))

(assert (=> b!1037418 m!957605))

(assert (=> bm!43892 d!125075))

(declare-fun d!125077 () Bool)

(assert (=> d!125077 (= (validMask!0 (mask!30230 thiss!1427)) (and (or (= (mask!30230 thiss!1427) #b00000000000000000000000000000111) (= (mask!30230 thiss!1427) #b00000000000000000000000000001111) (= (mask!30230 thiss!1427) #b00000000000000000000000000011111) (= (mask!30230 thiss!1427) #b00000000000000000000000000111111) (= (mask!30230 thiss!1427) #b00000000000000000000000001111111) (= (mask!30230 thiss!1427) #b00000000000000000000000011111111) (= (mask!30230 thiss!1427) #b00000000000000000000000111111111) (= (mask!30230 thiss!1427) #b00000000000000000000001111111111) (= (mask!30230 thiss!1427) #b00000000000000000000011111111111) (= (mask!30230 thiss!1427) #b00000000000000000000111111111111) (= (mask!30230 thiss!1427) #b00000000000000000001111111111111) (= (mask!30230 thiss!1427) #b00000000000000000011111111111111) (= (mask!30230 thiss!1427) #b00000000000000000111111111111111) (= (mask!30230 thiss!1427) #b00000000000000001111111111111111) (= (mask!30230 thiss!1427) #b00000000000000011111111111111111) (= (mask!30230 thiss!1427) #b00000000000000111111111111111111) (= (mask!30230 thiss!1427) #b00000000000001111111111111111111) (= (mask!30230 thiss!1427) #b00000000000011111111111111111111) (= (mask!30230 thiss!1427) #b00000000000111111111111111111111) (= (mask!30230 thiss!1427) #b00000000001111111111111111111111) (= (mask!30230 thiss!1427) #b00000000011111111111111111111111) (= (mask!30230 thiss!1427) #b00000000111111111111111111111111) (= (mask!30230 thiss!1427) #b00000001111111111111111111111111) (= (mask!30230 thiss!1427) #b00000011111111111111111111111111) (= (mask!30230 thiss!1427) #b00000111111111111111111111111111) (= (mask!30230 thiss!1427) #b00001111111111111111111111111111) (= (mask!30230 thiss!1427) #b00011111111111111111111111111111) (= (mask!30230 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30230 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!125039 d!125077))

(declare-fun d!125079 () Bool)

(declare-fun e!586808 () Bool)

(assert (=> d!125079 e!586808))

(declare-fun res!692181 () Bool)

(assert (=> d!125079 (=> res!692181 e!586808)))

(declare-fun lt!457484 () Bool)

(assert (=> d!125079 (= res!692181 (not lt!457484))))

(declare-fun lt!457481 () Bool)

(assert (=> d!125079 (= lt!457484 lt!457481)))

(declare-fun lt!457483 () Unit!33898)

(declare-fun e!586809 () Unit!33898)

(assert (=> d!125079 (= lt!457483 e!586809)))

(declare-fun c!105196 () Bool)

(assert (=> d!125079 (= c!105196 lt!457481)))

(assert (=> d!125079 (= lt!457481 (containsKey!566 (toList!6897 lt!457385) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125079 (= (contains!6046 lt!457385 #b0000000000000000000000000000000000000000000000000000000000000000) lt!457484)))

(declare-fun b!1037419 () Bool)

(declare-fun lt!457482 () Unit!33898)

(assert (=> b!1037419 (= e!586809 lt!457482)))

(assert (=> b!1037419 (= lt!457482 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457385) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1037419 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457385) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037420 () Bool)

(declare-fun Unit!33904 () Unit!33898)

(assert (=> b!1037420 (= e!586809 Unit!33904)))

(declare-fun b!1037421 () Bool)

(assert (=> b!1037421 (= e!586808 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457385) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125079 c!105196) b!1037419))

(assert (= (and d!125079 (not c!105196)) b!1037420))

(assert (= (and d!125079 (not res!692181)) b!1037421))

(declare-fun m!957607 () Bool)

(assert (=> d!125079 m!957607))

(declare-fun m!957609 () Bool)

(assert (=> b!1037419 m!957609))

(declare-fun m!957611 () Bool)

(assert (=> b!1037419 m!957611))

(assert (=> b!1037419 m!957611))

(declare-fun m!957613 () Bool)

(assert (=> b!1037419 m!957613))

(assert (=> b!1037421 m!957611))

(assert (=> b!1037421 m!957611))

(assert (=> b!1037421 m!957613))

(assert (=> bm!43884 d!125079))

(assert (=> d!125033 d!125077))

(declare-fun d!125081 () Bool)

(assert (=> d!125081 (= (apply!916 lt!457408 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) (get!16493 (getValueByKey!585 (toList!6897 lt!457408) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30342 () Bool)

(assert (= bs!30342 d!125081))

(assert (=> bs!30342 m!957361))

(declare-fun m!957615 () Bool)

(assert (=> bs!30342 m!957615))

(assert (=> bs!30342 m!957615))

(declare-fun m!957617 () Bool)

(assert (=> bs!30342 m!957617))

(assert (=> b!1037328 d!125081))

(declare-fun d!125083 () Bool)

(declare-fun c!105199 () Bool)

(assert (=> d!125083 (= c!105199 ((_ is ValueCellFull!11594) (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!586812 () V!37667)

(assert (=> d!125083 (= (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!586812)))

(declare-fun b!1037426 () Bool)

(declare-fun get!16494 (ValueCell!11594 V!37667) V!37667)

(assert (=> b!1037426 (= e!586812 (get!16494 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1037427 () Bool)

(declare-fun get!16495 (ValueCell!11594 V!37667) V!37667)

(assert (=> b!1037427 (= e!586812 (get!16495 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125083 c!105199) b!1037426))

(assert (= (and d!125083 (not c!105199)) b!1037427))

(assert (=> b!1037426 m!957375))

(assert (=> b!1037426 m!957373))

(declare-fun m!957619 () Bool)

(assert (=> b!1037426 m!957619))

(assert (=> b!1037427 m!957375))

(assert (=> b!1037427 m!957373))

(declare-fun m!957621 () Bool)

(assert (=> b!1037427 m!957621))

(assert (=> b!1037328 d!125083))

(declare-fun d!125085 () Bool)

(assert (=> d!125085 (= (apply!916 lt!457408 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16493 (getValueByKey!585 (toList!6897 lt!457408) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30343 () Bool)

(assert (= bs!30343 d!125085))

(declare-fun m!957623 () Bool)

(assert (=> bs!30343 m!957623))

(assert (=> bs!30343 m!957623))

(declare-fun m!957625 () Bool)

(assert (=> bs!30343 m!957625))

(assert (=> b!1037324 d!125085))

(declare-fun d!125087 () Bool)

(declare-fun e!586813 () Bool)

(assert (=> d!125087 e!586813))

(declare-fun res!692182 () Bool)

(assert (=> d!125087 (=> res!692182 e!586813)))

(declare-fun lt!457488 () Bool)

(assert (=> d!125087 (= res!692182 (not lt!457488))))

(declare-fun lt!457485 () Bool)

(assert (=> d!125087 (= lt!457488 lt!457485)))

(declare-fun lt!457487 () Unit!33898)

(declare-fun e!586814 () Unit!33898)

(assert (=> d!125087 (= lt!457487 e!586814)))

(declare-fun c!105200 () Bool)

(assert (=> d!125087 (= c!105200 lt!457485)))

(assert (=> d!125087 (= lt!457485 (containsKey!566 (toList!6897 lt!457386) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125087 (= (contains!6046 lt!457386 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457488)))

(declare-fun b!1037428 () Bool)

(declare-fun lt!457486 () Unit!33898)

(assert (=> b!1037428 (= e!586814 lt!457486)))

(assert (=> b!1037428 (= lt!457486 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457386) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1037428 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457386) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037429 () Bool)

(declare-fun Unit!33905 () Unit!33898)

(assert (=> b!1037429 (= e!586814 Unit!33905)))

(declare-fun b!1037430 () Bool)

(assert (=> b!1037430 (= e!586813 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457386) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125087 c!105200) b!1037428))

(assert (= (and d!125087 (not c!105200)) b!1037429))

(assert (= (and d!125087 (not res!692182)) b!1037430))

(declare-fun m!957627 () Bool)

(assert (=> d!125087 m!957627))

(declare-fun m!957629 () Bool)

(assert (=> b!1037428 m!957629))

(declare-fun m!957631 () Bool)

(assert (=> b!1037428 m!957631))

(assert (=> b!1037428 m!957631))

(declare-fun m!957633 () Bool)

(assert (=> b!1037428 m!957633))

(assert (=> b!1037430 m!957631))

(assert (=> b!1037430 m!957631))

(assert (=> b!1037430 m!957633))

(assert (=> d!125035 d!125087))

(declare-fun b!1037441 () Bool)

(declare-fun e!586823 () List!21902)

(assert (=> b!1037441 (= e!586823 Nil!21899)))

(declare-fun b!1037442 () Bool)

(declare-fun $colon$colon!604 (List!21902 tuple2!15728) List!21902)

(assert (=> b!1037442 (= e!586823 ($colon$colon!604 (removeStrictlySorted!56 (t!31099 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))) #b1000000000000000000000000000000000000000000000000000000000000000) (h!23109 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))))))

(declare-fun b!1037443 () Bool)

(declare-fun e!586822 () List!21902)

(assert (=> b!1037443 (= e!586822 e!586823)))

(declare-fun c!105205 () Bool)

(assert (=> b!1037443 (= c!105205 (and ((_ is Cons!21898) (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))) (not (= (_1!7875 (h!23109 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1037444 () Bool)

(declare-fun e!586821 () Bool)

(declare-fun lt!457491 () List!21902)

(assert (=> b!1037444 (= e!586821 (not (containsKey!566 lt!457491 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!125089 () Bool)

(assert (=> d!125089 e!586821))

(declare-fun res!692185 () Bool)

(assert (=> d!125089 (=> (not res!692185) (not e!586821))))

(declare-fun isStrictlySorted!707 (List!21902) Bool)

(assert (=> d!125089 (= res!692185 (isStrictlySorted!707 lt!457491))))

(assert (=> d!125089 (= lt!457491 e!586822)))

(declare-fun c!105206 () Bool)

(assert (=> d!125089 (= c!105206 (and ((_ is Cons!21898) (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))) (= (_1!7875 (h!23109 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125089 (isStrictlySorted!707 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))))

(assert (=> d!125089 (= (removeStrictlySorted!56 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457491)))

(declare-fun b!1037445 () Bool)

(assert (=> b!1037445 (= e!586822 (t!31099 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))))

(assert (= (and d!125089 c!105206) b!1037445))

(assert (= (and d!125089 (not c!105206)) b!1037443))

(assert (= (and b!1037443 c!105205) b!1037442))

(assert (= (and b!1037443 (not c!105205)) b!1037441))

(assert (= (and d!125089 res!692185) b!1037444))

(declare-fun m!957635 () Bool)

(assert (=> b!1037442 m!957635))

(assert (=> b!1037442 m!957635))

(declare-fun m!957637 () Bool)

(assert (=> b!1037442 m!957637))

(declare-fun m!957639 () Bool)

(assert (=> b!1037444 m!957639))

(declare-fun m!957641 () Bool)

(assert (=> d!125089 m!957641))

(declare-fun m!957643 () Bool)

(assert (=> d!125089 m!957643))

(assert (=> d!125035 d!125089))

(declare-fun d!125091 () Bool)

(declare-fun e!586824 () Bool)

(assert (=> d!125091 e!586824))

(declare-fun res!692186 () Bool)

(assert (=> d!125091 (=> (not res!692186) (not e!586824))))

(declare-fun lt!457493 () ListLongMap!13763)

(assert (=> d!125091 (= res!692186 (contains!6046 lt!457493 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))

(declare-fun lt!457495 () List!21902)

(assert (=> d!125091 (= lt!457493 (ListLongMap!13764 lt!457495))))

(declare-fun lt!457494 () Unit!33898)

(declare-fun lt!457492 () Unit!33898)

(assert (=> d!125091 (= lt!457494 lt!457492)))

(assert (=> d!125091 (= (getValueByKey!585 lt!457495 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))) (Some!635 (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))

(assert (=> d!125091 (= lt!457492 (lemmaContainsTupThenGetReturnValue!281 lt!457495 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)) (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))

(assert (=> d!125091 (= lt!457495 (insertStrictlySorted!374 (toList!6897 call!43890) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)) (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))

(assert (=> d!125091 (= (+!3127 call!43890 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)) lt!457493)))

(declare-fun b!1037446 () Bool)

(declare-fun res!692187 () Bool)

(assert (=> b!1037446 (=> (not res!692187) (not e!586824))))

(assert (=> b!1037446 (= res!692187 (= (getValueByKey!585 (toList!6897 lt!457493) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))) (Some!635 (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(declare-fun b!1037447 () Bool)

(assert (=> b!1037447 (= e!586824 (contains!6047 (toList!6897 lt!457493) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))

(assert (= (and d!125091 res!692186) b!1037446))

(assert (= (and b!1037446 res!692187) b!1037447))

(declare-fun m!957645 () Bool)

(assert (=> d!125091 m!957645))

(declare-fun m!957647 () Bool)

(assert (=> d!125091 m!957647))

(declare-fun m!957649 () Bool)

(assert (=> d!125091 m!957649))

(declare-fun m!957651 () Bool)

(assert (=> d!125091 m!957651))

(declare-fun m!957653 () Bool)

(assert (=> b!1037446 m!957653))

(declare-fun m!957655 () Bool)

(assert (=> b!1037447 m!957655))

(assert (=> b!1037341 d!125091))

(declare-fun d!125093 () Bool)

(assert (=> d!125093 (= (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1037309 d!125093))

(declare-fun d!125095 () Bool)

(declare-fun e!586825 () Bool)

(assert (=> d!125095 e!586825))

(declare-fun res!692188 () Bool)

(assert (=> d!125095 (=> res!692188 e!586825)))

(declare-fun lt!457499 () Bool)

(assert (=> d!125095 (= res!692188 (not lt!457499))))

(declare-fun lt!457496 () Bool)

(assert (=> d!125095 (= lt!457499 lt!457496)))

(declare-fun lt!457498 () Unit!33898)

(declare-fun e!586826 () Unit!33898)

(assert (=> d!125095 (= lt!457498 e!586826)))

(declare-fun c!105207 () Bool)

(assert (=> d!125095 (= c!105207 lt!457496)))

(assert (=> d!125095 (= lt!457496 (containsKey!566 (toList!6897 lt!457408) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125095 (= (contains!6046 lt!457408 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) lt!457499)))

(declare-fun b!1037448 () Bool)

(declare-fun lt!457497 () Unit!33898)

(assert (=> b!1037448 (= e!586826 lt!457497)))

(assert (=> b!1037448 (= lt!457497 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457408) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1037448 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457408) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037449 () Bool)

(declare-fun Unit!33906 () Unit!33898)

(assert (=> b!1037449 (= e!586826 Unit!33906)))

(declare-fun b!1037450 () Bool)

(assert (=> b!1037450 (= e!586825 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457408) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!125095 c!105207) b!1037448))

(assert (= (and d!125095 (not c!105207)) b!1037449))

(assert (= (and d!125095 (not res!692188)) b!1037450))

(assert (=> d!125095 m!957361))

(declare-fun m!957657 () Bool)

(assert (=> d!125095 m!957657))

(assert (=> b!1037448 m!957361))

(declare-fun m!957659 () Bool)

(assert (=> b!1037448 m!957659))

(assert (=> b!1037448 m!957361))

(assert (=> b!1037448 m!957615))

(assert (=> b!1037448 m!957615))

(declare-fun m!957661 () Bool)

(assert (=> b!1037448 m!957661))

(assert (=> b!1037450 m!957361))

(assert (=> b!1037450 m!957615))

(assert (=> b!1037450 m!957615))

(assert (=> b!1037450 m!957661))

(assert (=> b!1037326 d!125095))

(declare-fun b!1037462 () Bool)

(declare-fun e!586829 () Bool)

(assert (=> b!1037462 (= e!586829 (and (bvsge (extraKeys!5999 lt!457298) #b00000000000000000000000000000000) (bvsle (extraKeys!5999 lt!457298) #b00000000000000000000000000000011) (bvsge (_vacant!2946 lt!457298) #b00000000000000000000000000000000)))))

(declare-fun d!125097 () Bool)

(declare-fun res!692200 () Bool)

(assert (=> d!125097 (=> (not res!692200) (not e!586829))))

(assert (=> d!125097 (= res!692200 (validMask!0 (mask!30230 lt!457298)))))

(assert (=> d!125097 (= (simpleValid!414 lt!457298) e!586829)))

(declare-fun b!1037461 () Bool)

(declare-fun res!692198 () Bool)

(assert (=> b!1037461 (=> (not res!692198) (not e!586829))))

(declare-fun size!31982 (LongMapFixedSize!5782) (_ BitVec 32))

(assert (=> b!1037461 (= res!692198 (= (size!31982 lt!457298) (bvadd (_size!2946 lt!457298) (bvsdiv (bvadd (extraKeys!5999 lt!457298) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1037460 () Bool)

(declare-fun res!692199 () Bool)

(assert (=> b!1037460 (=> (not res!692199) (not e!586829))))

(assert (=> b!1037460 (= res!692199 (bvsge (size!31982 lt!457298) (_size!2946 lt!457298)))))

(declare-fun b!1037459 () Bool)

(declare-fun res!692197 () Bool)

(assert (=> b!1037459 (=> (not res!692197) (not e!586829))))

(assert (=> b!1037459 (= res!692197 (and (= (size!31977 (_values!6292 lt!457298)) (bvadd (mask!30230 lt!457298) #b00000000000000000000000000000001)) (= (size!31976 (_keys!11496 lt!457298)) (size!31977 (_values!6292 lt!457298))) (bvsge (_size!2946 lt!457298) #b00000000000000000000000000000000) (bvsle (_size!2946 lt!457298) (bvadd (mask!30230 lt!457298) #b00000000000000000000000000000001))))))

(assert (= (and d!125097 res!692200) b!1037459))

(assert (= (and b!1037459 res!692197) b!1037460))

(assert (= (and b!1037460 res!692199) b!1037461))

(assert (= (and b!1037461 res!692198) b!1037462))

(declare-fun m!957663 () Bool)

(assert (=> d!125097 m!957663))

(declare-fun m!957665 () Bool)

(assert (=> b!1037461 m!957665))

(assert (=> b!1037460 m!957665))

(assert (=> d!125037 d!125097))

(assert (=> bm!43879 d!125045))

(declare-fun b!1037463 () Bool)

(declare-fun e!586832 () ListLongMap!13763)

(declare-fun e!586842 () ListLongMap!13763)

(assert (=> b!1037463 (= e!586832 e!586842)))

(declare-fun c!105211 () Bool)

(assert (=> b!1037463 (= c!105211 (and (not (= (bvand (extraKeys!5999 lt!457298) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5999 lt!457298) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43896 () Bool)

(declare-fun call!43904 () ListLongMap!13763)

(assert (=> bm!43896 (= call!43904 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 lt!457298) (_values!6292 lt!457298) (mask!30230 lt!457298) (extraKeys!5999 lt!457298) (zeroValue!6103 lt!457298) (minValue!6105 lt!457298) #b00000000000000000000000000000000 (defaultEntry!6269 lt!457298)))))

(declare-fun b!1037464 () Bool)

(declare-fun e!586840 () Bool)

(declare-fun lt!457521 () ListLongMap!13763)

(assert (=> b!1037464 (= e!586840 (= (apply!916 lt!457521 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6103 lt!457298)))))

(declare-fun b!1037465 () Bool)

(declare-fun e!586837 () ListLongMap!13763)

(declare-fun call!43901 () ListLongMap!13763)

(assert (=> b!1037465 (= e!586837 call!43901)))

(declare-fun b!1037466 () Bool)

(declare-fun e!586833 () Bool)

(declare-fun e!586831 () Bool)

(assert (=> b!1037466 (= e!586833 e!586831)))

(declare-fun res!692209 () Bool)

(assert (=> b!1037466 (=> (not res!692209) (not e!586831))))

(assert (=> b!1037466 (= res!692209 (contains!6046 lt!457521 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)))))

(assert (=> b!1037466 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 lt!457298))))))

(declare-fun bm!43897 () Bool)

(declare-fun call!43902 () ListLongMap!13763)

(assert (=> bm!43897 (= call!43901 call!43902)))

(declare-fun b!1037467 () Bool)

(declare-fun e!586835 () Bool)

(assert (=> b!1037467 (= e!586835 e!586840)))

(declare-fun res!692202 () Bool)

(declare-fun call!43903 () Bool)

(assert (=> b!1037467 (= res!692202 call!43903)))

(assert (=> b!1037467 (=> (not res!692202) (not e!586840))))

(declare-fun b!1037468 () Bool)

(assert (=> b!1037468 (= e!586831 (= (apply!916 lt!457521 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)) (get!16492 (select (arr!31448 (_values!6292 lt!457298)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 lt!457298) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1037468 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31977 (_values!6292 lt!457298))))))

(assert (=> b!1037468 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 lt!457298))))))

(declare-fun b!1037469 () Bool)

(declare-fun call!43905 () ListLongMap!13763)

(assert (=> b!1037469 (= e!586837 call!43905)))

(declare-fun b!1037470 () Bool)

(declare-fun res!692204 () Bool)

(declare-fun e!586834 () Bool)

(assert (=> b!1037470 (=> (not res!692204) (not e!586834))))

(assert (=> b!1037470 (= res!692204 e!586833)))

(declare-fun res!692205 () Bool)

(assert (=> b!1037470 (=> res!692205 e!586833)))

(declare-fun e!586838 () Bool)

(assert (=> b!1037470 (= res!692205 (not e!586838))))

(declare-fun res!692201 () Bool)

(assert (=> b!1037470 (=> (not res!692201) (not e!586838))))

(assert (=> b!1037470 (= res!692201 (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 lt!457298))))))

(declare-fun b!1037471 () Bool)

(declare-fun res!692203 () Bool)

(assert (=> b!1037471 (=> (not res!692203) (not e!586834))))

(assert (=> b!1037471 (= res!692203 e!586835)))

(declare-fun c!105208 () Bool)

(assert (=> b!1037471 (= c!105208 (not (= (bvand (extraKeys!5999 lt!457298) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!43898 () Bool)

(assert (=> bm!43898 (= call!43902 call!43904)))

(declare-fun b!1037472 () Bool)

(declare-fun e!586836 () Unit!33898)

(declare-fun Unit!33907 () Unit!33898)

(assert (=> b!1037472 (= e!586836 Unit!33907)))

(declare-fun bm!43899 () Bool)

(declare-fun call!43900 () ListLongMap!13763)

(declare-fun c!105210 () Bool)

(assert (=> bm!43899 (= call!43900 (+!3127 (ite c!105210 call!43904 (ite c!105211 call!43902 call!43901)) (ite (or c!105210 c!105211) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!457298)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298)))))))

(declare-fun b!1037473 () Bool)

(assert (=> b!1037473 (= e!586838 (validKeyInArray!0 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)))))

(declare-fun bm!43900 () Bool)

(assert (=> bm!43900 (= call!43905 call!43900)))

(declare-fun b!1037474 () Bool)

(declare-fun lt!457502 () Unit!33898)

(assert (=> b!1037474 (= e!586836 lt!457502)))

(declare-fun lt!457506 () ListLongMap!13763)

(assert (=> b!1037474 (= lt!457506 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 lt!457298) (_values!6292 lt!457298) (mask!30230 lt!457298) (extraKeys!5999 lt!457298) (zeroValue!6103 lt!457298) (minValue!6105 lt!457298) #b00000000000000000000000000000000 (defaultEntry!6269 lt!457298)))))

(declare-fun lt!457510 () (_ BitVec 64))

(assert (=> b!1037474 (= lt!457510 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!457515 () (_ BitVec 64))

(assert (=> b!1037474 (= lt!457515 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000))))

(declare-fun lt!457514 () Unit!33898)

(assert (=> b!1037474 (= lt!457514 (addStillContains!626 lt!457506 lt!457510 (zeroValue!6103 lt!457298) lt!457515))))

(assert (=> b!1037474 (contains!6046 (+!3127 lt!457506 (tuple2!15729 lt!457510 (zeroValue!6103 lt!457298))) lt!457515)))

(declare-fun lt!457517 () Unit!33898)

(assert (=> b!1037474 (= lt!457517 lt!457514)))

(declare-fun lt!457500 () ListLongMap!13763)

(assert (=> b!1037474 (= lt!457500 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 lt!457298) (_values!6292 lt!457298) (mask!30230 lt!457298) (extraKeys!5999 lt!457298) (zeroValue!6103 lt!457298) (minValue!6105 lt!457298) #b00000000000000000000000000000000 (defaultEntry!6269 lt!457298)))))

(declare-fun lt!457507 () (_ BitVec 64))

(assert (=> b!1037474 (= lt!457507 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!457505 () (_ BitVec 64))

(assert (=> b!1037474 (= lt!457505 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000))))

(declare-fun lt!457504 () Unit!33898)

(assert (=> b!1037474 (= lt!457504 (addApplyDifferent!482 lt!457500 lt!457507 (minValue!6105 lt!457298) lt!457505))))

(assert (=> b!1037474 (= (apply!916 (+!3127 lt!457500 (tuple2!15729 lt!457507 (minValue!6105 lt!457298))) lt!457505) (apply!916 lt!457500 lt!457505))))

(declare-fun lt!457503 () Unit!33898)

(assert (=> b!1037474 (= lt!457503 lt!457504)))

(declare-fun lt!457511 () ListLongMap!13763)

(assert (=> b!1037474 (= lt!457511 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 lt!457298) (_values!6292 lt!457298) (mask!30230 lt!457298) (extraKeys!5999 lt!457298) (zeroValue!6103 lt!457298) (minValue!6105 lt!457298) #b00000000000000000000000000000000 (defaultEntry!6269 lt!457298)))))

(declare-fun lt!457516 () (_ BitVec 64))

(assert (=> b!1037474 (= lt!457516 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!457509 () (_ BitVec 64))

(assert (=> b!1037474 (= lt!457509 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000))))

(declare-fun lt!457519 () Unit!33898)

(assert (=> b!1037474 (= lt!457519 (addApplyDifferent!482 lt!457511 lt!457516 (zeroValue!6103 lt!457298) lt!457509))))

(assert (=> b!1037474 (= (apply!916 (+!3127 lt!457511 (tuple2!15729 lt!457516 (zeroValue!6103 lt!457298))) lt!457509) (apply!916 lt!457511 lt!457509))))

(declare-fun lt!457512 () Unit!33898)

(assert (=> b!1037474 (= lt!457512 lt!457519)))

(declare-fun lt!457518 () ListLongMap!13763)

(assert (=> b!1037474 (= lt!457518 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 lt!457298) (_values!6292 lt!457298) (mask!30230 lt!457298) (extraKeys!5999 lt!457298) (zeroValue!6103 lt!457298) (minValue!6105 lt!457298) #b00000000000000000000000000000000 (defaultEntry!6269 lt!457298)))))

(declare-fun lt!457513 () (_ BitVec 64))

(assert (=> b!1037474 (= lt!457513 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!457508 () (_ BitVec 64))

(assert (=> b!1037474 (= lt!457508 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000))))

(assert (=> b!1037474 (= lt!457502 (addApplyDifferent!482 lt!457518 lt!457513 (minValue!6105 lt!457298) lt!457508))))

(assert (=> b!1037474 (= (apply!916 (+!3127 lt!457518 (tuple2!15729 lt!457513 (minValue!6105 lt!457298))) lt!457508) (apply!916 lt!457518 lt!457508))))

(declare-fun b!1037475 () Bool)

(assert (=> b!1037475 (= e!586835 (not call!43903))))

(declare-fun d!125099 () Bool)

(assert (=> d!125099 e!586834))

(declare-fun res!692207 () Bool)

(assert (=> d!125099 (=> (not res!692207) (not e!586834))))

(assert (=> d!125099 (= res!692207 (or (bvsge #b00000000000000000000000000000000 (size!31976 (_keys!11496 lt!457298))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 lt!457298))))))))

(declare-fun lt!457501 () ListLongMap!13763)

(assert (=> d!125099 (= lt!457521 lt!457501)))

(declare-fun lt!457520 () Unit!33898)

(assert (=> d!125099 (= lt!457520 e!586836)))

(declare-fun c!105212 () Bool)

(declare-fun e!586841 () Bool)

(assert (=> d!125099 (= c!105212 e!586841)))

(declare-fun res!692206 () Bool)

(assert (=> d!125099 (=> (not res!692206) (not e!586841))))

(assert (=> d!125099 (= res!692206 (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 lt!457298))))))

(assert (=> d!125099 (= lt!457501 e!586832)))

(assert (=> d!125099 (= c!105210 (and (not (= (bvand (extraKeys!5999 lt!457298) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5999 lt!457298) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!125099 (validMask!0 (mask!30230 lt!457298))))

(assert (=> d!125099 (= (getCurrentListMap!3943 (_keys!11496 lt!457298) (_values!6292 lt!457298) (mask!30230 lt!457298) (extraKeys!5999 lt!457298) (zeroValue!6103 lt!457298) (minValue!6105 lt!457298) #b00000000000000000000000000000000 (defaultEntry!6269 lt!457298)) lt!457521)))

(declare-fun bm!43901 () Bool)

(assert (=> bm!43901 (= call!43903 (contains!6046 lt!457521 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037476 () Bool)

(assert (=> b!1037476 (= e!586841 (validKeyInArray!0 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)))))

(declare-fun b!1037477 () Bool)

(declare-fun e!586830 () Bool)

(declare-fun e!586839 () Bool)

(assert (=> b!1037477 (= e!586830 e!586839)))

(declare-fun res!692208 () Bool)

(declare-fun call!43899 () Bool)

(assert (=> b!1037477 (= res!692208 call!43899)))

(assert (=> b!1037477 (=> (not res!692208) (not e!586839))))

(declare-fun b!1037478 () Bool)

(assert (=> b!1037478 (= e!586830 (not call!43899))))

(declare-fun b!1037479 () Bool)

(declare-fun c!105213 () Bool)

(assert (=> b!1037479 (= c!105213 (and (not (= (bvand (extraKeys!5999 lt!457298) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5999 lt!457298) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1037479 (= e!586842 e!586837)))

(declare-fun b!1037480 () Bool)

(assert (=> b!1037480 (= e!586839 (= (apply!916 lt!457521 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6105 lt!457298)))))

(declare-fun b!1037481 () Bool)

(assert (=> b!1037481 (= e!586832 (+!3127 call!43900 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298))))))

(declare-fun b!1037482 () Bool)

(assert (=> b!1037482 (= e!586834 e!586830)))

(declare-fun c!105209 () Bool)

(assert (=> b!1037482 (= c!105209 (not (= (bvand (extraKeys!5999 lt!457298) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1037483 () Bool)

(assert (=> b!1037483 (= e!586842 call!43905)))

(declare-fun bm!43902 () Bool)

(assert (=> bm!43902 (= call!43899 (contains!6046 lt!457521 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125099 c!105210) b!1037481))

(assert (= (and d!125099 (not c!105210)) b!1037463))

(assert (= (and b!1037463 c!105211) b!1037483))

(assert (= (and b!1037463 (not c!105211)) b!1037479))

(assert (= (and b!1037479 c!105213) b!1037469))

(assert (= (and b!1037479 (not c!105213)) b!1037465))

(assert (= (or b!1037469 b!1037465) bm!43897))

(assert (= (or b!1037483 bm!43897) bm!43898))

(assert (= (or b!1037483 b!1037469) bm!43900))

(assert (= (or b!1037481 bm!43898) bm!43896))

(assert (= (or b!1037481 bm!43900) bm!43899))

(assert (= (and d!125099 res!692206) b!1037476))

(assert (= (and d!125099 c!105212) b!1037474))

(assert (= (and d!125099 (not c!105212)) b!1037472))

(assert (= (and d!125099 res!692207) b!1037470))

(assert (= (and b!1037470 res!692201) b!1037473))

(assert (= (and b!1037470 (not res!692205)) b!1037466))

(assert (= (and b!1037466 res!692209) b!1037468))

(assert (= (and b!1037470 res!692204) b!1037471))

(assert (= (and b!1037471 c!105208) b!1037467))

(assert (= (and b!1037471 (not c!105208)) b!1037475))

(assert (= (and b!1037467 res!692202) b!1037464))

(assert (= (or b!1037467 b!1037475) bm!43901))

(assert (= (and b!1037471 res!692203) b!1037482))

(assert (= (and b!1037482 c!105209) b!1037477))

(assert (= (and b!1037482 (not c!105209)) b!1037478))

(assert (= (and b!1037477 res!692208) b!1037480))

(assert (= (or b!1037477 b!1037478) bm!43902))

(declare-fun b_lambda!16131 () Bool)

(assert (=> (not b_lambda!16131) (not b!1037468)))

(declare-fun t!31110 () Bool)

(declare-fun tb!7027 () Bool)

(assert (=> (and b!1037199 (= (defaultEntry!6269 thiss!1427) (defaultEntry!6269 lt!457298)) t!31110) tb!7027))

(declare-fun result!14423 () Bool)

(assert (=> tb!7027 (= result!14423 tp_is_empty!24595)))

(assert (=> b!1037468 t!31110))

(declare-fun b_and!33405 () Bool)

(assert (= b_and!33403 (and (=> t!31110 result!14423) b_and!33405)))

(declare-fun m!957667 () Bool)

(assert (=> b!1037464 m!957667))

(declare-fun m!957669 () Bool)

(assert (=> b!1037476 m!957669))

(assert (=> b!1037476 m!957669))

(declare-fun m!957671 () Bool)

(assert (=> b!1037476 m!957671))

(declare-fun m!957673 () Bool)

(assert (=> bm!43896 m!957673))

(assert (=> d!125099 m!957663))

(assert (=> b!1037473 m!957669))

(assert (=> b!1037473 m!957669))

(assert (=> b!1037473 m!957671))

(declare-fun m!957675 () Bool)

(assert (=> bm!43899 m!957675))

(declare-fun m!957677 () Bool)

(assert (=> bm!43901 m!957677))

(declare-fun m!957679 () Bool)

(assert (=> b!1037468 m!957679))

(declare-fun m!957681 () Bool)

(assert (=> b!1037468 m!957681))

(assert (=> b!1037468 m!957669))

(assert (=> b!1037468 m!957669))

(declare-fun m!957683 () Bool)

(assert (=> b!1037468 m!957683))

(assert (=> b!1037468 m!957681))

(assert (=> b!1037468 m!957679))

(declare-fun m!957685 () Bool)

(assert (=> b!1037468 m!957685))

(declare-fun m!957687 () Bool)

(assert (=> b!1037480 m!957687))

(declare-fun m!957689 () Bool)

(assert (=> bm!43902 m!957689))

(declare-fun m!957691 () Bool)

(assert (=> b!1037481 m!957691))

(declare-fun m!957693 () Bool)

(assert (=> b!1037474 m!957693))

(declare-fun m!957695 () Bool)

(assert (=> b!1037474 m!957695))

(declare-fun m!957697 () Bool)

(assert (=> b!1037474 m!957697))

(declare-fun m!957699 () Bool)

(assert (=> b!1037474 m!957699))

(assert (=> b!1037474 m!957695))

(declare-fun m!957701 () Bool)

(assert (=> b!1037474 m!957701))

(declare-fun m!957703 () Bool)

(assert (=> b!1037474 m!957703))

(assert (=> b!1037474 m!957701))

(declare-fun m!957705 () Bool)

(assert (=> b!1037474 m!957705))

(declare-fun m!957707 () Bool)

(assert (=> b!1037474 m!957707))

(declare-fun m!957709 () Bool)

(assert (=> b!1037474 m!957709))

(declare-fun m!957711 () Bool)

(assert (=> b!1037474 m!957711))

(assert (=> b!1037474 m!957673))

(assert (=> b!1037474 m!957669))

(assert (=> b!1037474 m!957693))

(declare-fun m!957713 () Bool)

(assert (=> b!1037474 m!957713))

(declare-fun m!957715 () Bool)

(assert (=> b!1037474 m!957715))

(declare-fun m!957717 () Bool)

(assert (=> b!1037474 m!957717))

(declare-fun m!957719 () Bool)

(assert (=> b!1037474 m!957719))

(assert (=> b!1037474 m!957711))

(declare-fun m!957721 () Bool)

(assert (=> b!1037474 m!957721))

(assert (=> b!1037466 m!957669))

(assert (=> b!1037466 m!957669))

(declare-fun m!957723 () Bool)

(assert (=> b!1037466 m!957723))

(assert (=> d!125025 d!125099))

(declare-fun d!125101 () Bool)

(assert (=> d!125101 (= (apply!916 lt!457385 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16493 (getValueByKey!585 (toList!6897 lt!457385) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30344 () Bool)

(assert (= bs!30344 d!125101))

(declare-fun m!957725 () Bool)

(assert (=> bs!30344 m!957725))

(assert (=> bs!30344 m!957725))

(declare-fun m!957727 () Bool)

(assert (=> bs!30344 m!957727))

(assert (=> b!1037316 d!125101))

(assert (=> d!125029 d!125033))

(declare-fun d!125103 () Bool)

(assert (=> d!125103 (= (apply!916 lt!457385 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16493 (getValueByKey!585 (toList!6897 lt!457385) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30345 () Bool)

(assert (= bs!30345 d!125103))

(assert (=> bs!30345 m!957611))

(assert (=> bs!30345 m!957611))

(declare-fun m!957729 () Bool)

(assert (=> bs!30345 m!957729))

(assert (=> b!1037300 d!125103))

(assert (=> b!1037312 d!125093))

(declare-fun d!125105 () Bool)

(declare-fun lt!457524 () (_ BitVec 32))

(assert (=> d!125105 (and (bvsge lt!457524 #b00000000000000000000000000000000) (bvsle lt!457524 (bvsub (size!31976 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)))))

(declare-fun e!586847 () (_ BitVec 32))

(assert (=> d!125105 (= lt!457524 e!586847)))

(declare-fun c!105219 () Bool)

(assert (=> d!125105 (= c!105219 (bvsge #b00000000000000000000000000000000 (size!31976 (_keys!11496 lt!457298))))))

(assert (=> d!125105 (and (bvsle #b00000000000000000000000000000000 (size!31976 (_keys!11496 lt!457298))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31976 (_keys!11496 lt!457298)) (size!31976 (_keys!11496 lt!457298))))))

(assert (=> d!125105 (= (arrayCountValidKeys!0 (_keys!11496 lt!457298) #b00000000000000000000000000000000 (size!31976 (_keys!11496 lt!457298))) lt!457524)))

(declare-fun b!1037492 () Bool)

(declare-fun e!586848 () (_ BitVec 32))

(declare-fun call!43908 () (_ BitVec 32))

(assert (=> b!1037492 (= e!586848 (bvadd #b00000000000000000000000000000001 call!43908))))

(declare-fun bm!43905 () Bool)

(assert (=> bm!43905 (= call!43908 (arrayCountValidKeys!0 (_keys!11496 lt!457298) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 lt!457298))))))

(declare-fun b!1037493 () Bool)

(assert (=> b!1037493 (= e!586848 call!43908)))

(declare-fun b!1037494 () Bool)

(assert (=> b!1037494 (= e!586847 #b00000000000000000000000000000000)))

(declare-fun b!1037495 () Bool)

(assert (=> b!1037495 (= e!586847 e!586848)))

(declare-fun c!105218 () Bool)

(assert (=> b!1037495 (= c!105218 (validKeyInArray!0 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)))))

(assert (= (and d!125105 c!105219) b!1037494))

(assert (= (and d!125105 (not c!105219)) b!1037495))

(assert (= (and b!1037495 c!105218) b!1037492))

(assert (= (and b!1037495 (not c!105218)) b!1037493))

(assert (= (or b!1037492 b!1037493) bm!43905))

(declare-fun m!957731 () Bool)

(assert (=> bm!43905 m!957731))

(assert (=> b!1037495 m!957669))

(assert (=> b!1037495 m!957669))

(assert (=> b!1037495 m!957671))

(assert (=> b!1037320 d!125105))

(declare-fun b!1037499 () Bool)

(declare-fun e!586849 () Bool)

(assert (=> b!1037499 (= e!586849 (and (bvsge (extraKeys!5999 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5999 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2946 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun d!125107 () Bool)

(declare-fun res!692213 () Bool)

(assert (=> d!125107 (=> (not res!692213) (not e!586849))))

(assert (=> d!125107 (= res!692213 (validMask!0 (mask!30230 thiss!1427)))))

(assert (=> d!125107 (= (simpleValid!414 thiss!1427) e!586849)))

(declare-fun b!1037498 () Bool)

(declare-fun res!692211 () Bool)

(assert (=> b!1037498 (=> (not res!692211) (not e!586849))))

(assert (=> b!1037498 (= res!692211 (= (size!31982 thiss!1427) (bvadd (_size!2946 thiss!1427) (bvsdiv (bvadd (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1037497 () Bool)

(declare-fun res!692212 () Bool)

(assert (=> b!1037497 (=> (not res!692212) (not e!586849))))

(assert (=> b!1037497 (= res!692212 (bvsge (size!31982 thiss!1427) (_size!2946 thiss!1427)))))

(declare-fun b!1037496 () Bool)

(declare-fun res!692210 () Bool)

(assert (=> b!1037496 (=> (not res!692210) (not e!586849))))

(assert (=> b!1037496 (= res!692210 (and (= (size!31977 (_values!6292 thiss!1427)) (bvadd (mask!30230 thiss!1427) #b00000000000000000000000000000001)) (= (size!31976 (_keys!11496 thiss!1427)) (size!31977 (_values!6292 thiss!1427))) (bvsge (_size!2946 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2946 thiss!1427) (bvadd (mask!30230 thiss!1427) #b00000000000000000000000000000001))))))

(assert (= (and d!125107 res!692213) b!1037496))

(assert (= (and b!1037496 res!692210) b!1037497))

(assert (= (and b!1037497 res!692212) b!1037498))

(assert (= (and b!1037498 res!692211) b!1037499))

(assert (=> d!125107 m!957367))

(declare-fun m!957733 () Bool)

(assert (=> b!1037498 m!957733))

(assert (=> b!1037497 m!957733))

(assert (=> d!125031 d!125107))

(declare-fun d!125109 () Bool)

(declare-fun e!586850 () Bool)

(assert (=> d!125109 e!586850))

(declare-fun res!692214 () Bool)

(assert (=> d!125109 (=> res!692214 e!586850)))

(declare-fun lt!457528 () Bool)

(assert (=> d!125109 (= res!692214 (not lt!457528))))

(declare-fun lt!457525 () Bool)

(assert (=> d!125109 (= lt!457528 lt!457525)))

(declare-fun lt!457527 () Unit!33898)

(declare-fun e!586851 () Unit!33898)

(assert (=> d!125109 (= lt!457527 e!586851)))

(declare-fun c!105220 () Bool)

(assert (=> d!125109 (= c!105220 lt!457525)))

(assert (=> d!125109 (= lt!457525 (containsKey!566 (toList!6897 lt!457385) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125109 (= (contains!6046 lt!457385 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457528)))

(declare-fun b!1037500 () Bool)

(declare-fun lt!457526 () Unit!33898)

(assert (=> b!1037500 (= e!586851 lt!457526)))

(assert (=> b!1037500 (= lt!457526 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457385) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1037500 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457385) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037501 () Bool)

(declare-fun Unit!33908 () Unit!33898)

(assert (=> b!1037501 (= e!586851 Unit!33908)))

(declare-fun b!1037502 () Bool)

(assert (=> b!1037502 (= e!586850 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457385) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125109 c!105220) b!1037500))

(assert (= (and d!125109 (not c!105220)) b!1037501))

(assert (= (and d!125109 (not res!692214)) b!1037502))

(declare-fun m!957735 () Bool)

(assert (=> d!125109 m!957735))

(declare-fun m!957737 () Bool)

(assert (=> b!1037500 m!957737))

(assert (=> b!1037500 m!957725))

(assert (=> b!1037500 m!957725))

(declare-fun m!957739 () Bool)

(assert (=> b!1037500 m!957739))

(assert (=> b!1037502 m!957725))

(assert (=> b!1037502 m!957725))

(assert (=> b!1037502 m!957739))

(assert (=> bm!43885 d!125109))

(declare-fun d!125111 () Bool)

(assert (=> d!125111 (= (apply!916 (+!3127 lt!457387 (tuple2!15729 lt!457394 lt!457297)) lt!457392) (get!16493 (getValueByKey!585 (toList!6897 (+!3127 lt!457387 (tuple2!15729 lt!457394 lt!457297))) lt!457392)))))

(declare-fun bs!30346 () Bool)

(assert (= bs!30346 d!125111))

(declare-fun m!957741 () Bool)

(assert (=> bs!30346 m!957741))

(assert (=> bs!30346 m!957741))

(declare-fun m!957743 () Bool)

(assert (=> bs!30346 m!957743))

(assert (=> b!1037334 d!125111))

(declare-fun d!125113 () Bool)

(assert (=> d!125113 (= (apply!916 (+!3127 lt!457405 (tuple2!15729 lt!457400 lt!457297)) lt!457395) (apply!916 lt!457405 lt!457395))))

(declare-fun lt!457529 () Unit!33898)

(assert (=> d!125113 (= lt!457529 (choose!1707 lt!457405 lt!457400 lt!457297 lt!457395))))

(declare-fun e!586852 () Bool)

(assert (=> d!125113 e!586852))

(declare-fun res!692215 () Bool)

(assert (=> d!125113 (=> (not res!692215) (not e!586852))))

(assert (=> d!125113 (= res!692215 (contains!6046 lt!457405 lt!457395))))

(assert (=> d!125113 (= (addApplyDifferent!482 lt!457405 lt!457400 lt!457297 lt!457395) lt!457529)))

(declare-fun b!1037503 () Bool)

(assert (=> b!1037503 (= e!586852 (not (= lt!457395 lt!457400)))))

(assert (= (and d!125113 res!692215) b!1037503))

(declare-fun m!957745 () Bool)

(assert (=> d!125113 m!957745))

(assert (=> d!125113 m!957455))

(declare-fun m!957747 () Bool)

(assert (=> d!125113 m!957747))

(assert (=> d!125113 m!957459))

(assert (=> d!125113 m!957455))

(assert (=> d!125113 m!957457))

(assert (=> b!1037334 d!125113))

(declare-fun e!586859 () Bool)

(declare-fun lt!457536 () ListLongMap!13763)

(declare-fun b!1037504 () Bool)

(assert (=> b!1037504 (= e!586859 (= lt!457536 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!457297 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6269 thiss!1427))))))

(declare-fun b!1037505 () Bool)

(assert (=> b!1037505 (= e!586859 (isEmpty!933 lt!457536))))

(declare-fun d!125115 () Bool)

(declare-fun e!586858 () Bool)

(assert (=> d!125115 e!586858))

(declare-fun res!692219 () Bool)

(assert (=> d!125115 (=> (not res!692219) (not e!586858))))

(assert (=> d!125115 (= res!692219 (not (contains!6046 lt!457536 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!586857 () ListLongMap!13763)

(assert (=> d!125115 (= lt!457536 e!586857)))

(declare-fun c!105221 () Bool)

(assert (=> d!125115 (= c!105221 (bvsge #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(assert (=> d!125115 (validMask!0 (mask!30230 thiss!1427))))

(assert (=> d!125115 (= (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!457297 #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)) lt!457536)))

(declare-fun b!1037506 () Bool)

(declare-fun e!586854 () Bool)

(assert (=> b!1037506 (= e!586854 e!586859)))

(declare-fun c!105222 () Bool)

(assert (=> b!1037506 (= c!105222 (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun b!1037507 () Bool)

(assert (=> b!1037507 (= e!586858 e!586854)))

(declare-fun c!105224 () Bool)

(declare-fun e!586856 () Bool)

(assert (=> b!1037507 (= c!105224 e!586856)))

(declare-fun res!692216 () Bool)

(assert (=> b!1037507 (=> (not res!692216) (not e!586856))))

(assert (=> b!1037507 (= res!692216 (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun b!1037508 () Bool)

(declare-fun lt!457535 () Unit!33898)

(declare-fun lt!457531 () Unit!33898)

(assert (=> b!1037508 (= lt!457535 lt!457531)))

(declare-fun lt!457530 () ListLongMap!13763)

(declare-fun lt!457534 () (_ BitVec 64))

(declare-fun lt!457533 () (_ BitVec 64))

(declare-fun lt!457532 () V!37667)

(assert (=> b!1037508 (not (contains!6046 (+!3127 lt!457530 (tuple2!15729 lt!457534 lt!457532)) lt!457533))))

(assert (=> b!1037508 (= lt!457531 (addStillNotContains!245 lt!457530 lt!457534 lt!457532 lt!457533))))

(assert (=> b!1037508 (= lt!457533 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1037508 (= lt!457532 (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1037508 (= lt!457534 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun call!43909 () ListLongMap!13763)

(assert (=> b!1037508 (= lt!457530 call!43909)))

(declare-fun e!586855 () ListLongMap!13763)

(assert (=> b!1037508 (= e!586855 (+!3127 call!43909 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1037509 () Bool)

(declare-fun res!692217 () Bool)

(assert (=> b!1037509 (=> (not res!692217) (not e!586858))))

(assert (=> b!1037509 (= res!692217 (not (contains!6046 lt!457536 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1037510 () Bool)

(assert (=> b!1037510 (= e!586857 (ListLongMap!13764 Nil!21899))))

(declare-fun b!1037511 () Bool)

(declare-fun e!586853 () Bool)

(assert (=> b!1037511 (= e!586854 e!586853)))

(assert (=> b!1037511 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun res!692218 () Bool)

(assert (=> b!1037511 (= res!692218 (contains!6046 lt!457536 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1037511 (=> (not res!692218) (not e!586853))))

(declare-fun bm!43906 () Bool)

(assert (=> bm!43906 (= call!43909 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!457297 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6269 thiss!1427)))))

(declare-fun b!1037512 () Bool)

(assert (=> b!1037512 (= e!586857 e!586855)))

(declare-fun c!105223 () Bool)

(assert (=> b!1037512 (= c!105223 (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037513 () Bool)

(assert (=> b!1037513 (= e!586855 call!43909)))

(declare-fun b!1037514 () Bool)

(assert (=> b!1037514 (= e!586856 (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1037514 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1037515 () Bool)

(assert (=> b!1037515 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(assert (=> b!1037515 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31977 (_values!6292 thiss!1427))))))

(assert (=> b!1037515 (= e!586853 (= (apply!916 lt!457536 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!125115 c!105221) b!1037510))

(assert (= (and d!125115 (not c!105221)) b!1037512))

(assert (= (and b!1037512 c!105223) b!1037508))

(assert (= (and b!1037512 (not c!105223)) b!1037513))

(assert (= (or b!1037508 b!1037513) bm!43906))

(assert (= (and d!125115 res!692219) b!1037509))

(assert (= (and b!1037509 res!692217) b!1037507))

(assert (= (and b!1037507 res!692216) b!1037514))

(assert (= (and b!1037507 c!105224) b!1037511))

(assert (= (and b!1037507 (not c!105224)) b!1037506))

(assert (= (and b!1037511 res!692218) b!1037515))

(assert (= (and b!1037506 c!105222) b!1037504))

(assert (= (and b!1037506 (not c!105222)) b!1037505))

(declare-fun b_lambda!16133 () Bool)

(assert (=> (not b_lambda!16133) (not b!1037508)))

(assert (=> b!1037508 t!31107))

(declare-fun b_and!33407 () Bool)

(assert (= b_and!33405 (and (=> t!31107 result!14419) b_and!33407)))

(declare-fun b_lambda!16135 () Bool)

(assert (=> (not b_lambda!16135) (not b!1037515)))

(assert (=> b!1037515 t!31107))

(declare-fun b_and!33409 () Bool)

(assert (= b_and!33407 (and (=> t!31107 result!14419) b_and!33409)))

(declare-fun m!957749 () Bool)

(assert (=> b!1037504 m!957749))

(declare-fun m!957751 () Bool)

(assert (=> d!125115 m!957751))

(assert (=> d!125115 m!957367))

(declare-fun m!957753 () Bool)

(assert (=> b!1037508 m!957753))

(declare-fun m!957755 () Bool)

(assert (=> b!1037508 m!957755))

(declare-fun m!957757 () Bool)

(assert (=> b!1037508 m!957757))

(assert (=> b!1037508 m!957375))

(assert (=> b!1037508 m!957373))

(assert (=> b!1037508 m!957379))

(assert (=> b!1037508 m!957375))

(declare-fun m!957759 () Bool)

(assert (=> b!1037508 m!957759))

(assert (=> b!1037508 m!957373))

(assert (=> b!1037508 m!957755))

(assert (=> b!1037508 m!957361))

(assert (=> b!1037511 m!957361))

(assert (=> b!1037511 m!957361))

(declare-fun m!957761 () Bool)

(assert (=> b!1037511 m!957761))

(assert (=> b!1037512 m!957361))

(assert (=> b!1037512 m!957361))

(assert (=> b!1037512 m!957363))

(assert (=> b!1037514 m!957361))

(assert (=> b!1037514 m!957361))

(assert (=> b!1037514 m!957363))

(assert (=> bm!43906 m!957749))

(assert (=> b!1037515 m!957375))

(assert (=> b!1037515 m!957373))

(assert (=> b!1037515 m!957379))

(assert (=> b!1037515 m!957375))

(assert (=> b!1037515 m!957361))

(declare-fun m!957763 () Bool)

(assert (=> b!1037515 m!957763))

(assert (=> b!1037515 m!957373))

(assert (=> b!1037515 m!957361))

(declare-fun m!957765 () Bool)

(assert (=> b!1037505 m!957765))

(declare-fun m!957767 () Bool)

(assert (=> b!1037509 m!957767))

(assert (=> b!1037334 d!125115))

(declare-fun d!125117 () Bool)

(assert (=> d!125117 (= (apply!916 lt!457405 lt!457395) (get!16493 (getValueByKey!585 (toList!6897 lt!457405) lt!457395)))))

(declare-fun bs!30347 () Bool)

(assert (= bs!30347 d!125117))

(declare-fun m!957769 () Bool)

(assert (=> bs!30347 m!957769))

(assert (=> bs!30347 m!957769))

(declare-fun m!957771 () Bool)

(assert (=> bs!30347 m!957771))

(assert (=> b!1037334 d!125117))

(declare-fun d!125119 () Bool)

(assert (=> d!125119 (= (apply!916 (+!3127 lt!457405 (tuple2!15729 lt!457400 lt!457297)) lt!457395) (get!16493 (getValueByKey!585 (toList!6897 (+!3127 lt!457405 (tuple2!15729 lt!457400 lt!457297))) lt!457395)))))

(declare-fun bs!30348 () Bool)

(assert (= bs!30348 d!125119))

(declare-fun m!957773 () Bool)

(assert (=> bs!30348 m!957773))

(assert (=> bs!30348 m!957773))

(declare-fun m!957775 () Bool)

(assert (=> bs!30348 m!957775))

(assert (=> b!1037334 d!125119))

(declare-fun d!125121 () Bool)

(declare-fun e!586860 () Bool)

(assert (=> d!125121 e!586860))

(declare-fun res!692220 () Bool)

(assert (=> d!125121 (=> (not res!692220) (not e!586860))))

(declare-fun lt!457538 () ListLongMap!13763)

(assert (=> d!125121 (= res!692220 (contains!6046 lt!457538 (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))))))

(declare-fun lt!457540 () List!21902)

(assert (=> d!125121 (= lt!457538 (ListLongMap!13764 lt!457540))))

(declare-fun lt!457539 () Unit!33898)

(declare-fun lt!457537 () Unit!33898)

(assert (=> d!125121 (= lt!457539 lt!457537)))

(assert (=> d!125121 (= (getValueByKey!585 lt!457540 (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!125121 (= lt!457537 (lemmaContainsTupThenGetReturnValue!281 lt!457540 (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!125121 (= lt!457540 (insertStrictlySorted!374 (toList!6897 lt!457398) (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!125121 (= (+!3127 lt!457398 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))) lt!457538)))

(declare-fun b!1037516 () Bool)

(declare-fun res!692221 () Bool)

(assert (=> b!1037516 (=> (not res!692221) (not e!586860))))

(assert (=> b!1037516 (= res!692221 (= (getValueByKey!585 (toList!6897 lt!457538) (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))))))))

(declare-fun b!1037517 () Bool)

(assert (=> b!1037517 (= e!586860 (contains!6047 (toList!6897 lt!457538) (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))))))

(assert (= (and d!125121 res!692220) b!1037516))

(assert (= (and b!1037516 res!692221) b!1037517))

(declare-fun m!957777 () Bool)

(assert (=> d!125121 m!957777))

(declare-fun m!957779 () Bool)

(assert (=> d!125121 m!957779))

(declare-fun m!957781 () Bool)

(assert (=> d!125121 m!957781))

(declare-fun m!957783 () Bool)

(assert (=> d!125121 m!957783))

(declare-fun m!957785 () Bool)

(assert (=> b!1037516 m!957785))

(declare-fun m!957787 () Bool)

(assert (=> b!1037517 m!957787))

(assert (=> b!1037334 d!125121))

(declare-fun d!125123 () Bool)

(assert (=> d!125123 (= (apply!916 (+!3127 lt!457387 (tuple2!15729 lt!457394 lt!457297)) lt!457392) (apply!916 lt!457387 lt!457392))))

(declare-fun lt!457541 () Unit!33898)

(assert (=> d!125123 (= lt!457541 (choose!1707 lt!457387 lt!457394 lt!457297 lt!457392))))

(declare-fun e!586861 () Bool)

(assert (=> d!125123 e!586861))

(declare-fun res!692222 () Bool)

(assert (=> d!125123 (=> (not res!692222) (not e!586861))))

(assert (=> d!125123 (= res!692222 (contains!6046 lt!457387 lt!457392))))

(assert (=> d!125123 (= (addApplyDifferent!482 lt!457387 lt!457394 lt!457297 lt!457392) lt!457541)))

(declare-fun b!1037518 () Bool)

(assert (=> b!1037518 (= e!586861 (not (= lt!457392 lt!457394)))))

(assert (= (and d!125123 res!692222) b!1037518))

(declare-fun m!957789 () Bool)

(assert (=> d!125123 m!957789))

(assert (=> d!125123 m!957449))

(declare-fun m!957791 () Bool)

(assert (=> d!125123 m!957791))

(assert (=> d!125123 m!957453))

(assert (=> d!125123 m!957449))

(assert (=> d!125123 m!957451))

(assert (=> b!1037334 d!125123))

(declare-fun d!125125 () Bool)

(assert (=> d!125125 (= (apply!916 (+!3127 lt!457398 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))) lt!457396) (get!16493 (getValueByKey!585 (toList!6897 (+!3127 lt!457398 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))) lt!457396)))))

(declare-fun bs!30349 () Bool)

(assert (= bs!30349 d!125125))

(declare-fun m!957793 () Bool)

(assert (=> bs!30349 m!957793))

(assert (=> bs!30349 m!957793))

(declare-fun m!957795 () Bool)

(assert (=> bs!30349 m!957795))

(assert (=> b!1037334 d!125125))

(declare-fun d!125127 () Bool)

(declare-fun e!586862 () Bool)

(assert (=> d!125127 e!586862))

(declare-fun res!692223 () Bool)

(assert (=> d!125127 (=> res!692223 e!586862)))

(declare-fun lt!457545 () Bool)

(assert (=> d!125127 (= res!692223 (not lt!457545))))

(declare-fun lt!457542 () Bool)

(assert (=> d!125127 (= lt!457545 lt!457542)))

(declare-fun lt!457544 () Unit!33898)

(declare-fun e!586863 () Unit!33898)

(assert (=> d!125127 (= lt!457544 e!586863)))

(declare-fun c!105225 () Bool)

(assert (=> d!125127 (= c!105225 lt!457542)))

(assert (=> d!125127 (= lt!457542 (containsKey!566 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))) lt!457402))))

(assert (=> d!125127 (= (contains!6046 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))) lt!457402) lt!457545)))

(declare-fun b!1037519 () Bool)

(declare-fun lt!457543 () Unit!33898)

(assert (=> b!1037519 (= e!586863 lt!457543)))

(assert (=> b!1037519 (= lt!457543 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))) lt!457402))))

(assert (=> b!1037519 (isDefined!435 (getValueByKey!585 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))) lt!457402))))

(declare-fun b!1037520 () Bool)

(declare-fun Unit!33909 () Unit!33898)

(assert (=> b!1037520 (= e!586863 Unit!33909)))

(declare-fun b!1037521 () Bool)

(assert (=> b!1037521 (= e!586862 (isDefined!435 (getValueByKey!585 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))) lt!457402)))))

(assert (= (and d!125127 c!105225) b!1037519))

(assert (= (and d!125127 (not c!105225)) b!1037520))

(assert (= (and d!125127 (not res!692223)) b!1037521))

(declare-fun m!957797 () Bool)

(assert (=> d!125127 m!957797))

(declare-fun m!957799 () Bool)

(assert (=> b!1037519 m!957799))

(declare-fun m!957801 () Bool)

(assert (=> b!1037519 m!957801))

(assert (=> b!1037519 m!957801))

(declare-fun m!957803 () Bool)

(assert (=> b!1037519 m!957803))

(assert (=> b!1037521 m!957801))

(assert (=> b!1037521 m!957801))

(assert (=> b!1037521 m!957803))

(assert (=> b!1037334 d!125127))

(declare-fun d!125129 () Bool)

(assert (=> d!125129 (= (apply!916 (+!3127 lt!457398 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))) lt!457396) (apply!916 lt!457398 lt!457396))))

(declare-fun lt!457546 () Unit!33898)

(assert (=> d!125129 (= lt!457546 (choose!1707 lt!457398 lt!457403 (zeroValue!6103 thiss!1427) lt!457396))))

(declare-fun e!586864 () Bool)

(assert (=> d!125129 e!586864))

(declare-fun res!692224 () Bool)

(assert (=> d!125129 (=> (not res!692224) (not e!586864))))

(assert (=> d!125129 (= res!692224 (contains!6046 lt!457398 lt!457396))))

(assert (=> d!125129 (= (addApplyDifferent!482 lt!457398 lt!457403 (zeroValue!6103 thiss!1427) lt!457396) lt!457546)))

(declare-fun b!1037522 () Bool)

(assert (=> b!1037522 (= e!586864 (not (= lt!457396 lt!457403)))))

(assert (= (and d!125129 res!692224) b!1037522))

(declare-fun m!957805 () Bool)

(assert (=> d!125129 m!957805))

(assert (=> d!125129 m!957465))

(declare-fun m!957807 () Bool)

(assert (=> d!125129 m!957807))

(assert (=> d!125129 m!957461))

(assert (=> d!125129 m!957465))

(assert (=> d!125129 m!957475))

(assert (=> b!1037334 d!125129))

(declare-fun d!125131 () Bool)

(assert (=> d!125131 (= (apply!916 lt!457387 lt!457392) (get!16493 (getValueByKey!585 (toList!6897 lt!457387) lt!457392)))))

(declare-fun bs!30350 () Bool)

(assert (= bs!30350 d!125131))

(declare-fun m!957809 () Bool)

(assert (=> bs!30350 m!957809))

(assert (=> bs!30350 m!957809))

(declare-fun m!957811 () Bool)

(assert (=> bs!30350 m!957811))

(assert (=> b!1037334 d!125131))

(declare-fun d!125133 () Bool)

(assert (=> d!125133 (contains!6046 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))) lt!457402)))

(declare-fun lt!457547 () Unit!33898)

(assert (=> d!125133 (= lt!457547 (choose!1708 lt!457393 lt!457397 (zeroValue!6103 thiss!1427) lt!457402))))

(assert (=> d!125133 (contains!6046 lt!457393 lt!457402)))

(assert (=> d!125133 (= (addStillContains!626 lt!457393 lt!457397 (zeroValue!6103 thiss!1427) lt!457402) lt!457547)))

(declare-fun bs!30351 () Bool)

(assert (= bs!30351 d!125133))

(assert (=> bs!30351 m!957447))

(assert (=> bs!30351 m!957447))

(assert (=> bs!30351 m!957467))

(declare-fun m!957813 () Bool)

(assert (=> bs!30351 m!957813))

(declare-fun m!957815 () Bool)

(assert (=> bs!30351 m!957815))

(assert (=> b!1037334 d!125133))

(declare-fun d!125135 () Bool)

(declare-fun e!586865 () Bool)

(assert (=> d!125135 e!586865))

(declare-fun res!692225 () Bool)

(assert (=> d!125135 (=> (not res!692225) (not e!586865))))

(declare-fun lt!457549 () ListLongMap!13763)

(assert (=> d!125135 (= res!692225 (contains!6046 lt!457549 (_1!7875 (tuple2!15729 lt!457400 lt!457297))))))

(declare-fun lt!457551 () List!21902)

(assert (=> d!125135 (= lt!457549 (ListLongMap!13764 lt!457551))))

(declare-fun lt!457550 () Unit!33898)

(declare-fun lt!457548 () Unit!33898)

(assert (=> d!125135 (= lt!457550 lt!457548)))

(assert (=> d!125135 (= (getValueByKey!585 lt!457551 (_1!7875 (tuple2!15729 lt!457400 lt!457297))) (Some!635 (_2!7875 (tuple2!15729 lt!457400 lt!457297))))))

(assert (=> d!125135 (= lt!457548 (lemmaContainsTupThenGetReturnValue!281 lt!457551 (_1!7875 (tuple2!15729 lt!457400 lt!457297)) (_2!7875 (tuple2!15729 lt!457400 lt!457297))))))

(assert (=> d!125135 (= lt!457551 (insertStrictlySorted!374 (toList!6897 lt!457405) (_1!7875 (tuple2!15729 lt!457400 lt!457297)) (_2!7875 (tuple2!15729 lt!457400 lt!457297))))))

(assert (=> d!125135 (= (+!3127 lt!457405 (tuple2!15729 lt!457400 lt!457297)) lt!457549)))

(declare-fun b!1037523 () Bool)

(declare-fun res!692226 () Bool)

(assert (=> b!1037523 (=> (not res!692226) (not e!586865))))

(assert (=> b!1037523 (= res!692226 (= (getValueByKey!585 (toList!6897 lt!457549) (_1!7875 (tuple2!15729 lt!457400 lt!457297))) (Some!635 (_2!7875 (tuple2!15729 lt!457400 lt!457297)))))))

(declare-fun b!1037524 () Bool)

(assert (=> b!1037524 (= e!586865 (contains!6047 (toList!6897 lt!457549) (tuple2!15729 lt!457400 lt!457297)))))

(assert (= (and d!125135 res!692225) b!1037523))

(assert (= (and b!1037523 res!692226) b!1037524))

(declare-fun m!957817 () Bool)

(assert (=> d!125135 m!957817))

(declare-fun m!957819 () Bool)

(assert (=> d!125135 m!957819))

(declare-fun m!957821 () Bool)

(assert (=> d!125135 m!957821))

(declare-fun m!957823 () Bool)

(assert (=> d!125135 m!957823))

(declare-fun m!957825 () Bool)

(assert (=> b!1037523 m!957825))

(declare-fun m!957827 () Bool)

(assert (=> b!1037524 m!957827))

(assert (=> b!1037334 d!125135))

(declare-fun d!125137 () Bool)

(declare-fun e!586866 () Bool)

(assert (=> d!125137 e!586866))

(declare-fun res!692227 () Bool)

(assert (=> d!125137 (=> (not res!692227) (not e!586866))))

(declare-fun lt!457553 () ListLongMap!13763)

(assert (=> d!125137 (= res!692227 (contains!6046 lt!457553 (_1!7875 (tuple2!15729 lt!457394 lt!457297))))))

(declare-fun lt!457555 () List!21902)

(assert (=> d!125137 (= lt!457553 (ListLongMap!13764 lt!457555))))

(declare-fun lt!457554 () Unit!33898)

(declare-fun lt!457552 () Unit!33898)

(assert (=> d!125137 (= lt!457554 lt!457552)))

(assert (=> d!125137 (= (getValueByKey!585 lt!457555 (_1!7875 (tuple2!15729 lt!457394 lt!457297))) (Some!635 (_2!7875 (tuple2!15729 lt!457394 lt!457297))))))

(assert (=> d!125137 (= lt!457552 (lemmaContainsTupThenGetReturnValue!281 lt!457555 (_1!7875 (tuple2!15729 lt!457394 lt!457297)) (_2!7875 (tuple2!15729 lt!457394 lt!457297))))))

(assert (=> d!125137 (= lt!457555 (insertStrictlySorted!374 (toList!6897 lt!457387) (_1!7875 (tuple2!15729 lt!457394 lt!457297)) (_2!7875 (tuple2!15729 lt!457394 lt!457297))))))

(assert (=> d!125137 (= (+!3127 lt!457387 (tuple2!15729 lt!457394 lt!457297)) lt!457553)))

(declare-fun b!1037525 () Bool)

(declare-fun res!692228 () Bool)

(assert (=> b!1037525 (=> (not res!692228) (not e!586866))))

(assert (=> b!1037525 (= res!692228 (= (getValueByKey!585 (toList!6897 lt!457553) (_1!7875 (tuple2!15729 lt!457394 lt!457297))) (Some!635 (_2!7875 (tuple2!15729 lt!457394 lt!457297)))))))

(declare-fun b!1037526 () Bool)

(assert (=> b!1037526 (= e!586866 (contains!6047 (toList!6897 lt!457553) (tuple2!15729 lt!457394 lt!457297)))))

(assert (= (and d!125137 res!692227) b!1037525))

(assert (= (and b!1037525 res!692228) b!1037526))

(declare-fun m!957829 () Bool)

(assert (=> d!125137 m!957829))

(declare-fun m!957831 () Bool)

(assert (=> d!125137 m!957831))

(declare-fun m!957833 () Bool)

(assert (=> d!125137 m!957833))

(declare-fun m!957835 () Bool)

(assert (=> d!125137 m!957835))

(declare-fun m!957837 () Bool)

(assert (=> b!1037525 m!957837))

(declare-fun m!957839 () Bool)

(assert (=> b!1037526 m!957839))

(assert (=> b!1037334 d!125137))

(declare-fun d!125139 () Bool)

(assert (=> d!125139 (= (apply!916 lt!457398 lt!457396) (get!16493 (getValueByKey!585 (toList!6897 lt!457398) lt!457396)))))

(declare-fun bs!30352 () Bool)

(assert (= bs!30352 d!125139))

(declare-fun m!957841 () Bool)

(assert (=> bs!30352 m!957841))

(assert (=> bs!30352 m!957841))

(declare-fun m!957843 () Bool)

(assert (=> bs!30352 m!957843))

(assert (=> b!1037334 d!125139))

(declare-fun d!125141 () Bool)

(declare-fun e!586867 () Bool)

(assert (=> d!125141 e!586867))

(declare-fun res!692229 () Bool)

(assert (=> d!125141 (=> (not res!692229) (not e!586867))))

(declare-fun lt!457557 () ListLongMap!13763)

(assert (=> d!125141 (= res!692229 (contains!6046 lt!457557 (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))))

(declare-fun lt!457559 () List!21902)

(assert (=> d!125141 (= lt!457557 (ListLongMap!13764 lt!457559))))

(declare-fun lt!457558 () Unit!33898)

(declare-fun lt!457556 () Unit!33898)

(assert (=> d!125141 (= lt!457558 lt!457556)))

(assert (=> d!125141 (= (getValueByKey!585 lt!457559 (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!125141 (= lt!457556 (lemmaContainsTupThenGetReturnValue!281 lt!457559 (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!125141 (= lt!457559 (insertStrictlySorted!374 (toList!6897 lt!457393) (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!125141 (= (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))) lt!457557)))

(declare-fun b!1037527 () Bool)

(declare-fun res!692230 () Bool)

(assert (=> b!1037527 (=> (not res!692230) (not e!586867))))

(assert (=> b!1037527 (= res!692230 (= (getValueByKey!585 (toList!6897 lt!457557) (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))))))

(declare-fun b!1037528 () Bool)

(assert (=> b!1037528 (= e!586867 (contains!6047 (toList!6897 lt!457557) (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))))

(assert (= (and d!125141 res!692229) b!1037527))

(assert (= (and b!1037527 res!692230) b!1037528))

(declare-fun m!957845 () Bool)

(assert (=> d!125141 m!957845))

(declare-fun m!957847 () Bool)

(assert (=> d!125141 m!957847))

(declare-fun m!957849 () Bool)

(assert (=> d!125141 m!957849))

(declare-fun m!957851 () Bool)

(assert (=> d!125141 m!957851))

(declare-fun m!957853 () Bool)

(assert (=> b!1037527 m!957853))

(declare-fun m!957855 () Bool)

(assert (=> b!1037528 m!957855))

(assert (=> b!1037334 d!125141))

(declare-fun d!125143 () Bool)

(declare-fun lt!457560 () (_ BitVec 32))

(assert (=> d!125143 (and (bvsge lt!457560 #b00000000000000000000000000000000) (bvsle lt!457560 (bvsub (size!31976 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!586868 () (_ BitVec 32))

(assert (=> d!125143 (= lt!457560 e!586868)))

(declare-fun c!105227 () Bool)

(assert (=> d!125143 (= c!105227 (bvsge #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(assert (=> d!125143 (and (bvsle #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31976 (_keys!11496 thiss!1427)) (size!31976 (_keys!11496 thiss!1427))))))

(assert (=> d!125143 (= (arrayCountValidKeys!0 (_keys!11496 thiss!1427) #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))) lt!457560)))

(declare-fun b!1037529 () Bool)

(declare-fun e!586869 () (_ BitVec 32))

(declare-fun call!43910 () (_ BitVec 32))

(assert (=> b!1037529 (= e!586869 (bvadd #b00000000000000000000000000000001 call!43910))))

(declare-fun bm!43907 () Bool)

(assert (=> bm!43907 (= call!43910 (arrayCountValidKeys!0 (_keys!11496 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun b!1037530 () Bool)

(assert (=> b!1037530 (= e!586869 call!43910)))

(declare-fun b!1037531 () Bool)

(assert (=> b!1037531 (= e!586868 #b00000000000000000000000000000000)))

(declare-fun b!1037532 () Bool)

(assert (=> b!1037532 (= e!586868 e!586869)))

(declare-fun c!105226 () Bool)

(assert (=> b!1037532 (= c!105226 (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125143 c!105227) b!1037531))

(assert (= (and d!125143 (not c!105227)) b!1037532))

(assert (= (and b!1037532 c!105226) b!1037529))

(assert (= (and b!1037532 (not c!105226)) b!1037530))

(assert (= (or b!1037529 b!1037530) bm!43907))

(declare-fun m!957857 () Bool)

(assert (=> bm!43907 m!957857))

(assert (=> b!1037532 m!957361))

(assert (=> b!1037532 m!957361))

(assert (=> b!1037532 m!957363))

(assert (=> b!1037254 d!125143))

(declare-fun b!1037541 () Bool)

(declare-fun e!586876 () Bool)

(declare-fun e!586877 () Bool)

(assert (=> b!1037541 (= e!586876 e!586877)))

(declare-fun c!105230 () Bool)

(assert (=> b!1037541 (= c!105230 (validKeyInArray!0 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)))))

(declare-fun b!1037542 () Bool)

(declare-fun e!586878 () Bool)

(assert (=> b!1037542 (= e!586877 e!586878)))

(declare-fun lt!457567 () (_ BitVec 64))

(assert (=> b!1037542 (= lt!457567 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000))))

(declare-fun lt!457569 () Unit!33898)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65337 (_ BitVec 64) (_ BitVec 32)) Unit!33898)

(assert (=> b!1037542 (= lt!457569 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11496 lt!457298) lt!457567 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1037542 (arrayContainsKey!0 (_keys!11496 lt!457298) lt!457567 #b00000000000000000000000000000000)))

(declare-fun lt!457568 () Unit!33898)

(assert (=> b!1037542 (= lt!457568 lt!457569)))

(declare-fun res!692235 () Bool)

(declare-datatypes ((SeekEntryResult!9703 0))(
  ( (MissingZero!9703 (index!41183 (_ BitVec 32))) (Found!9703 (index!41184 (_ BitVec 32))) (Intermediate!9703 (undefined!10515 Bool) (index!41185 (_ BitVec 32)) (x!92451 (_ BitVec 32))) (Undefined!9703) (MissingVacant!9703 (index!41186 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65337 (_ BitVec 32)) SeekEntryResult!9703)

(assert (=> b!1037542 (= res!692235 (= (seekEntryOrOpen!0 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000) (_keys!11496 lt!457298) (mask!30230 lt!457298)) (Found!9703 #b00000000000000000000000000000000)))))

(assert (=> b!1037542 (=> (not res!692235) (not e!586878))))

(declare-fun b!1037543 () Bool)

(declare-fun call!43913 () Bool)

(assert (=> b!1037543 (= e!586877 call!43913)))

(declare-fun d!125145 () Bool)

(declare-fun res!692236 () Bool)

(assert (=> d!125145 (=> res!692236 e!586876)))

(assert (=> d!125145 (= res!692236 (bvsge #b00000000000000000000000000000000 (size!31976 (_keys!11496 lt!457298))))))

(assert (=> d!125145 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11496 lt!457298) (mask!30230 lt!457298)) e!586876)))

(declare-fun b!1037544 () Bool)

(assert (=> b!1037544 (= e!586878 call!43913)))

(declare-fun bm!43910 () Bool)

(assert (=> bm!43910 (= call!43913 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11496 lt!457298) (mask!30230 lt!457298)))))

(assert (= (and d!125145 (not res!692236)) b!1037541))

(assert (= (and b!1037541 c!105230) b!1037542))

(assert (= (and b!1037541 (not c!105230)) b!1037543))

(assert (= (and b!1037542 res!692235) b!1037544))

(assert (= (or b!1037544 b!1037543) bm!43910))

(assert (=> b!1037541 m!957669))

(assert (=> b!1037541 m!957669))

(assert (=> b!1037541 m!957671))

(assert (=> b!1037542 m!957669))

(declare-fun m!957859 () Bool)

(assert (=> b!1037542 m!957859))

(declare-fun m!957861 () Bool)

(assert (=> b!1037542 m!957861))

(assert (=> b!1037542 m!957669))

(declare-fun m!957863 () Bool)

(assert (=> b!1037542 m!957863))

(declare-fun m!957865 () Bool)

(assert (=> bm!43910 m!957865))

(assert (=> b!1037321 d!125145))

(declare-fun b!1037545 () Bool)

(declare-fun e!586879 () Bool)

(declare-fun e!586880 () Bool)

(assert (=> b!1037545 (= e!586879 e!586880)))

(declare-fun c!105231 () Bool)

(assert (=> b!1037545 (= c!105231 (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037546 () Bool)

(declare-fun e!586881 () Bool)

(assert (=> b!1037546 (= e!586880 e!586881)))

(declare-fun lt!457570 () (_ BitVec 64))

(assert (=> b!1037546 (= lt!457570 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!457572 () Unit!33898)

(assert (=> b!1037546 (= lt!457572 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11496 thiss!1427) lt!457570 #b00000000000000000000000000000000))))

(assert (=> b!1037546 (arrayContainsKey!0 (_keys!11496 thiss!1427) lt!457570 #b00000000000000000000000000000000)))

(declare-fun lt!457571 () Unit!33898)

(assert (=> b!1037546 (= lt!457571 lt!457572)))

(declare-fun res!692237 () Bool)

(assert (=> b!1037546 (= res!692237 (= (seekEntryOrOpen!0 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (_keys!11496 thiss!1427) (mask!30230 thiss!1427)) (Found!9703 #b00000000000000000000000000000000)))))

(assert (=> b!1037546 (=> (not res!692237) (not e!586881))))

(declare-fun b!1037547 () Bool)

(declare-fun call!43914 () Bool)

(assert (=> b!1037547 (= e!586880 call!43914)))

(declare-fun d!125147 () Bool)

(declare-fun res!692238 () Bool)

(assert (=> d!125147 (=> res!692238 e!586879)))

(assert (=> d!125147 (= res!692238 (bvsge #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(assert (=> d!125147 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11496 thiss!1427) (mask!30230 thiss!1427)) e!586879)))

(declare-fun b!1037548 () Bool)

(assert (=> b!1037548 (= e!586881 call!43914)))

(declare-fun bm!43911 () Bool)

(assert (=> bm!43911 (= call!43914 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11496 thiss!1427) (mask!30230 thiss!1427)))))

(assert (= (and d!125147 (not res!692238)) b!1037545))

(assert (= (and b!1037545 c!105231) b!1037546))

(assert (= (and b!1037545 (not c!105231)) b!1037547))

(assert (= (and b!1037546 res!692237) b!1037548))

(assert (= (or b!1037548 b!1037547) bm!43911))

(assert (=> b!1037545 m!957361))

(assert (=> b!1037545 m!957361))

(assert (=> b!1037545 m!957363))

(assert (=> b!1037546 m!957361))

(declare-fun m!957867 () Bool)

(assert (=> b!1037546 m!957867))

(declare-fun m!957869 () Bool)

(assert (=> b!1037546 m!957869))

(assert (=> b!1037546 m!957361))

(declare-fun m!957871 () Bool)

(assert (=> b!1037546 m!957871))

(declare-fun m!957873 () Bool)

(assert (=> bm!43911 m!957873))

(assert (=> b!1037255 d!125147))

(declare-fun d!125149 () Bool)

(assert (=> d!125149 (= (-!520 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!457297 #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))

(assert (=> d!125149 true))

(declare-fun _$10!34 () Unit!33898)

(assert (=> d!125149 (= (choose!1706 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) lt!457297 (defaultEntry!6269 thiss!1427)) _$10!34)))

(declare-fun bs!30353 () Bool)

(assert (= bs!30353 d!125149))

(assert (=> bs!30353 m!957275))

(assert (=> bs!30353 m!957275))

(assert (=> bs!30353 m!957277))

(assert (=> bs!30353 m!957281))

(assert (=> d!125041 d!125149))

(assert (=> d!125041 d!125033))

(assert (=> d!125041 d!125077))

(assert (=> d!125041 d!125035))

(assert (=> d!125041 d!125039))

(declare-fun d!125151 () Bool)

(assert (=> d!125151 (= (apply!916 lt!457385 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) (get!16493 (getValueByKey!585 (toList!6897 lt!457385) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30354 () Bool)

(assert (= bs!30354 d!125151))

(assert (=> bs!30354 m!957361))

(declare-fun m!957875 () Bool)

(assert (=> bs!30354 m!957875))

(assert (=> bs!30354 m!957875))

(declare-fun m!957877 () Bool)

(assert (=> bs!30354 m!957877))

(assert (=> b!1037304 d!125151))

(assert (=> b!1037304 d!125083))

(declare-fun b!1037559 () Bool)

(declare-fun e!586893 () Bool)

(declare-fun contains!6048 (List!21905 (_ BitVec 64)) Bool)

(assert (=> b!1037559 (= e!586893 (contains!6048 Nil!21902 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)))))

(declare-fun d!125153 () Bool)

(declare-fun res!692246 () Bool)

(declare-fun e!586892 () Bool)

(assert (=> d!125153 (=> res!692246 e!586892)))

(assert (=> d!125153 (= res!692246 (bvsge #b00000000000000000000000000000000 (size!31976 (_keys!11496 lt!457298))))))

(assert (=> d!125153 (= (arrayNoDuplicates!0 (_keys!11496 lt!457298) #b00000000000000000000000000000000 Nil!21902) e!586892)))

(declare-fun b!1037560 () Bool)

(declare-fun e!586890 () Bool)

(declare-fun call!43917 () Bool)

(assert (=> b!1037560 (= e!586890 call!43917)))

(declare-fun b!1037561 () Bool)

(declare-fun e!586891 () Bool)

(assert (=> b!1037561 (= e!586891 e!586890)))

(declare-fun c!105234 () Bool)

(assert (=> b!1037561 (= c!105234 (validKeyInArray!0 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)))))

(declare-fun b!1037562 () Bool)

(assert (=> b!1037562 (= e!586892 e!586891)))

(declare-fun res!692245 () Bool)

(assert (=> b!1037562 (=> (not res!692245) (not e!586891))))

(assert (=> b!1037562 (= res!692245 (not e!586893))))

(declare-fun res!692247 () Bool)

(assert (=> b!1037562 (=> (not res!692247) (not e!586893))))

(assert (=> b!1037562 (= res!692247 (validKeyInArray!0 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)))))

(declare-fun b!1037563 () Bool)

(assert (=> b!1037563 (= e!586890 call!43917)))

(declare-fun bm!43914 () Bool)

(assert (=> bm!43914 (= call!43917 (arrayNoDuplicates!0 (_keys!11496 lt!457298) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105234 (Cons!21901 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000) Nil!21902) Nil!21902)))))

(assert (= (and d!125153 (not res!692246)) b!1037562))

(assert (= (and b!1037562 res!692247) b!1037559))

(assert (= (and b!1037562 res!692245) b!1037561))

(assert (= (and b!1037561 c!105234) b!1037560))

(assert (= (and b!1037561 (not c!105234)) b!1037563))

(assert (= (or b!1037560 b!1037563) bm!43914))

(assert (=> b!1037559 m!957669))

(assert (=> b!1037559 m!957669))

(declare-fun m!957879 () Bool)

(assert (=> b!1037559 m!957879))

(assert (=> b!1037561 m!957669))

(assert (=> b!1037561 m!957669))

(assert (=> b!1037561 m!957671))

(assert (=> b!1037562 m!957669))

(assert (=> b!1037562 m!957669))

(assert (=> b!1037562 m!957671))

(assert (=> bm!43914 m!957669))

(declare-fun m!957881 () Bool)

(assert (=> bm!43914 m!957881))

(assert (=> b!1037322 d!125153))

(declare-fun d!125155 () Bool)

(declare-fun e!586894 () Bool)

(assert (=> d!125155 e!586894))

(declare-fun res!692248 () Bool)

(assert (=> d!125155 (=> (not res!692248) (not e!586894))))

(declare-fun lt!457574 () ListLongMap!13763)

(assert (=> d!125155 (= res!692248 (contains!6046 lt!457574 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun lt!457576 () List!21902)

(assert (=> d!125155 (= lt!457574 (ListLongMap!13764 lt!457576))))

(declare-fun lt!457575 () Unit!33898)

(declare-fun lt!457573 () Unit!33898)

(assert (=> d!125155 (= lt!457575 lt!457573)))

(assert (=> d!125155 (= (getValueByKey!585 lt!457576 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(assert (=> d!125155 (= lt!457573 (lemmaContainsTupThenGetReturnValue!281 lt!457576 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(assert (=> d!125155 (= lt!457576 (insertStrictlySorted!374 (toList!6897 call!43883) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(assert (=> d!125155 (= (+!3127 call!43883 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) lt!457574)))

(declare-fun b!1037564 () Bool)

(declare-fun res!692249 () Bool)

(assert (=> b!1037564 (=> (not res!692249) (not e!586894))))

(assert (=> b!1037564 (= res!692249 (= (getValueByKey!585 (toList!6897 lt!457574) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun b!1037565 () Bool)

(assert (=> b!1037565 (= e!586894 (contains!6047 (toList!6897 lt!457574) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))

(assert (= (and d!125155 res!692248) b!1037564))

(assert (= (and b!1037564 res!692249) b!1037565))

(declare-fun m!957883 () Bool)

(assert (=> d!125155 m!957883))

(declare-fun m!957885 () Bool)

(assert (=> d!125155 m!957885))

(declare-fun m!957887 () Bool)

(assert (=> d!125155 m!957887))

(declare-fun m!957889 () Bool)

(assert (=> d!125155 m!957889))

(declare-fun m!957891 () Bool)

(assert (=> b!1037564 m!957891))

(declare-fun m!957893 () Bool)

(assert (=> b!1037565 m!957893))

(assert (=> b!1037317 d!125155))

(declare-fun d!125157 () Bool)

(declare-fun e!586895 () Bool)

(assert (=> d!125157 e!586895))

(declare-fun res!692250 () Bool)

(assert (=> d!125157 (=> (not res!692250) (not e!586895))))

(declare-fun lt!457578 () ListLongMap!13763)

(assert (=> d!125157 (= res!692250 (contains!6046 lt!457578 (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(declare-fun lt!457580 () List!21902)

(assert (=> d!125157 (= lt!457578 (ListLongMap!13764 lt!457580))))

(declare-fun lt!457579 () Unit!33898)

(declare-fun lt!457577 () Unit!33898)

(assert (=> d!125157 (= lt!457579 lt!457577)))

(assert (=> d!125157 (= (getValueByKey!585 lt!457580 (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))) (Some!635 (_2!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(assert (=> d!125157 (= lt!457577 (lemmaContainsTupThenGetReturnValue!281 lt!457580 (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))) (_2!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(assert (=> d!125157 (= lt!457580 (insertStrictlySorted!374 (toList!6897 (ite c!105176 call!43894 (ite c!105177 call!43892 call!43891))) (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))) (_2!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(assert (=> d!125157 (= (+!3127 (ite c!105176 call!43894 (ite c!105177 call!43892 call!43891)) (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))) lt!457578)))

(declare-fun b!1037566 () Bool)

(declare-fun res!692251 () Bool)

(assert (=> b!1037566 (=> (not res!692251) (not e!586895))))

(assert (=> b!1037566 (= res!692251 (= (getValueByKey!585 (toList!6897 lt!457578) (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))) (Some!635 (_2!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))))

(declare-fun b!1037567 () Bool)

(assert (=> b!1037567 (= e!586895 (contains!6047 (toList!6897 lt!457578) (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))

(assert (= (and d!125157 res!692250) b!1037566))

(assert (= (and b!1037566 res!692251) b!1037567))

(declare-fun m!957895 () Bool)

(assert (=> d!125157 m!957895))

(declare-fun m!957897 () Bool)

(assert (=> d!125157 m!957897))

(declare-fun m!957899 () Bool)

(assert (=> d!125157 m!957899))

(declare-fun m!957901 () Bool)

(assert (=> d!125157 m!957901))

(declare-fun m!957903 () Bool)

(assert (=> b!1037566 m!957903))

(declare-fun m!957905 () Bool)

(assert (=> b!1037567 m!957905))

(assert (=> bm!43889 d!125157))

(assert (=> b!1037333 d!125093))

(declare-fun d!125159 () Bool)

(declare-fun e!586896 () Bool)

(assert (=> d!125159 e!586896))

(declare-fun res!692252 () Bool)

(assert (=> d!125159 (=> res!692252 e!586896)))

(declare-fun lt!457584 () Bool)

(assert (=> d!125159 (= res!692252 (not lt!457584))))

(declare-fun lt!457581 () Bool)

(assert (=> d!125159 (= lt!457584 lt!457581)))

(declare-fun lt!457583 () Unit!33898)

(declare-fun e!586897 () Unit!33898)

(assert (=> d!125159 (= lt!457583 e!586897)))

(declare-fun c!105235 () Bool)

(assert (=> d!125159 (= c!105235 lt!457581)))

(assert (=> d!125159 (= lt!457581 (containsKey!566 (toList!6897 lt!457385) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125159 (= (contains!6046 lt!457385 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) lt!457584)))

(declare-fun b!1037568 () Bool)

(declare-fun lt!457582 () Unit!33898)

(assert (=> b!1037568 (= e!586897 lt!457582)))

(assert (=> b!1037568 (= lt!457582 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457385) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1037568 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457385) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037569 () Bool)

(declare-fun Unit!33910 () Unit!33898)

(assert (=> b!1037569 (= e!586897 Unit!33910)))

(declare-fun b!1037570 () Bool)

(assert (=> b!1037570 (= e!586896 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457385) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!125159 c!105235) b!1037568))

(assert (= (and d!125159 (not c!105235)) b!1037569))

(assert (= (and d!125159 (not res!692252)) b!1037570))

(assert (=> d!125159 m!957361))

(declare-fun m!957907 () Bool)

(assert (=> d!125159 m!957907))

(assert (=> b!1037568 m!957361))

(declare-fun m!957909 () Bool)

(assert (=> b!1037568 m!957909))

(assert (=> b!1037568 m!957361))

(assert (=> b!1037568 m!957875))

(assert (=> b!1037568 m!957875))

(declare-fun m!957911 () Bool)

(assert (=> b!1037568 m!957911))

(assert (=> b!1037570 m!957361))

(assert (=> b!1037570 m!957875))

(assert (=> b!1037570 m!957875))

(assert (=> b!1037570 m!957911))

(assert (=> b!1037302 d!125159))

(assert (=> bm!43886 d!125115))

(declare-fun d!125161 () Bool)

(assert (=> d!125161 (= (apply!916 lt!457408 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16493 (getValueByKey!585 (toList!6897 lt!457408) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30355 () Bool)

(assert (= bs!30355 d!125161))

(assert (=> bs!30355 m!957603))

(assert (=> bs!30355 m!957603))

(declare-fun m!957913 () Bool)

(assert (=> bs!30355 m!957913))

(assert (=> b!1037340 d!125161))

(declare-fun d!125163 () Bool)

(declare-fun e!586898 () Bool)

(assert (=> d!125163 e!586898))

(declare-fun res!692253 () Bool)

(assert (=> d!125163 (=> (not res!692253) (not e!586898))))

(declare-fun lt!457586 () ListLongMap!13763)

(assert (=> d!125163 (= res!692253 (contains!6046 lt!457586 (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun lt!457588 () List!21902)

(assert (=> d!125163 (= lt!457586 (ListLongMap!13764 lt!457588))))

(declare-fun lt!457587 () Unit!33898)

(declare-fun lt!457585 () Unit!33898)

(assert (=> d!125163 (= lt!457587 lt!457585)))

(assert (=> d!125163 (= (getValueByKey!585 lt!457588 (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))) (Some!635 (_2!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (=> d!125163 (= lt!457585 (lemmaContainsTupThenGetReturnValue!281 lt!457588 (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (_2!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (=> d!125163 (= lt!457588 (insertStrictlySorted!374 (toList!6897 (ite c!105170 call!43887 (ite c!105171 call!43885 call!43884))) (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (_2!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (=> d!125163 (= (+!3127 (ite c!105170 call!43887 (ite c!105171 call!43885 call!43884)) (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) lt!457586)))

(declare-fun b!1037571 () Bool)

(declare-fun res!692254 () Bool)

(assert (=> b!1037571 (=> (not res!692254) (not e!586898))))

(assert (=> b!1037571 (= res!692254 (= (getValueByKey!585 (toList!6897 lt!457586) (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))) (Some!635 (_2!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(declare-fun b!1037572 () Bool)

(assert (=> b!1037572 (= e!586898 (contains!6047 (toList!6897 lt!457586) (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(assert (= (and d!125163 res!692253) b!1037571))

(assert (= (and b!1037571 res!692254) b!1037572))

(declare-fun m!957915 () Bool)

(assert (=> d!125163 m!957915))

(declare-fun m!957917 () Bool)

(assert (=> d!125163 m!957917))

(declare-fun m!957919 () Bool)

(assert (=> d!125163 m!957919))

(declare-fun m!957921 () Bool)

(assert (=> d!125163 m!957921))

(declare-fun m!957923 () Bool)

(assert (=> b!1037571 m!957923))

(declare-fun m!957925 () Bool)

(assert (=> b!1037572 m!957925))

(assert (=> bm!43882 d!125163))

(declare-fun d!125165 () Bool)

(declare-fun e!586899 () Bool)

(assert (=> d!125165 e!586899))

(declare-fun res!692255 () Bool)

(assert (=> d!125165 (=> res!692255 e!586899)))

(declare-fun lt!457592 () Bool)

(assert (=> d!125165 (= res!692255 (not lt!457592))))

(declare-fun lt!457589 () Bool)

(assert (=> d!125165 (= lt!457592 lt!457589)))

(declare-fun lt!457591 () Unit!33898)

(declare-fun e!586900 () Unit!33898)

(assert (=> d!125165 (= lt!457591 e!586900)))

(declare-fun c!105236 () Bool)

(assert (=> d!125165 (= c!105236 lt!457589)))

(assert (=> d!125165 (= lt!457589 (containsKey!566 (toList!6897 lt!457408) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125165 (= (contains!6046 lt!457408 #b0000000000000000000000000000000000000000000000000000000000000000) lt!457592)))

(declare-fun b!1037573 () Bool)

(declare-fun lt!457590 () Unit!33898)

(assert (=> b!1037573 (= e!586900 lt!457590)))

(assert (=> b!1037573 (= lt!457590 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457408) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1037573 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457408) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037574 () Bool)

(declare-fun Unit!33911 () Unit!33898)

(assert (=> b!1037574 (= e!586900 Unit!33911)))

(declare-fun b!1037575 () Bool)

(assert (=> b!1037575 (= e!586899 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457408) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125165 c!105236) b!1037573))

(assert (= (and d!125165 (not c!105236)) b!1037574))

(assert (= (and d!125165 (not res!692255)) b!1037575))

(declare-fun m!957927 () Bool)

(assert (=> d!125165 m!957927))

(declare-fun m!957929 () Bool)

(assert (=> b!1037573 m!957929))

(assert (=> b!1037573 m!957623))

(assert (=> b!1037573 m!957623))

(declare-fun m!957931 () Bool)

(assert (=> b!1037573 m!957931))

(assert (=> b!1037575 m!957623))

(assert (=> b!1037575 m!957623))

(assert (=> b!1037575 m!957931))

(assert (=> bm!43891 d!125165))

(declare-fun b!1037576 () Bool)

(declare-fun e!586904 () Bool)

(assert (=> b!1037576 (= e!586904 (contains!6048 Nil!21902 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125167 () Bool)

(declare-fun res!692257 () Bool)

(declare-fun e!586903 () Bool)

(assert (=> d!125167 (=> res!692257 e!586903)))

(assert (=> d!125167 (= res!692257 (bvsge #b00000000000000000000000000000000 (size!31976 (_keys!11496 thiss!1427))))))

(assert (=> d!125167 (= (arrayNoDuplicates!0 (_keys!11496 thiss!1427) #b00000000000000000000000000000000 Nil!21902) e!586903)))

(declare-fun b!1037577 () Bool)

(declare-fun e!586901 () Bool)

(declare-fun call!43918 () Bool)

(assert (=> b!1037577 (= e!586901 call!43918)))

(declare-fun b!1037578 () Bool)

(declare-fun e!586902 () Bool)

(assert (=> b!1037578 (= e!586902 e!586901)))

(declare-fun c!105237 () Bool)

(assert (=> b!1037578 (= c!105237 (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037579 () Bool)

(assert (=> b!1037579 (= e!586903 e!586902)))

(declare-fun res!692256 () Bool)

(assert (=> b!1037579 (=> (not res!692256) (not e!586902))))

(assert (=> b!1037579 (= res!692256 (not e!586904))))

(declare-fun res!692258 () Bool)

(assert (=> b!1037579 (=> (not res!692258) (not e!586904))))

(assert (=> b!1037579 (= res!692258 (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037580 () Bool)

(assert (=> b!1037580 (= e!586901 call!43918)))

(declare-fun bm!43915 () Bool)

(assert (=> bm!43915 (= call!43918 (arrayNoDuplicates!0 (_keys!11496 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105237 (Cons!21901 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) Nil!21902) Nil!21902)))))

(assert (= (and d!125167 (not res!692257)) b!1037579))

(assert (= (and b!1037579 res!692258) b!1037576))

(assert (= (and b!1037579 res!692256) b!1037578))

(assert (= (and b!1037578 c!105237) b!1037577))

(assert (= (and b!1037578 (not c!105237)) b!1037580))

(assert (= (or b!1037577 b!1037580) bm!43915))

(assert (=> b!1037576 m!957361))

(assert (=> b!1037576 m!957361))

(declare-fun m!957933 () Bool)

(assert (=> b!1037576 m!957933))

(assert (=> b!1037578 m!957361))

(assert (=> b!1037578 m!957361))

(assert (=> b!1037578 m!957363))

(assert (=> b!1037579 m!957361))

(assert (=> b!1037579 m!957361))

(assert (=> b!1037579 m!957363))

(assert (=> bm!43915 m!957361))

(declare-fun m!957935 () Bool)

(assert (=> bm!43915 m!957935))

(assert (=> b!1037256 d!125167))

(assert (=> b!1037336 d!125093))

(declare-fun d!125169 () Bool)

(declare-fun e!586905 () Bool)

(assert (=> d!125169 e!586905))

(declare-fun res!692259 () Bool)

(assert (=> d!125169 (=> res!692259 e!586905)))

(declare-fun lt!457596 () Bool)

(assert (=> d!125169 (= res!692259 (not lt!457596))))

(declare-fun lt!457593 () Bool)

(assert (=> d!125169 (= lt!457596 lt!457593)))

(declare-fun lt!457595 () Unit!33898)

(declare-fun e!586906 () Unit!33898)

(assert (=> d!125169 (= lt!457595 e!586906)))

(declare-fun c!105238 () Bool)

(assert (=> d!125169 (= c!105238 lt!457593)))

(assert (=> d!125169 (= lt!457593 (containsKey!566 (toList!6897 lt!457319) key!909))))

(assert (=> d!125169 (= (contains!6046 lt!457319 key!909) lt!457596)))

(declare-fun b!1037581 () Bool)

(declare-fun lt!457594 () Unit!33898)

(assert (=> b!1037581 (= e!586906 lt!457594)))

(assert (=> b!1037581 (= lt!457594 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457319) key!909))))

(assert (=> b!1037581 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457319) key!909))))

(declare-fun b!1037582 () Bool)

(declare-fun Unit!33912 () Unit!33898)

(assert (=> b!1037582 (= e!586906 Unit!33912)))

(declare-fun b!1037583 () Bool)

(assert (=> b!1037583 (= e!586905 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457319) key!909)))))

(assert (= (and d!125169 c!105238) b!1037581))

(assert (= (and d!125169 (not c!105238)) b!1037582))

(assert (= (and d!125169 (not res!692259)) b!1037583))

(declare-fun m!957937 () Bool)

(assert (=> d!125169 m!957937))

(declare-fun m!957939 () Bool)

(assert (=> b!1037581 m!957939))

(declare-fun m!957941 () Bool)

(assert (=> b!1037581 m!957941))

(assert (=> b!1037581 m!957941))

(declare-fun m!957943 () Bool)

(assert (=> b!1037581 m!957943))

(assert (=> b!1037583 m!957941))

(assert (=> b!1037583 m!957941))

(assert (=> b!1037583 m!957943))

(assert (=> d!125027 d!125169))

(declare-fun b!1037584 () Bool)

(declare-fun e!586909 () List!21902)

(assert (=> b!1037584 (= e!586909 Nil!21899)))

(declare-fun b!1037585 () Bool)

(assert (=> b!1037585 (= e!586909 ($colon$colon!604 (removeStrictlySorted!56 (t!31099 (toList!6897 (map!14712 thiss!1427))) key!909) (h!23109 (toList!6897 (map!14712 thiss!1427)))))))

(declare-fun b!1037586 () Bool)

(declare-fun e!586908 () List!21902)

(assert (=> b!1037586 (= e!586908 e!586909)))

(declare-fun c!105239 () Bool)

(assert (=> b!1037586 (= c!105239 (and ((_ is Cons!21898) (toList!6897 (map!14712 thiss!1427))) (not (= (_1!7875 (h!23109 (toList!6897 (map!14712 thiss!1427)))) key!909))))))

(declare-fun b!1037587 () Bool)

(declare-fun e!586907 () Bool)

(declare-fun lt!457597 () List!21902)

(assert (=> b!1037587 (= e!586907 (not (containsKey!566 lt!457597 key!909)))))

(declare-fun d!125171 () Bool)

(assert (=> d!125171 e!586907))

(declare-fun res!692260 () Bool)

(assert (=> d!125171 (=> (not res!692260) (not e!586907))))

(assert (=> d!125171 (= res!692260 (isStrictlySorted!707 lt!457597))))

(assert (=> d!125171 (= lt!457597 e!586908)))

(declare-fun c!105240 () Bool)

(assert (=> d!125171 (= c!105240 (and ((_ is Cons!21898) (toList!6897 (map!14712 thiss!1427))) (= (_1!7875 (h!23109 (toList!6897 (map!14712 thiss!1427)))) key!909)))))

(assert (=> d!125171 (isStrictlySorted!707 (toList!6897 (map!14712 thiss!1427)))))

(assert (=> d!125171 (= (removeStrictlySorted!56 (toList!6897 (map!14712 thiss!1427)) key!909) lt!457597)))

(declare-fun b!1037588 () Bool)

(assert (=> b!1037588 (= e!586908 (t!31099 (toList!6897 (map!14712 thiss!1427))))))

(assert (= (and d!125171 c!105240) b!1037588))

(assert (= (and d!125171 (not c!105240)) b!1037586))

(assert (= (and b!1037586 c!105239) b!1037585))

(assert (= (and b!1037586 (not c!105239)) b!1037584))

(assert (= (and d!125171 res!692260) b!1037587))

(declare-fun m!957945 () Bool)

(assert (=> b!1037585 m!957945))

(assert (=> b!1037585 m!957945))

(declare-fun m!957947 () Bool)

(assert (=> b!1037585 m!957947))

(declare-fun m!957949 () Bool)

(assert (=> b!1037587 m!957949))

(declare-fun m!957951 () Bool)

(assert (=> d!125171 m!957951))

(declare-fun m!957953 () Bool)

(assert (=> d!125171 m!957953))

(assert (=> d!125027 d!125171))

(declare-fun mapNonEmpty!38419 () Bool)

(declare-fun mapRes!38419 () Bool)

(declare-fun tp!73775 () Bool)

(declare-fun e!586911 () Bool)

(assert (=> mapNonEmpty!38419 (= mapRes!38419 (and tp!73775 e!586911))))

(declare-fun mapValue!38419 () ValueCell!11594)

(declare-fun mapKey!38419 () (_ BitVec 32))

(declare-fun mapRest!38419 () (Array (_ BitVec 32) ValueCell!11594))

(assert (=> mapNonEmpty!38419 (= mapRest!38418 (store mapRest!38419 mapKey!38419 mapValue!38419))))

(declare-fun b!1037589 () Bool)

(assert (=> b!1037589 (= e!586911 tp_is_empty!24595)))

(declare-fun mapIsEmpty!38419 () Bool)

(assert (=> mapIsEmpty!38419 mapRes!38419))

(declare-fun b!1037590 () Bool)

(declare-fun e!586910 () Bool)

(assert (=> b!1037590 (= e!586910 tp_is_empty!24595)))

(declare-fun condMapEmpty!38419 () Bool)

(declare-fun mapDefault!38419 () ValueCell!11594)

(assert (=> mapNonEmpty!38418 (= condMapEmpty!38419 (= mapRest!38418 ((as const (Array (_ BitVec 32) ValueCell!11594)) mapDefault!38419)))))

(assert (=> mapNonEmpty!38418 (= tp!73774 (and e!586910 mapRes!38419))))

(assert (= (and mapNonEmpty!38418 condMapEmpty!38419) mapIsEmpty!38419))

(assert (= (and mapNonEmpty!38418 (not condMapEmpty!38419)) mapNonEmpty!38419))

(assert (= (and mapNonEmpty!38419 ((_ is ValueCellFull!11594) mapValue!38419)) b!1037589))

(assert (= (and mapNonEmpty!38418 ((_ is ValueCellFull!11594) mapDefault!38419)) b!1037590))

(declare-fun m!957955 () Bool)

(assert (=> mapNonEmpty!38419 m!957955))

(declare-fun b_lambda!16137 () Bool)

(assert (= b_lambda!16135 (or (and b!1037199 b_free!20875) b_lambda!16137)))

(declare-fun b_lambda!16139 () Bool)

(assert (= b_lambda!16129 (or (and b!1037199 b_free!20875) b_lambda!16139)))

(declare-fun b_lambda!16141 () Bool)

(assert (= b_lambda!16133 (or (and b!1037199 b_free!20875) b_lambda!16141)))

(declare-fun b_lambda!16143 () Bool)

(assert (= b_lambda!16127 (or (and b!1037199 b_free!20875) b_lambda!16143)))

(check-sat (not b_lambda!16123) (not b_lambda!16131) (not b!1037526) (not d!125069) (not d!125125) (not b!1037390) (not bm!43899) (not d!125067) (not b!1037571) (not d!125119) (not d!125075) (not b!1037566) (not d!125091) (not bm!43906) (not b!1037360) (not b!1037511) (not b!1037411) (not bm!43910) (not d!125081) (not b!1037583) (not b_lambda!16137) (not b!1037508) (not b!1037565) (not b!1037521) (not b!1037386) (not b!1037517) (not d!125121) (not b!1037408) (not b!1037385) (not b!1037512) (not d!125161) (not d!125101) (not b!1037498) (not b!1037559) (not b!1037514) (not d!125087) (not d!125051) (not b!1037519) (not d!125061) (not d!125129) (not bm!43914) (not b!1037497) (not b!1037464) (not bm!43901) (not d!125053) (not b!1037500) (not bm!43907) (not b!1037564) (not b!1037504) (not b!1037567) (not b!1037585) (not b!1037525) (not d!125071) (not d!125149) (not b!1037428) (not b_lambda!16125) (not b!1037418) (not bm!43896) (not b!1037516) (not d!125095) (not d!125113) (not b!1037460) (not b!1037532) (not d!125131) (not d!125055) (not b!1037476) (not b!1037495) (not d!125139) (not b!1037579) (not d!125063) (not d!125057) (not b_next!20875) (not b!1037546) (not b!1037523) (not b!1037446) (not b!1037416) (not b!1037415) (not b!1037421) (not d!125109) (not bm!43915) (not d!125079) (not b!1037570) (not d!125117) (not d!125065) (not b!1037412) (not d!125043) (not b!1037575) (not d!125151) (not b!1037393) (not b!1037409) (not d!125159) b_and!33409 (not b!1037573) (not bm!43911) (not b!1037389) (not b!1037545) (not b!1037407) (not b_lambda!16141) (not d!125137) (not d!125049) (not b!1037466) (not d!125157) (not b!1037427) (not b!1037419) (not d!125097) (not b!1037541) (not b_lambda!16139) (not b!1037578) (not d!125085) (not d!125099) (not d!125045) (not b!1037448) (not bm!43902) (not d!125171) (not b!1037395) (not bm!43905) (not d!125089) (not b!1037450) (not b!1037505) (not d!125107) (not b!1037587) (not b!1037447) (not b!1037473) (not d!125123) (not d!125163) (not d!125115) (not b!1037396) (not b!1037430) (not b!1037442) (not b!1037474) (not b!1037481) (not d!125169) (not d!125047) (not b!1037562) (not bm!43895) (not b!1037561) (not b!1037568) (not b!1037426) (not d!125155) (not d!125135) (not b!1037542) (not b!1037414) (not d!125165) (not d!125133) (not b!1037572) (not d!125111) (not b!1037576) (not b!1037392) (not b!1037509) (not b!1037515) (not d!125103) (not d!125059) (not b!1037444) (not b!1037528) (not b!1037410) (not d!125073) tp_is_empty!24595 (not d!125127) (not b!1037461) (not b!1037502) (not d!125141) (not b_lambda!16143) (not b!1037581) (not b!1037527) (not b!1037358) (not b!1037524) (not b_lambda!16117) (not b!1037480) (not b!1037468) (not mapNonEmpty!38419))
(check-sat b_and!33409 (not b_next!20875))
(get-model)

(assert (=> b!1037395 d!125093))

(declare-fun d!125173 () Bool)

(declare-fun e!586912 () Bool)

(assert (=> d!125173 e!586912))

(declare-fun res!692261 () Bool)

(assert (=> d!125173 (=> res!692261 e!586912)))

(declare-fun lt!457601 () Bool)

(assert (=> d!125173 (= res!692261 (not lt!457601))))

(declare-fun lt!457598 () Bool)

(assert (=> d!125173 (= lt!457601 lt!457598)))

(declare-fun lt!457600 () Unit!33898)

(declare-fun e!586913 () Unit!33898)

(assert (=> d!125173 (= lt!457600 e!586913)))

(declare-fun c!105241 () Bool)

(assert (=> d!125173 (= c!105241 lt!457598)))

(assert (=> d!125173 (= lt!457598 (containsKey!566 (toList!6897 lt!457521) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125173 (= (contains!6046 lt!457521 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457601)))

(declare-fun b!1037591 () Bool)

(declare-fun lt!457599 () Unit!33898)

(assert (=> b!1037591 (= e!586913 lt!457599)))

(assert (=> b!1037591 (= lt!457599 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457521) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1037591 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457521) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037592 () Bool)

(declare-fun Unit!33913 () Unit!33898)

(assert (=> b!1037592 (= e!586913 Unit!33913)))

(declare-fun b!1037593 () Bool)

(assert (=> b!1037593 (= e!586912 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457521) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125173 c!105241) b!1037591))

(assert (= (and d!125173 (not c!105241)) b!1037592))

(assert (= (and d!125173 (not res!692261)) b!1037593))

(declare-fun m!957957 () Bool)

(assert (=> d!125173 m!957957))

(declare-fun m!957959 () Bool)

(assert (=> b!1037591 m!957959))

(declare-fun m!957961 () Bool)

(assert (=> b!1037591 m!957961))

(assert (=> b!1037591 m!957961))

(declare-fun m!957963 () Bool)

(assert (=> b!1037591 m!957963))

(assert (=> b!1037593 m!957961))

(assert (=> b!1037593 m!957961))

(assert (=> b!1037593 m!957963))

(assert (=> bm!43902 d!125173))

(declare-fun d!125175 () Bool)

(declare-fun e!586914 () Bool)

(assert (=> d!125175 e!586914))

(declare-fun res!692262 () Bool)

(assert (=> d!125175 (=> res!692262 e!586914)))

(declare-fun lt!457605 () Bool)

(assert (=> d!125175 (= res!692262 (not lt!457605))))

(declare-fun lt!457602 () Bool)

(assert (=> d!125175 (= lt!457605 lt!457602)))

(declare-fun lt!457604 () Unit!33898)

(declare-fun e!586915 () Unit!33898)

(assert (=> d!125175 (= lt!457604 e!586915)))

(declare-fun c!105242 () Bool)

(assert (=> d!125175 (= c!105242 lt!457602)))

(assert (=> d!125175 (= lt!457602 (containsKey!566 (toList!6897 lt!457465) (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))))))

(assert (=> d!125175 (= (contains!6046 lt!457465 (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))) lt!457605)))

(declare-fun b!1037594 () Bool)

(declare-fun lt!457603 () Unit!33898)

(assert (=> b!1037594 (= e!586915 lt!457603)))

(assert (=> b!1037594 (= lt!457603 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457465) (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))))))

(assert (=> b!1037594 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457465) (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))))))

(declare-fun b!1037595 () Bool)

(declare-fun Unit!33914 () Unit!33898)

(assert (=> b!1037595 (= e!586915 Unit!33914)))

(declare-fun b!1037596 () Bool)

(assert (=> b!1037596 (= e!586914 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457465) (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))))))))

(assert (= (and d!125175 c!105242) b!1037594))

(assert (= (and d!125175 (not c!105242)) b!1037595))

(assert (= (and d!125175 (not res!692262)) b!1037596))

(declare-fun m!957965 () Bool)

(assert (=> d!125175 m!957965))

(declare-fun m!957967 () Bool)

(assert (=> b!1037594 m!957967))

(assert (=> b!1037594 m!957567))

(assert (=> b!1037594 m!957567))

(declare-fun m!957969 () Bool)

(assert (=> b!1037594 m!957969))

(assert (=> b!1037596 m!957567))

(assert (=> b!1037596 m!957567))

(assert (=> b!1037596 m!957969))

(assert (=> d!125067 d!125175))

(declare-fun b!1037605 () Bool)

(declare-fun e!586920 () Option!636)

(assert (=> b!1037605 (= e!586920 (Some!635 (_2!7875 (h!23109 lt!457467))))))

(declare-fun d!125177 () Bool)

(declare-fun c!105247 () Bool)

(assert (=> d!125177 (= c!105247 (and ((_ is Cons!21898) lt!457467) (= (_1!7875 (h!23109 lt!457467)) (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))))))))

(assert (=> d!125177 (= (getValueByKey!585 lt!457467 (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))) e!586920)))

(declare-fun b!1037606 () Bool)

(declare-fun e!586921 () Option!636)

(assert (=> b!1037606 (= e!586920 e!586921)))

(declare-fun c!105248 () Bool)

(assert (=> b!1037606 (= c!105248 (and ((_ is Cons!21898) lt!457467) (not (= (_1!7875 (h!23109 lt!457467)) (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))))))))

(declare-fun b!1037607 () Bool)

(assert (=> b!1037607 (= e!586921 (getValueByKey!585 (t!31099 lt!457467) (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))))))

(declare-fun b!1037608 () Bool)

(assert (=> b!1037608 (= e!586921 None!634)))

(assert (= (and d!125177 c!105247) b!1037605))

(assert (= (and d!125177 (not c!105247)) b!1037606))

(assert (= (and b!1037606 c!105248) b!1037607))

(assert (= (and b!1037606 (not c!105248)) b!1037608))

(declare-fun m!957971 () Bool)

(assert (=> b!1037607 m!957971))

(assert (=> d!125067 d!125177))

(declare-fun d!125179 () Bool)

(assert (=> d!125179 (= (getValueByKey!585 lt!457467 (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))))))

(declare-fun lt!457608 () Unit!33898)

(declare-fun choose!1709 (List!21902 (_ BitVec 64) V!37667) Unit!33898)

(assert (=> d!125179 (= lt!457608 (choose!1709 lt!457467 (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))))))

(declare-fun e!586924 () Bool)

(assert (=> d!125179 e!586924))

(declare-fun res!692267 () Bool)

(assert (=> d!125179 (=> (not res!692267) (not e!586924))))

(assert (=> d!125179 (= res!692267 (isStrictlySorted!707 lt!457467))))

(assert (=> d!125179 (= (lemmaContainsTupThenGetReturnValue!281 lt!457467 (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))) lt!457608)))

(declare-fun b!1037613 () Bool)

(declare-fun res!692268 () Bool)

(assert (=> b!1037613 (=> (not res!692268) (not e!586924))))

(assert (=> b!1037613 (= res!692268 (containsKey!566 lt!457467 (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))))))

(declare-fun b!1037614 () Bool)

(assert (=> b!1037614 (= e!586924 (contains!6047 lt!457467 (tuple2!15729 (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))))))))

(assert (= (and d!125179 res!692267) b!1037613))

(assert (= (and b!1037613 res!692268) b!1037614))

(assert (=> d!125179 m!957561))

(declare-fun m!957973 () Bool)

(assert (=> d!125179 m!957973))

(declare-fun m!957975 () Bool)

(assert (=> d!125179 m!957975))

(declare-fun m!957977 () Bool)

(assert (=> b!1037613 m!957977))

(declare-fun m!957979 () Bool)

(assert (=> b!1037614 m!957979))

(assert (=> d!125067 d!125179))

(declare-fun b!1037635 () Bool)

(declare-fun res!692273 () Bool)

(declare-fun e!586939 () Bool)

(assert (=> b!1037635 (=> (not res!692273) (not e!586939))))

(declare-fun lt!457611 () List!21902)

(assert (=> b!1037635 (= res!692273 (containsKey!566 lt!457611 (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))))))

(declare-fun c!105258 () Bool)

(declare-fun b!1037636 () Bool)

(assert (=> b!1037636 (= c!105258 (and ((_ is Cons!21898) (toList!6897 lt!457382)) (bvsgt (_1!7875 (h!23109 (toList!6897 lt!457382))) (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))))))))

(declare-fun e!586935 () List!21902)

(declare-fun e!586937 () List!21902)

(assert (=> b!1037636 (= e!586935 e!586937)))

(declare-fun b!1037637 () Bool)

(declare-fun e!586936 () List!21902)

(assert (=> b!1037637 (= e!586936 (insertStrictlySorted!374 (t!31099 (toList!6897 lt!457382)) (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))))))

(declare-fun b!1037638 () Bool)

(assert (=> b!1037638 (= e!586939 (contains!6047 lt!457611 (tuple2!15729 (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))))))))

(declare-fun bm!43923 () Bool)

(declare-fun call!43926 () List!21902)

(declare-fun call!43925 () List!21902)

(assert (=> bm!43923 (= call!43926 call!43925)))

(declare-fun b!1037639 () Bool)

(assert (=> b!1037639 (= e!586937 call!43926)))

(declare-fun b!1037640 () Bool)

(declare-fun e!586938 () List!21902)

(declare-fun call!43927 () List!21902)

(assert (=> b!1037640 (= e!586938 call!43927)))

(declare-fun bm!43924 () Bool)

(assert (=> bm!43924 (= call!43925 call!43927)))

(declare-fun b!1037641 () Bool)

(assert (=> b!1037641 (= e!586935 call!43925)))

(declare-fun b!1037642 () Bool)

(assert (=> b!1037642 (= e!586937 call!43926)))

(declare-fun c!105259 () Bool)

(declare-fun b!1037643 () Bool)

(assert (=> b!1037643 (= e!586936 (ite c!105259 (t!31099 (toList!6897 lt!457382)) (ite c!105258 (Cons!21898 (h!23109 (toList!6897 lt!457382)) (t!31099 (toList!6897 lt!457382))) Nil!21899)))))

(declare-fun b!1037644 () Bool)

(assert (=> b!1037644 (= e!586938 e!586935)))

(assert (=> b!1037644 (= c!105259 (and ((_ is Cons!21898) (toList!6897 lt!457382)) (= (_1!7875 (h!23109 (toList!6897 lt!457382))) (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))))))))

(declare-fun c!105260 () Bool)

(declare-fun bm!43922 () Bool)

(assert (=> bm!43922 (= call!43927 ($colon$colon!604 e!586936 (ite c!105260 (h!23109 (toList!6897 lt!457382)) (tuple2!15729 (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))))))))

(declare-fun c!105257 () Bool)

(assert (=> bm!43922 (= c!105257 c!105260)))

(declare-fun d!125181 () Bool)

(assert (=> d!125181 e!586939))

(declare-fun res!692274 () Bool)

(assert (=> d!125181 (=> (not res!692274) (not e!586939))))

(assert (=> d!125181 (= res!692274 (isStrictlySorted!707 lt!457611))))

(assert (=> d!125181 (= lt!457611 e!586938)))

(assert (=> d!125181 (= c!105260 (and ((_ is Cons!21898) (toList!6897 lt!457382)) (bvslt (_1!7875 (h!23109 (toList!6897 lt!457382))) (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))))))))

(assert (=> d!125181 (isStrictlySorted!707 (toList!6897 lt!457382))))

(assert (=> d!125181 (= (insertStrictlySorted!374 (toList!6897 lt!457382) (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))) lt!457611)))

(assert (= (and d!125181 c!105260) b!1037640))

(assert (= (and d!125181 (not c!105260)) b!1037644))

(assert (= (and b!1037644 c!105259) b!1037641))

(assert (= (and b!1037644 (not c!105259)) b!1037636))

(assert (= (and b!1037636 c!105258) b!1037642))

(assert (= (and b!1037636 (not c!105258)) b!1037639))

(assert (= (or b!1037642 b!1037639) bm!43923))

(assert (= (or b!1037641 bm!43923) bm!43924))

(assert (= (or b!1037640 bm!43924) bm!43922))

(assert (= (and bm!43922 c!105257) b!1037637))

(assert (= (and bm!43922 (not c!105257)) b!1037643))

(assert (= (and d!125181 res!692274) b!1037635))

(assert (= (and b!1037635 res!692273) b!1037638))

(declare-fun m!957981 () Bool)

(assert (=> b!1037637 m!957981))

(declare-fun m!957983 () Bool)

(assert (=> bm!43922 m!957983))

(declare-fun m!957985 () Bool)

(assert (=> b!1037635 m!957985))

(declare-fun m!957987 () Bool)

(assert (=> b!1037638 m!957987))

(declare-fun m!957989 () Bool)

(assert (=> d!125181 m!957989))

(declare-fun m!957991 () Bool)

(assert (=> d!125181 m!957991))

(assert (=> d!125067 d!125181))

(declare-fun d!125183 () Bool)

(declare-fun lt!457614 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!517 (List!21902) (InoxSet tuple2!15728))

(assert (=> d!125183 (= lt!457614 (select (content!517 (toList!6897 lt!457461)) (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))))

(declare-fun e!586945 () Bool)

(assert (=> d!125183 (= lt!457614 e!586945)))

(declare-fun res!692279 () Bool)

(assert (=> d!125183 (=> (not res!692279) (not e!586945))))

(assert (=> d!125183 (= res!692279 ((_ is Cons!21898) (toList!6897 lt!457461)))))

(assert (=> d!125183 (= (contains!6047 (toList!6897 lt!457461) (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))) lt!457614)))

(declare-fun b!1037649 () Bool)

(declare-fun e!586944 () Bool)

(assert (=> b!1037649 (= e!586945 e!586944)))

(declare-fun res!692280 () Bool)

(assert (=> b!1037649 (=> res!692280 e!586944)))

(assert (=> b!1037649 (= res!692280 (= (h!23109 (toList!6897 lt!457461)) (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))))

(declare-fun b!1037650 () Bool)

(assert (=> b!1037650 (= e!586944 (contains!6047 (t!31099 (toList!6897 lt!457461)) (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))))

(assert (= (and d!125183 res!692279) b!1037649))

(assert (= (and b!1037649 (not res!692280)) b!1037650))

(declare-fun m!957993 () Bool)

(assert (=> d!125183 m!957993))

(declare-fun m!957995 () Bool)

(assert (=> d!125183 m!957995))

(declare-fun m!957997 () Bool)

(assert (=> b!1037650 m!957997))

(assert (=> b!1037408 d!125183))

(declare-fun d!125185 () Bool)

(assert (=> d!125185 (isDefined!435 (getValueByKey!585 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))) lt!457402))))

(declare-fun lt!457617 () Unit!33898)

(declare-fun choose!1710 (List!21902 (_ BitVec 64)) Unit!33898)

(assert (=> d!125185 (= lt!457617 (choose!1710 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))) lt!457402))))

(declare-fun e!586948 () Bool)

(assert (=> d!125185 e!586948))

(declare-fun res!692283 () Bool)

(assert (=> d!125185 (=> (not res!692283) (not e!586948))))

(assert (=> d!125185 (= res!692283 (isStrictlySorted!707 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))))))

(assert (=> d!125185 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))) lt!457402) lt!457617)))

(declare-fun b!1037653 () Bool)

(assert (=> b!1037653 (= e!586948 (containsKey!566 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))) lt!457402))))

(assert (= (and d!125185 res!692283) b!1037653))

(assert (=> d!125185 m!957801))

(assert (=> d!125185 m!957801))

(assert (=> d!125185 m!957803))

(declare-fun m!957999 () Bool)

(assert (=> d!125185 m!957999))

(declare-fun m!958001 () Bool)

(assert (=> d!125185 m!958001))

(assert (=> b!1037653 m!957797))

(assert (=> b!1037519 d!125185))

(declare-fun d!125187 () Bool)

(declare-fun isEmpty!934 (Option!636) Bool)

(assert (=> d!125187 (= (isDefined!435 (getValueByKey!585 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))) lt!457402)) (not (isEmpty!934 (getValueByKey!585 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))) lt!457402))))))

(declare-fun bs!30356 () Bool)

(assert (= bs!30356 d!125187))

(assert (=> bs!30356 m!957801))

(declare-fun m!958003 () Bool)

(assert (=> bs!30356 m!958003))

(assert (=> b!1037519 d!125187))

(declare-fun b!1037654 () Bool)

(declare-fun e!586949 () Option!636)

(assert (=> b!1037654 (= e!586949 (Some!635 (_2!7875 (h!23109 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))))))))

(declare-fun d!125189 () Bool)

(declare-fun c!105261 () Bool)

(assert (=> d!125189 (= c!105261 (and ((_ is Cons!21898) (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))) (= (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))) lt!457402)))))

(assert (=> d!125189 (= (getValueByKey!585 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))) lt!457402) e!586949)))

(declare-fun b!1037655 () Bool)

(declare-fun e!586950 () Option!636)

(assert (=> b!1037655 (= e!586949 e!586950)))

(declare-fun c!105262 () Bool)

(assert (=> b!1037655 (= c!105262 (and ((_ is Cons!21898) (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))) (not (= (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))) lt!457402))))))

(declare-fun b!1037656 () Bool)

(assert (=> b!1037656 (= e!586950 (getValueByKey!585 (t!31099 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))) lt!457402))))

(declare-fun b!1037657 () Bool)

(assert (=> b!1037657 (= e!586950 None!634)))

(assert (= (and d!125189 c!105261) b!1037654))

(assert (= (and d!125189 (not c!105261)) b!1037655))

(assert (= (and b!1037655 c!105262) b!1037656))

(assert (= (and b!1037655 (not c!105262)) b!1037657))

(declare-fun m!958005 () Bool)

(assert (=> b!1037656 m!958005))

(assert (=> b!1037519 d!125189))

(declare-fun d!125191 () Bool)

(assert (=> d!125191 (isDefined!435 (getValueByKey!585 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))) lt!457379))))

(declare-fun lt!457618 () Unit!33898)

(assert (=> d!125191 (= lt!457618 (choose!1710 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))) lt!457379))))

(declare-fun e!586951 () Bool)

(assert (=> d!125191 e!586951))

(declare-fun res!692284 () Bool)

(assert (=> d!125191 (=> (not res!692284) (not e!586951))))

(assert (=> d!125191 (= res!692284 (isStrictlySorted!707 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))))))

(assert (=> d!125191 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))) lt!457379) lt!457618)))

(declare-fun b!1037658 () Bool)

(assert (=> b!1037658 (= e!586951 (containsKey!566 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))) lt!457379))))

(assert (= (and d!125191 res!692284) b!1037658))

(assert (=> d!125191 m!957487))

(assert (=> d!125191 m!957487))

(assert (=> d!125191 m!957489))

(declare-fun m!958007 () Bool)

(assert (=> d!125191 m!958007))

(declare-fun m!958009 () Bool)

(assert (=> d!125191 m!958009))

(assert (=> b!1037658 m!957483))

(assert (=> b!1037358 d!125191))

(declare-fun d!125193 () Bool)

(assert (=> d!125193 (= (isDefined!435 (getValueByKey!585 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))) lt!457379)) (not (isEmpty!934 (getValueByKey!585 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))) lt!457379))))))

(declare-fun bs!30357 () Bool)

(assert (= bs!30357 d!125193))

(assert (=> bs!30357 m!957487))

(declare-fun m!958011 () Bool)

(assert (=> bs!30357 m!958011))

(assert (=> b!1037358 d!125193))

(declare-fun b!1037659 () Bool)

(declare-fun e!586952 () Option!636)

(assert (=> b!1037659 (= e!586952 (Some!635 (_2!7875 (h!23109 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))))))))

(declare-fun d!125195 () Bool)

(declare-fun c!105263 () Bool)

(assert (=> d!125195 (= c!105263 (and ((_ is Cons!21898) (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))) (= (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))) lt!457379)))))

(assert (=> d!125195 (= (getValueByKey!585 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))) lt!457379) e!586952)))

(declare-fun b!1037660 () Bool)

(declare-fun e!586953 () Option!636)

(assert (=> b!1037660 (= e!586952 e!586953)))

(declare-fun c!105264 () Bool)

(assert (=> b!1037660 (= c!105264 (and ((_ is Cons!21898) (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))) (not (= (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))) lt!457379))))))

(declare-fun b!1037661 () Bool)

(assert (=> b!1037661 (= e!586953 (getValueByKey!585 (t!31099 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))) lt!457379))))

(declare-fun b!1037662 () Bool)

(assert (=> b!1037662 (= e!586953 None!634)))

(assert (= (and d!125195 c!105263) b!1037659))

(assert (= (and d!125195 (not c!105263)) b!1037660))

(assert (= (and b!1037660 c!105264) b!1037661))

(assert (= (and b!1037660 (not c!105264)) b!1037662))

(declare-fun m!958013 () Bool)

(assert (=> b!1037661 m!958013))

(assert (=> b!1037358 d!125195))

(declare-fun d!125197 () Bool)

(declare-fun e!586954 () Bool)

(assert (=> d!125197 e!586954))

(declare-fun res!692285 () Bool)

(assert (=> d!125197 (=> res!692285 e!586954)))

(declare-fun lt!457622 () Bool)

(assert (=> d!125197 (= res!692285 (not lt!457622))))

(declare-fun lt!457619 () Bool)

(assert (=> d!125197 (= lt!457622 lt!457619)))

(declare-fun lt!457621 () Unit!33898)

(declare-fun e!586955 () Unit!33898)

(assert (=> d!125197 (= lt!457621 e!586955)))

(declare-fun c!105265 () Bool)

(assert (=> d!125197 (= c!105265 lt!457619)))

(assert (=> d!125197 (= lt!457619 (containsKey!566 (toList!6897 lt!457493) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))

(assert (=> d!125197 (= (contains!6046 lt!457493 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))) lt!457622)))

(declare-fun b!1037663 () Bool)

(declare-fun lt!457620 () Unit!33898)

(assert (=> b!1037663 (= e!586955 lt!457620)))

(assert (=> b!1037663 (= lt!457620 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457493) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))

(assert (=> b!1037663 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457493) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))

(declare-fun b!1037664 () Bool)

(declare-fun Unit!33915 () Unit!33898)

(assert (=> b!1037664 (= e!586955 Unit!33915)))

(declare-fun b!1037665 () Bool)

(assert (=> b!1037665 (= e!586954 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457493) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(assert (= (and d!125197 c!105265) b!1037663))

(assert (= (and d!125197 (not c!105265)) b!1037664))

(assert (= (and d!125197 (not res!692285)) b!1037665))

(declare-fun m!958015 () Bool)

(assert (=> d!125197 m!958015))

(declare-fun m!958017 () Bool)

(assert (=> b!1037663 m!958017))

(assert (=> b!1037663 m!957653))

(assert (=> b!1037663 m!957653))

(declare-fun m!958019 () Bool)

(assert (=> b!1037663 m!958019))

(assert (=> b!1037665 m!957653))

(assert (=> b!1037665 m!957653))

(assert (=> b!1037665 m!958019))

(assert (=> d!125091 d!125197))

(declare-fun b!1037666 () Bool)

(declare-fun e!586956 () Option!636)

(assert (=> b!1037666 (= e!586956 (Some!635 (_2!7875 (h!23109 lt!457495))))))

(declare-fun d!125199 () Bool)

(declare-fun c!105266 () Bool)

(assert (=> d!125199 (= c!105266 (and ((_ is Cons!21898) lt!457495) (= (_1!7875 (h!23109 lt!457495)) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(assert (=> d!125199 (= (getValueByKey!585 lt!457495 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))) e!586956)))

(declare-fun b!1037667 () Bool)

(declare-fun e!586957 () Option!636)

(assert (=> b!1037667 (= e!586956 e!586957)))

(declare-fun c!105267 () Bool)

(assert (=> b!1037667 (= c!105267 (and ((_ is Cons!21898) lt!457495) (not (= (_1!7875 (h!23109 lt!457495)) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))))

(declare-fun b!1037668 () Bool)

(assert (=> b!1037668 (= e!586957 (getValueByKey!585 (t!31099 lt!457495) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))

(declare-fun b!1037669 () Bool)

(assert (=> b!1037669 (= e!586957 None!634)))

(assert (= (and d!125199 c!105266) b!1037666))

(assert (= (and d!125199 (not c!105266)) b!1037667))

(assert (= (and b!1037667 c!105267) b!1037668))

(assert (= (and b!1037667 (not c!105267)) b!1037669))

(declare-fun m!958021 () Bool)

(assert (=> b!1037668 m!958021))

(assert (=> d!125091 d!125199))

(declare-fun d!125201 () Bool)

(assert (=> d!125201 (= (getValueByKey!585 lt!457495 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))) (Some!635 (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))

(declare-fun lt!457623 () Unit!33898)

(assert (=> d!125201 (= lt!457623 (choose!1709 lt!457495 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)) (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))

(declare-fun e!586958 () Bool)

(assert (=> d!125201 e!586958))

(declare-fun res!692286 () Bool)

(assert (=> d!125201 (=> (not res!692286) (not e!586958))))

(assert (=> d!125201 (= res!692286 (isStrictlySorted!707 lt!457495))))

(assert (=> d!125201 (= (lemmaContainsTupThenGetReturnValue!281 lt!457495 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)) (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))) lt!457623)))

(declare-fun b!1037670 () Bool)

(declare-fun res!692287 () Bool)

(assert (=> b!1037670 (=> (not res!692287) (not e!586958))))

(assert (=> b!1037670 (= res!692287 (containsKey!566 lt!457495 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))

(declare-fun b!1037671 () Bool)

(assert (=> b!1037671 (= e!586958 (contains!6047 lt!457495 (tuple2!15729 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)) (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(assert (= (and d!125201 res!692286) b!1037670))

(assert (= (and b!1037670 res!692287) b!1037671))

(assert (=> d!125201 m!957647))

(declare-fun m!958023 () Bool)

(assert (=> d!125201 m!958023))

(declare-fun m!958025 () Bool)

(assert (=> d!125201 m!958025))

(declare-fun m!958027 () Bool)

(assert (=> b!1037670 m!958027))

(declare-fun m!958029 () Bool)

(assert (=> b!1037671 m!958029))

(assert (=> d!125091 d!125201))

(declare-fun b!1037672 () Bool)

(declare-fun res!692288 () Bool)

(declare-fun e!586963 () Bool)

(assert (=> b!1037672 (=> (not res!692288) (not e!586963))))

(declare-fun lt!457624 () List!21902)

(assert (=> b!1037672 (= res!692288 (containsKey!566 lt!457624 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))

(declare-fun b!1037673 () Bool)

(declare-fun c!105269 () Bool)

(assert (=> b!1037673 (= c!105269 (and ((_ is Cons!21898) (toList!6897 call!43890)) (bvsgt (_1!7875 (h!23109 (toList!6897 call!43890))) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(declare-fun e!586959 () List!21902)

(declare-fun e!586961 () List!21902)

(assert (=> b!1037673 (= e!586959 e!586961)))

(declare-fun b!1037674 () Bool)

(declare-fun e!586960 () List!21902)

(assert (=> b!1037674 (= e!586960 (insertStrictlySorted!374 (t!31099 (toList!6897 call!43890)) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)) (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))

(declare-fun b!1037675 () Bool)

(assert (=> b!1037675 (= e!586963 (contains!6047 lt!457624 (tuple2!15729 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)) (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(declare-fun bm!43926 () Bool)

(declare-fun call!43929 () List!21902)

(declare-fun call!43928 () List!21902)

(assert (=> bm!43926 (= call!43929 call!43928)))

(declare-fun b!1037676 () Bool)

(assert (=> b!1037676 (= e!586961 call!43929)))

(declare-fun b!1037677 () Bool)

(declare-fun e!586962 () List!21902)

(declare-fun call!43930 () List!21902)

(assert (=> b!1037677 (= e!586962 call!43930)))

(declare-fun bm!43927 () Bool)

(assert (=> bm!43927 (= call!43928 call!43930)))

(declare-fun b!1037678 () Bool)

(assert (=> b!1037678 (= e!586959 call!43928)))

(declare-fun b!1037679 () Bool)

(assert (=> b!1037679 (= e!586961 call!43929)))

(declare-fun b!1037680 () Bool)

(declare-fun c!105270 () Bool)

(assert (=> b!1037680 (= e!586960 (ite c!105270 (t!31099 (toList!6897 call!43890)) (ite c!105269 (Cons!21898 (h!23109 (toList!6897 call!43890)) (t!31099 (toList!6897 call!43890))) Nil!21899)))))

(declare-fun b!1037681 () Bool)

(assert (=> b!1037681 (= e!586962 e!586959)))

(assert (=> b!1037681 (= c!105270 (and ((_ is Cons!21898) (toList!6897 call!43890)) (= (_1!7875 (h!23109 (toList!6897 call!43890))) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(declare-fun c!105271 () Bool)

(declare-fun bm!43925 () Bool)

(assert (=> bm!43925 (= call!43930 ($colon$colon!604 e!586960 (ite c!105271 (h!23109 (toList!6897 call!43890)) (tuple2!15729 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)) (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))))

(declare-fun c!105268 () Bool)

(assert (=> bm!43925 (= c!105268 c!105271)))

(declare-fun d!125203 () Bool)

(assert (=> d!125203 e!586963))

(declare-fun res!692289 () Bool)

(assert (=> d!125203 (=> (not res!692289) (not e!586963))))

(assert (=> d!125203 (= res!692289 (isStrictlySorted!707 lt!457624))))

(assert (=> d!125203 (= lt!457624 e!586962)))

(assert (=> d!125203 (= c!105271 (and ((_ is Cons!21898) (toList!6897 call!43890)) (bvslt (_1!7875 (h!23109 (toList!6897 call!43890))) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(assert (=> d!125203 (isStrictlySorted!707 (toList!6897 call!43890))))

(assert (=> d!125203 (= (insertStrictlySorted!374 (toList!6897 call!43890) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)) (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))) lt!457624)))

(assert (= (and d!125203 c!105271) b!1037677))

(assert (= (and d!125203 (not c!105271)) b!1037681))

(assert (= (and b!1037681 c!105270) b!1037678))

(assert (= (and b!1037681 (not c!105270)) b!1037673))

(assert (= (and b!1037673 c!105269) b!1037679))

(assert (= (and b!1037673 (not c!105269)) b!1037676))

(assert (= (or b!1037679 b!1037676) bm!43926))

(assert (= (or b!1037678 bm!43926) bm!43927))

(assert (= (or b!1037677 bm!43927) bm!43925))

(assert (= (and bm!43925 c!105268) b!1037674))

(assert (= (and bm!43925 (not c!105268)) b!1037680))

(assert (= (and d!125203 res!692289) b!1037672))

(assert (= (and b!1037672 res!692288) b!1037675))

(declare-fun m!958031 () Bool)

(assert (=> b!1037674 m!958031))

(declare-fun m!958033 () Bool)

(assert (=> bm!43925 m!958033))

(declare-fun m!958035 () Bool)

(assert (=> b!1037672 m!958035))

(declare-fun m!958037 () Bool)

(assert (=> b!1037675 m!958037))

(declare-fun m!958039 () Bool)

(assert (=> d!125203 m!958039))

(declare-fun m!958041 () Bool)

(assert (=> d!125203 m!958041))

(assert (=> d!125091 d!125203))

(declare-fun d!125205 () Bool)

(assert (=> d!125205 (= (get!16493 (getValueByKey!585 (toList!6897 lt!457408) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))) (v!14927 (getValueByKey!585 (toList!6897 lt!457408) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!125081 d!125205))

(declare-fun b!1037682 () Bool)

(declare-fun e!586964 () Option!636)

(assert (=> b!1037682 (= e!586964 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457408)))))))

(declare-fun d!125207 () Bool)

(declare-fun c!105272 () Bool)

(assert (=> d!125207 (= c!105272 (and ((_ is Cons!21898) (toList!6897 lt!457408)) (= (_1!7875 (h!23109 (toList!6897 lt!457408))) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!125207 (= (getValueByKey!585 (toList!6897 lt!457408) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) e!586964)))

(declare-fun b!1037683 () Bool)

(declare-fun e!586965 () Option!636)

(assert (=> b!1037683 (= e!586964 e!586965)))

(declare-fun c!105273 () Bool)

(assert (=> b!1037683 (= c!105273 (and ((_ is Cons!21898) (toList!6897 lt!457408)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457408))) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))))

(declare-fun b!1037684 () Bool)

(assert (=> b!1037684 (= e!586965 (getValueByKey!585 (t!31099 (toList!6897 lt!457408)) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037685 () Bool)

(assert (=> b!1037685 (= e!586965 None!634)))

(assert (= (and d!125207 c!105272) b!1037682))

(assert (= (and d!125207 (not c!105272)) b!1037683))

(assert (= (and b!1037683 c!105273) b!1037684))

(assert (= (and b!1037683 (not c!105273)) b!1037685))

(assert (=> b!1037684 m!957361))

(declare-fun m!958043 () Bool)

(assert (=> b!1037684 m!958043))

(assert (=> d!125081 d!125207))

(declare-fun d!125209 () Bool)

(declare-fun res!692294 () Bool)

(declare-fun e!586970 () Bool)

(assert (=> d!125209 (=> res!692294 e!586970)))

(assert (=> d!125209 (= res!692294 (and ((_ is Cons!21898) (toList!6897 lt!457385)) (= (_1!7875 (h!23109 (toList!6897 lt!457385))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125209 (= (containsKey!566 (toList!6897 lt!457385) #b0000000000000000000000000000000000000000000000000000000000000000) e!586970)))

(declare-fun b!1037690 () Bool)

(declare-fun e!586971 () Bool)

(assert (=> b!1037690 (= e!586970 e!586971)))

(declare-fun res!692295 () Bool)

(assert (=> b!1037690 (=> (not res!692295) (not e!586971))))

(assert (=> b!1037690 (= res!692295 (and (or (not ((_ is Cons!21898) (toList!6897 lt!457385))) (bvsle (_1!7875 (h!23109 (toList!6897 lt!457385))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21898) (toList!6897 lt!457385)) (bvslt (_1!7875 (h!23109 (toList!6897 lt!457385))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1037691 () Bool)

(assert (=> b!1037691 (= e!586971 (containsKey!566 (t!31099 (toList!6897 lt!457385)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125209 (not res!692294)) b!1037690))

(assert (= (and b!1037690 res!692295) b!1037691))

(declare-fun m!958045 () Bool)

(assert (=> b!1037691 m!958045))

(assert (=> d!125079 d!125209))

(declare-fun d!125211 () Bool)

(declare-fun res!692296 () Bool)

(declare-fun e!586972 () Bool)

(assert (=> d!125211 (=> res!692296 e!586972)))

(assert (=> d!125211 (= res!692296 (and ((_ is Cons!21898) (toList!6897 lt!457408)) (= (_1!7875 (h!23109 (toList!6897 lt!457408))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125211 (= (containsKey!566 (toList!6897 lt!457408) #b0000000000000000000000000000000000000000000000000000000000000000) e!586972)))

(declare-fun b!1037692 () Bool)

(declare-fun e!586973 () Bool)

(assert (=> b!1037692 (= e!586972 e!586973)))

(declare-fun res!692297 () Bool)

(assert (=> b!1037692 (=> (not res!692297) (not e!586973))))

(assert (=> b!1037692 (= res!692297 (and (or (not ((_ is Cons!21898) (toList!6897 lt!457408))) (bvsle (_1!7875 (h!23109 (toList!6897 lt!457408))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21898) (toList!6897 lt!457408)) (bvslt (_1!7875 (h!23109 (toList!6897 lt!457408))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1037693 () Bool)

(assert (=> b!1037693 (= e!586973 (containsKey!566 (t!31099 (toList!6897 lt!457408)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125211 (not res!692296)) b!1037692))

(assert (= (and b!1037692 res!692297) b!1037693))

(declare-fun m!958047 () Bool)

(assert (=> b!1037693 m!958047))

(assert (=> d!125165 d!125211))

(declare-fun d!125213 () Bool)

(assert (=> d!125213 (= (get!16493 (getValueByKey!585 (toList!6897 (+!3127 lt!457375 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))) lt!457373)) (v!14927 (getValueByKey!585 (toList!6897 (+!3127 lt!457375 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))) lt!457373)))))

(assert (=> d!125061 d!125213))

(declare-fun e!586974 () Option!636)

(declare-fun b!1037694 () Bool)

(assert (=> b!1037694 (= e!586974 (Some!635 (_2!7875 (h!23109 (toList!6897 (+!3127 lt!457375 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))))))))))

(declare-fun c!105274 () Bool)

(declare-fun d!125215 () Bool)

(assert (=> d!125215 (= c!105274 (and ((_ is Cons!21898) (toList!6897 (+!3127 lt!457375 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))))) (= (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457375 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))))) lt!457373)))))

(assert (=> d!125215 (= (getValueByKey!585 (toList!6897 (+!3127 lt!457375 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))) lt!457373) e!586974)))

(declare-fun b!1037695 () Bool)

(declare-fun e!586975 () Option!636)

(assert (=> b!1037695 (= e!586974 e!586975)))

(declare-fun c!105275 () Bool)

(assert (=> b!1037695 (= c!105275 (and ((_ is Cons!21898) (toList!6897 (+!3127 lt!457375 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))))) (not (= (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457375 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))))) lt!457373))))))

(declare-fun b!1037696 () Bool)

(assert (=> b!1037696 (= e!586975 (getValueByKey!585 (t!31099 (toList!6897 (+!3127 lt!457375 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))))) lt!457373))))

(declare-fun b!1037697 () Bool)

(assert (=> b!1037697 (= e!586975 None!634)))

(assert (= (and d!125215 c!105274) b!1037694))

(assert (= (and d!125215 (not c!105274)) b!1037695))

(assert (= (and b!1037695 c!105275) b!1037696))

(assert (= (and b!1037695 (not c!105275)) b!1037697))

(declare-fun m!958049 () Bool)

(assert (=> b!1037696 m!958049))

(assert (=> d!125061 d!125215))

(declare-fun b!1037698 () Bool)

(declare-fun e!586982 () Bool)

(declare-fun lt!457631 () ListLongMap!13763)

(assert (=> b!1037698 (= e!586982 (= lt!457631 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!457297 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6269 thiss!1427))))))

(declare-fun b!1037699 () Bool)

(assert (=> b!1037699 (= e!586982 (isEmpty!933 lt!457631))))

(declare-fun d!125217 () Bool)

(declare-fun e!586981 () Bool)

(assert (=> d!125217 e!586981))

(declare-fun res!692301 () Bool)

(assert (=> d!125217 (=> (not res!692301) (not e!586981))))

(assert (=> d!125217 (= res!692301 (not (contains!6046 lt!457631 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!586980 () ListLongMap!13763)

(assert (=> d!125217 (= lt!457631 e!586980)))

(declare-fun c!105276 () Bool)

(assert (=> d!125217 (= c!105276 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 thiss!1427))))))

(assert (=> d!125217 (validMask!0 (mask!30230 thiss!1427))))

(assert (=> d!125217 (= (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!457297 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6269 thiss!1427)) lt!457631)))

(declare-fun b!1037700 () Bool)

(declare-fun e!586977 () Bool)

(assert (=> b!1037700 (= e!586977 e!586982)))

(declare-fun c!105277 () Bool)

(assert (=> b!1037700 (= c!105277 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun b!1037701 () Bool)

(assert (=> b!1037701 (= e!586981 e!586977)))

(declare-fun c!105279 () Bool)

(declare-fun e!586979 () Bool)

(assert (=> b!1037701 (= c!105279 e!586979)))

(declare-fun res!692298 () Bool)

(assert (=> b!1037701 (=> (not res!692298) (not e!586979))))

(assert (=> b!1037701 (= res!692298 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun b!1037702 () Bool)

(declare-fun lt!457630 () Unit!33898)

(declare-fun lt!457626 () Unit!33898)

(assert (=> b!1037702 (= lt!457630 lt!457626)))

(declare-fun lt!457627 () V!37667)

(declare-fun lt!457625 () ListLongMap!13763)

(declare-fun lt!457628 () (_ BitVec 64))

(declare-fun lt!457629 () (_ BitVec 64))

(assert (=> b!1037702 (not (contains!6046 (+!3127 lt!457625 (tuple2!15729 lt!457629 lt!457627)) lt!457628))))

(assert (=> b!1037702 (= lt!457626 (addStillNotContains!245 lt!457625 lt!457629 lt!457627 lt!457628))))

(assert (=> b!1037702 (= lt!457628 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1037702 (= lt!457627 (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1037702 (= lt!457629 (select (arr!31447 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun call!43931 () ListLongMap!13763)

(assert (=> b!1037702 (= lt!457625 call!43931)))

(declare-fun e!586978 () ListLongMap!13763)

(assert (=> b!1037702 (= e!586978 (+!3127 call!43931 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1037703 () Bool)

(declare-fun res!692299 () Bool)

(assert (=> b!1037703 (=> (not res!692299) (not e!586981))))

(assert (=> b!1037703 (= res!692299 (not (contains!6046 lt!457631 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1037704 () Bool)

(assert (=> b!1037704 (= e!586980 (ListLongMap!13764 Nil!21899))))

(declare-fun b!1037705 () Bool)

(declare-fun e!586976 () Bool)

(assert (=> b!1037705 (= e!586977 e!586976)))

(assert (=> b!1037705 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun res!692300 () Bool)

(assert (=> b!1037705 (= res!692300 (contains!6046 lt!457631 (select (arr!31447 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1037705 (=> (not res!692300) (not e!586976))))

(declare-fun bm!43928 () Bool)

(assert (=> bm!43928 (= call!43931 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (bvand (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) (zeroValue!6103 thiss!1427) lt!457297 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6269 thiss!1427)))))

(declare-fun b!1037706 () Bool)

(assert (=> b!1037706 (= e!586980 e!586978)))

(declare-fun c!105278 () Bool)

(assert (=> b!1037706 (= c!105278 (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1037707 () Bool)

(assert (=> b!1037707 (= e!586978 call!43931)))

(declare-fun b!1037708 () Bool)

(assert (=> b!1037708 (= e!586979 (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1037708 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1037709 () Bool)

(assert (=> b!1037709 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 thiss!1427))))))

(assert (=> b!1037709 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31977 (_values!6292 thiss!1427))))))

(assert (=> b!1037709 (= e!586976 (= (apply!916 lt!457631 (select (arr!31447 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!125217 c!105276) b!1037704))

(assert (= (and d!125217 (not c!105276)) b!1037706))

(assert (= (and b!1037706 c!105278) b!1037702))

(assert (= (and b!1037706 (not c!105278)) b!1037707))

(assert (= (or b!1037702 b!1037707) bm!43928))

(assert (= (and d!125217 res!692301) b!1037703))

(assert (= (and b!1037703 res!692299) b!1037701))

(assert (= (and b!1037701 res!692298) b!1037708))

(assert (= (and b!1037701 c!105279) b!1037705))

(assert (= (and b!1037701 (not c!105279)) b!1037700))

(assert (= (and b!1037705 res!692300) b!1037709))

(assert (= (and b!1037700 c!105277) b!1037698))

(assert (= (and b!1037700 (not c!105277)) b!1037699))

(declare-fun b_lambda!16145 () Bool)

(assert (=> (not b_lambda!16145) (not b!1037702)))

(assert (=> b!1037702 t!31107))

(declare-fun b_and!33411 () Bool)

(assert (= b_and!33409 (and (=> t!31107 result!14419) b_and!33411)))

(declare-fun b_lambda!16147 () Bool)

(assert (=> (not b_lambda!16147) (not b!1037709)))

(assert (=> b!1037709 t!31107))

(declare-fun b_and!33413 () Bool)

(assert (= b_and!33411 (and (=> t!31107 result!14419) b_and!33413)))

(declare-fun m!958051 () Bool)

(assert (=> b!1037698 m!958051))

(declare-fun m!958053 () Bool)

(assert (=> d!125217 m!958053))

(assert (=> d!125217 m!957367))

(declare-fun m!958055 () Bool)

(assert (=> b!1037702 m!958055))

(declare-fun m!958057 () Bool)

(assert (=> b!1037702 m!958057))

(declare-fun m!958059 () Bool)

(assert (=> b!1037702 m!958059))

(declare-fun m!958061 () Bool)

(assert (=> b!1037702 m!958061))

(assert (=> b!1037702 m!957373))

(declare-fun m!958063 () Bool)

(assert (=> b!1037702 m!958063))

(assert (=> b!1037702 m!958061))

(declare-fun m!958065 () Bool)

(assert (=> b!1037702 m!958065))

(assert (=> b!1037702 m!957373))

(assert (=> b!1037702 m!958057))

(declare-fun m!958067 () Bool)

(assert (=> b!1037702 m!958067))

(assert (=> b!1037705 m!958067))

(assert (=> b!1037705 m!958067))

(declare-fun m!958069 () Bool)

(assert (=> b!1037705 m!958069))

(assert (=> b!1037706 m!958067))

(assert (=> b!1037706 m!958067))

(declare-fun m!958071 () Bool)

(assert (=> b!1037706 m!958071))

(assert (=> b!1037708 m!958067))

(assert (=> b!1037708 m!958067))

(assert (=> b!1037708 m!958071))

(assert (=> bm!43928 m!958051))

(assert (=> b!1037709 m!958061))

(assert (=> b!1037709 m!957373))

(assert (=> b!1037709 m!958063))

(assert (=> b!1037709 m!958061))

(assert (=> b!1037709 m!958067))

(declare-fun m!958073 () Bool)

(assert (=> b!1037709 m!958073))

(assert (=> b!1037709 m!957373))

(assert (=> b!1037709 m!958067))

(declare-fun m!958075 () Bool)

(assert (=> b!1037699 m!958075))

(declare-fun m!958077 () Bool)

(assert (=> b!1037703 m!958077))

(assert (=> b!1037504 d!125217))

(declare-fun d!125219 () Bool)

(assert (=> d!125219 (= (get!16493 (getValueByKey!585 (toList!6897 lt!457382) lt!457372)) (v!14927 (getValueByKey!585 (toList!6897 lt!457382) lt!457372)))))

(assert (=> d!125055 d!125219))

(declare-fun b!1037710 () Bool)

(declare-fun e!586983 () Option!636)

(assert (=> b!1037710 (= e!586983 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457382)))))))

(declare-fun d!125221 () Bool)

(declare-fun c!105280 () Bool)

(assert (=> d!125221 (= c!105280 (and ((_ is Cons!21898) (toList!6897 lt!457382)) (= (_1!7875 (h!23109 (toList!6897 lt!457382))) lt!457372)))))

(assert (=> d!125221 (= (getValueByKey!585 (toList!6897 lt!457382) lt!457372) e!586983)))

(declare-fun b!1037711 () Bool)

(declare-fun e!586984 () Option!636)

(assert (=> b!1037711 (= e!586983 e!586984)))

(declare-fun c!105281 () Bool)

(assert (=> b!1037711 (= c!105281 (and ((_ is Cons!21898) (toList!6897 lt!457382)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457382))) lt!457372))))))

(declare-fun b!1037712 () Bool)

(assert (=> b!1037712 (= e!586984 (getValueByKey!585 (t!31099 (toList!6897 lt!457382)) lt!457372))))

(declare-fun b!1037713 () Bool)

(assert (=> b!1037713 (= e!586984 None!634)))

(assert (= (and d!125221 c!105280) b!1037710))

(assert (= (and d!125221 (not c!105280)) b!1037711))

(assert (= (and b!1037711 c!105281) b!1037712))

(assert (= (and b!1037711 (not c!105281)) b!1037713))

(declare-fun m!958079 () Bool)

(assert (=> b!1037712 m!958079))

(assert (=> d!125055 d!125221))

(declare-fun d!125223 () Bool)

(assert (=> d!125223 (= (get!16493 (getValueByKey!585 (toList!6897 lt!457408) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14927 (getValueByKey!585 (toList!6897 lt!457408) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125085 d!125223))

(declare-fun b!1037714 () Bool)

(declare-fun e!586985 () Option!636)

(assert (=> b!1037714 (= e!586985 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457408)))))))

(declare-fun d!125225 () Bool)

(declare-fun c!105282 () Bool)

(assert (=> d!125225 (= c!105282 (and ((_ is Cons!21898) (toList!6897 lt!457408)) (= (_1!7875 (h!23109 (toList!6897 lt!457408))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125225 (= (getValueByKey!585 (toList!6897 lt!457408) #b0000000000000000000000000000000000000000000000000000000000000000) e!586985)))

(declare-fun b!1037715 () Bool)

(declare-fun e!586986 () Option!636)

(assert (=> b!1037715 (= e!586985 e!586986)))

(declare-fun c!105283 () Bool)

(assert (=> b!1037715 (= c!105283 (and ((_ is Cons!21898) (toList!6897 lt!457408)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457408))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1037716 () Bool)

(assert (=> b!1037716 (= e!586986 (getValueByKey!585 (t!31099 (toList!6897 lt!457408)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037717 () Bool)

(assert (=> b!1037717 (= e!586986 None!634)))

(assert (= (and d!125225 c!105282) b!1037714))

(assert (= (and d!125225 (not c!105282)) b!1037715))

(assert (= (and b!1037715 c!105283) b!1037716))

(assert (= (and b!1037715 (not c!105283)) b!1037717))

(declare-fun m!958081 () Bool)

(assert (=> b!1037716 m!958081))

(assert (=> d!125085 d!125225))

(assert (=> d!125051 d!125067))

(declare-fun d!125227 () Bool)

(declare-fun e!586987 () Bool)

(assert (=> d!125227 e!586987))

(declare-fun res!692302 () Bool)

(assert (=> d!125227 (=> res!692302 e!586987)))

(declare-fun lt!457635 () Bool)

(assert (=> d!125227 (= res!692302 (not lt!457635))))

(declare-fun lt!457632 () Bool)

(assert (=> d!125227 (= lt!457635 lt!457632)))

(declare-fun lt!457634 () Unit!33898)

(declare-fun e!586988 () Unit!33898)

(assert (=> d!125227 (= lt!457634 e!586988)))

(declare-fun c!105284 () Bool)

(assert (=> d!125227 (= c!105284 lt!457632)))

(assert (=> d!125227 (= lt!457632 (containsKey!566 (toList!6897 lt!457382) lt!457372))))

(assert (=> d!125227 (= (contains!6046 lt!457382 lt!457372) lt!457635)))

(declare-fun b!1037718 () Bool)

(declare-fun lt!457633 () Unit!33898)

(assert (=> b!1037718 (= e!586988 lt!457633)))

(assert (=> b!1037718 (= lt!457633 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457382) lt!457372))))

(assert (=> b!1037718 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457382) lt!457372))))

(declare-fun b!1037719 () Bool)

(declare-fun Unit!33916 () Unit!33898)

(assert (=> b!1037719 (= e!586988 Unit!33916)))

(declare-fun b!1037720 () Bool)

(assert (=> b!1037720 (= e!586987 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457382) lt!457372)))))

(assert (= (and d!125227 c!105284) b!1037718))

(assert (= (and d!125227 (not c!105284)) b!1037719))

(assert (= (and d!125227 (not res!692302)) b!1037720))

(declare-fun m!958083 () Bool)

(assert (=> d!125227 m!958083))

(declare-fun m!958085 () Bool)

(assert (=> b!1037718 m!958085))

(assert (=> b!1037718 m!957527))

(assert (=> b!1037718 m!957527))

(declare-fun m!958087 () Bool)

(assert (=> b!1037718 m!958087))

(assert (=> b!1037720 m!957527))

(assert (=> b!1037720 m!957527))

(assert (=> b!1037720 m!958087))

(assert (=> d!125051 d!125227))

(assert (=> d!125051 d!125053))

(assert (=> d!125051 d!125055))

(declare-fun d!125229 () Bool)

(assert (=> d!125229 (= (apply!916 (+!3127 lt!457382 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))) lt!457372) (apply!916 lt!457382 lt!457372))))

(assert (=> d!125229 true))

(declare-fun _$34!1172 () Unit!33898)

(assert (=> d!125229 (= (choose!1707 lt!457382 lt!457377 (minValue!6105 thiss!1427) lt!457372) _$34!1172)))

(declare-fun bs!30358 () Bool)

(assert (= bs!30358 d!125229))

(assert (=> bs!30358 m!957395))

(assert (=> bs!30358 m!957395))

(assert (=> bs!30358 m!957397))

(assert (=> bs!30358 m!957399))

(assert (=> d!125051 d!125229))

(declare-fun d!125231 () Bool)

(assert (=> d!125231 (= (get!16493 (getValueByKey!585 (toList!6897 lt!457405) lt!457395)) (v!14927 (getValueByKey!585 (toList!6897 lt!457405) lt!457395)))))

(assert (=> d!125117 d!125231))

(declare-fun b!1037722 () Bool)

(declare-fun e!586989 () Option!636)

(assert (=> b!1037722 (= e!586989 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457405)))))))

(declare-fun d!125233 () Bool)

(declare-fun c!105285 () Bool)

(assert (=> d!125233 (= c!105285 (and ((_ is Cons!21898) (toList!6897 lt!457405)) (= (_1!7875 (h!23109 (toList!6897 lt!457405))) lt!457395)))))

(assert (=> d!125233 (= (getValueByKey!585 (toList!6897 lt!457405) lt!457395) e!586989)))

(declare-fun b!1037723 () Bool)

(declare-fun e!586990 () Option!636)

(assert (=> b!1037723 (= e!586989 e!586990)))

(declare-fun c!105286 () Bool)

(assert (=> b!1037723 (= c!105286 (and ((_ is Cons!21898) (toList!6897 lt!457405)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457405))) lt!457395))))))

(declare-fun b!1037724 () Bool)

(assert (=> b!1037724 (= e!586990 (getValueByKey!585 (t!31099 (toList!6897 lt!457405)) lt!457395))))

(declare-fun b!1037725 () Bool)

(assert (=> b!1037725 (= e!586990 None!634)))

(assert (= (and d!125233 c!105285) b!1037722))

(assert (= (and d!125233 (not c!105285)) b!1037723))

(assert (= (and b!1037723 c!105286) b!1037724))

(assert (= (and b!1037723 (not c!105286)) b!1037725))

(declare-fun m!958089 () Bool)

(assert (=> b!1037724 m!958089))

(assert (=> d!125117 d!125233))

(declare-fun d!125235 () Bool)

(assert (=> d!125235 (= (validKeyInArray!0 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1037473 d!125235))

(declare-fun d!125237 () Bool)

(assert (=> d!125237 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457408) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!457636 () Unit!33898)

(assert (=> d!125237 (= lt!457636 (choose!1710 (toList!6897 lt!457408) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586991 () Bool)

(assert (=> d!125237 e!586991))

(declare-fun res!692303 () Bool)

(assert (=> d!125237 (=> (not res!692303) (not e!586991))))

(assert (=> d!125237 (= res!692303 (isStrictlySorted!707 (toList!6897 lt!457408)))))

(assert (=> d!125237 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457408) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457636)))

(declare-fun b!1037726 () Bool)

(assert (=> b!1037726 (= e!586991 (containsKey!566 (toList!6897 lt!457408) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125237 res!692303) b!1037726))

(assert (=> d!125237 m!957603))

(assert (=> d!125237 m!957603))

(assert (=> d!125237 m!957605))

(declare-fun m!958091 () Bool)

(assert (=> d!125237 m!958091))

(declare-fun m!958093 () Bool)

(assert (=> d!125237 m!958093))

(assert (=> b!1037726 m!957599))

(assert (=> b!1037416 d!125237))

(declare-fun d!125239 () Bool)

(assert (=> d!125239 (= (isDefined!435 (getValueByKey!585 (toList!6897 lt!457408) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!934 (getValueByKey!585 (toList!6897 lt!457408) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30359 () Bool)

(assert (= bs!30359 d!125239))

(assert (=> bs!30359 m!957603))

(declare-fun m!958095 () Bool)

(assert (=> bs!30359 m!958095))

(assert (=> b!1037416 d!125239))

(declare-fun b!1037727 () Bool)

(declare-fun e!586992 () Option!636)

(assert (=> b!1037727 (= e!586992 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457408)))))))

(declare-fun d!125241 () Bool)

(declare-fun c!105287 () Bool)

(assert (=> d!125241 (= c!105287 (and ((_ is Cons!21898) (toList!6897 lt!457408)) (= (_1!7875 (h!23109 (toList!6897 lt!457408))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125241 (= (getValueByKey!585 (toList!6897 lt!457408) #b1000000000000000000000000000000000000000000000000000000000000000) e!586992)))

(declare-fun b!1037728 () Bool)

(declare-fun e!586993 () Option!636)

(assert (=> b!1037728 (= e!586992 e!586993)))

(declare-fun c!105288 () Bool)

(assert (=> b!1037728 (= c!105288 (and ((_ is Cons!21898) (toList!6897 lt!457408)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457408))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1037729 () Bool)

(assert (=> b!1037729 (= e!586993 (getValueByKey!585 (t!31099 (toList!6897 lt!457408)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037730 () Bool)

(assert (=> b!1037730 (= e!586993 None!634)))

(assert (= (and d!125241 c!105287) b!1037727))

(assert (= (and d!125241 (not c!105287)) b!1037728))

(assert (= (and b!1037728 c!105288) b!1037729))

(assert (= (and b!1037728 (not c!105288)) b!1037730))

(declare-fun m!958097 () Bool)

(assert (=> b!1037729 m!958097))

(assert (=> b!1037416 d!125241))

(declare-fun d!125243 () Bool)

(declare-fun e!586994 () Bool)

(assert (=> d!125243 e!586994))

(declare-fun res!692304 () Bool)

(assert (=> d!125243 (=> res!692304 e!586994)))

(declare-fun lt!457640 () Bool)

(assert (=> d!125243 (= res!692304 (not lt!457640))))

(declare-fun lt!457637 () Bool)

(assert (=> d!125243 (= lt!457640 lt!457637)))

(declare-fun lt!457639 () Unit!33898)

(declare-fun e!586995 () Unit!33898)

(assert (=> d!125243 (= lt!457639 e!586995)))

(declare-fun c!105289 () Bool)

(assert (=> d!125243 (= c!105289 lt!457637)))

(assert (=> d!125243 (= lt!457637 (containsKey!566 (toList!6897 lt!457364) lt!457369))))

(assert (=> d!125243 (= (contains!6046 lt!457364 lt!457369) lt!457640)))

(declare-fun b!1037731 () Bool)

(declare-fun lt!457638 () Unit!33898)

(assert (=> b!1037731 (= e!586995 lt!457638)))

(assert (=> b!1037731 (= lt!457638 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457364) lt!457369))))

(assert (=> b!1037731 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457364) lt!457369))))

(declare-fun b!1037732 () Bool)

(declare-fun Unit!33917 () Unit!33898)

(assert (=> b!1037732 (= e!586995 Unit!33917)))

(declare-fun b!1037733 () Bool)

(assert (=> b!1037733 (= e!586994 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457364) lt!457369)))))

(assert (= (and d!125243 c!105289) b!1037731))

(assert (= (and d!125243 (not c!105289)) b!1037732))

(assert (= (and d!125243 (not res!692304)) b!1037733))

(declare-fun m!958099 () Bool)

(assert (=> d!125243 m!958099))

(declare-fun m!958101 () Bool)

(assert (=> b!1037731 m!958101))

(assert (=> b!1037731 m!957555))

(assert (=> b!1037731 m!957555))

(declare-fun m!958103 () Bool)

(assert (=> b!1037731 m!958103))

(assert (=> b!1037733 m!957555))

(assert (=> b!1037733 m!957555))

(assert (=> b!1037733 m!958103))

(assert (=> d!125071 d!125243))

(assert (=> d!125071 d!125065))

(assert (=> d!125071 d!125069))

(declare-fun d!125245 () Bool)

(assert (=> d!125245 (= (apply!916 (+!3127 lt!457364 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))) lt!457369) (apply!916 lt!457364 lt!457369))))

(assert (=> d!125245 true))

(declare-fun _$34!1173 () Unit!33898)

(assert (=> d!125245 (= (choose!1707 lt!457364 lt!457371 (minValue!6105 thiss!1427) lt!457369) _$34!1173)))

(declare-fun bs!30360 () Bool)

(assert (= bs!30360 d!125245))

(assert (=> bs!30360 m!957389))

(assert (=> bs!30360 m!957389))

(assert (=> bs!30360 m!957391))

(assert (=> bs!30360 m!957393))

(assert (=> d!125071 d!125245))

(assert (=> d!125071 d!125057))

(declare-fun d!125247 () Bool)

(declare-fun lt!457641 () Bool)

(assert (=> d!125247 (= lt!457641 (select (content!517 (toList!6897 lt!457574)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))

(declare-fun e!586997 () Bool)

(assert (=> d!125247 (= lt!457641 e!586997)))

(declare-fun res!692305 () Bool)

(assert (=> d!125247 (=> (not res!692305) (not e!586997))))

(assert (=> d!125247 (= res!692305 ((_ is Cons!21898) (toList!6897 lt!457574)))))

(assert (=> d!125247 (= (contains!6047 (toList!6897 lt!457574) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) lt!457641)))

(declare-fun b!1037734 () Bool)

(declare-fun e!586996 () Bool)

(assert (=> b!1037734 (= e!586997 e!586996)))

(declare-fun res!692306 () Bool)

(assert (=> b!1037734 (=> res!692306 e!586996)))

(assert (=> b!1037734 (= res!692306 (= (h!23109 (toList!6897 lt!457574)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))

(declare-fun b!1037735 () Bool)

(assert (=> b!1037735 (= e!586996 (contains!6047 (t!31099 (toList!6897 lt!457574)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))

(assert (= (and d!125247 res!692305) b!1037734))

(assert (= (and b!1037734 (not res!692306)) b!1037735))

(declare-fun m!958105 () Bool)

(assert (=> d!125247 m!958105))

(declare-fun m!958107 () Bool)

(assert (=> d!125247 m!958107))

(declare-fun m!958109 () Bool)

(assert (=> b!1037735 m!958109))

(assert (=> b!1037565 d!125247))

(declare-fun d!125249 () Bool)

(declare-fun lt!457642 () Bool)

(assert (=> d!125249 (= lt!457642 (select (content!517 (toList!6897 lt!457549)) (tuple2!15729 lt!457400 lt!457297)))))

(declare-fun e!586999 () Bool)

(assert (=> d!125249 (= lt!457642 e!586999)))

(declare-fun res!692307 () Bool)

(assert (=> d!125249 (=> (not res!692307) (not e!586999))))

(assert (=> d!125249 (= res!692307 ((_ is Cons!21898) (toList!6897 lt!457549)))))

(assert (=> d!125249 (= (contains!6047 (toList!6897 lt!457549) (tuple2!15729 lt!457400 lt!457297)) lt!457642)))

(declare-fun b!1037736 () Bool)

(declare-fun e!586998 () Bool)

(assert (=> b!1037736 (= e!586999 e!586998)))

(declare-fun res!692308 () Bool)

(assert (=> b!1037736 (=> res!692308 e!586998)))

(assert (=> b!1037736 (= res!692308 (= (h!23109 (toList!6897 lt!457549)) (tuple2!15729 lt!457400 lt!457297)))))

(declare-fun b!1037737 () Bool)

(assert (=> b!1037737 (= e!586998 (contains!6047 (t!31099 (toList!6897 lt!457549)) (tuple2!15729 lt!457400 lt!457297)))))

(assert (= (and d!125249 res!692307) b!1037736))

(assert (= (and b!1037736 (not res!692308)) b!1037737))

(declare-fun m!958111 () Bool)

(assert (=> d!125249 m!958111))

(declare-fun m!958113 () Bool)

(assert (=> d!125249 m!958113))

(declare-fun m!958115 () Bool)

(assert (=> b!1037737 m!958115))

(assert (=> b!1037524 d!125249))

(declare-fun d!125251 () Bool)

(declare-fun e!587000 () Bool)

(assert (=> d!125251 e!587000))

(declare-fun res!692309 () Bool)

(assert (=> d!125251 (=> res!692309 e!587000)))

(declare-fun lt!457646 () Bool)

(assert (=> d!125251 (= res!692309 (not lt!457646))))

(declare-fun lt!457643 () Bool)

(assert (=> d!125251 (= lt!457646 lt!457643)))

(declare-fun lt!457645 () Unit!33898)

(declare-fun e!587001 () Unit!33898)

(assert (=> d!125251 (= lt!457645 e!587001)))

(declare-fun c!105290 () Bool)

(assert (=> d!125251 (= c!105290 lt!457643)))

(assert (=> d!125251 (= lt!457643 (containsKey!566 (toList!6897 lt!457536) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125251 (= (contains!6046 lt!457536 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457646)))

(declare-fun b!1037738 () Bool)

(declare-fun lt!457644 () Unit!33898)

(assert (=> b!1037738 (= e!587001 lt!457644)))

(assert (=> b!1037738 (= lt!457644 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457536) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1037738 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457536) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037739 () Bool)

(declare-fun Unit!33918 () Unit!33898)

(assert (=> b!1037739 (= e!587001 Unit!33918)))

(declare-fun b!1037740 () Bool)

(assert (=> b!1037740 (= e!587000 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457536) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125251 c!105290) b!1037738))

(assert (= (and d!125251 (not c!105290)) b!1037739))

(assert (= (and d!125251 (not res!692309)) b!1037740))

(declare-fun m!958117 () Bool)

(assert (=> d!125251 m!958117))

(declare-fun m!958119 () Bool)

(assert (=> b!1037738 m!958119))

(declare-fun m!958121 () Bool)

(assert (=> b!1037738 m!958121))

(assert (=> b!1037738 m!958121))

(declare-fun m!958123 () Bool)

(assert (=> b!1037738 m!958123))

(assert (=> b!1037740 m!958121))

(assert (=> b!1037740 m!958121))

(assert (=> b!1037740 m!958123))

(assert (=> b!1037509 d!125251))

(assert (=> d!125049 d!125043))

(assert (=> d!125049 d!125063))

(declare-fun d!125253 () Bool)

(assert (=> d!125253 (contains!6046 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))) lt!457379)))

(assert (=> d!125253 true))

(declare-fun _$35!442 () Unit!33898)

(assert (=> d!125253 (= (choose!1708 lt!457370 lt!457374 (zeroValue!6103 thiss!1427) lt!457379) _$35!442)))

(declare-fun bs!30361 () Bool)

(assert (= bs!30361 d!125253))

(assert (=> bs!30361 m!957387))

(assert (=> bs!30361 m!957387))

(assert (=> bs!30361 m!957407))

(assert (=> d!125049 d!125253))

(declare-fun d!125255 () Bool)

(declare-fun e!587002 () Bool)

(assert (=> d!125255 e!587002))

(declare-fun res!692310 () Bool)

(assert (=> d!125255 (=> res!692310 e!587002)))

(declare-fun lt!457650 () Bool)

(assert (=> d!125255 (= res!692310 (not lt!457650))))

(declare-fun lt!457647 () Bool)

(assert (=> d!125255 (= lt!457650 lt!457647)))

(declare-fun lt!457649 () Unit!33898)

(declare-fun e!587003 () Unit!33898)

(assert (=> d!125255 (= lt!457649 e!587003)))

(declare-fun c!105291 () Bool)

(assert (=> d!125255 (= c!105291 lt!457647)))

(assert (=> d!125255 (= lt!457647 (containsKey!566 (toList!6897 lt!457370) lt!457379))))

(assert (=> d!125255 (= (contains!6046 lt!457370 lt!457379) lt!457650)))

(declare-fun b!1037742 () Bool)

(declare-fun lt!457648 () Unit!33898)

(assert (=> b!1037742 (= e!587003 lt!457648)))

(assert (=> b!1037742 (= lt!457648 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457370) lt!457379))))

(assert (=> b!1037742 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457370) lt!457379))))

(declare-fun b!1037743 () Bool)

(declare-fun Unit!33919 () Unit!33898)

(assert (=> b!1037743 (= e!587003 Unit!33919)))

(declare-fun b!1037744 () Bool)

(assert (=> b!1037744 (= e!587002 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457370) lt!457379)))))

(assert (= (and d!125255 c!105291) b!1037742))

(assert (= (and d!125255 (not c!105291)) b!1037743))

(assert (= (and d!125255 (not res!692310)) b!1037744))

(declare-fun m!958125 () Bool)

(assert (=> d!125255 m!958125))

(declare-fun m!958127 () Bool)

(assert (=> b!1037742 m!958127))

(declare-fun m!958129 () Bool)

(assert (=> b!1037742 m!958129))

(assert (=> b!1037742 m!958129))

(declare-fun m!958131 () Bool)

(assert (=> b!1037742 m!958131))

(assert (=> b!1037744 m!958129))

(assert (=> b!1037744 m!958129))

(assert (=> b!1037744 m!958131))

(assert (=> d!125049 d!125255))

(assert (=> b!1037512 d!125093))

(declare-fun d!125257 () Bool)

(assert (=> d!125257 (= (isDefined!435 (getValueByKey!585 (toList!6897 lt!457319) key!909)) (not (isEmpty!934 (getValueByKey!585 (toList!6897 lt!457319) key!909))))))

(declare-fun bs!30362 () Bool)

(assert (= bs!30362 d!125257))

(assert (=> bs!30362 m!957941))

(declare-fun m!958133 () Bool)

(assert (=> bs!30362 m!958133))

(assert (=> b!1037583 d!125257))

(declare-fun b!1037745 () Bool)

(declare-fun e!587004 () Option!636)

(assert (=> b!1037745 (= e!587004 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457319)))))))

(declare-fun d!125259 () Bool)

(declare-fun c!105292 () Bool)

(assert (=> d!125259 (= c!105292 (and ((_ is Cons!21898) (toList!6897 lt!457319)) (= (_1!7875 (h!23109 (toList!6897 lt!457319))) key!909)))))

(assert (=> d!125259 (= (getValueByKey!585 (toList!6897 lt!457319) key!909) e!587004)))

(declare-fun b!1037746 () Bool)

(declare-fun e!587005 () Option!636)

(assert (=> b!1037746 (= e!587004 e!587005)))

(declare-fun c!105293 () Bool)

(assert (=> b!1037746 (= c!105293 (and ((_ is Cons!21898) (toList!6897 lt!457319)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457319))) key!909))))))

(declare-fun b!1037747 () Bool)

(assert (=> b!1037747 (= e!587005 (getValueByKey!585 (t!31099 (toList!6897 lt!457319)) key!909))))

(declare-fun b!1037748 () Bool)

(assert (=> b!1037748 (= e!587005 None!634)))

(assert (= (and d!125259 c!105292) b!1037745))

(assert (= (and d!125259 (not c!105292)) b!1037746))

(assert (= (and b!1037746 c!105293) b!1037747))

(assert (= (and b!1037746 (not c!105293)) b!1037748))

(declare-fun m!958135 () Bool)

(assert (=> b!1037747 m!958135))

(assert (=> b!1037583 d!125259))

(declare-fun d!125261 () Bool)

(assert (=> d!125261 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457385) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!457651 () Unit!33898)

(assert (=> d!125261 (= lt!457651 (choose!1710 (toList!6897 lt!457385) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587006 () Bool)

(assert (=> d!125261 e!587006))

(declare-fun res!692311 () Bool)

(assert (=> d!125261 (=> (not res!692311) (not e!587006))))

(assert (=> d!125261 (= res!692311 (isStrictlySorted!707 (toList!6897 lt!457385)))))

(assert (=> d!125261 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457385) #b0000000000000000000000000000000000000000000000000000000000000000) lt!457651)))

(declare-fun b!1037749 () Bool)

(assert (=> b!1037749 (= e!587006 (containsKey!566 (toList!6897 lt!457385) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125261 res!692311) b!1037749))

(assert (=> d!125261 m!957611))

(assert (=> d!125261 m!957611))

(assert (=> d!125261 m!957613))

(declare-fun m!958137 () Bool)

(assert (=> d!125261 m!958137))

(declare-fun m!958139 () Bool)

(assert (=> d!125261 m!958139))

(assert (=> b!1037749 m!957607))

(assert (=> b!1037419 d!125261))

(declare-fun d!125263 () Bool)

(assert (=> d!125263 (= (isDefined!435 (getValueByKey!585 (toList!6897 lt!457385) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!934 (getValueByKey!585 (toList!6897 lt!457385) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30363 () Bool)

(assert (= bs!30363 d!125263))

(assert (=> bs!30363 m!957611))

(declare-fun m!958141 () Bool)

(assert (=> bs!30363 m!958141))

(assert (=> b!1037419 d!125263))

(declare-fun b!1037750 () Bool)

(declare-fun e!587007 () Option!636)

(assert (=> b!1037750 (= e!587007 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457385)))))))

(declare-fun d!125265 () Bool)

(declare-fun c!105294 () Bool)

(assert (=> d!125265 (= c!105294 (and ((_ is Cons!21898) (toList!6897 lt!457385)) (= (_1!7875 (h!23109 (toList!6897 lt!457385))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125265 (= (getValueByKey!585 (toList!6897 lt!457385) #b0000000000000000000000000000000000000000000000000000000000000000) e!587007)))

(declare-fun b!1037751 () Bool)

(declare-fun e!587008 () Option!636)

(assert (=> b!1037751 (= e!587007 e!587008)))

(declare-fun c!105295 () Bool)

(assert (=> b!1037751 (= c!105295 (and ((_ is Cons!21898) (toList!6897 lt!457385)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457385))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1037752 () Bool)

(assert (=> b!1037752 (= e!587008 (getValueByKey!585 (t!31099 (toList!6897 lt!457385)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037753 () Bool)

(assert (=> b!1037753 (= e!587008 None!634)))

(assert (= (and d!125265 c!105294) b!1037750))

(assert (= (and d!125265 (not c!105294)) b!1037751))

(assert (= (and b!1037751 c!105295) b!1037752))

(assert (= (and b!1037751 (not c!105295)) b!1037753))

(declare-fun m!958143 () Bool)

(assert (=> b!1037752 m!958143))

(assert (=> b!1037419 d!125265))

(declare-fun d!125267 () Bool)

(declare-fun res!692312 () Bool)

(declare-fun e!587009 () Bool)

(assert (=> d!125267 (=> res!692312 e!587009)))

(assert (=> d!125267 (= res!692312 (and ((_ is Cons!21898) lt!457597) (= (_1!7875 (h!23109 lt!457597)) key!909)))))

(assert (=> d!125267 (= (containsKey!566 lt!457597 key!909) e!587009)))

(declare-fun b!1037754 () Bool)

(declare-fun e!587010 () Bool)

(assert (=> b!1037754 (= e!587009 e!587010)))

(declare-fun res!692313 () Bool)

(assert (=> b!1037754 (=> (not res!692313) (not e!587010))))

(assert (=> b!1037754 (= res!692313 (and (or (not ((_ is Cons!21898) lt!457597)) (bvsle (_1!7875 (h!23109 lt!457597)) key!909)) ((_ is Cons!21898) lt!457597) (bvslt (_1!7875 (h!23109 lt!457597)) key!909)))))

(declare-fun b!1037755 () Bool)

(assert (=> b!1037755 (= e!587010 (containsKey!566 (t!31099 lt!457597) key!909))))

(assert (= (and d!125267 (not res!692312)) b!1037754))

(assert (= (and b!1037754 res!692313) b!1037755))

(declare-fun m!958145 () Bool)

(assert (=> b!1037755 m!958145))

(assert (=> b!1037587 d!125267))

(assert (=> b!1037476 d!125235))

(declare-fun lt!457652 () Bool)

(declare-fun d!125269 () Bool)

(assert (=> d!125269 (= lt!457652 (select (content!517 (toList!6897 lt!457465)) (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))))))

(declare-fun e!587012 () Bool)

(assert (=> d!125269 (= lt!457652 e!587012)))

(declare-fun res!692314 () Bool)

(assert (=> d!125269 (=> (not res!692314) (not e!587012))))

(assert (=> d!125269 (= res!692314 ((_ is Cons!21898) (toList!6897 lt!457465)))))

(assert (=> d!125269 (= (contains!6047 (toList!6897 lt!457465) (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))) lt!457652)))

(declare-fun b!1037756 () Bool)

(declare-fun e!587011 () Bool)

(assert (=> b!1037756 (= e!587012 e!587011)))

(declare-fun res!692315 () Bool)

(assert (=> b!1037756 (=> res!692315 e!587011)))

(assert (=> b!1037756 (= res!692315 (= (h!23109 (toList!6897 lt!457465)) (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))))))

(declare-fun b!1037757 () Bool)

(assert (=> b!1037757 (= e!587011 (contains!6047 (t!31099 (toList!6897 lt!457465)) (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))))))

(assert (= (and d!125269 res!692314) b!1037756))

(assert (= (and b!1037756 (not res!692315)) b!1037757))

(declare-fun m!958147 () Bool)

(assert (=> d!125269 m!958147))

(declare-fun m!958149 () Bool)

(assert (=> d!125269 m!958149))

(declare-fun m!958151 () Bool)

(assert (=> b!1037757 m!958151))

(assert (=> b!1037410 d!125269))

(declare-fun d!125271 () Bool)

(declare-fun lt!457653 () Bool)

(assert (=> d!125271 (= lt!457653 (select (content!517 (toList!6897 lt!457493)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))

(declare-fun e!587014 () Bool)

(assert (=> d!125271 (= lt!457653 e!587014)))

(declare-fun res!692316 () Bool)

(assert (=> d!125271 (=> (not res!692316) (not e!587014))))

(assert (=> d!125271 (= res!692316 ((_ is Cons!21898) (toList!6897 lt!457493)))))

(assert (=> d!125271 (= (contains!6047 (toList!6897 lt!457493) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)) lt!457653)))

(declare-fun b!1037758 () Bool)

(declare-fun e!587013 () Bool)

(assert (=> b!1037758 (= e!587014 e!587013)))

(declare-fun res!692317 () Bool)

(assert (=> b!1037758 (=> res!692317 e!587013)))

(assert (=> b!1037758 (= res!692317 (= (h!23109 (toList!6897 lt!457493)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))

(declare-fun b!1037759 () Bool)

(assert (=> b!1037759 (= e!587013 (contains!6047 (t!31099 (toList!6897 lt!457493)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))

(assert (= (and d!125271 res!692316) b!1037758))

(assert (= (and b!1037758 (not res!692317)) b!1037759))

(declare-fun m!958153 () Bool)

(assert (=> d!125271 m!958153))

(declare-fun m!958155 () Bool)

(assert (=> d!125271 m!958155))

(declare-fun m!958157 () Bool)

(assert (=> b!1037759 m!958157))

(assert (=> b!1037447 d!125271))

(declare-fun d!125273 () Bool)

(declare-fun e!587015 () Bool)

(assert (=> d!125273 e!587015))

(declare-fun res!692318 () Bool)

(assert (=> d!125273 (=> res!692318 e!587015)))

(declare-fun lt!457657 () Bool)

(assert (=> d!125273 (= res!692318 (not lt!457657))))

(declare-fun lt!457654 () Bool)

(assert (=> d!125273 (= lt!457657 lt!457654)))

(declare-fun lt!457656 () Unit!33898)

(declare-fun e!587016 () Unit!33898)

(assert (=> d!125273 (= lt!457656 e!587016)))

(declare-fun c!105296 () Bool)

(assert (=> d!125273 (= c!105296 lt!457654)))

(assert (=> d!125273 (= lt!457654 (containsKey!566 (toList!6897 lt!457444) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125273 (= (contains!6046 lt!457444 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) lt!457657)))

(declare-fun b!1037760 () Bool)

(declare-fun lt!457655 () Unit!33898)

(assert (=> b!1037760 (= e!587016 lt!457655)))

(assert (=> b!1037760 (= lt!457655 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457444) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1037760 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457444) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037761 () Bool)

(declare-fun Unit!33920 () Unit!33898)

(assert (=> b!1037761 (= e!587016 Unit!33920)))

(declare-fun b!1037762 () Bool)

(assert (=> b!1037762 (= e!587015 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457444) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!125273 c!105296) b!1037760))

(assert (= (and d!125273 (not c!105296)) b!1037761))

(assert (= (and d!125273 (not res!692318)) b!1037762))

(assert (=> d!125273 m!957361))

(declare-fun m!958159 () Bool)

(assert (=> d!125273 m!958159))

(assert (=> b!1037760 m!957361))

(declare-fun m!958161 () Bool)

(assert (=> b!1037760 m!958161))

(assert (=> b!1037760 m!957361))

(declare-fun m!958163 () Bool)

(assert (=> b!1037760 m!958163))

(assert (=> b!1037760 m!958163))

(declare-fun m!958165 () Bool)

(assert (=> b!1037760 m!958165))

(assert (=> b!1037762 m!957361))

(assert (=> b!1037762 m!958163))

(assert (=> b!1037762 m!958163))

(assert (=> b!1037762 m!958165))

(assert (=> b!1037392 d!125273))

(declare-fun d!125275 () Bool)

(assert (=> d!125275 (= (size!31982 lt!457298) (bvadd (_size!2946 lt!457298) (bvsdiv (bvadd (extraKeys!5999 lt!457298) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!1037461 d!125275))

(declare-fun d!125277 () Bool)

(assert (=> d!125277 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457408) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!457658 () Unit!33898)

(assert (=> d!125277 (= lt!457658 (choose!1710 (toList!6897 lt!457408) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587017 () Bool)

(assert (=> d!125277 e!587017))

(declare-fun res!692319 () Bool)

(assert (=> d!125277 (=> (not res!692319) (not e!587017))))

(assert (=> d!125277 (= res!692319 (isStrictlySorted!707 (toList!6897 lt!457408)))))

(assert (=> d!125277 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457408) #b0000000000000000000000000000000000000000000000000000000000000000) lt!457658)))

(declare-fun b!1037763 () Bool)

(assert (=> b!1037763 (= e!587017 (containsKey!566 (toList!6897 lt!457408) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125277 res!692319) b!1037763))

(assert (=> d!125277 m!957623))

(assert (=> d!125277 m!957623))

(assert (=> d!125277 m!957931))

(declare-fun m!958167 () Bool)

(assert (=> d!125277 m!958167))

(assert (=> d!125277 m!958093))

(assert (=> b!1037763 m!957927))

(assert (=> b!1037573 d!125277))

(declare-fun d!125279 () Bool)

(assert (=> d!125279 (= (isDefined!435 (getValueByKey!585 (toList!6897 lt!457408) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!934 (getValueByKey!585 (toList!6897 lt!457408) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30364 () Bool)

(assert (= bs!30364 d!125279))

(assert (=> bs!30364 m!957623))

(declare-fun m!958169 () Bool)

(assert (=> bs!30364 m!958169))

(assert (=> b!1037573 d!125279))

(assert (=> b!1037573 d!125225))

(declare-fun b!1037764 () Bool)

(declare-fun e!587021 () Bool)

(assert (=> b!1037764 (= e!587021 (contains!6048 (ite c!105237 (Cons!21901 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) Nil!21902) Nil!21902) (select (arr!31447 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125281 () Bool)

(declare-fun res!692321 () Bool)

(declare-fun e!587020 () Bool)

(assert (=> d!125281 (=> res!692321 e!587020)))

(assert (=> d!125281 (= res!692321 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 thiss!1427))))))

(assert (=> d!125281 (= (arrayNoDuplicates!0 (_keys!11496 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105237 (Cons!21901 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) Nil!21902) Nil!21902)) e!587020)))

(declare-fun b!1037765 () Bool)

(declare-fun e!587018 () Bool)

(declare-fun call!43932 () Bool)

(assert (=> b!1037765 (= e!587018 call!43932)))

(declare-fun b!1037766 () Bool)

(declare-fun e!587019 () Bool)

(assert (=> b!1037766 (= e!587019 e!587018)))

(declare-fun c!105297 () Bool)

(assert (=> b!1037766 (= c!105297 (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1037767 () Bool)

(assert (=> b!1037767 (= e!587020 e!587019)))

(declare-fun res!692320 () Bool)

(assert (=> b!1037767 (=> (not res!692320) (not e!587019))))

(assert (=> b!1037767 (= res!692320 (not e!587021))))

(declare-fun res!692322 () Bool)

(assert (=> b!1037767 (=> (not res!692322) (not e!587021))))

(assert (=> b!1037767 (= res!692322 (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1037768 () Bool)

(assert (=> b!1037768 (= e!587018 call!43932)))

(declare-fun bm!43929 () Bool)

(assert (=> bm!43929 (= call!43932 (arrayNoDuplicates!0 (_keys!11496 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!105297 (Cons!21901 (select (arr!31447 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!105237 (Cons!21901 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) Nil!21902) Nil!21902)) (ite c!105237 (Cons!21901 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) Nil!21902) Nil!21902))))))

(assert (= (and d!125281 (not res!692321)) b!1037767))

(assert (= (and b!1037767 res!692322) b!1037764))

(assert (= (and b!1037767 res!692320) b!1037766))

(assert (= (and b!1037766 c!105297) b!1037765))

(assert (= (and b!1037766 (not c!105297)) b!1037768))

(assert (= (or b!1037765 b!1037768) bm!43929))

(assert (=> b!1037764 m!958067))

(assert (=> b!1037764 m!958067))

(declare-fun m!958171 () Bool)

(assert (=> b!1037764 m!958171))

(assert (=> b!1037766 m!958067))

(assert (=> b!1037766 m!958067))

(assert (=> b!1037766 m!958071))

(assert (=> b!1037767 m!958067))

(assert (=> b!1037767 m!958067))

(assert (=> b!1037767 m!958071))

(assert (=> bm!43929 m!958067))

(declare-fun m!958173 () Bool)

(assert (=> bm!43929 m!958173))

(assert (=> bm!43915 d!125281))

(declare-fun d!125283 () Bool)

(assert (=> d!125283 (= (apply!916 lt!457521 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16493 (getValueByKey!585 (toList!6897 lt!457521) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30365 () Bool)

(assert (= bs!30365 d!125283))

(declare-fun m!958175 () Bool)

(assert (=> bs!30365 m!958175))

(assert (=> bs!30365 m!958175))

(declare-fun m!958177 () Bool)

(assert (=> bs!30365 m!958177))

(assert (=> b!1037464 d!125283))

(declare-fun d!125285 () Bool)

(assert (=> d!125285 (= (apply!916 lt!457521 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16493 (getValueByKey!585 (toList!6897 lt!457521) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30366 () Bool)

(assert (= bs!30366 d!125285))

(assert (=> bs!30366 m!957961))

(assert (=> bs!30366 m!957961))

(declare-fun m!958179 () Bool)

(assert (=> bs!30366 m!958179))

(assert (=> b!1037480 d!125285))

(declare-fun d!125287 () Bool)

(assert (=> d!125287 (= (get!16494 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14924 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1037426 d!125287))

(declare-fun d!125289 () Bool)

(assert (=> d!125289 (= (apply!916 lt!457444 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) (get!16493 (getValueByKey!585 (toList!6897 lt!457444) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30367 () Bool)

(assert (= bs!30367 d!125289))

(assert (=> bs!30367 m!957361))

(assert (=> bs!30367 m!958163))

(assert (=> bs!30367 m!958163))

(declare-fun m!958181 () Bool)

(assert (=> bs!30367 m!958181))

(assert (=> b!1037396 d!125289))

(assert (=> b!1037396 d!125083))

(declare-fun b!1037769 () Bool)

(declare-fun e!587022 () Option!636)

(assert (=> b!1037769 (= e!587022 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457474)))))))

(declare-fun d!125291 () Bool)

(declare-fun c!105298 () Bool)

(assert (=> d!125291 (= c!105298 (and ((_ is Cons!21898) (toList!6897 lt!457474)) (= (_1!7875 (h!23109 (toList!6897 lt!457474))) (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))))))))

(assert (=> d!125291 (= (getValueByKey!585 (toList!6897 lt!457474) (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))) e!587022)))

(declare-fun b!1037770 () Bool)

(declare-fun e!587023 () Option!636)

(assert (=> b!1037770 (= e!587022 e!587023)))

(declare-fun c!105299 () Bool)

(assert (=> b!1037770 (= c!105299 (and ((_ is Cons!21898) (toList!6897 lt!457474)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457474))) (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))))))))

(declare-fun b!1037771 () Bool)

(assert (=> b!1037771 (= e!587023 (getValueByKey!585 (t!31099 (toList!6897 lt!457474)) (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1037772 () Bool)

(assert (=> b!1037772 (= e!587023 None!634)))

(assert (= (and d!125291 c!105298) b!1037769))

(assert (= (and d!125291 (not c!105298)) b!1037770))

(assert (= (and b!1037770 c!105299) b!1037771))

(assert (= (and b!1037770 (not c!105299)) b!1037772))

(declare-fun m!958183 () Bool)

(assert (=> b!1037771 m!958183))

(assert (=> b!1037414 d!125291))

(declare-fun d!125293 () Bool)

(declare-fun e!587024 () Bool)

(assert (=> d!125293 e!587024))

(declare-fun res!692323 () Bool)

(assert (=> d!125293 (=> res!692323 e!587024)))

(declare-fun lt!457662 () Bool)

(assert (=> d!125293 (= res!692323 (not lt!457662))))

(declare-fun lt!457659 () Bool)

(assert (=> d!125293 (= lt!457662 lt!457659)))

(declare-fun lt!457661 () Unit!33898)

(declare-fun e!587025 () Unit!33898)

(assert (=> d!125293 (= lt!457661 e!587025)))

(declare-fun c!105300 () Bool)

(assert (=> d!125293 (= c!105300 lt!457659)))

(assert (=> d!125293 (= lt!457659 (containsKey!566 (toList!6897 lt!457578) (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(assert (=> d!125293 (= (contains!6046 lt!457578 (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))) lt!457662)))

(declare-fun b!1037773 () Bool)

(declare-fun lt!457660 () Unit!33898)

(assert (=> b!1037773 (= e!587025 lt!457660)))

(assert (=> b!1037773 (= lt!457660 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457578) (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(assert (=> b!1037773 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457578) (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(declare-fun b!1037774 () Bool)

(declare-fun Unit!33921 () Unit!33898)

(assert (=> b!1037774 (= e!587025 Unit!33921)))

(declare-fun b!1037775 () Bool)

(assert (=> b!1037775 (= e!587024 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457578) (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))))

(assert (= (and d!125293 c!105300) b!1037773))

(assert (= (and d!125293 (not c!105300)) b!1037774))

(assert (= (and d!125293 (not res!692323)) b!1037775))

(declare-fun m!958185 () Bool)

(assert (=> d!125293 m!958185))

(declare-fun m!958187 () Bool)

(assert (=> b!1037773 m!958187))

(assert (=> b!1037773 m!957903))

(assert (=> b!1037773 m!957903))

(declare-fun m!958189 () Bool)

(assert (=> b!1037773 m!958189))

(assert (=> b!1037775 m!957903))

(assert (=> b!1037775 m!957903))

(assert (=> b!1037775 m!958189))

(assert (=> d!125157 d!125293))

(declare-fun b!1037776 () Bool)

(declare-fun e!587026 () Option!636)

(assert (=> b!1037776 (= e!587026 (Some!635 (_2!7875 (h!23109 lt!457580))))))

(declare-fun c!105301 () Bool)

(declare-fun d!125295 () Bool)

(assert (=> d!125295 (= c!105301 (and ((_ is Cons!21898) lt!457580) (= (_1!7875 (h!23109 lt!457580)) (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))))

(assert (=> d!125295 (= (getValueByKey!585 lt!457580 (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))) e!587026)))

(declare-fun b!1037777 () Bool)

(declare-fun e!587027 () Option!636)

(assert (=> b!1037777 (= e!587026 e!587027)))

(declare-fun c!105302 () Bool)

(assert (=> b!1037777 (= c!105302 (and ((_ is Cons!21898) lt!457580) (not (= (_1!7875 (h!23109 lt!457580)) (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))))

(declare-fun b!1037778 () Bool)

(assert (=> b!1037778 (= e!587027 (getValueByKey!585 (t!31099 lt!457580) (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(declare-fun b!1037779 () Bool)

(assert (=> b!1037779 (= e!587027 None!634)))

(assert (= (and d!125295 c!105301) b!1037776))

(assert (= (and d!125295 (not c!105301)) b!1037777))

(assert (= (and b!1037777 c!105302) b!1037778))

(assert (= (and b!1037777 (not c!105302)) b!1037779))

(declare-fun m!958191 () Bool)

(assert (=> b!1037778 m!958191))

(assert (=> d!125157 d!125295))

(declare-fun d!125297 () Bool)

(assert (=> d!125297 (= (getValueByKey!585 lt!457580 (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))) (Some!635 (_2!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(declare-fun lt!457663 () Unit!33898)

(assert (=> d!125297 (= lt!457663 (choose!1709 lt!457580 (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))) (_2!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(declare-fun e!587028 () Bool)

(assert (=> d!125297 e!587028))

(declare-fun res!692324 () Bool)

(assert (=> d!125297 (=> (not res!692324) (not e!587028))))

(assert (=> d!125297 (= res!692324 (isStrictlySorted!707 lt!457580))))

(assert (=> d!125297 (= (lemmaContainsTupThenGetReturnValue!281 lt!457580 (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))) (_2!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))) lt!457663)))

(declare-fun b!1037780 () Bool)

(declare-fun res!692325 () Bool)

(assert (=> b!1037780 (=> (not res!692325) (not e!587028))))

(assert (=> b!1037780 (= res!692325 (containsKey!566 lt!457580 (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(declare-fun b!1037781 () Bool)

(assert (=> b!1037781 (= e!587028 (contains!6047 lt!457580 (tuple2!15729 (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))) (_2!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))))

(assert (= (and d!125297 res!692324) b!1037780))

(assert (= (and b!1037780 res!692325) b!1037781))

(assert (=> d!125297 m!957897))

(declare-fun m!958193 () Bool)

(assert (=> d!125297 m!958193))

(declare-fun m!958195 () Bool)

(assert (=> d!125297 m!958195))

(declare-fun m!958197 () Bool)

(assert (=> b!1037780 m!958197))

(declare-fun m!958199 () Bool)

(assert (=> b!1037781 m!958199))

(assert (=> d!125157 d!125297))

(declare-fun b!1037782 () Bool)

(declare-fun res!692326 () Bool)

(declare-fun e!587033 () Bool)

(assert (=> b!1037782 (=> (not res!692326) (not e!587033))))

(declare-fun lt!457664 () List!21902)

(assert (=> b!1037782 (= res!692326 (containsKey!566 lt!457664 (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(declare-fun b!1037783 () Bool)

(declare-fun c!105304 () Bool)

(assert (=> b!1037783 (= c!105304 (and ((_ is Cons!21898) (toList!6897 (ite c!105176 call!43894 (ite c!105177 call!43892 call!43891)))) (bvsgt (_1!7875 (h!23109 (toList!6897 (ite c!105176 call!43894 (ite c!105177 call!43892 call!43891))))) (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))))

(declare-fun e!587029 () List!21902)

(declare-fun e!587031 () List!21902)

(assert (=> b!1037783 (= e!587029 e!587031)))

(declare-fun b!1037784 () Bool)

(declare-fun e!587030 () List!21902)

(assert (=> b!1037784 (= e!587030 (insertStrictlySorted!374 (t!31099 (toList!6897 (ite c!105176 call!43894 (ite c!105177 call!43892 call!43891)))) (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))) (_2!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(declare-fun b!1037785 () Bool)

(assert (=> b!1037785 (= e!587033 (contains!6047 lt!457664 (tuple2!15729 (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))) (_2!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))))

(declare-fun bm!43931 () Bool)

(declare-fun call!43934 () List!21902)

(declare-fun call!43933 () List!21902)

(assert (=> bm!43931 (= call!43934 call!43933)))

(declare-fun b!1037786 () Bool)

(assert (=> b!1037786 (= e!587031 call!43934)))

(declare-fun b!1037787 () Bool)

(declare-fun e!587032 () List!21902)

(declare-fun call!43935 () List!21902)

(assert (=> b!1037787 (= e!587032 call!43935)))

(declare-fun bm!43932 () Bool)

(assert (=> bm!43932 (= call!43933 call!43935)))

(declare-fun b!1037788 () Bool)

(assert (=> b!1037788 (= e!587029 call!43933)))

(declare-fun b!1037789 () Bool)

(assert (=> b!1037789 (= e!587031 call!43934)))

(declare-fun b!1037790 () Bool)

(declare-fun c!105305 () Bool)

(assert (=> b!1037790 (= e!587030 (ite c!105305 (t!31099 (toList!6897 (ite c!105176 call!43894 (ite c!105177 call!43892 call!43891)))) (ite c!105304 (Cons!21898 (h!23109 (toList!6897 (ite c!105176 call!43894 (ite c!105177 call!43892 call!43891)))) (t!31099 (toList!6897 (ite c!105176 call!43894 (ite c!105177 call!43892 call!43891))))) Nil!21899)))))

(declare-fun b!1037791 () Bool)

(assert (=> b!1037791 (= e!587032 e!587029)))

(assert (=> b!1037791 (= c!105305 (and ((_ is Cons!21898) (toList!6897 (ite c!105176 call!43894 (ite c!105177 call!43892 call!43891)))) (= (_1!7875 (h!23109 (toList!6897 (ite c!105176 call!43894 (ite c!105177 call!43892 call!43891))))) (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))))

(declare-fun c!105306 () Bool)

(declare-fun bm!43930 () Bool)

(assert (=> bm!43930 (= call!43935 ($colon$colon!604 e!587030 (ite c!105306 (h!23109 (toList!6897 (ite c!105176 call!43894 (ite c!105177 call!43892 call!43891)))) (tuple2!15729 (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))) (_2!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))))

(declare-fun c!105303 () Bool)

(assert (=> bm!43930 (= c!105303 c!105306)))

(declare-fun d!125299 () Bool)

(assert (=> d!125299 e!587033))

(declare-fun res!692327 () Bool)

(assert (=> d!125299 (=> (not res!692327) (not e!587033))))

(assert (=> d!125299 (= res!692327 (isStrictlySorted!707 lt!457664))))

(assert (=> d!125299 (= lt!457664 e!587032)))

(assert (=> d!125299 (= c!105306 (and ((_ is Cons!21898) (toList!6897 (ite c!105176 call!43894 (ite c!105177 call!43892 call!43891)))) (bvslt (_1!7875 (h!23109 (toList!6897 (ite c!105176 call!43894 (ite c!105177 call!43892 call!43891))))) (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))))

(assert (=> d!125299 (isStrictlySorted!707 (toList!6897 (ite c!105176 call!43894 (ite c!105177 call!43892 call!43891))))))

(assert (=> d!125299 (= (insertStrictlySorted!374 (toList!6897 (ite c!105176 call!43894 (ite c!105177 call!43892 call!43891))) (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))) (_2!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))) lt!457664)))

(assert (= (and d!125299 c!105306) b!1037787))

(assert (= (and d!125299 (not c!105306)) b!1037791))

(assert (= (and b!1037791 c!105305) b!1037788))

(assert (= (and b!1037791 (not c!105305)) b!1037783))

(assert (= (and b!1037783 c!105304) b!1037789))

(assert (= (and b!1037783 (not c!105304)) b!1037786))

(assert (= (or b!1037789 b!1037786) bm!43931))

(assert (= (or b!1037788 bm!43931) bm!43932))

(assert (= (or b!1037787 bm!43932) bm!43930))

(assert (= (and bm!43930 c!105303) b!1037784))

(assert (= (and bm!43930 (not c!105303)) b!1037790))

(assert (= (and d!125299 res!692327) b!1037782))

(assert (= (and b!1037782 res!692326) b!1037785))

(declare-fun m!958201 () Bool)

(assert (=> b!1037784 m!958201))

(declare-fun m!958203 () Bool)

(assert (=> bm!43930 m!958203))

(declare-fun m!958205 () Bool)

(assert (=> b!1037782 m!958205))

(declare-fun m!958207 () Bool)

(assert (=> b!1037785 m!958207))

(declare-fun m!958209 () Bool)

(assert (=> d!125299 m!958209))

(declare-fun m!958211 () Bool)

(assert (=> d!125299 m!958211))

(assert (=> d!125157 d!125299))

(declare-fun d!125301 () Bool)

(declare-fun e!587034 () Bool)

(assert (=> d!125301 e!587034))

(declare-fun res!692328 () Bool)

(assert (=> d!125301 (=> res!692328 e!587034)))

(declare-fun lt!457668 () Bool)

(assert (=> d!125301 (= res!692328 (not lt!457668))))

(declare-fun lt!457665 () Bool)

(assert (=> d!125301 (= lt!457668 lt!457665)))

(declare-fun lt!457667 () Unit!33898)

(declare-fun e!587035 () Unit!33898)

(assert (=> d!125301 (= lt!457667 e!587035)))

(declare-fun c!105307 () Bool)

(assert (=> d!125301 (= c!105307 lt!457665)))

(assert (=> d!125301 (= lt!457665 (containsKey!566 (toList!6897 lt!457553) (_1!7875 (tuple2!15729 lt!457394 lt!457297))))))

(assert (=> d!125301 (= (contains!6046 lt!457553 (_1!7875 (tuple2!15729 lt!457394 lt!457297))) lt!457668)))

(declare-fun b!1037792 () Bool)

(declare-fun lt!457666 () Unit!33898)

(assert (=> b!1037792 (= e!587035 lt!457666)))

(assert (=> b!1037792 (= lt!457666 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457553) (_1!7875 (tuple2!15729 lt!457394 lt!457297))))))

(assert (=> b!1037792 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457553) (_1!7875 (tuple2!15729 lt!457394 lt!457297))))))

(declare-fun b!1037793 () Bool)

(declare-fun Unit!33922 () Unit!33898)

(assert (=> b!1037793 (= e!587035 Unit!33922)))

(declare-fun b!1037794 () Bool)

(assert (=> b!1037794 (= e!587034 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457553) (_1!7875 (tuple2!15729 lt!457394 lt!457297)))))))

(assert (= (and d!125301 c!105307) b!1037792))

(assert (= (and d!125301 (not c!105307)) b!1037793))

(assert (= (and d!125301 (not res!692328)) b!1037794))

(declare-fun m!958213 () Bool)

(assert (=> d!125301 m!958213))

(declare-fun m!958215 () Bool)

(assert (=> b!1037792 m!958215))

(assert (=> b!1037792 m!957837))

(assert (=> b!1037792 m!957837))

(declare-fun m!958217 () Bool)

(assert (=> b!1037792 m!958217))

(assert (=> b!1037794 m!957837))

(assert (=> b!1037794 m!957837))

(assert (=> b!1037794 m!958217))

(assert (=> d!125137 d!125301))

(declare-fun b!1037795 () Bool)

(declare-fun e!587036 () Option!636)

(assert (=> b!1037795 (= e!587036 (Some!635 (_2!7875 (h!23109 lt!457555))))))

(declare-fun d!125303 () Bool)

(declare-fun c!105308 () Bool)

(assert (=> d!125303 (= c!105308 (and ((_ is Cons!21898) lt!457555) (= (_1!7875 (h!23109 lt!457555)) (_1!7875 (tuple2!15729 lt!457394 lt!457297)))))))

(assert (=> d!125303 (= (getValueByKey!585 lt!457555 (_1!7875 (tuple2!15729 lt!457394 lt!457297))) e!587036)))

(declare-fun b!1037796 () Bool)

(declare-fun e!587037 () Option!636)

(assert (=> b!1037796 (= e!587036 e!587037)))

(declare-fun c!105309 () Bool)

(assert (=> b!1037796 (= c!105309 (and ((_ is Cons!21898) lt!457555) (not (= (_1!7875 (h!23109 lt!457555)) (_1!7875 (tuple2!15729 lt!457394 lt!457297))))))))

(declare-fun b!1037797 () Bool)

(assert (=> b!1037797 (= e!587037 (getValueByKey!585 (t!31099 lt!457555) (_1!7875 (tuple2!15729 lt!457394 lt!457297))))))

(declare-fun b!1037798 () Bool)

(assert (=> b!1037798 (= e!587037 None!634)))

(assert (= (and d!125303 c!105308) b!1037795))

(assert (= (and d!125303 (not c!105308)) b!1037796))

(assert (= (and b!1037796 c!105309) b!1037797))

(assert (= (and b!1037796 (not c!105309)) b!1037798))

(declare-fun m!958219 () Bool)

(assert (=> b!1037797 m!958219))

(assert (=> d!125137 d!125303))

(declare-fun d!125305 () Bool)

(assert (=> d!125305 (= (getValueByKey!585 lt!457555 (_1!7875 (tuple2!15729 lt!457394 lt!457297))) (Some!635 (_2!7875 (tuple2!15729 lt!457394 lt!457297))))))

(declare-fun lt!457669 () Unit!33898)

(assert (=> d!125305 (= lt!457669 (choose!1709 lt!457555 (_1!7875 (tuple2!15729 lt!457394 lt!457297)) (_2!7875 (tuple2!15729 lt!457394 lt!457297))))))

(declare-fun e!587038 () Bool)

(assert (=> d!125305 e!587038))

(declare-fun res!692329 () Bool)

(assert (=> d!125305 (=> (not res!692329) (not e!587038))))

(assert (=> d!125305 (= res!692329 (isStrictlySorted!707 lt!457555))))

(assert (=> d!125305 (= (lemmaContainsTupThenGetReturnValue!281 lt!457555 (_1!7875 (tuple2!15729 lt!457394 lt!457297)) (_2!7875 (tuple2!15729 lt!457394 lt!457297))) lt!457669)))

(declare-fun b!1037799 () Bool)

(declare-fun res!692330 () Bool)

(assert (=> b!1037799 (=> (not res!692330) (not e!587038))))

(assert (=> b!1037799 (= res!692330 (containsKey!566 lt!457555 (_1!7875 (tuple2!15729 lt!457394 lt!457297))))))

(declare-fun b!1037800 () Bool)

(assert (=> b!1037800 (= e!587038 (contains!6047 lt!457555 (tuple2!15729 (_1!7875 (tuple2!15729 lt!457394 lt!457297)) (_2!7875 (tuple2!15729 lt!457394 lt!457297)))))))

(assert (= (and d!125305 res!692329) b!1037799))

(assert (= (and b!1037799 res!692330) b!1037800))

(assert (=> d!125305 m!957831))

(declare-fun m!958221 () Bool)

(assert (=> d!125305 m!958221))

(declare-fun m!958223 () Bool)

(assert (=> d!125305 m!958223))

(declare-fun m!958225 () Bool)

(assert (=> b!1037799 m!958225))

(declare-fun m!958227 () Bool)

(assert (=> b!1037800 m!958227))

(assert (=> d!125137 d!125305))

(declare-fun b!1037801 () Bool)

(declare-fun res!692331 () Bool)

(declare-fun e!587043 () Bool)

(assert (=> b!1037801 (=> (not res!692331) (not e!587043))))

(declare-fun lt!457670 () List!21902)

(assert (=> b!1037801 (= res!692331 (containsKey!566 lt!457670 (_1!7875 (tuple2!15729 lt!457394 lt!457297))))))

(declare-fun c!105311 () Bool)

(declare-fun b!1037802 () Bool)

(assert (=> b!1037802 (= c!105311 (and ((_ is Cons!21898) (toList!6897 lt!457387)) (bvsgt (_1!7875 (h!23109 (toList!6897 lt!457387))) (_1!7875 (tuple2!15729 lt!457394 lt!457297)))))))

(declare-fun e!587039 () List!21902)

(declare-fun e!587041 () List!21902)

(assert (=> b!1037802 (= e!587039 e!587041)))

(declare-fun b!1037803 () Bool)

(declare-fun e!587040 () List!21902)

(assert (=> b!1037803 (= e!587040 (insertStrictlySorted!374 (t!31099 (toList!6897 lt!457387)) (_1!7875 (tuple2!15729 lt!457394 lt!457297)) (_2!7875 (tuple2!15729 lt!457394 lt!457297))))))

(declare-fun b!1037804 () Bool)

(assert (=> b!1037804 (= e!587043 (contains!6047 lt!457670 (tuple2!15729 (_1!7875 (tuple2!15729 lt!457394 lt!457297)) (_2!7875 (tuple2!15729 lt!457394 lt!457297)))))))

(declare-fun bm!43934 () Bool)

(declare-fun call!43937 () List!21902)

(declare-fun call!43936 () List!21902)

(assert (=> bm!43934 (= call!43937 call!43936)))

(declare-fun b!1037805 () Bool)

(assert (=> b!1037805 (= e!587041 call!43937)))

(declare-fun b!1037806 () Bool)

(declare-fun e!587042 () List!21902)

(declare-fun call!43938 () List!21902)

(assert (=> b!1037806 (= e!587042 call!43938)))

(declare-fun bm!43935 () Bool)

(assert (=> bm!43935 (= call!43936 call!43938)))

(declare-fun b!1037807 () Bool)

(assert (=> b!1037807 (= e!587039 call!43936)))

(declare-fun b!1037808 () Bool)

(assert (=> b!1037808 (= e!587041 call!43937)))

(declare-fun c!105312 () Bool)

(declare-fun b!1037809 () Bool)

(assert (=> b!1037809 (= e!587040 (ite c!105312 (t!31099 (toList!6897 lt!457387)) (ite c!105311 (Cons!21898 (h!23109 (toList!6897 lt!457387)) (t!31099 (toList!6897 lt!457387))) Nil!21899)))))

(declare-fun b!1037810 () Bool)

(assert (=> b!1037810 (= e!587042 e!587039)))

(assert (=> b!1037810 (= c!105312 (and ((_ is Cons!21898) (toList!6897 lt!457387)) (= (_1!7875 (h!23109 (toList!6897 lt!457387))) (_1!7875 (tuple2!15729 lt!457394 lt!457297)))))))

(declare-fun bm!43933 () Bool)

(declare-fun c!105313 () Bool)

(assert (=> bm!43933 (= call!43938 ($colon$colon!604 e!587040 (ite c!105313 (h!23109 (toList!6897 lt!457387)) (tuple2!15729 (_1!7875 (tuple2!15729 lt!457394 lt!457297)) (_2!7875 (tuple2!15729 lt!457394 lt!457297))))))))

(declare-fun c!105310 () Bool)

(assert (=> bm!43933 (= c!105310 c!105313)))

(declare-fun d!125307 () Bool)

(assert (=> d!125307 e!587043))

(declare-fun res!692332 () Bool)

(assert (=> d!125307 (=> (not res!692332) (not e!587043))))

(assert (=> d!125307 (= res!692332 (isStrictlySorted!707 lt!457670))))

(assert (=> d!125307 (= lt!457670 e!587042)))

(assert (=> d!125307 (= c!105313 (and ((_ is Cons!21898) (toList!6897 lt!457387)) (bvslt (_1!7875 (h!23109 (toList!6897 lt!457387))) (_1!7875 (tuple2!15729 lt!457394 lt!457297)))))))

(assert (=> d!125307 (isStrictlySorted!707 (toList!6897 lt!457387))))

(assert (=> d!125307 (= (insertStrictlySorted!374 (toList!6897 lt!457387) (_1!7875 (tuple2!15729 lt!457394 lt!457297)) (_2!7875 (tuple2!15729 lt!457394 lt!457297))) lt!457670)))

(assert (= (and d!125307 c!105313) b!1037806))

(assert (= (and d!125307 (not c!105313)) b!1037810))

(assert (= (and b!1037810 c!105312) b!1037807))

(assert (= (and b!1037810 (not c!105312)) b!1037802))

(assert (= (and b!1037802 c!105311) b!1037808))

(assert (= (and b!1037802 (not c!105311)) b!1037805))

(assert (= (or b!1037808 b!1037805) bm!43934))

(assert (= (or b!1037807 bm!43934) bm!43935))

(assert (= (or b!1037806 bm!43935) bm!43933))

(assert (= (and bm!43933 c!105310) b!1037803))

(assert (= (and bm!43933 (not c!105310)) b!1037809))

(assert (= (and d!125307 res!692332) b!1037801))

(assert (= (and b!1037801 res!692331) b!1037804))

(declare-fun m!958229 () Bool)

(assert (=> b!1037803 m!958229))

(declare-fun m!958231 () Bool)

(assert (=> bm!43933 m!958231))

(declare-fun m!958233 () Bool)

(assert (=> b!1037801 m!958233))

(declare-fun m!958235 () Bool)

(assert (=> b!1037804 m!958235))

(declare-fun m!958237 () Bool)

(assert (=> d!125307 m!958237))

(declare-fun m!958239 () Bool)

(assert (=> d!125307 m!958239))

(assert (=> d!125137 d!125307))

(declare-fun d!125309 () Bool)

(assert (=> d!125309 (= (isDefined!435 (getValueByKey!585 (toList!6897 lt!457408) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))) (not (isEmpty!934 (getValueByKey!585 (toList!6897 lt!457408) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))))

(declare-fun bs!30368 () Bool)

(assert (= bs!30368 d!125309))

(assert (=> bs!30368 m!957615))

(declare-fun m!958241 () Bool)

(assert (=> bs!30368 m!958241))

(assert (=> b!1037450 d!125309))

(assert (=> b!1037450 d!125207))

(declare-fun d!125311 () Bool)

(assert (=> d!125311 (= (get!16493 (getValueByKey!585 (toList!6897 lt!457408) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!14927 (getValueByKey!585 (toList!6897 lt!457408) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125161 d!125311))

(assert (=> d!125161 d!125241))

(declare-fun d!125313 () Bool)

(assert (=> d!125313 (= (isDefined!435 (getValueByKey!585 (toList!6897 lt!457385) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!934 (getValueByKey!585 (toList!6897 lt!457385) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30369 () Bool)

(assert (= bs!30369 d!125313))

(assert (=> bs!30369 m!957725))

(declare-fun m!958243 () Bool)

(assert (=> bs!30369 m!958243))

(assert (=> b!1037502 d!125313))

(declare-fun b!1037811 () Bool)

(declare-fun e!587044 () Option!636)

(assert (=> b!1037811 (= e!587044 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457385)))))))

(declare-fun d!125315 () Bool)

(declare-fun c!105314 () Bool)

(assert (=> d!125315 (= c!105314 (and ((_ is Cons!21898) (toList!6897 lt!457385)) (= (_1!7875 (h!23109 (toList!6897 lt!457385))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125315 (= (getValueByKey!585 (toList!6897 lt!457385) #b1000000000000000000000000000000000000000000000000000000000000000) e!587044)))

(declare-fun b!1037812 () Bool)

(declare-fun e!587045 () Option!636)

(assert (=> b!1037812 (= e!587044 e!587045)))

(declare-fun c!105315 () Bool)

(assert (=> b!1037812 (= c!105315 (and ((_ is Cons!21898) (toList!6897 lt!457385)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457385))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1037813 () Bool)

(assert (=> b!1037813 (= e!587045 (getValueByKey!585 (t!31099 (toList!6897 lt!457385)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037814 () Bool)

(assert (=> b!1037814 (= e!587045 None!634)))

(assert (= (and d!125315 c!105314) b!1037811))

(assert (= (and d!125315 (not c!105314)) b!1037812))

(assert (= (and b!1037812 c!105315) b!1037813))

(assert (= (and b!1037812 (not c!105315)) b!1037814))

(declare-fun m!958245 () Bool)

(assert (=> b!1037813 m!958245))

(assert (=> b!1037502 d!125315))

(declare-fun d!125317 () Bool)

(assert (=> d!125317 (= (size!31982 thiss!1427) (bvadd (_size!2946 thiss!1427) (bvsdiv (bvadd (extraKeys!5999 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!1037497 d!125317))

(declare-fun d!125319 () Bool)

(declare-fun e!587046 () Bool)

(assert (=> d!125319 e!587046))

(declare-fun res!692333 () Bool)

(assert (=> d!125319 (=> res!692333 e!587046)))

(declare-fun lt!457674 () Bool)

(assert (=> d!125319 (= res!692333 (not lt!457674))))

(declare-fun lt!457671 () Bool)

(assert (=> d!125319 (= lt!457674 lt!457671)))

(declare-fun lt!457673 () Unit!33898)

(declare-fun e!587047 () Unit!33898)

(assert (=> d!125319 (= lt!457673 e!587047)))

(declare-fun c!105316 () Bool)

(assert (=> d!125319 (= c!105316 lt!457671)))

(assert (=> d!125319 (= lt!457671 (containsKey!566 (toList!6897 lt!457536) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125319 (= (contains!6046 lt!457536 #b0000000000000000000000000000000000000000000000000000000000000000) lt!457674)))

(declare-fun b!1037815 () Bool)

(declare-fun lt!457672 () Unit!33898)

(assert (=> b!1037815 (= e!587047 lt!457672)))

(assert (=> b!1037815 (= lt!457672 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457536) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1037815 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457536) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037816 () Bool)

(declare-fun Unit!33923 () Unit!33898)

(assert (=> b!1037816 (= e!587047 Unit!33923)))

(declare-fun b!1037817 () Bool)

(assert (=> b!1037817 (= e!587046 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457536) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125319 c!105316) b!1037815))

(assert (= (and d!125319 (not c!105316)) b!1037816))

(assert (= (and d!125319 (not res!692333)) b!1037817))

(declare-fun m!958247 () Bool)

(assert (=> d!125319 m!958247))

(declare-fun m!958249 () Bool)

(assert (=> b!1037815 m!958249))

(declare-fun m!958251 () Bool)

(assert (=> b!1037815 m!958251))

(assert (=> b!1037815 m!958251))

(declare-fun m!958253 () Bool)

(assert (=> b!1037815 m!958253))

(assert (=> b!1037817 m!958251))

(assert (=> b!1037817 m!958251))

(assert (=> b!1037817 m!958253))

(assert (=> d!125115 d!125319))

(assert (=> d!125115 d!125077))

(declare-fun d!125321 () Bool)

(assert (=> d!125321 (= (get!16493 (getValueByKey!585 (toList!6897 lt!457375) lt!457373)) (v!14927 (getValueByKey!585 (toList!6897 lt!457375) lt!457373)))))

(assert (=> d!125059 d!125321))

(declare-fun b!1037818 () Bool)

(declare-fun e!587048 () Option!636)

(assert (=> b!1037818 (= e!587048 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457375)))))))

(declare-fun d!125323 () Bool)

(declare-fun c!105317 () Bool)

(assert (=> d!125323 (= c!105317 (and ((_ is Cons!21898) (toList!6897 lt!457375)) (= (_1!7875 (h!23109 (toList!6897 lt!457375))) lt!457373)))))

(assert (=> d!125323 (= (getValueByKey!585 (toList!6897 lt!457375) lt!457373) e!587048)))

(declare-fun b!1037819 () Bool)

(declare-fun e!587049 () Option!636)

(assert (=> b!1037819 (= e!587048 e!587049)))

(declare-fun c!105318 () Bool)

(assert (=> b!1037819 (= c!105318 (and ((_ is Cons!21898) (toList!6897 lt!457375)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457375))) lt!457373))))))

(declare-fun b!1037820 () Bool)

(assert (=> b!1037820 (= e!587049 (getValueByKey!585 (t!31099 (toList!6897 lt!457375)) lt!457373))))

(declare-fun b!1037821 () Bool)

(assert (=> b!1037821 (= e!587049 None!634)))

(assert (= (and d!125323 c!105317) b!1037818))

(assert (= (and d!125323 (not c!105317)) b!1037819))

(assert (= (and b!1037819 c!105318) b!1037820))

(assert (= (and b!1037819 (not c!105318)) b!1037821))

(declare-fun m!958255 () Bool)

(assert (=> b!1037820 m!958255))

(assert (=> d!125059 d!125323))

(declare-fun d!125325 () Bool)

(assert (=> d!125325 (= (apply!916 lt!457521 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)) (get!16493 (getValueByKey!585 (toList!6897 lt!457521) (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000))))))

(declare-fun bs!30370 () Bool)

(assert (= bs!30370 d!125325))

(assert (=> bs!30370 m!957669))

(declare-fun m!958257 () Bool)

(assert (=> bs!30370 m!958257))

(assert (=> bs!30370 m!958257))

(declare-fun m!958259 () Bool)

(assert (=> bs!30370 m!958259))

(assert (=> b!1037468 d!125325))

(declare-fun d!125327 () Bool)

(declare-fun c!105319 () Bool)

(assert (=> d!125327 (= c!105319 ((_ is ValueCellFull!11594) (select (arr!31448 (_values!6292 lt!457298)) #b00000000000000000000000000000000)))))

(declare-fun e!587050 () V!37667)

(assert (=> d!125327 (= (get!16492 (select (arr!31448 (_values!6292 lt!457298)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 lt!457298) #b0000000000000000000000000000000000000000000000000000000000000000)) e!587050)))

(declare-fun b!1037822 () Bool)

(assert (=> b!1037822 (= e!587050 (get!16494 (select (arr!31448 (_values!6292 lt!457298)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 lt!457298) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1037823 () Bool)

(assert (=> b!1037823 (= e!587050 (get!16495 (select (arr!31448 (_values!6292 lt!457298)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 lt!457298) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125327 c!105319) b!1037822))

(assert (= (and d!125327 (not c!105319)) b!1037823))

(assert (=> b!1037822 m!957681))

(assert (=> b!1037822 m!957679))

(declare-fun m!958261 () Bool)

(assert (=> b!1037822 m!958261))

(assert (=> b!1037823 m!957681))

(assert (=> b!1037823 m!957679))

(declare-fun m!958263 () Bool)

(assert (=> b!1037823 m!958263))

(assert (=> b!1037468 d!125327))

(declare-fun d!125329 () Bool)

(declare-fun isEmpty!935 (List!21902) Bool)

(assert (=> d!125329 (= (isEmpty!933 lt!457536) (isEmpty!935 (toList!6897 lt!457536)))))

(declare-fun bs!30371 () Bool)

(assert (= bs!30371 d!125329))

(declare-fun m!958265 () Bool)

(assert (=> bs!30371 m!958265))

(assert (=> b!1037505 d!125329))

(declare-fun b!1037824 () Bool)

(declare-fun e!587051 () Option!636)

(assert (=> b!1037824 (= e!587051 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457538)))))))

(declare-fun d!125331 () Bool)

(declare-fun c!105320 () Bool)

(assert (=> d!125331 (= c!105320 (and ((_ is Cons!21898) (toList!6897 lt!457538)) (= (_1!7875 (h!23109 (toList!6897 lt!457538))) (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))))))))

(assert (=> d!125331 (= (getValueByKey!585 (toList!6897 lt!457538) (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))) e!587051)))

(declare-fun b!1037825 () Bool)

(declare-fun e!587052 () Option!636)

(assert (=> b!1037825 (= e!587051 e!587052)))

(declare-fun c!105321 () Bool)

(assert (=> b!1037825 (= c!105321 (and ((_ is Cons!21898) (toList!6897 lt!457538)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457538))) (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))))))))

(declare-fun b!1037826 () Bool)

(assert (=> b!1037826 (= e!587052 (getValueByKey!585 (t!31099 (toList!6897 lt!457538)) (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1037827 () Bool)

(assert (=> b!1037827 (= e!587052 None!634)))

(assert (= (and d!125331 c!105320) b!1037824))

(assert (= (and d!125331 (not c!105320)) b!1037825))

(assert (= (and b!1037825 c!105321) b!1037826))

(assert (= (and b!1037825 (not c!105321)) b!1037827))

(declare-fun m!958267 () Bool)

(assert (=> b!1037826 m!958267))

(assert (=> b!1037516 d!125331))

(declare-fun d!125333 () Bool)

(assert (=> d!125333 (= (isDefined!435 (getValueByKey!585 (toList!6897 lt!457386) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!934 (getValueByKey!585 (toList!6897 lt!457386) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30372 () Bool)

(assert (= bs!30372 d!125333))

(assert (=> bs!30372 m!957631))

(declare-fun m!958269 () Bool)

(assert (=> bs!30372 m!958269))

(assert (=> b!1037430 d!125333))

(declare-fun b!1037828 () Bool)

(declare-fun e!587053 () Option!636)

(assert (=> b!1037828 (= e!587053 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457386)))))))

(declare-fun d!125335 () Bool)

(declare-fun c!105322 () Bool)

(assert (=> d!125335 (= c!105322 (and ((_ is Cons!21898) (toList!6897 lt!457386)) (= (_1!7875 (h!23109 (toList!6897 lt!457386))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125335 (= (getValueByKey!585 (toList!6897 lt!457386) #b1000000000000000000000000000000000000000000000000000000000000000) e!587053)))

(declare-fun b!1037829 () Bool)

(declare-fun e!587054 () Option!636)

(assert (=> b!1037829 (= e!587053 e!587054)))

(declare-fun c!105323 () Bool)

(assert (=> b!1037829 (= c!105323 (and ((_ is Cons!21898) (toList!6897 lt!457386)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457386))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1037830 () Bool)

(assert (=> b!1037830 (= e!587054 (getValueByKey!585 (t!31099 (toList!6897 lt!457386)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037831 () Bool)

(assert (=> b!1037831 (= e!587054 None!634)))

(assert (= (and d!125335 c!105322) b!1037828))

(assert (= (and d!125335 (not c!105322)) b!1037829))

(assert (= (and b!1037829 c!105323) b!1037830))

(assert (= (and b!1037829 (not c!105323)) b!1037831))

(declare-fun m!958271 () Bool)

(assert (=> b!1037830 m!958271))

(assert (=> b!1037430 d!125335))

(declare-fun d!125337 () Bool)

(assert (=> d!125337 (= (get!16493 (getValueByKey!585 (toList!6897 lt!457387) lt!457392)) (v!14927 (getValueByKey!585 (toList!6897 lt!457387) lt!457392)))))

(assert (=> d!125131 d!125337))

(declare-fun b!1037832 () Bool)

(declare-fun e!587055 () Option!636)

(assert (=> b!1037832 (= e!587055 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457387)))))))

(declare-fun d!125339 () Bool)

(declare-fun c!105324 () Bool)

(assert (=> d!125339 (= c!105324 (and ((_ is Cons!21898) (toList!6897 lt!457387)) (= (_1!7875 (h!23109 (toList!6897 lt!457387))) lt!457392)))))

(assert (=> d!125339 (= (getValueByKey!585 (toList!6897 lt!457387) lt!457392) e!587055)))

(declare-fun b!1037833 () Bool)

(declare-fun e!587056 () Option!636)

(assert (=> b!1037833 (= e!587055 e!587056)))

(declare-fun c!105325 () Bool)

(assert (=> b!1037833 (= c!105325 (and ((_ is Cons!21898) (toList!6897 lt!457387)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457387))) lt!457392))))))

(declare-fun b!1037834 () Bool)

(assert (=> b!1037834 (= e!587056 (getValueByKey!585 (t!31099 (toList!6897 lt!457387)) lt!457392))))

(declare-fun b!1037835 () Bool)

(assert (=> b!1037835 (= e!587056 None!634)))

(assert (= (and d!125339 c!105324) b!1037832))

(assert (= (and d!125339 (not c!105324)) b!1037833))

(assert (= (and b!1037833 c!105325) b!1037834))

(assert (= (and b!1037833 (not c!105325)) b!1037835))

(declare-fun m!958273 () Bool)

(assert (=> b!1037834 m!958273))

(assert (=> d!125131 d!125339))

(declare-fun d!125341 () Bool)

(assert (=> d!125341 (= (get!16493 (getValueByKey!585 (toList!6897 (+!3127 lt!457398 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))) lt!457396)) (v!14927 (getValueByKey!585 (toList!6897 (+!3127 lt!457398 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))) lt!457396)))))

(assert (=> d!125125 d!125341))

(declare-fun e!587057 () Option!636)

(declare-fun b!1037836 () Bool)

(assert (=> b!1037836 (= e!587057 (Some!635 (_2!7875 (h!23109 (toList!6897 (+!3127 lt!457398 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))))))))))

(declare-fun c!105326 () Bool)

(declare-fun d!125343 () Bool)

(assert (=> d!125343 (= c!105326 (and ((_ is Cons!21898) (toList!6897 (+!3127 lt!457398 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))))) (= (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457398 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))))) lt!457396)))))

(assert (=> d!125343 (= (getValueByKey!585 (toList!6897 (+!3127 lt!457398 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))) lt!457396) e!587057)))

(declare-fun b!1037837 () Bool)

(declare-fun e!587058 () Option!636)

(assert (=> b!1037837 (= e!587057 e!587058)))

(declare-fun c!105327 () Bool)

(assert (=> b!1037837 (= c!105327 (and ((_ is Cons!21898) (toList!6897 (+!3127 lt!457398 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))))) (not (= (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457398 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))))) lt!457396))))))

(declare-fun b!1037838 () Bool)

(assert (=> b!1037838 (= e!587058 (getValueByKey!585 (t!31099 (toList!6897 (+!3127 lt!457398 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))))) lt!457396))))

(declare-fun b!1037839 () Bool)

(assert (=> b!1037839 (= e!587058 None!634)))

(assert (= (and d!125343 c!105326) b!1037836))

(assert (= (and d!125343 (not c!105326)) b!1037837))

(assert (= (and b!1037837 c!105327) b!1037838))

(assert (= (and b!1037837 (not c!105327)) b!1037839))

(declare-fun m!958275 () Bool)

(assert (=> b!1037838 m!958275))

(assert (=> d!125125 d!125343))

(declare-fun d!125345 () Bool)

(declare-fun lt!457677 () Bool)

(declare-fun content!518 (List!21905) (InoxSet (_ BitVec 64)))

(assert (=> d!125345 (= lt!457677 (select (content!518 Nil!21902) (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)))))

(declare-fun e!587063 () Bool)

(assert (=> d!125345 (= lt!457677 e!587063)))

(declare-fun res!692339 () Bool)

(assert (=> d!125345 (=> (not res!692339) (not e!587063))))

(assert (=> d!125345 (= res!692339 ((_ is Cons!21901) Nil!21902))))

(assert (=> d!125345 (= (contains!6048 Nil!21902 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)) lt!457677)))

(declare-fun b!1037844 () Bool)

(declare-fun e!587064 () Bool)

(assert (=> b!1037844 (= e!587063 e!587064)))

(declare-fun res!692338 () Bool)

(assert (=> b!1037844 (=> res!692338 e!587064)))

(assert (=> b!1037844 (= res!692338 (= (h!23112 Nil!21902) (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)))))

(declare-fun b!1037845 () Bool)

(assert (=> b!1037845 (= e!587064 (contains!6048 (t!31108 Nil!21902) (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)))))

(assert (= (and d!125345 res!692339) b!1037844))

(assert (= (and b!1037844 (not res!692338)) b!1037845))

(declare-fun m!958277 () Bool)

(assert (=> d!125345 m!958277))

(assert (=> d!125345 m!957669))

(declare-fun m!958279 () Bool)

(assert (=> d!125345 m!958279))

(assert (=> b!1037845 m!957669))

(declare-fun m!958281 () Bool)

(assert (=> b!1037845 m!958281))

(assert (=> b!1037559 d!125345))

(declare-fun b!1037846 () Bool)

(declare-fun e!587065 () Option!636)

(assert (=> b!1037846 (= e!587065 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457578)))))))

(declare-fun d!125347 () Bool)

(declare-fun c!105328 () Bool)

(assert (=> d!125347 (= c!105328 (and ((_ is Cons!21898) (toList!6897 lt!457578)) (= (_1!7875 (h!23109 (toList!6897 lt!457578))) (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))))

(assert (=> d!125347 (= (getValueByKey!585 (toList!6897 lt!457578) (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))) e!587065)))

(declare-fun b!1037847 () Bool)

(declare-fun e!587066 () Option!636)

(assert (=> b!1037847 (= e!587065 e!587066)))

(declare-fun c!105329 () Bool)

(assert (=> b!1037847 (= c!105329 (and ((_ is Cons!21898) (toList!6897 lt!457578)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457578))) (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))))

(declare-fun b!1037848 () Bool)

(assert (=> b!1037848 (= e!587066 (getValueByKey!585 (t!31099 (toList!6897 lt!457578)) (_1!7875 (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(declare-fun b!1037849 () Bool)

(assert (=> b!1037849 (= e!587066 None!634)))

(assert (= (and d!125347 c!105328) b!1037846))

(assert (= (and d!125347 (not c!105328)) b!1037847))

(assert (= (and b!1037847 c!105329) b!1037848))

(assert (= (and b!1037847 (not c!105329)) b!1037849))

(declare-fun m!958283 () Bool)

(assert (=> b!1037848 m!958283))

(assert (=> b!1037566 d!125347))

(declare-fun b!1037850 () Bool)

(declare-fun e!587067 () Option!636)

(assert (=> b!1037850 (= e!587067 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457553)))))))

(declare-fun c!105330 () Bool)

(declare-fun d!125349 () Bool)

(assert (=> d!125349 (= c!105330 (and ((_ is Cons!21898) (toList!6897 lt!457553)) (= (_1!7875 (h!23109 (toList!6897 lt!457553))) (_1!7875 (tuple2!15729 lt!457394 lt!457297)))))))

(assert (=> d!125349 (= (getValueByKey!585 (toList!6897 lt!457553) (_1!7875 (tuple2!15729 lt!457394 lt!457297))) e!587067)))

(declare-fun b!1037851 () Bool)

(declare-fun e!587068 () Option!636)

(assert (=> b!1037851 (= e!587067 e!587068)))

(declare-fun c!105331 () Bool)

(assert (=> b!1037851 (= c!105331 (and ((_ is Cons!21898) (toList!6897 lt!457553)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457553))) (_1!7875 (tuple2!15729 lt!457394 lt!457297))))))))

(declare-fun b!1037852 () Bool)

(assert (=> b!1037852 (= e!587068 (getValueByKey!585 (t!31099 (toList!6897 lt!457553)) (_1!7875 (tuple2!15729 lt!457394 lt!457297))))))

(declare-fun b!1037853 () Bool)

(assert (=> b!1037853 (= e!587068 None!634)))

(assert (= (and d!125349 c!105330) b!1037850))

(assert (= (and d!125349 (not c!105330)) b!1037851))

(assert (= (and b!1037851 c!105331) b!1037852))

(assert (= (and b!1037851 (not c!105331)) b!1037853))

(declare-fun m!958285 () Bool)

(assert (=> b!1037852 m!958285))

(assert (=> b!1037525 d!125349))

(declare-fun d!125351 () Bool)

(assert (=> d!125351 (= (validMask!0 (mask!30230 lt!457298)) (and (or (= (mask!30230 lt!457298) #b00000000000000000000000000000111) (= (mask!30230 lt!457298) #b00000000000000000000000000001111) (= (mask!30230 lt!457298) #b00000000000000000000000000011111) (= (mask!30230 lt!457298) #b00000000000000000000000000111111) (= (mask!30230 lt!457298) #b00000000000000000000000001111111) (= (mask!30230 lt!457298) #b00000000000000000000000011111111) (= (mask!30230 lt!457298) #b00000000000000000000000111111111) (= (mask!30230 lt!457298) #b00000000000000000000001111111111) (= (mask!30230 lt!457298) #b00000000000000000000011111111111) (= (mask!30230 lt!457298) #b00000000000000000000111111111111) (= (mask!30230 lt!457298) #b00000000000000000001111111111111) (= (mask!30230 lt!457298) #b00000000000000000011111111111111) (= (mask!30230 lt!457298) #b00000000000000000111111111111111) (= (mask!30230 lt!457298) #b00000000000000001111111111111111) (= (mask!30230 lt!457298) #b00000000000000011111111111111111) (= (mask!30230 lt!457298) #b00000000000000111111111111111111) (= (mask!30230 lt!457298) #b00000000000001111111111111111111) (= (mask!30230 lt!457298) #b00000000000011111111111111111111) (= (mask!30230 lt!457298) #b00000000000111111111111111111111) (= (mask!30230 lt!457298) #b00000000001111111111111111111111) (= (mask!30230 lt!457298) #b00000000011111111111111111111111) (= (mask!30230 lt!457298) #b00000000111111111111111111111111) (= (mask!30230 lt!457298) #b00000001111111111111111111111111) (= (mask!30230 lt!457298) #b00000011111111111111111111111111) (= (mask!30230 lt!457298) #b00000111111111111111111111111111) (= (mask!30230 lt!457298) #b00001111111111111111111111111111) (= (mask!30230 lt!457298) #b00011111111111111111111111111111) (= (mask!30230 lt!457298) #b00111111111111111111111111111111)) (bvsle (mask!30230 lt!457298) #b00111111111111111111111111111111)))))

(assert (=> d!125097 d!125351))

(declare-fun d!125353 () Bool)

(assert (=> d!125353 (= (get!16493 (getValueByKey!585 (toList!6897 (+!3127 lt!457387 (tuple2!15729 lt!457394 lt!457297))) lt!457392)) (v!14927 (getValueByKey!585 (toList!6897 (+!3127 lt!457387 (tuple2!15729 lt!457394 lt!457297))) lt!457392)))))

(assert (=> d!125111 d!125353))

(declare-fun b!1037854 () Bool)

(declare-fun e!587069 () Option!636)

(assert (=> b!1037854 (= e!587069 (Some!635 (_2!7875 (h!23109 (toList!6897 (+!3127 lt!457387 (tuple2!15729 lt!457394 lt!457297)))))))))

(declare-fun c!105332 () Bool)

(declare-fun d!125355 () Bool)

(assert (=> d!125355 (= c!105332 (and ((_ is Cons!21898) (toList!6897 (+!3127 lt!457387 (tuple2!15729 lt!457394 lt!457297)))) (= (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457387 (tuple2!15729 lt!457394 lt!457297))))) lt!457392)))))

(assert (=> d!125355 (= (getValueByKey!585 (toList!6897 (+!3127 lt!457387 (tuple2!15729 lt!457394 lt!457297))) lt!457392) e!587069)))

(declare-fun b!1037855 () Bool)

(declare-fun e!587070 () Option!636)

(assert (=> b!1037855 (= e!587069 e!587070)))

(declare-fun c!105333 () Bool)

(assert (=> b!1037855 (= c!105333 (and ((_ is Cons!21898) (toList!6897 (+!3127 lt!457387 (tuple2!15729 lt!457394 lt!457297)))) (not (= (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457387 (tuple2!15729 lt!457394 lt!457297))))) lt!457392))))))

(declare-fun b!1037856 () Bool)

(assert (=> b!1037856 (= e!587070 (getValueByKey!585 (t!31099 (toList!6897 (+!3127 lt!457387 (tuple2!15729 lt!457394 lt!457297)))) lt!457392))))

(declare-fun b!1037857 () Bool)

(assert (=> b!1037857 (= e!587070 None!634)))

(assert (= (and d!125355 c!105332) b!1037854))

(assert (= (and d!125355 (not c!105332)) b!1037855))

(assert (= (and b!1037855 c!105333) b!1037856))

(assert (= (and b!1037855 (not c!105333)) b!1037857))

(declare-fun m!958287 () Bool)

(assert (=> b!1037856 m!958287))

(assert (=> d!125111 d!125355))

(declare-fun b!1037858 () Bool)

(declare-fun e!587071 () Option!636)

(assert (=> b!1037858 (= e!587071 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457469)))))))

(declare-fun c!105334 () Bool)

(declare-fun d!125357 () Bool)

(assert (=> d!125357 (= c!105334 (and ((_ is Cons!21898) (toList!6897 lt!457469)) (= (_1!7875 (h!23109 (toList!6897 lt!457469))) (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))))))))

(assert (=> d!125357 (= (getValueByKey!585 (toList!6897 lt!457469) (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))) e!587071)))

(declare-fun b!1037859 () Bool)

(declare-fun e!587072 () Option!636)

(assert (=> b!1037859 (= e!587071 e!587072)))

(declare-fun c!105335 () Bool)

(assert (=> b!1037859 (= c!105335 (and ((_ is Cons!21898) (toList!6897 lt!457469)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457469))) (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))))))))

(declare-fun b!1037860 () Bool)

(assert (=> b!1037860 (= e!587072 (getValueByKey!585 (t!31099 (toList!6897 lt!457469)) (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))))))

(declare-fun b!1037861 () Bool)

(assert (=> b!1037861 (= e!587072 None!634)))

(assert (= (and d!125357 c!105334) b!1037858))

(assert (= (and d!125357 (not c!105334)) b!1037859))

(assert (= (and b!1037859 c!105335) b!1037860))

(assert (= (and b!1037859 (not c!105335)) b!1037861))

(declare-fun m!958289 () Bool)

(assert (=> b!1037860 m!958289))

(assert (=> b!1037411 d!125357))

(declare-fun b!1037862 () Bool)

(declare-fun e!587073 () Bool)

(declare-fun e!587074 () Bool)

(assert (=> b!1037862 (= e!587073 e!587074)))

(declare-fun c!105336 () Bool)

(assert (=> b!1037862 (= c!105336 (validKeyInArray!0 (select (arr!31447 (_keys!11496 lt!457298)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1037863 () Bool)

(declare-fun e!587075 () Bool)

(assert (=> b!1037863 (= e!587074 e!587075)))

(declare-fun lt!457678 () (_ BitVec 64))

(assert (=> b!1037863 (= lt!457678 (select (arr!31447 (_keys!11496 lt!457298)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!457680 () Unit!33898)

(assert (=> b!1037863 (= lt!457680 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11496 lt!457298) lt!457678 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1037863 (arrayContainsKey!0 (_keys!11496 lt!457298) lt!457678 #b00000000000000000000000000000000)))

(declare-fun lt!457679 () Unit!33898)

(assert (=> b!1037863 (= lt!457679 lt!457680)))

(declare-fun res!692340 () Bool)

(assert (=> b!1037863 (= res!692340 (= (seekEntryOrOpen!0 (select (arr!31447 (_keys!11496 lt!457298)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!11496 lt!457298) (mask!30230 lt!457298)) (Found!9703 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1037863 (=> (not res!692340) (not e!587075))))

(declare-fun b!1037864 () Bool)

(declare-fun call!43939 () Bool)

(assert (=> b!1037864 (= e!587074 call!43939)))

(declare-fun d!125359 () Bool)

(declare-fun res!692341 () Bool)

(assert (=> d!125359 (=> res!692341 e!587073)))

(assert (=> d!125359 (= res!692341 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 lt!457298))))))

(assert (=> d!125359 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11496 lt!457298) (mask!30230 lt!457298)) e!587073)))

(declare-fun b!1037865 () Bool)

(assert (=> b!1037865 (= e!587075 call!43939)))

(declare-fun bm!43936 () Bool)

(assert (=> bm!43936 (= call!43939 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!11496 lt!457298) (mask!30230 lt!457298)))))

(assert (= (and d!125359 (not res!692341)) b!1037862))

(assert (= (and b!1037862 c!105336) b!1037863))

(assert (= (and b!1037862 (not c!105336)) b!1037864))

(assert (= (and b!1037863 res!692340) b!1037865))

(assert (= (or b!1037865 b!1037864) bm!43936))

(declare-fun m!958291 () Bool)

(assert (=> b!1037862 m!958291))

(assert (=> b!1037862 m!958291))

(declare-fun m!958293 () Bool)

(assert (=> b!1037862 m!958293))

(assert (=> b!1037863 m!958291))

(declare-fun m!958295 () Bool)

(assert (=> b!1037863 m!958295))

(declare-fun m!958297 () Bool)

(assert (=> b!1037863 m!958297))

(assert (=> b!1037863 m!958291))

(declare-fun m!958299 () Bool)

(assert (=> b!1037863 m!958299))

(declare-fun m!958301 () Bool)

(assert (=> bm!43936 m!958301))

(assert (=> bm!43910 d!125359))

(assert (=> b!1037545 d!125093))

(declare-fun b!1037866 () Bool)

(declare-fun e!587082 () Bool)

(declare-fun lt!457687 () ListLongMap!13763)

(assert (=> b!1037866 (= e!587082 (= lt!457687 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 lt!457298) (_values!6292 lt!457298) (mask!30230 lt!457298) (extraKeys!5999 lt!457298) (zeroValue!6103 lt!457298) (minValue!6105 lt!457298) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6269 lt!457298))))))

(declare-fun b!1037867 () Bool)

(assert (=> b!1037867 (= e!587082 (isEmpty!933 lt!457687))))

(declare-fun d!125361 () Bool)

(declare-fun e!587081 () Bool)

(assert (=> d!125361 e!587081))

(declare-fun res!692345 () Bool)

(assert (=> d!125361 (=> (not res!692345) (not e!587081))))

(assert (=> d!125361 (= res!692345 (not (contains!6046 lt!457687 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!587080 () ListLongMap!13763)

(assert (=> d!125361 (= lt!457687 e!587080)))

(declare-fun c!105337 () Bool)

(assert (=> d!125361 (= c!105337 (bvsge #b00000000000000000000000000000000 (size!31976 (_keys!11496 lt!457298))))))

(assert (=> d!125361 (validMask!0 (mask!30230 lt!457298))))

(assert (=> d!125361 (= (getCurrentListMapNoExtraKeys!3567 (_keys!11496 lt!457298) (_values!6292 lt!457298) (mask!30230 lt!457298) (extraKeys!5999 lt!457298) (zeroValue!6103 lt!457298) (minValue!6105 lt!457298) #b00000000000000000000000000000000 (defaultEntry!6269 lt!457298)) lt!457687)))

(declare-fun b!1037868 () Bool)

(declare-fun e!587077 () Bool)

(assert (=> b!1037868 (= e!587077 e!587082)))

(declare-fun c!105338 () Bool)

(assert (=> b!1037868 (= c!105338 (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 lt!457298))))))

(declare-fun b!1037869 () Bool)

(assert (=> b!1037869 (= e!587081 e!587077)))

(declare-fun c!105340 () Bool)

(declare-fun e!587079 () Bool)

(assert (=> b!1037869 (= c!105340 e!587079)))

(declare-fun res!692342 () Bool)

(assert (=> b!1037869 (=> (not res!692342) (not e!587079))))

(assert (=> b!1037869 (= res!692342 (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 lt!457298))))))

(declare-fun b!1037870 () Bool)

(declare-fun lt!457686 () Unit!33898)

(declare-fun lt!457682 () Unit!33898)

(assert (=> b!1037870 (= lt!457686 lt!457682)))

(declare-fun lt!457681 () ListLongMap!13763)

(declare-fun lt!457683 () V!37667)

(declare-fun lt!457684 () (_ BitVec 64))

(declare-fun lt!457685 () (_ BitVec 64))

(assert (=> b!1037870 (not (contains!6046 (+!3127 lt!457681 (tuple2!15729 lt!457685 lt!457683)) lt!457684))))

(assert (=> b!1037870 (= lt!457682 (addStillNotContains!245 lt!457681 lt!457685 lt!457683 lt!457684))))

(assert (=> b!1037870 (= lt!457684 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1037870 (= lt!457683 (get!16492 (select (arr!31448 (_values!6292 lt!457298)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 lt!457298) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1037870 (= lt!457685 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000))))

(declare-fun call!43940 () ListLongMap!13763)

(assert (=> b!1037870 (= lt!457681 call!43940)))

(declare-fun e!587078 () ListLongMap!13763)

(assert (=> b!1037870 (= e!587078 (+!3127 call!43940 (tuple2!15729 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 lt!457298)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 lt!457298) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1037871 () Bool)

(declare-fun res!692343 () Bool)

(assert (=> b!1037871 (=> (not res!692343) (not e!587081))))

(assert (=> b!1037871 (= res!692343 (not (contains!6046 lt!457687 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1037872 () Bool)

(assert (=> b!1037872 (= e!587080 (ListLongMap!13764 Nil!21899))))

(declare-fun b!1037873 () Bool)

(declare-fun e!587076 () Bool)

(assert (=> b!1037873 (= e!587077 e!587076)))

(assert (=> b!1037873 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 lt!457298))))))

(declare-fun res!692344 () Bool)

(assert (=> b!1037873 (= res!692344 (contains!6046 lt!457687 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)))))

(assert (=> b!1037873 (=> (not res!692344) (not e!587076))))

(declare-fun bm!43937 () Bool)

(assert (=> bm!43937 (= call!43940 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 lt!457298) (_values!6292 lt!457298) (mask!30230 lt!457298) (extraKeys!5999 lt!457298) (zeroValue!6103 lt!457298) (minValue!6105 lt!457298) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6269 lt!457298)))))

(declare-fun b!1037874 () Bool)

(assert (=> b!1037874 (= e!587080 e!587078)))

(declare-fun c!105339 () Bool)

(assert (=> b!1037874 (= c!105339 (validKeyInArray!0 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)))))

(declare-fun b!1037875 () Bool)

(assert (=> b!1037875 (= e!587078 call!43940)))

(declare-fun b!1037876 () Bool)

(assert (=> b!1037876 (= e!587079 (validKeyInArray!0 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)))))

(assert (=> b!1037876 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1037877 () Bool)

(assert (=> b!1037877 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31976 (_keys!11496 lt!457298))))))

(assert (=> b!1037877 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31977 (_values!6292 lt!457298))))))

(assert (=> b!1037877 (= e!587076 (= (apply!916 lt!457687 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)) (get!16492 (select (arr!31448 (_values!6292 lt!457298)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 lt!457298) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!125361 c!105337) b!1037872))

(assert (= (and d!125361 (not c!105337)) b!1037874))

(assert (= (and b!1037874 c!105339) b!1037870))

(assert (= (and b!1037874 (not c!105339)) b!1037875))

(assert (= (or b!1037870 b!1037875) bm!43937))

(assert (= (and d!125361 res!692345) b!1037871))

(assert (= (and b!1037871 res!692343) b!1037869))

(assert (= (and b!1037869 res!692342) b!1037876))

(assert (= (and b!1037869 c!105340) b!1037873))

(assert (= (and b!1037869 (not c!105340)) b!1037868))

(assert (= (and b!1037873 res!692344) b!1037877))

(assert (= (and b!1037868 c!105338) b!1037866))

(assert (= (and b!1037868 (not c!105338)) b!1037867))

(declare-fun b_lambda!16149 () Bool)

(assert (=> (not b_lambda!16149) (not b!1037870)))

(assert (=> b!1037870 t!31110))

(declare-fun b_and!33415 () Bool)

(assert (= b_and!33413 (and (=> t!31110 result!14423) b_and!33415)))

(declare-fun b_lambda!16151 () Bool)

(assert (=> (not b_lambda!16151) (not b!1037877)))

(assert (=> b!1037877 t!31110))

(declare-fun b_and!33417 () Bool)

(assert (= b_and!33415 (and (=> t!31110 result!14423) b_and!33417)))

(declare-fun m!958303 () Bool)

(assert (=> b!1037866 m!958303))

(declare-fun m!958305 () Bool)

(assert (=> d!125361 m!958305))

(assert (=> d!125361 m!957663))

(declare-fun m!958307 () Bool)

(assert (=> b!1037870 m!958307))

(declare-fun m!958309 () Bool)

(assert (=> b!1037870 m!958309))

(declare-fun m!958311 () Bool)

(assert (=> b!1037870 m!958311))

(assert (=> b!1037870 m!957681))

(assert (=> b!1037870 m!957679))

(assert (=> b!1037870 m!957685))

(assert (=> b!1037870 m!957681))

(declare-fun m!958313 () Bool)

(assert (=> b!1037870 m!958313))

(assert (=> b!1037870 m!957679))

(assert (=> b!1037870 m!958309))

(assert (=> b!1037870 m!957669))

(assert (=> b!1037873 m!957669))

(assert (=> b!1037873 m!957669))

(declare-fun m!958315 () Bool)

(assert (=> b!1037873 m!958315))

(assert (=> b!1037874 m!957669))

(assert (=> b!1037874 m!957669))

(assert (=> b!1037874 m!957671))

(assert (=> b!1037876 m!957669))

(assert (=> b!1037876 m!957669))

(assert (=> b!1037876 m!957671))

(assert (=> bm!43937 m!958303))

(assert (=> b!1037877 m!957681))

(assert (=> b!1037877 m!957679))

(assert (=> b!1037877 m!957685))

(assert (=> b!1037877 m!957681))

(assert (=> b!1037877 m!957669))

(declare-fun m!958317 () Bool)

(assert (=> b!1037877 m!958317))

(assert (=> b!1037877 m!957679))

(assert (=> b!1037877 m!957669))

(declare-fun m!958319 () Bool)

(assert (=> b!1037867 m!958319))

(declare-fun m!958321 () Bool)

(assert (=> b!1037871 m!958321))

(assert (=> b!1037474 d!125361))

(declare-fun d!125363 () Bool)

(assert (=> d!125363 (= (apply!916 (+!3127 lt!457518 (tuple2!15729 lt!457513 (minValue!6105 lt!457298))) lt!457508) (apply!916 lt!457518 lt!457508))))

(declare-fun lt!457688 () Unit!33898)

(assert (=> d!125363 (= lt!457688 (choose!1707 lt!457518 lt!457513 (minValue!6105 lt!457298) lt!457508))))

(declare-fun e!587083 () Bool)

(assert (=> d!125363 e!587083))

(declare-fun res!692346 () Bool)

(assert (=> d!125363 (=> (not res!692346) (not e!587083))))

(assert (=> d!125363 (= res!692346 (contains!6046 lt!457518 lt!457508))))

(assert (=> d!125363 (= (addApplyDifferent!482 lt!457518 lt!457513 (minValue!6105 lt!457298) lt!457508) lt!457688)))

(declare-fun b!1037878 () Bool)

(assert (=> b!1037878 (= e!587083 (not (= lt!457508 lt!457513)))))

(assert (= (and d!125363 res!692346) b!1037878))

(declare-fun m!958323 () Bool)

(assert (=> d!125363 m!958323))

(assert (=> d!125363 m!957701))

(declare-fun m!958325 () Bool)

(assert (=> d!125363 m!958325))

(assert (=> d!125363 m!957705))

(assert (=> d!125363 m!957701))

(assert (=> d!125363 m!957703))

(assert (=> b!1037474 d!125363))

(declare-fun d!125365 () Bool)

(assert (=> d!125365 (contains!6046 (+!3127 lt!457506 (tuple2!15729 lt!457510 (zeroValue!6103 lt!457298))) lt!457515)))

(declare-fun lt!457689 () Unit!33898)

(assert (=> d!125365 (= lt!457689 (choose!1708 lt!457506 lt!457510 (zeroValue!6103 lt!457298) lt!457515))))

(assert (=> d!125365 (contains!6046 lt!457506 lt!457515)))

(assert (=> d!125365 (= (addStillContains!626 lt!457506 lt!457510 (zeroValue!6103 lt!457298) lt!457515) lt!457689)))

(declare-fun bs!30373 () Bool)

(assert (= bs!30373 d!125365))

(assert (=> bs!30373 m!957693))

(assert (=> bs!30373 m!957693))

(assert (=> bs!30373 m!957713))

(declare-fun m!958327 () Bool)

(assert (=> bs!30373 m!958327))

(declare-fun m!958329 () Bool)

(assert (=> bs!30373 m!958329))

(assert (=> b!1037474 d!125365))

(declare-fun d!125367 () Bool)

(declare-fun e!587084 () Bool)

(assert (=> d!125367 e!587084))

(declare-fun res!692347 () Bool)

(assert (=> d!125367 (=> (not res!692347) (not e!587084))))

(declare-fun lt!457691 () ListLongMap!13763)

(assert (=> d!125367 (= res!692347 (contains!6046 lt!457691 (_1!7875 (tuple2!15729 lt!457507 (minValue!6105 lt!457298)))))))

(declare-fun lt!457693 () List!21902)

(assert (=> d!125367 (= lt!457691 (ListLongMap!13764 lt!457693))))

(declare-fun lt!457692 () Unit!33898)

(declare-fun lt!457690 () Unit!33898)

(assert (=> d!125367 (= lt!457692 lt!457690)))

(assert (=> d!125367 (= (getValueByKey!585 lt!457693 (_1!7875 (tuple2!15729 lt!457507 (minValue!6105 lt!457298)))) (Some!635 (_2!7875 (tuple2!15729 lt!457507 (minValue!6105 lt!457298)))))))

(assert (=> d!125367 (= lt!457690 (lemmaContainsTupThenGetReturnValue!281 lt!457693 (_1!7875 (tuple2!15729 lt!457507 (minValue!6105 lt!457298))) (_2!7875 (tuple2!15729 lt!457507 (minValue!6105 lt!457298)))))))

(assert (=> d!125367 (= lt!457693 (insertStrictlySorted!374 (toList!6897 lt!457500) (_1!7875 (tuple2!15729 lt!457507 (minValue!6105 lt!457298))) (_2!7875 (tuple2!15729 lt!457507 (minValue!6105 lt!457298)))))))

(assert (=> d!125367 (= (+!3127 lt!457500 (tuple2!15729 lt!457507 (minValue!6105 lt!457298))) lt!457691)))

(declare-fun b!1037879 () Bool)

(declare-fun res!692348 () Bool)

(assert (=> b!1037879 (=> (not res!692348) (not e!587084))))

(assert (=> b!1037879 (= res!692348 (= (getValueByKey!585 (toList!6897 lt!457691) (_1!7875 (tuple2!15729 lt!457507 (minValue!6105 lt!457298)))) (Some!635 (_2!7875 (tuple2!15729 lt!457507 (minValue!6105 lt!457298))))))))

(declare-fun b!1037880 () Bool)

(assert (=> b!1037880 (= e!587084 (contains!6047 (toList!6897 lt!457691) (tuple2!15729 lt!457507 (minValue!6105 lt!457298))))))

(assert (= (and d!125367 res!692347) b!1037879))

(assert (= (and b!1037879 res!692348) b!1037880))

(declare-fun m!958331 () Bool)

(assert (=> d!125367 m!958331))

(declare-fun m!958333 () Bool)

(assert (=> d!125367 m!958333))

(declare-fun m!958335 () Bool)

(assert (=> d!125367 m!958335))

(declare-fun m!958337 () Bool)

(assert (=> d!125367 m!958337))

(declare-fun m!958339 () Bool)

(assert (=> b!1037879 m!958339))

(declare-fun m!958341 () Bool)

(assert (=> b!1037880 m!958341))

(assert (=> b!1037474 d!125367))

(declare-fun d!125369 () Bool)

(assert (=> d!125369 (= (apply!916 (+!3127 lt!457511 (tuple2!15729 lt!457516 (zeroValue!6103 lt!457298))) lt!457509) (apply!916 lt!457511 lt!457509))))

(declare-fun lt!457694 () Unit!33898)

(assert (=> d!125369 (= lt!457694 (choose!1707 lt!457511 lt!457516 (zeroValue!6103 lt!457298) lt!457509))))

(declare-fun e!587085 () Bool)

(assert (=> d!125369 e!587085))

(declare-fun res!692349 () Bool)

(assert (=> d!125369 (=> (not res!692349) (not e!587085))))

(assert (=> d!125369 (= res!692349 (contains!6046 lt!457511 lt!457509))))

(assert (=> d!125369 (= (addApplyDifferent!482 lt!457511 lt!457516 (zeroValue!6103 lt!457298) lt!457509) lt!457694)))

(declare-fun b!1037881 () Bool)

(assert (=> b!1037881 (= e!587085 (not (= lt!457509 lt!457516)))))

(assert (= (and d!125369 res!692349) b!1037881))

(declare-fun m!958343 () Bool)

(assert (=> d!125369 m!958343))

(assert (=> d!125369 m!957711))

(declare-fun m!958345 () Bool)

(assert (=> d!125369 m!958345))

(assert (=> d!125369 m!957707))

(assert (=> d!125369 m!957711))

(assert (=> d!125369 m!957721))

(assert (=> b!1037474 d!125369))

(declare-fun d!125371 () Bool)

(declare-fun e!587086 () Bool)

(assert (=> d!125371 e!587086))

(declare-fun res!692350 () Bool)

(assert (=> d!125371 (=> res!692350 e!587086)))

(declare-fun lt!457698 () Bool)

(assert (=> d!125371 (= res!692350 (not lt!457698))))

(declare-fun lt!457695 () Bool)

(assert (=> d!125371 (= lt!457698 lt!457695)))

(declare-fun lt!457697 () Unit!33898)

(declare-fun e!587087 () Unit!33898)

(assert (=> d!125371 (= lt!457697 e!587087)))

(declare-fun c!105341 () Bool)

(assert (=> d!125371 (= c!105341 lt!457695)))

(assert (=> d!125371 (= lt!457695 (containsKey!566 (toList!6897 (+!3127 lt!457506 (tuple2!15729 lt!457510 (zeroValue!6103 lt!457298)))) lt!457515))))

(assert (=> d!125371 (= (contains!6046 (+!3127 lt!457506 (tuple2!15729 lt!457510 (zeroValue!6103 lt!457298))) lt!457515) lt!457698)))

(declare-fun b!1037882 () Bool)

(declare-fun lt!457696 () Unit!33898)

(assert (=> b!1037882 (= e!587087 lt!457696)))

(assert (=> b!1037882 (= lt!457696 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 (+!3127 lt!457506 (tuple2!15729 lt!457510 (zeroValue!6103 lt!457298)))) lt!457515))))

(assert (=> b!1037882 (isDefined!435 (getValueByKey!585 (toList!6897 (+!3127 lt!457506 (tuple2!15729 lt!457510 (zeroValue!6103 lt!457298)))) lt!457515))))

(declare-fun b!1037883 () Bool)

(declare-fun Unit!33924 () Unit!33898)

(assert (=> b!1037883 (= e!587087 Unit!33924)))

(declare-fun b!1037884 () Bool)

(assert (=> b!1037884 (= e!587086 (isDefined!435 (getValueByKey!585 (toList!6897 (+!3127 lt!457506 (tuple2!15729 lt!457510 (zeroValue!6103 lt!457298)))) lt!457515)))))

(assert (= (and d!125371 c!105341) b!1037882))

(assert (= (and d!125371 (not c!105341)) b!1037883))

(assert (= (and d!125371 (not res!692350)) b!1037884))

(declare-fun m!958347 () Bool)

(assert (=> d!125371 m!958347))

(declare-fun m!958349 () Bool)

(assert (=> b!1037882 m!958349))

(declare-fun m!958351 () Bool)

(assert (=> b!1037882 m!958351))

(assert (=> b!1037882 m!958351))

(declare-fun m!958353 () Bool)

(assert (=> b!1037882 m!958353))

(assert (=> b!1037884 m!958351))

(assert (=> b!1037884 m!958351))

(assert (=> b!1037884 m!958353))

(assert (=> b!1037474 d!125371))

(declare-fun d!125373 () Bool)

(declare-fun e!587088 () Bool)

(assert (=> d!125373 e!587088))

(declare-fun res!692351 () Bool)

(assert (=> d!125373 (=> (not res!692351) (not e!587088))))

(declare-fun lt!457700 () ListLongMap!13763)

(assert (=> d!125373 (= res!692351 (contains!6046 lt!457700 (_1!7875 (tuple2!15729 lt!457513 (minValue!6105 lt!457298)))))))

(declare-fun lt!457702 () List!21902)

(assert (=> d!125373 (= lt!457700 (ListLongMap!13764 lt!457702))))

(declare-fun lt!457701 () Unit!33898)

(declare-fun lt!457699 () Unit!33898)

(assert (=> d!125373 (= lt!457701 lt!457699)))

(assert (=> d!125373 (= (getValueByKey!585 lt!457702 (_1!7875 (tuple2!15729 lt!457513 (minValue!6105 lt!457298)))) (Some!635 (_2!7875 (tuple2!15729 lt!457513 (minValue!6105 lt!457298)))))))

(assert (=> d!125373 (= lt!457699 (lemmaContainsTupThenGetReturnValue!281 lt!457702 (_1!7875 (tuple2!15729 lt!457513 (minValue!6105 lt!457298))) (_2!7875 (tuple2!15729 lt!457513 (minValue!6105 lt!457298)))))))

(assert (=> d!125373 (= lt!457702 (insertStrictlySorted!374 (toList!6897 lt!457518) (_1!7875 (tuple2!15729 lt!457513 (minValue!6105 lt!457298))) (_2!7875 (tuple2!15729 lt!457513 (minValue!6105 lt!457298)))))))

(assert (=> d!125373 (= (+!3127 lt!457518 (tuple2!15729 lt!457513 (minValue!6105 lt!457298))) lt!457700)))

(declare-fun b!1037885 () Bool)

(declare-fun res!692352 () Bool)

(assert (=> b!1037885 (=> (not res!692352) (not e!587088))))

(assert (=> b!1037885 (= res!692352 (= (getValueByKey!585 (toList!6897 lt!457700) (_1!7875 (tuple2!15729 lt!457513 (minValue!6105 lt!457298)))) (Some!635 (_2!7875 (tuple2!15729 lt!457513 (minValue!6105 lt!457298))))))))

(declare-fun b!1037886 () Bool)

(assert (=> b!1037886 (= e!587088 (contains!6047 (toList!6897 lt!457700) (tuple2!15729 lt!457513 (minValue!6105 lt!457298))))))

(assert (= (and d!125373 res!692351) b!1037885))

(assert (= (and b!1037885 res!692352) b!1037886))

(declare-fun m!958355 () Bool)

(assert (=> d!125373 m!958355))

(declare-fun m!958357 () Bool)

(assert (=> d!125373 m!958357))

(declare-fun m!958359 () Bool)

(assert (=> d!125373 m!958359))

(declare-fun m!958361 () Bool)

(assert (=> d!125373 m!958361))

(declare-fun m!958363 () Bool)

(assert (=> b!1037885 m!958363))

(declare-fun m!958365 () Bool)

(assert (=> b!1037886 m!958365))

(assert (=> b!1037474 d!125373))

(declare-fun d!125375 () Bool)

(assert (=> d!125375 (= (apply!916 (+!3127 lt!457500 (tuple2!15729 lt!457507 (minValue!6105 lt!457298))) lt!457505) (apply!916 lt!457500 lt!457505))))

(declare-fun lt!457703 () Unit!33898)

(assert (=> d!125375 (= lt!457703 (choose!1707 lt!457500 lt!457507 (minValue!6105 lt!457298) lt!457505))))

(declare-fun e!587089 () Bool)

(assert (=> d!125375 e!587089))

(declare-fun res!692353 () Bool)

(assert (=> d!125375 (=> (not res!692353) (not e!587089))))

(assert (=> d!125375 (= res!692353 (contains!6046 lt!457500 lt!457505))))

(assert (=> d!125375 (= (addApplyDifferent!482 lt!457500 lt!457507 (minValue!6105 lt!457298) lt!457505) lt!457703)))

(declare-fun b!1037887 () Bool)

(assert (=> b!1037887 (= e!587089 (not (= lt!457505 lt!457507)))))

(assert (= (and d!125375 res!692353) b!1037887))

(declare-fun m!958367 () Bool)

(assert (=> d!125375 m!958367))

(assert (=> d!125375 m!957695))

(declare-fun m!958369 () Bool)

(assert (=> d!125375 m!958369))

(assert (=> d!125375 m!957699))

(assert (=> d!125375 m!957695))

(assert (=> d!125375 m!957697))

(assert (=> b!1037474 d!125375))

(declare-fun d!125377 () Bool)

(assert (=> d!125377 (= (apply!916 (+!3127 lt!457511 (tuple2!15729 lt!457516 (zeroValue!6103 lt!457298))) lt!457509) (get!16493 (getValueByKey!585 (toList!6897 (+!3127 lt!457511 (tuple2!15729 lt!457516 (zeroValue!6103 lt!457298)))) lt!457509)))))

(declare-fun bs!30374 () Bool)

(assert (= bs!30374 d!125377))

(declare-fun m!958371 () Bool)

(assert (=> bs!30374 m!958371))

(assert (=> bs!30374 m!958371))

(declare-fun m!958373 () Bool)

(assert (=> bs!30374 m!958373))

(assert (=> b!1037474 d!125377))

(declare-fun d!125379 () Bool)

(assert (=> d!125379 (= (apply!916 (+!3127 lt!457518 (tuple2!15729 lt!457513 (minValue!6105 lt!457298))) lt!457508) (get!16493 (getValueByKey!585 (toList!6897 (+!3127 lt!457518 (tuple2!15729 lt!457513 (minValue!6105 lt!457298)))) lt!457508)))))

(declare-fun bs!30375 () Bool)

(assert (= bs!30375 d!125379))

(declare-fun m!958375 () Bool)

(assert (=> bs!30375 m!958375))

(assert (=> bs!30375 m!958375))

(declare-fun m!958377 () Bool)

(assert (=> bs!30375 m!958377))

(assert (=> b!1037474 d!125379))

(declare-fun d!125381 () Bool)

(assert (=> d!125381 (= (apply!916 lt!457511 lt!457509) (get!16493 (getValueByKey!585 (toList!6897 lt!457511) lt!457509)))))

(declare-fun bs!30376 () Bool)

(assert (= bs!30376 d!125381))

(declare-fun m!958379 () Bool)

(assert (=> bs!30376 m!958379))

(assert (=> bs!30376 m!958379))

(declare-fun m!958381 () Bool)

(assert (=> bs!30376 m!958381))

(assert (=> b!1037474 d!125381))

(declare-fun d!125383 () Bool)

(declare-fun e!587090 () Bool)

(assert (=> d!125383 e!587090))

(declare-fun res!692354 () Bool)

(assert (=> d!125383 (=> (not res!692354) (not e!587090))))

(declare-fun lt!457705 () ListLongMap!13763)

(assert (=> d!125383 (= res!692354 (contains!6046 lt!457705 (_1!7875 (tuple2!15729 lt!457516 (zeroValue!6103 lt!457298)))))))

(declare-fun lt!457707 () List!21902)

(assert (=> d!125383 (= lt!457705 (ListLongMap!13764 lt!457707))))

(declare-fun lt!457706 () Unit!33898)

(declare-fun lt!457704 () Unit!33898)

(assert (=> d!125383 (= lt!457706 lt!457704)))

(assert (=> d!125383 (= (getValueByKey!585 lt!457707 (_1!7875 (tuple2!15729 lt!457516 (zeroValue!6103 lt!457298)))) (Some!635 (_2!7875 (tuple2!15729 lt!457516 (zeroValue!6103 lt!457298)))))))

(assert (=> d!125383 (= lt!457704 (lemmaContainsTupThenGetReturnValue!281 lt!457707 (_1!7875 (tuple2!15729 lt!457516 (zeroValue!6103 lt!457298))) (_2!7875 (tuple2!15729 lt!457516 (zeroValue!6103 lt!457298)))))))

(assert (=> d!125383 (= lt!457707 (insertStrictlySorted!374 (toList!6897 lt!457511) (_1!7875 (tuple2!15729 lt!457516 (zeroValue!6103 lt!457298))) (_2!7875 (tuple2!15729 lt!457516 (zeroValue!6103 lt!457298)))))))

(assert (=> d!125383 (= (+!3127 lt!457511 (tuple2!15729 lt!457516 (zeroValue!6103 lt!457298))) lt!457705)))

(declare-fun b!1037888 () Bool)

(declare-fun res!692355 () Bool)

(assert (=> b!1037888 (=> (not res!692355) (not e!587090))))

(assert (=> b!1037888 (= res!692355 (= (getValueByKey!585 (toList!6897 lt!457705) (_1!7875 (tuple2!15729 lt!457516 (zeroValue!6103 lt!457298)))) (Some!635 (_2!7875 (tuple2!15729 lt!457516 (zeroValue!6103 lt!457298))))))))

(declare-fun b!1037889 () Bool)

(assert (=> b!1037889 (= e!587090 (contains!6047 (toList!6897 lt!457705) (tuple2!15729 lt!457516 (zeroValue!6103 lt!457298))))))

(assert (= (and d!125383 res!692354) b!1037888))

(assert (= (and b!1037888 res!692355) b!1037889))

(declare-fun m!958383 () Bool)

(assert (=> d!125383 m!958383))

(declare-fun m!958385 () Bool)

(assert (=> d!125383 m!958385))

(declare-fun m!958387 () Bool)

(assert (=> d!125383 m!958387))

(declare-fun m!958389 () Bool)

(assert (=> d!125383 m!958389))

(declare-fun m!958391 () Bool)

(assert (=> b!1037888 m!958391))

(declare-fun m!958393 () Bool)

(assert (=> b!1037889 m!958393))

(assert (=> b!1037474 d!125383))

(declare-fun d!125385 () Bool)

(declare-fun e!587091 () Bool)

(assert (=> d!125385 e!587091))

(declare-fun res!692356 () Bool)

(assert (=> d!125385 (=> (not res!692356) (not e!587091))))

(declare-fun lt!457709 () ListLongMap!13763)

(assert (=> d!125385 (= res!692356 (contains!6046 lt!457709 (_1!7875 (tuple2!15729 lt!457510 (zeroValue!6103 lt!457298)))))))

(declare-fun lt!457711 () List!21902)

(assert (=> d!125385 (= lt!457709 (ListLongMap!13764 lt!457711))))

(declare-fun lt!457710 () Unit!33898)

(declare-fun lt!457708 () Unit!33898)

(assert (=> d!125385 (= lt!457710 lt!457708)))

(assert (=> d!125385 (= (getValueByKey!585 lt!457711 (_1!7875 (tuple2!15729 lt!457510 (zeroValue!6103 lt!457298)))) (Some!635 (_2!7875 (tuple2!15729 lt!457510 (zeroValue!6103 lt!457298)))))))

(assert (=> d!125385 (= lt!457708 (lemmaContainsTupThenGetReturnValue!281 lt!457711 (_1!7875 (tuple2!15729 lt!457510 (zeroValue!6103 lt!457298))) (_2!7875 (tuple2!15729 lt!457510 (zeroValue!6103 lt!457298)))))))

(assert (=> d!125385 (= lt!457711 (insertStrictlySorted!374 (toList!6897 lt!457506) (_1!7875 (tuple2!15729 lt!457510 (zeroValue!6103 lt!457298))) (_2!7875 (tuple2!15729 lt!457510 (zeroValue!6103 lt!457298)))))))

(assert (=> d!125385 (= (+!3127 lt!457506 (tuple2!15729 lt!457510 (zeroValue!6103 lt!457298))) lt!457709)))

(declare-fun b!1037890 () Bool)

(declare-fun res!692357 () Bool)

(assert (=> b!1037890 (=> (not res!692357) (not e!587091))))

(assert (=> b!1037890 (= res!692357 (= (getValueByKey!585 (toList!6897 lt!457709) (_1!7875 (tuple2!15729 lt!457510 (zeroValue!6103 lt!457298)))) (Some!635 (_2!7875 (tuple2!15729 lt!457510 (zeroValue!6103 lt!457298))))))))

(declare-fun b!1037891 () Bool)

(assert (=> b!1037891 (= e!587091 (contains!6047 (toList!6897 lt!457709) (tuple2!15729 lt!457510 (zeroValue!6103 lt!457298))))))

(assert (= (and d!125385 res!692356) b!1037890))

(assert (= (and b!1037890 res!692357) b!1037891))

(declare-fun m!958395 () Bool)

(assert (=> d!125385 m!958395))

(declare-fun m!958397 () Bool)

(assert (=> d!125385 m!958397))

(declare-fun m!958399 () Bool)

(assert (=> d!125385 m!958399))

(declare-fun m!958401 () Bool)

(assert (=> d!125385 m!958401))

(declare-fun m!958403 () Bool)

(assert (=> b!1037890 m!958403))

(declare-fun m!958405 () Bool)

(assert (=> b!1037891 m!958405))

(assert (=> b!1037474 d!125385))

(declare-fun d!125387 () Bool)

(assert (=> d!125387 (= (apply!916 lt!457500 lt!457505) (get!16493 (getValueByKey!585 (toList!6897 lt!457500) lt!457505)))))

(declare-fun bs!30377 () Bool)

(assert (= bs!30377 d!125387))

(declare-fun m!958407 () Bool)

(assert (=> bs!30377 m!958407))

(assert (=> bs!30377 m!958407))

(declare-fun m!958409 () Bool)

(assert (=> bs!30377 m!958409))

(assert (=> b!1037474 d!125387))

(declare-fun d!125389 () Bool)

(assert (=> d!125389 (= (apply!916 lt!457518 lt!457508) (get!16493 (getValueByKey!585 (toList!6897 lt!457518) lt!457508)))))

(declare-fun bs!30378 () Bool)

(assert (= bs!30378 d!125389))

(declare-fun m!958411 () Bool)

(assert (=> bs!30378 m!958411))

(assert (=> bs!30378 m!958411))

(declare-fun m!958413 () Bool)

(assert (=> bs!30378 m!958413))

(assert (=> b!1037474 d!125389))

(declare-fun d!125391 () Bool)

(assert (=> d!125391 (= (apply!916 (+!3127 lt!457500 (tuple2!15729 lt!457507 (minValue!6105 lt!457298))) lt!457505) (get!16493 (getValueByKey!585 (toList!6897 (+!3127 lt!457500 (tuple2!15729 lt!457507 (minValue!6105 lt!457298)))) lt!457505)))))

(declare-fun bs!30379 () Bool)

(assert (= bs!30379 d!125391))

(declare-fun m!958415 () Bool)

(assert (=> bs!30379 m!958415))

(assert (=> bs!30379 m!958415))

(declare-fun m!958417 () Bool)

(assert (=> bs!30379 m!958417))

(assert (=> b!1037474 d!125391))

(declare-fun d!125393 () Bool)

(assert (=> d!125393 (= ($colon$colon!604 (removeStrictlySorted!56 (t!31099 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))) #b1000000000000000000000000000000000000000000000000000000000000000) (h!23109 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))) (Cons!21898 (h!23109 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))) (removeStrictlySorted!56 (t!31099 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1037442 d!125393))

(declare-fun b!1037892 () Bool)

(declare-fun e!587094 () List!21902)

(assert (=> b!1037892 (= e!587094 Nil!21899)))

(declare-fun b!1037893 () Bool)

(assert (=> b!1037893 (= e!587094 ($colon$colon!604 (removeStrictlySorted!56 (t!31099 (t!31099 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))) #b1000000000000000000000000000000000000000000000000000000000000000) (h!23109 (t!31099 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))))))

(declare-fun b!1037894 () Bool)

(declare-fun e!587093 () List!21902)

(assert (=> b!1037894 (= e!587093 e!587094)))

(declare-fun c!105342 () Bool)

(assert (=> b!1037894 (= c!105342 (and ((_ is Cons!21898) (t!31099 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))) (not (= (_1!7875 (h!23109 (t!31099 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1037895 () Bool)

(declare-fun e!587092 () Bool)

(declare-fun lt!457712 () List!21902)

(assert (=> b!1037895 (= e!587092 (not (containsKey!566 lt!457712 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!125395 () Bool)

(assert (=> d!125395 e!587092))

(declare-fun res!692358 () Bool)

(assert (=> d!125395 (=> (not res!692358) (not e!587092))))

(assert (=> d!125395 (= res!692358 (isStrictlySorted!707 lt!457712))))

(assert (=> d!125395 (= lt!457712 e!587093)))

(declare-fun c!105343 () Bool)

(assert (=> d!125395 (= c!105343 (and ((_ is Cons!21898) (t!31099 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))) (= (_1!7875 (h!23109 (t!31099 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125395 (isStrictlySorted!707 (t!31099 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))))

(assert (=> d!125395 (= (removeStrictlySorted!56 (t!31099 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457712)))

(declare-fun b!1037896 () Bool)

(assert (=> b!1037896 (= e!587093 (t!31099 (t!31099 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))))))

(assert (= (and d!125395 c!105343) b!1037896))

(assert (= (and d!125395 (not c!105343)) b!1037894))

(assert (= (and b!1037894 c!105342) b!1037893))

(assert (= (and b!1037894 (not c!105342)) b!1037892))

(assert (= (and d!125395 res!692358) b!1037895))

(declare-fun m!958419 () Bool)

(assert (=> b!1037893 m!958419))

(assert (=> b!1037893 m!958419))

(declare-fun m!958421 () Bool)

(assert (=> b!1037893 m!958421))

(declare-fun m!958423 () Bool)

(assert (=> b!1037895 m!958423))

(declare-fun m!958425 () Bool)

(assert (=> d!125395 m!958425))

(declare-fun m!958427 () Bool)

(assert (=> d!125395 m!958427))

(assert (=> b!1037442 d!125395))

(declare-fun b!1037897 () Bool)

(declare-fun e!587098 () Bool)

(assert (=> b!1037897 (= e!587098 (contains!6048 (ite c!105234 (Cons!21901 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000) Nil!21902) Nil!21902) (select (arr!31447 (_keys!11496 lt!457298)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125397 () Bool)

(declare-fun res!692360 () Bool)

(declare-fun e!587097 () Bool)

(assert (=> d!125397 (=> res!692360 e!587097)))

(assert (=> d!125397 (= res!692360 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 lt!457298))))))

(assert (=> d!125397 (= (arrayNoDuplicates!0 (_keys!11496 lt!457298) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105234 (Cons!21901 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000) Nil!21902) Nil!21902)) e!587097)))

(declare-fun b!1037898 () Bool)

(declare-fun e!587095 () Bool)

(declare-fun call!43941 () Bool)

(assert (=> b!1037898 (= e!587095 call!43941)))

(declare-fun b!1037899 () Bool)

(declare-fun e!587096 () Bool)

(assert (=> b!1037899 (= e!587096 e!587095)))

(declare-fun c!105344 () Bool)

(assert (=> b!1037899 (= c!105344 (validKeyInArray!0 (select (arr!31447 (_keys!11496 lt!457298)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1037900 () Bool)

(assert (=> b!1037900 (= e!587097 e!587096)))

(declare-fun res!692359 () Bool)

(assert (=> b!1037900 (=> (not res!692359) (not e!587096))))

(assert (=> b!1037900 (= res!692359 (not e!587098))))

(declare-fun res!692361 () Bool)

(assert (=> b!1037900 (=> (not res!692361) (not e!587098))))

(assert (=> b!1037900 (= res!692361 (validKeyInArray!0 (select (arr!31447 (_keys!11496 lt!457298)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1037901 () Bool)

(assert (=> b!1037901 (= e!587095 call!43941)))

(declare-fun bm!43938 () Bool)

(assert (=> bm!43938 (= call!43941 (arrayNoDuplicates!0 (_keys!11496 lt!457298) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!105344 (Cons!21901 (select (arr!31447 (_keys!11496 lt!457298)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!105234 (Cons!21901 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000) Nil!21902) Nil!21902)) (ite c!105234 (Cons!21901 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000) Nil!21902) Nil!21902))))))

(assert (= (and d!125397 (not res!692360)) b!1037900))

(assert (= (and b!1037900 res!692361) b!1037897))

(assert (= (and b!1037900 res!692359) b!1037899))

(assert (= (and b!1037899 c!105344) b!1037898))

(assert (= (and b!1037899 (not c!105344)) b!1037901))

(assert (= (or b!1037898 b!1037901) bm!43938))

(assert (=> b!1037897 m!958291))

(assert (=> b!1037897 m!958291))

(declare-fun m!958429 () Bool)

(assert (=> b!1037897 m!958429))

(assert (=> b!1037899 m!958291))

(assert (=> b!1037899 m!958291))

(assert (=> b!1037899 m!958293))

(assert (=> b!1037900 m!958291))

(assert (=> b!1037900 m!958291))

(assert (=> b!1037900 m!958293))

(assert (=> bm!43938 m!958291))

(declare-fun m!958431 () Bool)

(assert (=> bm!43938 m!958431))

(assert (=> bm!43914 d!125397))

(declare-fun d!125399 () Bool)

(assert (=> d!125399 (= (get!16493 (getValueByKey!585 (toList!6897 lt!457385) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14927 (getValueByKey!585 (toList!6897 lt!457385) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125103 d!125399))

(assert (=> d!125103 d!125265))

(declare-fun d!125401 () Bool)

(assert (=> d!125401 (= (apply!916 (+!3127 lt!457375 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))) lt!457373) (apply!916 lt!457375 lt!457373))))

(assert (=> d!125401 true))

(declare-fun _$34!1174 () Unit!33898)

(assert (=> d!125401 (= (choose!1707 lt!457375 lt!457380 (zeroValue!6103 thiss!1427) lt!457373) _$34!1174)))

(declare-fun bs!30380 () Bool)

(assert (= bs!30380 d!125401))

(assert (=> bs!30380 m!957405))

(assert (=> bs!30380 m!957405))

(assert (=> bs!30380 m!957415))

(assert (=> bs!30380 m!957401))

(assert (=> d!125047 d!125401))

(assert (=> d!125047 d!125073))

(declare-fun d!125403 () Bool)

(declare-fun e!587099 () Bool)

(assert (=> d!125403 e!587099))

(declare-fun res!692362 () Bool)

(assert (=> d!125403 (=> res!692362 e!587099)))

(declare-fun lt!457716 () Bool)

(assert (=> d!125403 (= res!692362 (not lt!457716))))

(declare-fun lt!457713 () Bool)

(assert (=> d!125403 (= lt!457716 lt!457713)))

(declare-fun lt!457715 () Unit!33898)

(declare-fun e!587100 () Unit!33898)

(assert (=> d!125403 (= lt!457715 e!587100)))

(declare-fun c!105345 () Bool)

(assert (=> d!125403 (= c!105345 lt!457713)))

(assert (=> d!125403 (= lt!457713 (containsKey!566 (toList!6897 lt!457375) lt!457373))))

(assert (=> d!125403 (= (contains!6046 lt!457375 lt!457373) lt!457716)))

(declare-fun b!1037902 () Bool)

(declare-fun lt!457714 () Unit!33898)

(assert (=> b!1037902 (= e!587100 lt!457714)))

(assert (=> b!1037902 (= lt!457714 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457375) lt!457373))))

(assert (=> b!1037902 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457375) lt!457373))))

(declare-fun b!1037903 () Bool)

(declare-fun Unit!33925 () Unit!33898)

(assert (=> b!1037903 (= e!587100 Unit!33925)))

(declare-fun b!1037904 () Bool)

(assert (=> b!1037904 (= e!587099 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457375) lt!457373)))))

(assert (= (and d!125403 c!105345) b!1037902))

(assert (= (and d!125403 (not c!105345)) b!1037903))

(assert (= (and d!125403 (not res!692362)) b!1037904))

(declare-fun m!958433 () Bool)

(assert (=> d!125403 m!958433))

(declare-fun m!958435 () Bool)

(assert (=> b!1037902 m!958435))

(assert (=> b!1037902 m!957535))

(assert (=> b!1037902 m!957535))

(declare-fun m!958437 () Bool)

(assert (=> b!1037902 m!958437))

(assert (=> b!1037904 m!957535))

(assert (=> b!1037904 m!957535))

(assert (=> b!1037904 m!958437))

(assert (=> d!125047 d!125403))

(assert (=> d!125047 d!125059))

(assert (=> d!125047 d!125061))

(declare-fun d!125405 () Bool)

(assert (=> d!125405 (= (isDefined!435 (getValueByKey!585 (toList!6897 lt!457385) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))) (not (isEmpty!934 (getValueByKey!585 (toList!6897 lt!457385) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))))

(declare-fun bs!30381 () Bool)

(assert (= bs!30381 d!125405))

(assert (=> bs!30381 m!957875))

(declare-fun m!958439 () Bool)

(assert (=> bs!30381 m!958439))

(assert (=> b!1037570 d!125405))

(declare-fun b!1037905 () Bool)

(declare-fun e!587101 () Option!636)

(assert (=> b!1037905 (= e!587101 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457385)))))))

(declare-fun d!125407 () Bool)

(declare-fun c!105346 () Bool)

(assert (=> d!125407 (= c!105346 (and ((_ is Cons!21898) (toList!6897 lt!457385)) (= (_1!7875 (h!23109 (toList!6897 lt!457385))) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!125407 (= (getValueByKey!585 (toList!6897 lt!457385) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) e!587101)))

(declare-fun b!1037906 () Bool)

(declare-fun e!587102 () Option!636)

(assert (=> b!1037906 (= e!587101 e!587102)))

(declare-fun c!105347 () Bool)

(assert (=> b!1037906 (= c!105347 (and ((_ is Cons!21898) (toList!6897 lt!457385)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457385))) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))))

(declare-fun b!1037907 () Bool)

(assert (=> b!1037907 (= e!587102 (getValueByKey!585 (t!31099 (toList!6897 lt!457385)) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037908 () Bool)

(assert (=> b!1037908 (= e!587102 None!634)))

(assert (= (and d!125407 c!105346) b!1037905))

(assert (= (and d!125407 (not c!105346)) b!1037906))

(assert (= (and b!1037906 c!105347) b!1037907))

(assert (= (and b!1037906 (not c!105347)) b!1037908))

(assert (=> b!1037907 m!957361))

(declare-fun m!958441 () Bool)

(assert (=> b!1037907 m!958441))

(assert (=> b!1037570 d!125407))

(declare-fun b!1037909 () Bool)

(declare-fun e!587109 () Bool)

(declare-fun lt!457723 () ListLongMap!13763)

(assert (=> b!1037909 (= e!587109 (= lt!457723 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6269 thiss!1427))))))

(declare-fun b!1037910 () Bool)

(assert (=> b!1037910 (= e!587109 (isEmpty!933 lt!457723))))

(declare-fun d!125409 () Bool)

(declare-fun e!587108 () Bool)

(assert (=> d!125409 e!587108))

(declare-fun res!692366 () Bool)

(assert (=> d!125409 (=> (not res!692366) (not e!587108))))

(assert (=> d!125409 (= res!692366 (not (contains!6046 lt!457723 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!587107 () ListLongMap!13763)

(assert (=> d!125409 (= lt!457723 e!587107)))

(declare-fun c!105348 () Bool)

(assert (=> d!125409 (= c!105348 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 thiss!1427))))))

(assert (=> d!125409 (validMask!0 (mask!30230 thiss!1427))))

(assert (=> d!125409 (= (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6269 thiss!1427)) lt!457723)))

(declare-fun b!1037911 () Bool)

(declare-fun e!587104 () Bool)

(assert (=> b!1037911 (= e!587104 e!587109)))

(declare-fun c!105349 () Bool)

(assert (=> b!1037911 (= c!105349 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun b!1037912 () Bool)

(assert (=> b!1037912 (= e!587108 e!587104)))

(declare-fun c!105351 () Bool)

(declare-fun e!587106 () Bool)

(assert (=> b!1037912 (= c!105351 e!587106)))

(declare-fun res!692363 () Bool)

(assert (=> b!1037912 (=> (not res!692363) (not e!587106))))

(assert (=> b!1037912 (= res!692363 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun b!1037913 () Bool)

(declare-fun lt!457722 () Unit!33898)

(declare-fun lt!457718 () Unit!33898)

(assert (=> b!1037913 (= lt!457722 lt!457718)))

(declare-fun lt!457720 () (_ BitVec 64))

(declare-fun lt!457719 () V!37667)

(declare-fun lt!457721 () (_ BitVec 64))

(declare-fun lt!457717 () ListLongMap!13763)

(assert (=> b!1037913 (not (contains!6046 (+!3127 lt!457717 (tuple2!15729 lt!457721 lt!457719)) lt!457720))))

(assert (=> b!1037913 (= lt!457718 (addStillNotContains!245 lt!457717 lt!457721 lt!457719 lt!457720))))

(assert (=> b!1037913 (= lt!457720 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1037913 (= lt!457719 (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1037913 (= lt!457721 (select (arr!31447 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun call!43942 () ListLongMap!13763)

(assert (=> b!1037913 (= lt!457717 call!43942)))

(declare-fun e!587105 () ListLongMap!13763)

(assert (=> b!1037913 (= e!587105 (+!3127 call!43942 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1037914 () Bool)

(declare-fun res!692364 () Bool)

(assert (=> b!1037914 (=> (not res!692364) (not e!587108))))

(assert (=> b!1037914 (= res!692364 (not (contains!6046 lt!457723 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1037915 () Bool)

(assert (=> b!1037915 (= e!587107 (ListLongMap!13764 Nil!21899))))

(declare-fun b!1037916 () Bool)

(declare-fun e!587103 () Bool)

(assert (=> b!1037916 (= e!587104 e!587103)))

(assert (=> b!1037916 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun res!692365 () Bool)

(assert (=> b!1037916 (= res!692365 (contains!6046 lt!457723 (select (arr!31447 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1037916 (=> (not res!692365) (not e!587103))))

(declare-fun bm!43939 () Bool)

(assert (=> bm!43939 (= call!43942 (getCurrentListMapNoExtraKeys!3567 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6269 thiss!1427)))))

(declare-fun b!1037917 () Bool)

(assert (=> b!1037917 (= e!587107 e!587105)))

(declare-fun c!105350 () Bool)

(assert (=> b!1037917 (= c!105350 (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1037918 () Bool)

(assert (=> b!1037918 (= e!587105 call!43942)))

(declare-fun b!1037919 () Bool)

(assert (=> b!1037919 (= e!587106 (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1037919 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1037920 () Bool)

(assert (=> b!1037920 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 thiss!1427))))))

(assert (=> b!1037920 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31977 (_values!6292 thiss!1427))))))

(assert (=> b!1037920 (= e!587103 (= (apply!916 lt!457723 (select (arr!31447 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!125409 c!105348) b!1037915))

(assert (= (and d!125409 (not c!105348)) b!1037917))

(assert (= (and b!1037917 c!105350) b!1037913))

(assert (= (and b!1037917 (not c!105350)) b!1037918))

(assert (= (or b!1037913 b!1037918) bm!43939))

(assert (= (and d!125409 res!692366) b!1037914))

(assert (= (and b!1037914 res!692364) b!1037912))

(assert (= (and b!1037912 res!692363) b!1037919))

(assert (= (and b!1037912 c!105351) b!1037916))

(assert (= (and b!1037912 (not c!105351)) b!1037911))

(assert (= (and b!1037916 res!692365) b!1037920))

(assert (= (and b!1037911 c!105349) b!1037909))

(assert (= (and b!1037911 (not c!105349)) b!1037910))

(declare-fun b_lambda!16153 () Bool)

(assert (=> (not b_lambda!16153) (not b!1037913)))

(assert (=> b!1037913 t!31107))

(declare-fun b_and!33419 () Bool)

(assert (= b_and!33417 (and (=> t!31107 result!14419) b_and!33419)))

(declare-fun b_lambda!16155 () Bool)

(assert (=> (not b_lambda!16155) (not b!1037920)))

(assert (=> b!1037920 t!31107))

(declare-fun b_and!33421 () Bool)

(assert (= b_and!33419 (and (=> t!31107 result!14419) b_and!33421)))

(declare-fun m!958443 () Bool)

(assert (=> b!1037909 m!958443))

(declare-fun m!958445 () Bool)

(assert (=> d!125409 m!958445))

(assert (=> d!125409 m!957367))

(declare-fun m!958447 () Bool)

(assert (=> b!1037913 m!958447))

(declare-fun m!958449 () Bool)

(assert (=> b!1037913 m!958449))

(declare-fun m!958451 () Bool)

(assert (=> b!1037913 m!958451))

(assert (=> b!1037913 m!958061))

(assert (=> b!1037913 m!957373))

(assert (=> b!1037913 m!958063))

(assert (=> b!1037913 m!958061))

(declare-fun m!958453 () Bool)

(assert (=> b!1037913 m!958453))

(assert (=> b!1037913 m!957373))

(assert (=> b!1037913 m!958449))

(assert (=> b!1037913 m!958067))

(assert (=> b!1037916 m!958067))

(assert (=> b!1037916 m!958067))

(declare-fun m!958455 () Bool)

(assert (=> b!1037916 m!958455))

(assert (=> b!1037917 m!958067))

(assert (=> b!1037917 m!958067))

(assert (=> b!1037917 m!958071))

(assert (=> b!1037919 m!958067))

(assert (=> b!1037919 m!958067))

(assert (=> b!1037919 m!958071))

(assert (=> bm!43939 m!958443))

(assert (=> b!1037920 m!958061))

(assert (=> b!1037920 m!957373))

(assert (=> b!1037920 m!958063))

(assert (=> b!1037920 m!958061))

(assert (=> b!1037920 m!958067))

(declare-fun m!958457 () Bool)

(assert (=> b!1037920 m!958457))

(assert (=> b!1037920 m!957373))

(assert (=> b!1037920 m!958067))

(declare-fun m!958459 () Bool)

(assert (=> b!1037910 m!958459))

(declare-fun m!958461 () Bool)

(assert (=> b!1037914 m!958461))

(assert (=> b!1037385 d!125409))

(declare-fun b!1037921 () Bool)

(declare-fun e!587110 () Option!636)

(assert (=> b!1037921 (= e!587110 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457586)))))))

(declare-fun c!105352 () Bool)

(declare-fun d!125411 () Bool)

(assert (=> d!125411 (= c!105352 (and ((_ is Cons!21898) (toList!6897 lt!457586)) (= (_1!7875 (h!23109 (toList!6897 lt!457586))) (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(assert (=> d!125411 (= (getValueByKey!585 (toList!6897 lt!457586) (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))) e!587110)))

(declare-fun b!1037922 () Bool)

(declare-fun e!587111 () Option!636)

(assert (=> b!1037922 (= e!587110 e!587111)))

(declare-fun c!105353 () Bool)

(assert (=> b!1037922 (= c!105353 (and ((_ is Cons!21898) (toList!6897 lt!457586)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457586))) (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))))

(declare-fun b!1037923 () Bool)

(assert (=> b!1037923 (= e!587111 (getValueByKey!585 (t!31099 (toList!6897 lt!457586)) (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun b!1037924 () Bool)

(assert (=> b!1037924 (= e!587111 None!634)))

(assert (= (and d!125411 c!105352) b!1037921))

(assert (= (and d!125411 (not c!105352)) b!1037922))

(assert (= (and b!1037922 c!105353) b!1037923))

(assert (= (and b!1037922 (not c!105353)) b!1037924))

(declare-fun m!958463 () Bool)

(assert (=> b!1037923 m!958463))

(assert (=> b!1037571 d!125411))

(declare-fun b!1037925 () Bool)

(declare-fun e!587112 () Option!636)

(assert (=> b!1037925 (= e!587112 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457557)))))))

(declare-fun d!125413 () Bool)

(declare-fun c!105354 () Bool)

(assert (=> d!125413 (= c!105354 (and ((_ is Cons!21898) (toList!6897 lt!457557)) (= (_1!7875 (h!23109 (toList!6897 lt!457557))) (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))))))

(assert (=> d!125413 (= (getValueByKey!585 (toList!6897 lt!457557) (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))) e!587112)))

(declare-fun b!1037926 () Bool)

(declare-fun e!587113 () Option!636)

(assert (=> b!1037926 (= e!587112 e!587113)))

(declare-fun c!105355 () Bool)

(assert (=> b!1037926 (= c!105355 (and ((_ is Cons!21898) (toList!6897 lt!457557)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457557))) (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))))))

(declare-fun b!1037927 () Bool)

(assert (=> b!1037927 (= e!587113 (getValueByKey!585 (t!31099 (toList!6897 lt!457557)) (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1037928 () Bool)

(assert (=> b!1037928 (= e!587113 None!634)))

(assert (= (and d!125413 c!105354) b!1037925))

(assert (= (and d!125413 (not c!105354)) b!1037926))

(assert (= (and b!1037926 c!105355) b!1037927))

(assert (= (and b!1037926 (not c!105355)) b!1037928))

(declare-fun m!958465 () Bool)

(assert (=> b!1037927 m!958465))

(assert (=> b!1037527 d!125413))

(declare-fun d!125415 () Bool)

(assert (=> d!125415 (= (get!16493 (getValueByKey!585 (toList!6897 (+!3127 lt!457382 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))) lt!457372)) (v!14927 (getValueByKey!585 (toList!6897 (+!3127 lt!457382 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))) lt!457372)))))

(assert (=> d!125053 d!125415))

(declare-fun e!587114 () Option!636)

(declare-fun b!1037929 () Bool)

(assert (=> b!1037929 (= e!587114 (Some!635 (_2!7875 (h!23109 (toList!6897 (+!3127 lt!457382 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))))))))))

(declare-fun d!125417 () Bool)

(declare-fun c!105356 () Bool)

(assert (=> d!125417 (= c!105356 (and ((_ is Cons!21898) (toList!6897 (+!3127 lt!457382 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))))) (= (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457382 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))))) lt!457372)))))

(assert (=> d!125417 (= (getValueByKey!585 (toList!6897 (+!3127 lt!457382 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))) lt!457372) e!587114)))

(declare-fun b!1037930 () Bool)

(declare-fun e!587115 () Option!636)

(assert (=> b!1037930 (= e!587114 e!587115)))

(declare-fun c!105357 () Bool)

(assert (=> b!1037930 (= c!105357 (and ((_ is Cons!21898) (toList!6897 (+!3127 lt!457382 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))))) (not (= (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457382 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))))) lt!457372))))))

(declare-fun b!1037931 () Bool)

(assert (=> b!1037931 (= e!587115 (getValueByKey!585 (t!31099 (toList!6897 (+!3127 lt!457382 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))))) lt!457372))))

(declare-fun b!1037932 () Bool)

(assert (=> b!1037932 (= e!587115 None!634)))

(assert (= (and d!125417 c!105356) b!1037929))

(assert (= (and d!125417 (not c!105356)) b!1037930))

(assert (= (and b!1037930 c!105357) b!1037931))

(assert (= (and b!1037930 (not c!105357)) b!1037932))

(declare-fun m!958467 () Bool)

(assert (=> b!1037931 m!958467))

(assert (=> d!125053 d!125417))

(assert (=> b!1037578 d!125093))

(assert (=> bm!43895 d!125409))

(declare-fun b!1037933 () Bool)

(declare-fun e!587116 () Bool)

(declare-fun e!587117 () Bool)

(assert (=> b!1037933 (= e!587116 e!587117)))

(declare-fun c!105358 () Bool)

(assert (=> b!1037933 (= c!105358 (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1037934 () Bool)

(declare-fun e!587118 () Bool)

(assert (=> b!1037934 (= e!587117 e!587118)))

(declare-fun lt!457724 () (_ BitVec 64))

(assert (=> b!1037934 (= lt!457724 (select (arr!31447 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!457726 () Unit!33898)

(assert (=> b!1037934 (= lt!457726 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11496 thiss!1427) lt!457724 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1037934 (arrayContainsKey!0 (_keys!11496 thiss!1427) lt!457724 #b00000000000000000000000000000000)))

(declare-fun lt!457725 () Unit!33898)

(assert (=> b!1037934 (= lt!457725 lt!457726)))

(declare-fun res!692367 () Bool)

(assert (=> b!1037934 (= res!692367 (= (seekEntryOrOpen!0 (select (arr!31447 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!11496 thiss!1427) (mask!30230 thiss!1427)) (Found!9703 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1037934 (=> (not res!692367) (not e!587118))))

(declare-fun b!1037935 () Bool)

(declare-fun call!43943 () Bool)

(assert (=> b!1037935 (= e!587117 call!43943)))

(declare-fun d!125419 () Bool)

(declare-fun res!692368 () Bool)

(assert (=> d!125419 (=> res!692368 e!587116)))

(assert (=> d!125419 (= res!692368 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 thiss!1427))))))

(assert (=> d!125419 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11496 thiss!1427) (mask!30230 thiss!1427)) e!587116)))

(declare-fun b!1037936 () Bool)

(assert (=> b!1037936 (= e!587118 call!43943)))

(declare-fun bm!43940 () Bool)

(assert (=> bm!43940 (= call!43943 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!11496 thiss!1427) (mask!30230 thiss!1427)))))

(assert (= (and d!125419 (not res!692368)) b!1037933))

(assert (= (and b!1037933 c!105358) b!1037934))

(assert (= (and b!1037933 (not c!105358)) b!1037935))

(assert (= (and b!1037934 res!692367) b!1037936))

(assert (= (or b!1037936 b!1037935) bm!43940))

(assert (=> b!1037933 m!958067))

(assert (=> b!1037933 m!958067))

(assert (=> b!1037933 m!958071))

(assert (=> b!1037934 m!958067))

(declare-fun m!958469 () Bool)

(assert (=> b!1037934 m!958469))

(declare-fun m!958471 () Bool)

(assert (=> b!1037934 m!958471))

(assert (=> b!1037934 m!958067))

(declare-fun m!958473 () Bool)

(assert (=> b!1037934 m!958473))

(declare-fun m!958475 () Bool)

(assert (=> bm!43940 m!958475))

(assert (=> bm!43911 d!125419))

(assert (=> b!1037389 d!125083))

(declare-fun d!125421 () Bool)

(declare-fun e!587119 () Bool)

(assert (=> d!125421 e!587119))

(declare-fun res!692369 () Bool)

(assert (=> d!125421 (=> (not res!692369) (not e!587119))))

(declare-fun lt!457728 () ListLongMap!13763)

(assert (=> d!125421 (= res!692369 (contains!6046 lt!457728 (_1!7875 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!457730 () List!21902)

(assert (=> d!125421 (= lt!457728 (ListLongMap!13764 lt!457730))))

(declare-fun lt!457729 () Unit!33898)

(declare-fun lt!457727 () Unit!33898)

(assert (=> d!125421 (= lt!457729 lt!457727)))

(assert (=> d!125421 (= (getValueByKey!585 lt!457730 (_1!7875 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!635 (_2!7875 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!125421 (= lt!457727 (lemmaContainsTupThenGetReturnValue!281 lt!457730 (_1!7875 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7875 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!125421 (= lt!457730 (insertStrictlySorted!374 (toList!6897 call!43898) (_1!7875 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7875 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!125421 (= (+!3127 call!43898 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!457728)))

(declare-fun b!1037937 () Bool)

(declare-fun res!692370 () Bool)

(assert (=> b!1037937 (=> (not res!692370) (not e!587119))))

(assert (=> b!1037937 (= res!692370 (= (getValueByKey!585 (toList!6897 lt!457728) (_1!7875 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!635 (_2!7875 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1037938 () Bool)

(assert (=> b!1037938 (= e!587119 (contains!6047 (toList!6897 lt!457728) (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!125421 res!692369) b!1037937))

(assert (= (and b!1037937 res!692370) b!1037938))

(declare-fun m!958477 () Bool)

(assert (=> d!125421 m!958477))

(declare-fun m!958479 () Bool)

(assert (=> d!125421 m!958479))

(declare-fun m!958481 () Bool)

(assert (=> d!125421 m!958481))

(declare-fun m!958483 () Bool)

(assert (=> d!125421 m!958483))

(declare-fun m!958485 () Bool)

(assert (=> b!1037937 m!958485))

(declare-fun m!958487 () Bool)

(assert (=> b!1037938 m!958487))

(assert (=> b!1037389 d!125421))

(declare-fun d!125423 () Bool)

(declare-fun e!587120 () Bool)

(assert (=> d!125423 e!587120))

(declare-fun res!692371 () Bool)

(assert (=> d!125423 (=> (not res!692371) (not e!587120))))

(declare-fun lt!457732 () ListLongMap!13763)

(assert (=> d!125423 (= res!692371 (contains!6046 lt!457732 (_1!7875 (tuple2!15729 lt!457442 lt!457440))))))

(declare-fun lt!457734 () List!21902)

(assert (=> d!125423 (= lt!457732 (ListLongMap!13764 lt!457734))))

(declare-fun lt!457733 () Unit!33898)

(declare-fun lt!457731 () Unit!33898)

(assert (=> d!125423 (= lt!457733 lt!457731)))

(assert (=> d!125423 (= (getValueByKey!585 lt!457734 (_1!7875 (tuple2!15729 lt!457442 lt!457440))) (Some!635 (_2!7875 (tuple2!15729 lt!457442 lt!457440))))))

(assert (=> d!125423 (= lt!457731 (lemmaContainsTupThenGetReturnValue!281 lt!457734 (_1!7875 (tuple2!15729 lt!457442 lt!457440)) (_2!7875 (tuple2!15729 lt!457442 lt!457440))))))

(assert (=> d!125423 (= lt!457734 (insertStrictlySorted!374 (toList!6897 lt!457438) (_1!7875 (tuple2!15729 lt!457442 lt!457440)) (_2!7875 (tuple2!15729 lt!457442 lt!457440))))))

(assert (=> d!125423 (= (+!3127 lt!457438 (tuple2!15729 lt!457442 lt!457440)) lt!457732)))

(declare-fun b!1037939 () Bool)

(declare-fun res!692372 () Bool)

(assert (=> b!1037939 (=> (not res!692372) (not e!587120))))

(assert (=> b!1037939 (= res!692372 (= (getValueByKey!585 (toList!6897 lt!457732) (_1!7875 (tuple2!15729 lt!457442 lt!457440))) (Some!635 (_2!7875 (tuple2!15729 lt!457442 lt!457440)))))))

(declare-fun b!1037940 () Bool)

(assert (=> b!1037940 (= e!587120 (contains!6047 (toList!6897 lt!457732) (tuple2!15729 lt!457442 lt!457440)))))

(assert (= (and d!125423 res!692371) b!1037939))

(assert (= (and b!1037939 res!692372) b!1037940))

(declare-fun m!958489 () Bool)

(assert (=> d!125423 m!958489))

(declare-fun m!958491 () Bool)

(assert (=> d!125423 m!958491))

(declare-fun m!958493 () Bool)

(assert (=> d!125423 m!958493))

(declare-fun m!958495 () Bool)

(assert (=> d!125423 m!958495))

(declare-fun m!958497 () Bool)

(assert (=> b!1037939 m!958497))

(declare-fun m!958499 () Bool)

(assert (=> b!1037940 m!958499))

(assert (=> b!1037389 d!125423))

(declare-fun d!125425 () Bool)

(assert (=> d!125425 (not (contains!6046 (+!3127 lt!457438 (tuple2!15729 lt!457442 lt!457440)) lt!457441))))

(declare-fun lt!457737 () Unit!33898)

(declare-fun choose!1711 (ListLongMap!13763 (_ BitVec 64) V!37667 (_ BitVec 64)) Unit!33898)

(assert (=> d!125425 (= lt!457737 (choose!1711 lt!457438 lt!457442 lt!457440 lt!457441))))

(declare-fun e!587123 () Bool)

(assert (=> d!125425 e!587123))

(declare-fun res!692375 () Bool)

(assert (=> d!125425 (=> (not res!692375) (not e!587123))))

(assert (=> d!125425 (= res!692375 (not (contains!6046 lt!457438 lt!457441)))))

(assert (=> d!125425 (= (addStillNotContains!245 lt!457438 lt!457442 lt!457440 lt!457441) lt!457737)))

(declare-fun b!1037944 () Bool)

(assert (=> b!1037944 (= e!587123 (not (= lt!457442 lt!457441)))))

(assert (= (and d!125425 res!692375) b!1037944))

(assert (=> d!125425 m!957497))

(assert (=> d!125425 m!957497))

(assert (=> d!125425 m!957499))

(declare-fun m!958501 () Bool)

(assert (=> d!125425 m!958501))

(declare-fun m!958503 () Bool)

(assert (=> d!125425 m!958503))

(assert (=> b!1037389 d!125425))

(declare-fun d!125427 () Bool)

(declare-fun e!587124 () Bool)

(assert (=> d!125427 e!587124))

(declare-fun res!692376 () Bool)

(assert (=> d!125427 (=> res!692376 e!587124)))

(declare-fun lt!457741 () Bool)

(assert (=> d!125427 (= res!692376 (not lt!457741))))

(declare-fun lt!457738 () Bool)

(assert (=> d!125427 (= lt!457741 lt!457738)))

(declare-fun lt!457740 () Unit!33898)

(declare-fun e!587125 () Unit!33898)

(assert (=> d!125427 (= lt!457740 e!587125)))

(declare-fun c!105359 () Bool)

(assert (=> d!125427 (= c!105359 lt!457738)))

(assert (=> d!125427 (= lt!457738 (containsKey!566 (toList!6897 (+!3127 lt!457438 (tuple2!15729 lt!457442 lt!457440))) lt!457441))))

(assert (=> d!125427 (= (contains!6046 (+!3127 lt!457438 (tuple2!15729 lt!457442 lt!457440)) lt!457441) lt!457741)))

(declare-fun b!1037945 () Bool)

(declare-fun lt!457739 () Unit!33898)

(assert (=> b!1037945 (= e!587125 lt!457739)))

(assert (=> b!1037945 (= lt!457739 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 (+!3127 lt!457438 (tuple2!15729 lt!457442 lt!457440))) lt!457441))))

(assert (=> b!1037945 (isDefined!435 (getValueByKey!585 (toList!6897 (+!3127 lt!457438 (tuple2!15729 lt!457442 lt!457440))) lt!457441))))

(declare-fun b!1037946 () Bool)

(declare-fun Unit!33926 () Unit!33898)

(assert (=> b!1037946 (= e!587125 Unit!33926)))

(declare-fun b!1037947 () Bool)

(assert (=> b!1037947 (= e!587124 (isDefined!435 (getValueByKey!585 (toList!6897 (+!3127 lt!457438 (tuple2!15729 lt!457442 lt!457440))) lt!457441)))))

(assert (= (and d!125427 c!105359) b!1037945))

(assert (= (and d!125427 (not c!105359)) b!1037946))

(assert (= (and d!125427 (not res!692376)) b!1037947))

(declare-fun m!958505 () Bool)

(assert (=> d!125427 m!958505))

(declare-fun m!958507 () Bool)

(assert (=> b!1037945 m!958507))

(declare-fun m!958509 () Bool)

(assert (=> b!1037945 m!958509))

(assert (=> b!1037945 m!958509))

(declare-fun m!958511 () Bool)

(assert (=> b!1037945 m!958511))

(assert (=> b!1037947 m!958509))

(assert (=> b!1037947 m!958509))

(assert (=> b!1037947 m!958511))

(assert (=> b!1037389 d!125427))

(declare-fun d!125429 () Bool)

(declare-fun e!587126 () Bool)

(assert (=> d!125429 e!587126))

(declare-fun res!692377 () Bool)

(assert (=> d!125429 (=> res!692377 e!587126)))

(declare-fun lt!457745 () Bool)

(assert (=> d!125429 (= res!692377 (not lt!457745))))

(declare-fun lt!457742 () Bool)

(assert (=> d!125429 (= lt!457745 lt!457742)))

(declare-fun lt!457744 () Unit!33898)

(declare-fun e!587127 () Unit!33898)

(assert (=> d!125429 (= lt!457744 e!587127)))

(declare-fun c!105360 () Bool)

(assert (=> d!125429 (= c!105360 lt!457742)))

(assert (=> d!125429 (= lt!457742 (containsKey!566 (toList!6897 lt!457538) (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!125429 (= (contains!6046 lt!457538 (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))) lt!457745)))

(declare-fun b!1037948 () Bool)

(declare-fun lt!457743 () Unit!33898)

(assert (=> b!1037948 (= e!587127 lt!457743)))

(assert (=> b!1037948 (= lt!457743 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457538) (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))))))

(assert (=> b!1037948 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457538) (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1037949 () Bool)

(declare-fun Unit!33927 () Unit!33898)

(assert (=> b!1037949 (= e!587127 Unit!33927)))

(declare-fun b!1037950 () Bool)

(assert (=> b!1037950 (= e!587126 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457538) (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))))))))

(assert (= (and d!125429 c!105360) b!1037948))

(assert (= (and d!125429 (not c!105360)) b!1037949))

(assert (= (and d!125429 (not res!692377)) b!1037950))

(declare-fun m!958513 () Bool)

(assert (=> d!125429 m!958513))

(declare-fun m!958515 () Bool)

(assert (=> b!1037948 m!958515))

(assert (=> b!1037948 m!957785))

(assert (=> b!1037948 m!957785))

(declare-fun m!958517 () Bool)

(assert (=> b!1037948 m!958517))

(assert (=> b!1037950 m!957785))

(assert (=> b!1037950 m!957785))

(assert (=> b!1037950 m!958517))

(assert (=> d!125121 d!125429))

(declare-fun b!1037951 () Bool)

(declare-fun e!587128 () Option!636)

(assert (=> b!1037951 (= e!587128 (Some!635 (_2!7875 (h!23109 lt!457540))))))

(declare-fun d!125431 () Bool)

(declare-fun c!105361 () Bool)

(assert (=> d!125431 (= c!105361 (and ((_ is Cons!21898) lt!457540) (= (_1!7875 (h!23109 lt!457540)) (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))))))))

(assert (=> d!125431 (= (getValueByKey!585 lt!457540 (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))) e!587128)))

(declare-fun b!1037952 () Bool)

(declare-fun e!587129 () Option!636)

(assert (=> b!1037952 (= e!587128 e!587129)))

(declare-fun c!105362 () Bool)

(assert (=> b!1037952 (= c!105362 (and ((_ is Cons!21898) lt!457540) (not (= (_1!7875 (h!23109 lt!457540)) (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))))))))

(declare-fun b!1037953 () Bool)

(assert (=> b!1037953 (= e!587129 (getValueByKey!585 (t!31099 lt!457540) (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1037954 () Bool)

(assert (=> b!1037954 (= e!587129 None!634)))

(assert (= (and d!125431 c!105361) b!1037951))

(assert (= (and d!125431 (not c!105361)) b!1037952))

(assert (= (and b!1037952 c!105362) b!1037953))

(assert (= (and b!1037952 (not c!105362)) b!1037954))

(declare-fun m!958519 () Bool)

(assert (=> b!1037953 m!958519))

(assert (=> d!125121 d!125431))

(declare-fun d!125433 () Bool)

(assert (=> d!125433 (= (getValueByKey!585 lt!457540 (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))))))

(declare-fun lt!457746 () Unit!33898)

(assert (=> d!125433 (= lt!457746 (choose!1709 lt!457540 (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))))))

(declare-fun e!587130 () Bool)

(assert (=> d!125433 e!587130))

(declare-fun res!692378 () Bool)

(assert (=> d!125433 (=> (not res!692378) (not e!587130))))

(assert (=> d!125433 (= res!692378 (isStrictlySorted!707 lt!457540))))

(assert (=> d!125433 (= (lemmaContainsTupThenGetReturnValue!281 lt!457540 (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))) lt!457746)))

(declare-fun b!1037955 () Bool)

(declare-fun res!692379 () Bool)

(assert (=> b!1037955 (=> (not res!692379) (not e!587130))))

(assert (=> b!1037955 (= res!692379 (containsKey!566 lt!457540 (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1037956 () Bool)

(assert (=> b!1037956 (= e!587130 (contains!6047 lt!457540 (tuple2!15729 (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))))))))

(assert (= (and d!125433 res!692378) b!1037955))

(assert (= (and b!1037955 res!692379) b!1037956))

(assert (=> d!125433 m!957779))

(declare-fun m!958521 () Bool)

(assert (=> d!125433 m!958521))

(declare-fun m!958523 () Bool)

(assert (=> d!125433 m!958523))

(declare-fun m!958525 () Bool)

(assert (=> b!1037955 m!958525))

(declare-fun m!958527 () Bool)

(assert (=> b!1037956 m!958527))

(assert (=> d!125121 d!125433))

(declare-fun b!1037957 () Bool)

(declare-fun res!692380 () Bool)

(declare-fun e!587135 () Bool)

(assert (=> b!1037957 (=> (not res!692380) (not e!587135))))

(declare-fun lt!457747 () List!21902)

(assert (=> b!1037957 (= res!692380 (containsKey!566 lt!457747 (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))))))

(declare-fun c!105364 () Bool)

(declare-fun b!1037958 () Bool)

(assert (=> b!1037958 (= c!105364 (and ((_ is Cons!21898) (toList!6897 lt!457398)) (bvsgt (_1!7875 (h!23109 (toList!6897 lt!457398))) (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))))))))

(declare-fun e!587131 () List!21902)

(declare-fun e!587133 () List!21902)

(assert (=> b!1037958 (= e!587131 e!587133)))

(declare-fun b!1037959 () Bool)

(declare-fun e!587132 () List!21902)

(assert (=> b!1037959 (= e!587132 (insertStrictlySorted!374 (t!31099 (toList!6897 lt!457398)) (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1037960 () Bool)

(assert (=> b!1037960 (= e!587135 (contains!6047 lt!457747 (tuple2!15729 (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))))))))

(declare-fun bm!43942 () Bool)

(declare-fun call!43945 () List!21902)

(declare-fun call!43944 () List!21902)

(assert (=> bm!43942 (= call!43945 call!43944)))

(declare-fun b!1037961 () Bool)

(assert (=> b!1037961 (= e!587133 call!43945)))

(declare-fun b!1037962 () Bool)

(declare-fun e!587134 () List!21902)

(declare-fun call!43946 () List!21902)

(assert (=> b!1037962 (= e!587134 call!43946)))

(declare-fun bm!43943 () Bool)

(assert (=> bm!43943 (= call!43944 call!43946)))

(declare-fun b!1037963 () Bool)

(assert (=> b!1037963 (= e!587131 call!43944)))

(declare-fun b!1037964 () Bool)

(assert (=> b!1037964 (= e!587133 call!43945)))

(declare-fun c!105365 () Bool)

(declare-fun b!1037965 () Bool)

(assert (=> b!1037965 (= e!587132 (ite c!105365 (t!31099 (toList!6897 lt!457398)) (ite c!105364 (Cons!21898 (h!23109 (toList!6897 lt!457398)) (t!31099 (toList!6897 lt!457398))) Nil!21899)))))

(declare-fun b!1037966 () Bool)

(assert (=> b!1037966 (= e!587134 e!587131)))

(assert (=> b!1037966 (= c!105365 (and ((_ is Cons!21898) (toList!6897 lt!457398)) (= (_1!7875 (h!23109 (toList!6897 lt!457398))) (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))))))))

(declare-fun c!105366 () Bool)

(declare-fun bm!43941 () Bool)

(assert (=> bm!43941 (= call!43946 ($colon$colon!604 e!587132 (ite c!105366 (h!23109 (toList!6897 lt!457398)) (tuple2!15729 (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))))))))

(declare-fun c!105363 () Bool)

(assert (=> bm!43941 (= c!105363 c!105366)))

(declare-fun d!125435 () Bool)

(assert (=> d!125435 e!587135))

(declare-fun res!692381 () Bool)

(assert (=> d!125435 (=> (not res!692381) (not e!587135))))

(assert (=> d!125435 (= res!692381 (isStrictlySorted!707 lt!457747))))

(assert (=> d!125435 (= lt!457747 e!587134)))

(assert (=> d!125435 (= c!105366 (and ((_ is Cons!21898) (toList!6897 lt!457398)) (bvslt (_1!7875 (h!23109 (toList!6897 lt!457398))) (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))))))))

(assert (=> d!125435 (isStrictlySorted!707 (toList!6897 lt!457398))))

(assert (=> d!125435 (= (insertStrictlySorted!374 (toList!6897 lt!457398) (_1!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427)))) lt!457747)))

(assert (= (and d!125435 c!105366) b!1037962))

(assert (= (and d!125435 (not c!105366)) b!1037966))

(assert (= (and b!1037966 c!105365) b!1037963))

(assert (= (and b!1037966 (not c!105365)) b!1037958))

(assert (= (and b!1037958 c!105364) b!1037964))

(assert (= (and b!1037958 (not c!105364)) b!1037961))

(assert (= (or b!1037964 b!1037961) bm!43942))

(assert (= (or b!1037963 bm!43942) bm!43943))

(assert (= (or b!1037962 bm!43943) bm!43941))

(assert (= (and bm!43941 c!105363) b!1037959))

(assert (= (and bm!43941 (not c!105363)) b!1037965))

(assert (= (and d!125435 res!692381) b!1037957))

(assert (= (and b!1037957 res!692380) b!1037960))

(declare-fun m!958529 () Bool)

(assert (=> b!1037959 m!958529))

(declare-fun m!958531 () Bool)

(assert (=> bm!43941 m!958531))

(declare-fun m!958533 () Bool)

(assert (=> b!1037957 m!958533))

(declare-fun m!958535 () Bool)

(assert (=> b!1037960 m!958535))

(declare-fun m!958537 () Bool)

(assert (=> d!125435 m!958537))

(declare-fun m!958539 () Bool)

(assert (=> d!125435 m!958539))

(assert (=> d!125121 d!125435))

(declare-fun d!125437 () Bool)

(declare-fun e!587136 () Bool)

(assert (=> d!125437 e!587136))

(declare-fun res!692382 () Bool)

(assert (=> d!125437 (=> (not res!692382) (not e!587136))))

(declare-fun lt!457749 () ListLongMap!13763)

(assert (=> d!125437 (= res!692382 (contains!6046 lt!457749 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298)))))))

(declare-fun lt!457751 () List!21902)

(assert (=> d!125437 (= lt!457749 (ListLongMap!13764 lt!457751))))

(declare-fun lt!457750 () Unit!33898)

(declare-fun lt!457748 () Unit!33898)

(assert (=> d!125437 (= lt!457750 lt!457748)))

(assert (=> d!125437 (= (getValueByKey!585 lt!457751 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298)))) (Some!635 (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298)))))))

(assert (=> d!125437 (= lt!457748 (lemmaContainsTupThenGetReturnValue!281 lt!457751 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298))) (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298)))))))

(assert (=> d!125437 (= lt!457751 (insertStrictlySorted!374 (toList!6897 call!43900) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298))) (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298)))))))

(assert (=> d!125437 (= (+!3127 call!43900 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298))) lt!457749)))

(declare-fun b!1037967 () Bool)

(declare-fun res!692383 () Bool)

(assert (=> b!1037967 (=> (not res!692383) (not e!587136))))

(assert (=> b!1037967 (= res!692383 (= (getValueByKey!585 (toList!6897 lt!457749) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298)))) (Some!635 (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298))))))))

(declare-fun b!1037968 () Bool)

(assert (=> b!1037968 (= e!587136 (contains!6047 (toList!6897 lt!457749) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298))))))

(assert (= (and d!125437 res!692382) b!1037967))

(assert (= (and b!1037967 res!692383) b!1037968))

(declare-fun m!958541 () Bool)

(assert (=> d!125437 m!958541))

(declare-fun m!958543 () Bool)

(assert (=> d!125437 m!958543))

(declare-fun m!958545 () Bool)

(assert (=> d!125437 m!958545))

(declare-fun m!958547 () Bool)

(assert (=> d!125437 m!958547))

(declare-fun m!958549 () Bool)

(assert (=> b!1037967 m!958549))

(declare-fun m!958551 () Bool)

(assert (=> b!1037968 m!958551))

(assert (=> b!1037481 d!125437))

(declare-fun d!125439 () Bool)

(declare-fun e!587137 () Bool)

(assert (=> d!125439 e!587137))

(declare-fun res!692384 () Bool)

(assert (=> d!125439 (=> res!692384 e!587137)))

(declare-fun lt!457755 () Bool)

(assert (=> d!125439 (= res!692384 (not lt!457755))))

(declare-fun lt!457752 () Bool)

(assert (=> d!125439 (= lt!457755 lt!457752)))

(declare-fun lt!457754 () Unit!33898)

(declare-fun e!587138 () Unit!33898)

(assert (=> d!125439 (= lt!457754 e!587138)))

(declare-fun c!105367 () Bool)

(assert (=> d!125439 (= c!105367 lt!457752)))

(assert (=> d!125439 (= lt!457752 (containsKey!566 (toList!6897 lt!457474) (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!125439 (= (contains!6046 lt!457474 (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))) lt!457755)))

(declare-fun b!1037969 () Bool)

(declare-fun lt!457753 () Unit!33898)

(assert (=> b!1037969 (= e!587138 lt!457753)))

(assert (=> b!1037969 (= lt!457753 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457474) (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))))))

(assert (=> b!1037969 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457474) (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1037970 () Bool)

(declare-fun Unit!33928 () Unit!33898)

(assert (=> b!1037970 (= e!587138 Unit!33928)))

(declare-fun b!1037971 () Bool)

(assert (=> b!1037971 (= e!587137 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457474) (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))))))))

(assert (= (and d!125439 c!105367) b!1037969))

(assert (= (and d!125439 (not c!105367)) b!1037970))

(assert (= (and d!125439 (not res!692384)) b!1037971))

(declare-fun m!958553 () Bool)

(assert (=> d!125439 m!958553))

(declare-fun m!958555 () Bool)

(assert (=> b!1037969 m!958555))

(assert (=> b!1037969 m!957595))

(assert (=> b!1037969 m!957595))

(declare-fun m!958557 () Bool)

(assert (=> b!1037969 m!958557))

(assert (=> b!1037971 m!957595))

(assert (=> b!1037971 m!957595))

(assert (=> b!1037971 m!958557))

(assert (=> d!125073 d!125439))

(declare-fun b!1037972 () Bool)

(declare-fun e!587139 () Option!636)

(assert (=> b!1037972 (= e!587139 (Some!635 (_2!7875 (h!23109 lt!457476))))))

(declare-fun c!105368 () Bool)

(declare-fun d!125441 () Bool)

(assert (=> d!125441 (= c!105368 (and ((_ is Cons!21898) lt!457476) (= (_1!7875 (h!23109 lt!457476)) (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))))))))

(assert (=> d!125441 (= (getValueByKey!585 lt!457476 (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))) e!587139)))

(declare-fun b!1037973 () Bool)

(declare-fun e!587140 () Option!636)

(assert (=> b!1037973 (= e!587139 e!587140)))

(declare-fun c!105369 () Bool)

(assert (=> b!1037973 (= c!105369 (and ((_ is Cons!21898) lt!457476) (not (= (_1!7875 (h!23109 lt!457476)) (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))))))))

(declare-fun b!1037974 () Bool)

(assert (=> b!1037974 (= e!587140 (getValueByKey!585 (t!31099 lt!457476) (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1037975 () Bool)

(assert (=> b!1037975 (= e!587140 None!634)))

(assert (= (and d!125441 c!105368) b!1037972))

(assert (= (and d!125441 (not c!105368)) b!1037973))

(assert (= (and b!1037973 c!105369) b!1037974))

(assert (= (and b!1037973 (not c!105369)) b!1037975))

(declare-fun m!958559 () Bool)

(assert (=> b!1037974 m!958559))

(assert (=> d!125073 d!125441))

(declare-fun d!125443 () Bool)

(assert (=> d!125443 (= (getValueByKey!585 lt!457476 (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))))))

(declare-fun lt!457756 () Unit!33898)

(assert (=> d!125443 (= lt!457756 (choose!1709 lt!457476 (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))))))

(declare-fun e!587141 () Bool)

(assert (=> d!125443 e!587141))

(declare-fun res!692385 () Bool)

(assert (=> d!125443 (=> (not res!692385) (not e!587141))))

(assert (=> d!125443 (= res!692385 (isStrictlySorted!707 lt!457476))))

(assert (=> d!125443 (= (lemmaContainsTupThenGetReturnValue!281 lt!457476 (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))) lt!457756)))

(declare-fun b!1037976 () Bool)

(declare-fun res!692386 () Bool)

(assert (=> b!1037976 (=> (not res!692386) (not e!587141))))

(assert (=> b!1037976 (= res!692386 (containsKey!566 lt!457476 (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1037977 () Bool)

(assert (=> b!1037977 (= e!587141 (contains!6047 lt!457476 (tuple2!15729 (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))))))))

(assert (= (and d!125443 res!692385) b!1037976))

(assert (= (and b!1037976 res!692386) b!1037977))

(assert (=> d!125443 m!957589))

(declare-fun m!958561 () Bool)

(assert (=> d!125443 m!958561))

(declare-fun m!958563 () Bool)

(assert (=> d!125443 m!958563))

(declare-fun m!958565 () Bool)

(assert (=> b!1037976 m!958565))

(declare-fun m!958567 () Bool)

(assert (=> b!1037977 m!958567))

(assert (=> d!125073 d!125443))

(declare-fun b!1037978 () Bool)

(declare-fun res!692387 () Bool)

(declare-fun e!587146 () Bool)

(assert (=> b!1037978 (=> (not res!692387) (not e!587146))))

(declare-fun lt!457757 () List!21902)

(assert (=> b!1037978 (= res!692387 (containsKey!566 lt!457757 (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1037979 () Bool)

(declare-fun c!105371 () Bool)

(assert (=> b!1037979 (= c!105371 (and ((_ is Cons!21898) (toList!6897 lt!457375)) (bvsgt (_1!7875 (h!23109 (toList!6897 lt!457375))) (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))))))))

(declare-fun e!587142 () List!21902)

(declare-fun e!587144 () List!21902)

(assert (=> b!1037979 (= e!587142 e!587144)))

(declare-fun b!1037980 () Bool)

(declare-fun e!587143 () List!21902)

(assert (=> b!1037980 (= e!587143 (insertStrictlySorted!374 (t!31099 (toList!6897 lt!457375)) (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1037981 () Bool)

(assert (=> b!1037981 (= e!587146 (contains!6047 lt!457757 (tuple2!15729 (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))))))))

(declare-fun bm!43945 () Bool)

(declare-fun call!43948 () List!21902)

(declare-fun call!43947 () List!21902)

(assert (=> bm!43945 (= call!43948 call!43947)))

(declare-fun b!1037982 () Bool)

(assert (=> b!1037982 (= e!587144 call!43948)))

(declare-fun b!1037983 () Bool)

(declare-fun e!587145 () List!21902)

(declare-fun call!43949 () List!21902)

(assert (=> b!1037983 (= e!587145 call!43949)))

(declare-fun bm!43946 () Bool)

(assert (=> bm!43946 (= call!43947 call!43949)))

(declare-fun b!1037984 () Bool)

(assert (=> b!1037984 (= e!587142 call!43947)))

(declare-fun b!1037985 () Bool)

(assert (=> b!1037985 (= e!587144 call!43948)))

(declare-fun b!1037986 () Bool)

(declare-fun c!105372 () Bool)

(assert (=> b!1037986 (= e!587143 (ite c!105372 (t!31099 (toList!6897 lt!457375)) (ite c!105371 (Cons!21898 (h!23109 (toList!6897 lt!457375)) (t!31099 (toList!6897 lt!457375))) Nil!21899)))))

(declare-fun b!1037987 () Bool)

(assert (=> b!1037987 (= e!587145 e!587142)))

(assert (=> b!1037987 (= c!105372 (and ((_ is Cons!21898) (toList!6897 lt!457375)) (= (_1!7875 (h!23109 (toList!6897 lt!457375))) (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))))))))

(declare-fun c!105373 () Bool)

(declare-fun bm!43944 () Bool)

(assert (=> bm!43944 (= call!43949 ($colon$colon!604 e!587143 (ite c!105373 (h!23109 (toList!6897 lt!457375)) (tuple2!15729 (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))))))))

(declare-fun c!105370 () Bool)

(assert (=> bm!43944 (= c!105370 c!105373)))

(declare-fun d!125445 () Bool)

(assert (=> d!125445 e!587146))

(declare-fun res!692388 () Bool)

(assert (=> d!125445 (=> (not res!692388) (not e!587146))))

(assert (=> d!125445 (= res!692388 (isStrictlySorted!707 lt!457757))))

(assert (=> d!125445 (= lt!457757 e!587145)))

(assert (=> d!125445 (= c!105373 (and ((_ is Cons!21898) (toList!6897 lt!457375)) (bvslt (_1!7875 (h!23109 (toList!6897 lt!457375))) (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))))))))

(assert (=> d!125445 (isStrictlySorted!707 (toList!6897 lt!457375))))

(assert (=> d!125445 (= (insertStrictlySorted!374 (toList!6897 lt!457375) (_1!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427)))) lt!457757)))

(assert (= (and d!125445 c!105373) b!1037983))

(assert (= (and d!125445 (not c!105373)) b!1037987))

(assert (= (and b!1037987 c!105372) b!1037984))

(assert (= (and b!1037987 (not c!105372)) b!1037979))

(assert (= (and b!1037979 c!105371) b!1037985))

(assert (= (and b!1037979 (not c!105371)) b!1037982))

(assert (= (or b!1037985 b!1037982) bm!43945))

(assert (= (or b!1037984 bm!43945) bm!43946))

(assert (= (or b!1037983 bm!43946) bm!43944))

(assert (= (and bm!43944 c!105370) b!1037980))

(assert (= (and bm!43944 (not c!105370)) b!1037986))

(assert (= (and d!125445 res!692388) b!1037978))

(assert (= (and b!1037978 res!692387) b!1037981))

(declare-fun m!958569 () Bool)

(assert (=> b!1037980 m!958569))

(declare-fun m!958571 () Bool)

(assert (=> bm!43944 m!958571))

(declare-fun m!958573 () Bool)

(assert (=> b!1037978 m!958573))

(declare-fun m!958575 () Bool)

(assert (=> b!1037981 m!958575))

(declare-fun m!958577 () Bool)

(assert (=> d!125445 m!958577))

(declare-fun m!958579 () Bool)

(assert (=> d!125445 m!958579))

(assert (=> d!125073 d!125445))

(declare-fun d!125447 () Bool)

(assert (=> d!125447 (= (get!16493 (getValueByKey!585 (toList!6897 lt!457364) lt!457369)) (v!14927 (getValueByKey!585 (toList!6897 lt!457364) lt!457369)))))

(assert (=> d!125065 d!125447))

(declare-fun b!1037988 () Bool)

(declare-fun e!587147 () Option!636)

(assert (=> b!1037988 (= e!587147 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457364)))))))

(declare-fun d!125449 () Bool)

(declare-fun c!105374 () Bool)

(assert (=> d!125449 (= c!105374 (and ((_ is Cons!21898) (toList!6897 lt!457364)) (= (_1!7875 (h!23109 (toList!6897 lt!457364))) lt!457369)))))

(assert (=> d!125449 (= (getValueByKey!585 (toList!6897 lt!457364) lt!457369) e!587147)))

(declare-fun b!1037989 () Bool)

(declare-fun e!587148 () Option!636)

(assert (=> b!1037989 (= e!587147 e!587148)))

(declare-fun c!105375 () Bool)

(assert (=> b!1037989 (= c!105375 (and ((_ is Cons!21898) (toList!6897 lt!457364)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457364))) lt!457369))))))

(declare-fun b!1037990 () Bool)

(assert (=> b!1037990 (= e!587148 (getValueByKey!585 (t!31099 (toList!6897 lt!457364)) lt!457369))))

(declare-fun b!1037991 () Bool)

(assert (=> b!1037991 (= e!587148 None!634)))

(assert (= (and d!125449 c!105374) b!1037988))

(assert (= (and d!125449 (not c!105374)) b!1037989))

(assert (= (and b!1037989 c!105375) b!1037990))

(assert (= (and b!1037989 (not c!105375)) b!1037991))

(declare-fun m!958581 () Bool)

(assert (=> b!1037990 m!958581))

(assert (=> d!125065 d!125449))

(assert (=> b!1037360 d!125193))

(assert (=> b!1037360 d!125195))

(declare-fun d!125451 () Bool)

(assert (=> d!125451 (= (get!16495 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1037427 d!125451))

(assert (=> b!1037532 d!125093))

(declare-fun lt!457758 () Bool)

(declare-fun d!125453 () Bool)

(assert (=> d!125453 (= lt!457758 (select (content!517 (toList!6897 lt!457474)) (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))))))

(declare-fun e!587150 () Bool)

(assert (=> d!125453 (= lt!457758 e!587150)))

(declare-fun res!692389 () Bool)

(assert (=> d!125453 (=> (not res!692389) (not e!587150))))

(assert (=> d!125453 (= res!692389 ((_ is Cons!21898) (toList!6897 lt!457474)))))

(assert (=> d!125453 (= (contains!6047 (toList!6897 lt!457474) (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))) lt!457758)))

(declare-fun b!1037992 () Bool)

(declare-fun e!587149 () Bool)

(assert (=> b!1037992 (= e!587150 e!587149)))

(declare-fun res!692390 () Bool)

(assert (=> b!1037992 (=> res!692390 e!587149)))

(assert (=> b!1037992 (= res!692390 (= (h!23109 (toList!6897 lt!457474)) (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))))))

(declare-fun b!1037993 () Bool)

(assert (=> b!1037993 (= e!587149 (contains!6047 (t!31099 (toList!6897 lt!457474)) (tuple2!15729 lt!457380 (zeroValue!6103 thiss!1427))))))

(assert (= (and d!125453 res!692389) b!1037992))

(assert (= (and b!1037992 (not res!692390)) b!1037993))

(declare-fun m!958583 () Bool)

(assert (=> d!125453 m!958583))

(declare-fun m!958585 () Bool)

(assert (=> d!125453 m!958585))

(declare-fun m!958587 () Bool)

(assert (=> b!1037993 m!958587))

(assert (=> b!1037415 d!125453))

(declare-fun d!125455 () Bool)

(declare-fun e!587151 () Bool)

(assert (=> d!125455 e!587151))

(declare-fun res!692391 () Bool)

(assert (=> d!125455 (=> res!692391 e!587151)))

(declare-fun lt!457762 () Bool)

(assert (=> d!125455 (= res!692391 (not lt!457762))))

(declare-fun lt!457759 () Bool)

(assert (=> d!125455 (= lt!457762 lt!457759)))

(declare-fun lt!457761 () Unit!33898)

(declare-fun e!587152 () Unit!33898)

(assert (=> d!125455 (= lt!457761 e!587152)))

(declare-fun c!105376 () Bool)

(assert (=> d!125455 (= c!105376 lt!457759)))

(assert (=> d!125455 (= lt!457759 (containsKey!566 (toList!6897 lt!457521) (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)))))

(assert (=> d!125455 (= (contains!6046 lt!457521 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)) lt!457762)))

(declare-fun b!1037994 () Bool)

(declare-fun lt!457760 () Unit!33898)

(assert (=> b!1037994 (= e!587152 lt!457760)))

(assert (=> b!1037994 (= lt!457760 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457521) (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)))))

(assert (=> b!1037994 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457521) (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)))))

(declare-fun b!1037995 () Bool)

(declare-fun Unit!33929 () Unit!33898)

(assert (=> b!1037995 (= e!587152 Unit!33929)))

(declare-fun b!1037996 () Bool)

(assert (=> b!1037996 (= e!587151 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457521) (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000))))))

(assert (= (and d!125455 c!105376) b!1037994))

(assert (= (and d!125455 (not c!105376)) b!1037995))

(assert (= (and d!125455 (not res!692391)) b!1037996))

(assert (=> d!125455 m!957669))

(declare-fun m!958589 () Bool)

(assert (=> d!125455 m!958589))

(assert (=> b!1037994 m!957669))

(declare-fun m!958591 () Bool)

(assert (=> b!1037994 m!958591))

(assert (=> b!1037994 m!957669))

(assert (=> b!1037994 m!958257))

(assert (=> b!1037994 m!958257))

(declare-fun m!958593 () Bool)

(assert (=> b!1037994 m!958593))

(assert (=> b!1037996 m!957669))

(assert (=> b!1037996 m!958257))

(assert (=> b!1037996 m!958257))

(assert (=> b!1037996 m!958593))

(assert (=> b!1037466 d!125455))

(assert (=> b!1037393 d!125093))

(declare-fun d!125457 () Bool)

(declare-fun res!692392 () Bool)

(declare-fun e!587153 () Bool)

(assert (=> d!125457 (=> res!692392 e!587153)))

(assert (=> d!125457 (= res!692392 (and ((_ is Cons!21898) (toList!6897 lt!457319)) (= (_1!7875 (h!23109 (toList!6897 lt!457319))) key!909)))))

(assert (=> d!125457 (= (containsKey!566 (toList!6897 lt!457319) key!909) e!587153)))

(declare-fun b!1037997 () Bool)

(declare-fun e!587154 () Bool)

(assert (=> b!1037997 (= e!587153 e!587154)))

(declare-fun res!692393 () Bool)

(assert (=> b!1037997 (=> (not res!692393) (not e!587154))))

(assert (=> b!1037997 (= res!692393 (and (or (not ((_ is Cons!21898) (toList!6897 lt!457319))) (bvsle (_1!7875 (h!23109 (toList!6897 lt!457319))) key!909)) ((_ is Cons!21898) (toList!6897 lt!457319)) (bvslt (_1!7875 (h!23109 (toList!6897 lt!457319))) key!909)))))

(declare-fun b!1037998 () Bool)

(assert (=> b!1037998 (= e!587154 (containsKey!566 (t!31099 (toList!6897 lt!457319)) key!909))))

(assert (= (and d!125457 (not res!692392)) b!1037997))

(assert (= (and b!1037997 res!692393) b!1037998))

(declare-fun m!958595 () Bool)

(assert (=> b!1037998 m!958595))

(assert (=> d!125169 d!125457))

(declare-fun d!125459 () Bool)

(declare-fun res!692398 () Bool)

(declare-fun e!587159 () Bool)

(assert (=> d!125459 (=> res!692398 e!587159)))

(assert (=> d!125459 (= res!692398 (or ((_ is Nil!21899) lt!457597) ((_ is Nil!21899) (t!31099 lt!457597))))))

(assert (=> d!125459 (= (isStrictlySorted!707 lt!457597) e!587159)))

(declare-fun b!1038003 () Bool)

(declare-fun e!587160 () Bool)

(assert (=> b!1038003 (= e!587159 e!587160)))

(declare-fun res!692399 () Bool)

(assert (=> b!1038003 (=> (not res!692399) (not e!587160))))

(assert (=> b!1038003 (= res!692399 (bvslt (_1!7875 (h!23109 lt!457597)) (_1!7875 (h!23109 (t!31099 lt!457597)))))))

(declare-fun b!1038004 () Bool)

(assert (=> b!1038004 (= e!587160 (isStrictlySorted!707 (t!31099 lt!457597)))))

(assert (= (and d!125459 (not res!692398)) b!1038003))

(assert (= (and b!1038003 res!692399) b!1038004))

(declare-fun m!958597 () Bool)

(assert (=> b!1038004 m!958597))

(assert (=> d!125171 d!125459))

(declare-fun d!125461 () Bool)

(declare-fun res!692400 () Bool)

(declare-fun e!587161 () Bool)

(assert (=> d!125461 (=> res!692400 e!587161)))

(assert (=> d!125461 (= res!692400 (or ((_ is Nil!21899) (toList!6897 (map!14712 thiss!1427))) ((_ is Nil!21899) (t!31099 (toList!6897 (map!14712 thiss!1427))))))))

(assert (=> d!125461 (= (isStrictlySorted!707 (toList!6897 (map!14712 thiss!1427))) e!587161)))

(declare-fun b!1038005 () Bool)

(declare-fun e!587162 () Bool)

(assert (=> b!1038005 (= e!587161 e!587162)))

(declare-fun res!692401 () Bool)

(assert (=> b!1038005 (=> (not res!692401) (not e!587162))))

(assert (=> b!1038005 (= res!692401 (bvslt (_1!7875 (h!23109 (toList!6897 (map!14712 thiss!1427)))) (_1!7875 (h!23109 (t!31099 (toList!6897 (map!14712 thiss!1427)))))))))

(declare-fun b!1038006 () Bool)

(assert (=> b!1038006 (= e!587162 (isStrictlySorted!707 (t!31099 (toList!6897 (map!14712 thiss!1427)))))))

(assert (= (and d!125461 (not res!692400)) b!1038005))

(assert (= (and b!1038005 res!692401) b!1038006))

(declare-fun m!958599 () Bool)

(assert (=> b!1038006 m!958599))

(assert (=> d!125171 d!125461))

(declare-fun lt!457763 () Bool)

(declare-fun d!125463 () Bool)

(assert (=> d!125463 (= lt!457763 (select (content!517 (toList!6897 lt!457538)) (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))))))

(declare-fun e!587164 () Bool)

(assert (=> d!125463 (= lt!457763 e!587164)))

(declare-fun res!692402 () Bool)

(assert (=> d!125463 (=> (not res!692402) (not e!587164))))

(assert (=> d!125463 (= res!692402 ((_ is Cons!21898) (toList!6897 lt!457538)))))

(assert (=> d!125463 (= (contains!6047 (toList!6897 lt!457538) (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))) lt!457763)))

(declare-fun b!1038007 () Bool)

(declare-fun e!587163 () Bool)

(assert (=> b!1038007 (= e!587164 e!587163)))

(declare-fun res!692403 () Bool)

(assert (=> b!1038007 (=> res!692403 e!587163)))

(assert (=> b!1038007 (= res!692403 (= (h!23109 (toList!6897 lt!457538)) (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))))))

(declare-fun b!1038008 () Bool)

(assert (=> b!1038008 (= e!587163 (contains!6047 (t!31099 (toList!6897 lt!457538)) (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))))))

(assert (= (and d!125463 res!692402) b!1038007))

(assert (= (and b!1038007 (not res!692403)) b!1038008))

(declare-fun m!958601 () Bool)

(assert (=> d!125463 m!958601))

(declare-fun m!958603 () Bool)

(assert (=> d!125463 m!958603))

(declare-fun m!958605 () Bool)

(assert (=> b!1038008 m!958605))

(assert (=> b!1037517 d!125463))

(assert (=> b!1037418 d!125239))

(assert (=> b!1037418 d!125241))

(assert (=> b!1037521 d!125187))

(assert (=> b!1037521 d!125189))

(assert (=> b!1037498 d!125317))

(declare-fun d!125465 () Bool)

(declare-fun e!587165 () Bool)

(assert (=> d!125465 e!587165))

(declare-fun res!692404 () Bool)

(assert (=> d!125465 (=> res!692404 e!587165)))

(declare-fun lt!457767 () Bool)

(assert (=> d!125465 (= res!692404 (not lt!457767))))

(declare-fun lt!457764 () Bool)

(assert (=> d!125465 (= lt!457767 lt!457764)))

(declare-fun lt!457766 () Unit!33898)

(declare-fun e!587166 () Unit!33898)

(assert (=> d!125465 (= lt!457766 e!587166)))

(declare-fun c!105377 () Bool)

(assert (=> d!125465 (= c!105377 lt!457764)))

(assert (=> d!125465 (= lt!457764 (containsKey!566 (toList!6897 lt!457586) (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (=> d!125465 (= (contains!6046 lt!457586 (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))) lt!457767)))

(declare-fun b!1038009 () Bool)

(declare-fun lt!457765 () Unit!33898)

(assert (=> b!1038009 (= e!587166 lt!457765)))

(assert (=> b!1038009 (= lt!457765 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457586) (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (=> b!1038009 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457586) (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun b!1038010 () Bool)

(declare-fun Unit!33930 () Unit!33898)

(assert (=> b!1038010 (= e!587166 Unit!33930)))

(declare-fun b!1038011 () Bool)

(assert (=> b!1038011 (= e!587165 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457586) (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(assert (= (and d!125465 c!105377) b!1038009))

(assert (= (and d!125465 (not c!105377)) b!1038010))

(assert (= (and d!125465 (not res!692404)) b!1038011))

(declare-fun m!958607 () Bool)

(assert (=> d!125465 m!958607))

(declare-fun m!958609 () Bool)

(assert (=> b!1038009 m!958609))

(assert (=> b!1038009 m!957923))

(assert (=> b!1038009 m!957923))

(declare-fun m!958611 () Bool)

(assert (=> b!1038009 m!958611))

(assert (=> b!1038011 m!957923))

(assert (=> b!1038011 m!957923))

(assert (=> b!1038011 m!958611))

(assert (=> d!125163 d!125465))

(declare-fun b!1038012 () Bool)

(declare-fun e!587167 () Option!636)

(assert (=> b!1038012 (= e!587167 (Some!635 (_2!7875 (h!23109 lt!457588))))))

(declare-fun c!105378 () Bool)

(declare-fun d!125467 () Bool)

(assert (=> d!125467 (= c!105378 (and ((_ is Cons!21898) lt!457588) (= (_1!7875 (h!23109 lt!457588)) (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(assert (=> d!125467 (= (getValueByKey!585 lt!457588 (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))) e!587167)))

(declare-fun b!1038013 () Bool)

(declare-fun e!587168 () Option!636)

(assert (=> b!1038013 (= e!587167 e!587168)))

(declare-fun c!105379 () Bool)

(assert (=> b!1038013 (= c!105379 (and ((_ is Cons!21898) lt!457588) (not (= (_1!7875 (h!23109 lt!457588)) (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))))

(declare-fun b!1038014 () Bool)

(assert (=> b!1038014 (= e!587168 (getValueByKey!585 (t!31099 lt!457588) (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun b!1038015 () Bool)

(assert (=> b!1038015 (= e!587168 None!634)))

(assert (= (and d!125467 c!105378) b!1038012))

(assert (= (and d!125467 (not c!105378)) b!1038013))

(assert (= (and b!1038013 c!105379) b!1038014))

(assert (= (and b!1038013 (not c!105379)) b!1038015))

(declare-fun m!958613 () Bool)

(assert (=> b!1038014 m!958613))

(assert (=> d!125163 d!125467))

(declare-fun d!125469 () Bool)

(assert (=> d!125469 (= (getValueByKey!585 lt!457588 (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))) (Some!635 (_2!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun lt!457768 () Unit!33898)

(assert (=> d!125469 (= lt!457768 (choose!1709 lt!457588 (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (_2!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun e!587169 () Bool)

(assert (=> d!125469 e!587169))

(declare-fun res!692405 () Bool)

(assert (=> d!125469 (=> (not res!692405) (not e!587169))))

(assert (=> d!125469 (= res!692405 (isStrictlySorted!707 lt!457588))))

(assert (=> d!125469 (= (lemmaContainsTupThenGetReturnValue!281 lt!457588 (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (_2!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))) lt!457768)))

(declare-fun b!1038016 () Bool)

(declare-fun res!692406 () Bool)

(assert (=> b!1038016 (=> (not res!692406) (not e!587169))))

(assert (=> b!1038016 (= res!692406 (containsKey!566 lt!457588 (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun b!1038017 () Bool)

(assert (=> b!1038017 (= e!587169 (contains!6047 lt!457588 (tuple2!15729 (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (_2!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(assert (= (and d!125469 res!692405) b!1038016))

(assert (= (and b!1038016 res!692406) b!1038017))

(assert (=> d!125469 m!957917))

(declare-fun m!958615 () Bool)

(assert (=> d!125469 m!958615))

(declare-fun m!958617 () Bool)

(assert (=> d!125469 m!958617))

(declare-fun m!958619 () Bool)

(assert (=> b!1038016 m!958619))

(declare-fun m!958621 () Bool)

(assert (=> b!1038017 m!958621))

(assert (=> d!125163 d!125469))

(declare-fun b!1038018 () Bool)

(declare-fun res!692407 () Bool)

(declare-fun e!587174 () Bool)

(assert (=> b!1038018 (=> (not res!692407) (not e!587174))))

(declare-fun lt!457769 () List!21902)

(assert (=> b!1038018 (= res!692407 (containsKey!566 lt!457769 (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun b!1038019 () Bool)

(declare-fun c!105381 () Bool)

(assert (=> b!1038019 (= c!105381 (and ((_ is Cons!21898) (toList!6897 (ite c!105170 call!43887 (ite c!105171 call!43885 call!43884)))) (bvsgt (_1!7875 (h!23109 (toList!6897 (ite c!105170 call!43887 (ite c!105171 call!43885 call!43884))))) (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(declare-fun e!587170 () List!21902)

(declare-fun e!587172 () List!21902)

(assert (=> b!1038019 (= e!587170 e!587172)))

(declare-fun b!1038020 () Bool)

(declare-fun e!587171 () List!21902)

(assert (=> b!1038020 (= e!587171 (insertStrictlySorted!374 (t!31099 (toList!6897 (ite c!105170 call!43887 (ite c!105171 call!43885 call!43884)))) (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (_2!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun b!1038021 () Bool)

(assert (=> b!1038021 (= e!587174 (contains!6047 lt!457769 (tuple2!15729 (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (_2!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(declare-fun bm!43948 () Bool)

(declare-fun call!43951 () List!21902)

(declare-fun call!43950 () List!21902)

(assert (=> bm!43948 (= call!43951 call!43950)))

(declare-fun b!1038022 () Bool)

(assert (=> b!1038022 (= e!587172 call!43951)))

(declare-fun b!1038023 () Bool)

(declare-fun e!587173 () List!21902)

(declare-fun call!43952 () List!21902)

(assert (=> b!1038023 (= e!587173 call!43952)))

(declare-fun bm!43949 () Bool)

(assert (=> bm!43949 (= call!43950 call!43952)))

(declare-fun b!1038024 () Bool)

(assert (=> b!1038024 (= e!587170 call!43950)))

(declare-fun b!1038025 () Bool)

(assert (=> b!1038025 (= e!587172 call!43951)))

(declare-fun b!1038026 () Bool)

(declare-fun c!105382 () Bool)

(assert (=> b!1038026 (= e!587171 (ite c!105382 (t!31099 (toList!6897 (ite c!105170 call!43887 (ite c!105171 call!43885 call!43884)))) (ite c!105381 (Cons!21898 (h!23109 (toList!6897 (ite c!105170 call!43887 (ite c!105171 call!43885 call!43884)))) (t!31099 (toList!6897 (ite c!105170 call!43887 (ite c!105171 call!43885 call!43884))))) Nil!21899)))))

(declare-fun b!1038027 () Bool)

(assert (=> b!1038027 (= e!587173 e!587170)))

(assert (=> b!1038027 (= c!105382 (and ((_ is Cons!21898) (toList!6897 (ite c!105170 call!43887 (ite c!105171 call!43885 call!43884)))) (= (_1!7875 (h!23109 (toList!6897 (ite c!105170 call!43887 (ite c!105171 call!43885 call!43884))))) (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(declare-fun c!105383 () Bool)

(declare-fun bm!43947 () Bool)

(assert (=> bm!43947 (= call!43952 ($colon$colon!604 e!587171 (ite c!105383 (h!23109 (toList!6897 (ite c!105170 call!43887 (ite c!105171 call!43885 call!43884)))) (tuple2!15729 (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (_2!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))))

(declare-fun c!105380 () Bool)

(assert (=> bm!43947 (= c!105380 c!105383)))

(declare-fun d!125471 () Bool)

(assert (=> d!125471 e!587174))

(declare-fun res!692408 () Bool)

(assert (=> d!125471 (=> (not res!692408) (not e!587174))))

(assert (=> d!125471 (= res!692408 (isStrictlySorted!707 lt!457769))))

(assert (=> d!125471 (= lt!457769 e!587173)))

(assert (=> d!125471 (= c!105383 (and ((_ is Cons!21898) (toList!6897 (ite c!105170 call!43887 (ite c!105171 call!43885 call!43884)))) (bvslt (_1!7875 (h!23109 (toList!6897 (ite c!105170 call!43887 (ite c!105171 call!43885 call!43884))))) (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(assert (=> d!125471 (isStrictlySorted!707 (toList!6897 (ite c!105170 call!43887 (ite c!105171 call!43885 call!43884))))))

(assert (=> d!125471 (= (insertStrictlySorted!374 (toList!6897 (ite c!105170 call!43887 (ite c!105171 call!43885 call!43884))) (_1!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (_2!7875 (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))) lt!457769)))

(assert (= (and d!125471 c!105383) b!1038023))

(assert (= (and d!125471 (not c!105383)) b!1038027))

(assert (= (and b!1038027 c!105382) b!1038024))

(assert (= (and b!1038027 (not c!105382)) b!1038019))

(assert (= (and b!1038019 c!105381) b!1038025))

(assert (= (and b!1038019 (not c!105381)) b!1038022))

(assert (= (or b!1038025 b!1038022) bm!43948))

(assert (= (or b!1038024 bm!43948) bm!43949))

(assert (= (or b!1038023 bm!43949) bm!43947))

(assert (= (and bm!43947 c!105380) b!1038020))

(assert (= (and bm!43947 (not c!105380)) b!1038026))

(assert (= (and d!125471 res!692408) b!1038018))

(assert (= (and b!1038018 res!692407) b!1038021))

(declare-fun m!958623 () Bool)

(assert (=> b!1038020 m!958623))

(declare-fun m!958625 () Bool)

(assert (=> bm!43947 m!958625))

(declare-fun m!958627 () Bool)

(assert (=> b!1038018 m!958627))

(declare-fun m!958629 () Bool)

(assert (=> b!1038021 m!958629))

(declare-fun m!958631 () Bool)

(assert (=> d!125471 m!958631))

(declare-fun m!958633 () Bool)

(assert (=> d!125471 m!958633))

(assert (=> d!125163 d!125471))

(declare-fun d!125473 () Bool)

(declare-fun e!587175 () Bool)

(assert (=> d!125473 e!587175))

(declare-fun res!692409 () Bool)

(assert (=> d!125473 (=> res!692409 e!587175)))

(declare-fun lt!457773 () Bool)

(assert (=> d!125473 (= res!692409 (not lt!457773))))

(declare-fun lt!457770 () Bool)

(assert (=> d!125473 (= lt!457773 lt!457770)))

(declare-fun lt!457772 () Unit!33898)

(declare-fun e!587176 () Unit!33898)

(assert (=> d!125473 (= lt!457772 e!587176)))

(declare-fun c!105384 () Bool)

(assert (=> d!125473 (= c!105384 lt!457770)))

(assert (=> d!125473 (= lt!457770 (containsKey!566 (toList!6897 lt!457469) (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))))))

(assert (=> d!125473 (= (contains!6046 lt!457469 (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))) lt!457773)))

(declare-fun b!1038028 () Bool)

(declare-fun lt!457771 () Unit!33898)

(assert (=> b!1038028 (= e!587176 lt!457771)))

(assert (=> b!1038028 (= lt!457771 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457469) (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))))))

(assert (=> b!1038028 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457469) (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))))))

(declare-fun b!1038029 () Bool)

(declare-fun Unit!33931 () Unit!33898)

(assert (=> b!1038029 (= e!587176 Unit!33931)))

(declare-fun b!1038030 () Bool)

(assert (=> b!1038030 (= e!587175 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457469) (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))))))))

(assert (= (and d!125473 c!105384) b!1038028))

(assert (= (and d!125473 (not c!105384)) b!1038029))

(assert (= (and d!125473 (not res!692409)) b!1038030))

(declare-fun m!958635 () Bool)

(assert (=> d!125473 m!958635))

(declare-fun m!958637 () Bool)

(assert (=> b!1038028 m!958637))

(assert (=> b!1038028 m!957579))

(assert (=> b!1038028 m!957579))

(declare-fun m!958639 () Bool)

(assert (=> b!1038028 m!958639))

(assert (=> b!1038030 m!957579))

(assert (=> b!1038030 m!957579))

(assert (=> b!1038030 m!958639))

(assert (=> d!125069 d!125473))

(declare-fun b!1038031 () Bool)

(declare-fun e!587177 () Option!636)

(assert (=> b!1038031 (= e!587177 (Some!635 (_2!7875 (h!23109 lt!457471))))))

(declare-fun c!105385 () Bool)

(declare-fun d!125475 () Bool)

(assert (=> d!125475 (= c!105385 (and ((_ is Cons!21898) lt!457471) (= (_1!7875 (h!23109 lt!457471)) (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))))))))

(assert (=> d!125475 (= (getValueByKey!585 lt!457471 (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))) e!587177)))

(declare-fun b!1038032 () Bool)

(declare-fun e!587178 () Option!636)

(assert (=> b!1038032 (= e!587177 e!587178)))

(declare-fun c!105386 () Bool)

(assert (=> b!1038032 (= c!105386 (and ((_ is Cons!21898) lt!457471) (not (= (_1!7875 (h!23109 lt!457471)) (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))))))))

(declare-fun b!1038033 () Bool)

(assert (=> b!1038033 (= e!587178 (getValueByKey!585 (t!31099 lt!457471) (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))))))

(declare-fun b!1038034 () Bool)

(assert (=> b!1038034 (= e!587178 None!634)))

(assert (= (and d!125475 c!105385) b!1038031))

(assert (= (and d!125475 (not c!105385)) b!1038032))

(assert (= (and b!1038032 c!105386) b!1038033))

(assert (= (and b!1038032 (not c!105386)) b!1038034))

(declare-fun m!958641 () Bool)

(assert (=> b!1038033 m!958641))

(assert (=> d!125069 d!125475))

(declare-fun d!125477 () Bool)

(assert (=> d!125477 (= (getValueByKey!585 lt!457471 (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))))))

(declare-fun lt!457774 () Unit!33898)

(assert (=> d!125477 (= lt!457774 (choose!1709 lt!457471 (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))))))

(declare-fun e!587179 () Bool)

(assert (=> d!125477 e!587179))

(declare-fun res!692410 () Bool)

(assert (=> d!125477 (=> (not res!692410) (not e!587179))))

(assert (=> d!125477 (= res!692410 (isStrictlySorted!707 lt!457471))))

(assert (=> d!125477 (= (lemmaContainsTupThenGetReturnValue!281 lt!457471 (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))) lt!457774)))

(declare-fun b!1038035 () Bool)

(declare-fun res!692411 () Bool)

(assert (=> b!1038035 (=> (not res!692411) (not e!587179))))

(assert (=> b!1038035 (= res!692411 (containsKey!566 lt!457471 (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))))))

(declare-fun b!1038036 () Bool)

(assert (=> b!1038036 (= e!587179 (contains!6047 lt!457471 (tuple2!15729 (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))))))))

(assert (= (and d!125477 res!692410) b!1038035))

(assert (= (and b!1038035 res!692411) b!1038036))

(assert (=> d!125477 m!957573))

(declare-fun m!958643 () Bool)

(assert (=> d!125477 m!958643))

(declare-fun m!958645 () Bool)

(assert (=> d!125477 m!958645))

(declare-fun m!958647 () Bool)

(assert (=> b!1038035 m!958647))

(declare-fun m!958649 () Bool)

(assert (=> b!1038036 m!958649))

(assert (=> d!125069 d!125477))

(declare-fun b!1038037 () Bool)

(declare-fun res!692412 () Bool)

(declare-fun e!587184 () Bool)

(assert (=> b!1038037 (=> (not res!692412) (not e!587184))))

(declare-fun lt!457775 () List!21902)

(assert (=> b!1038037 (= res!692412 (containsKey!566 lt!457775 (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))))))

(declare-fun c!105388 () Bool)

(declare-fun b!1038038 () Bool)

(assert (=> b!1038038 (= c!105388 (and ((_ is Cons!21898) (toList!6897 lt!457364)) (bvsgt (_1!7875 (h!23109 (toList!6897 lt!457364))) (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))))))))

(declare-fun e!587180 () List!21902)

(declare-fun e!587182 () List!21902)

(assert (=> b!1038038 (= e!587180 e!587182)))

(declare-fun e!587181 () List!21902)

(declare-fun b!1038039 () Bool)

(assert (=> b!1038039 (= e!587181 (insertStrictlySorted!374 (t!31099 (toList!6897 lt!457364)) (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))))))

(declare-fun b!1038040 () Bool)

(assert (=> b!1038040 (= e!587184 (contains!6047 lt!457775 (tuple2!15729 (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))))))))

(declare-fun bm!43951 () Bool)

(declare-fun call!43954 () List!21902)

(declare-fun call!43953 () List!21902)

(assert (=> bm!43951 (= call!43954 call!43953)))

(declare-fun b!1038041 () Bool)

(assert (=> b!1038041 (= e!587182 call!43954)))

(declare-fun b!1038042 () Bool)

(declare-fun e!587183 () List!21902)

(declare-fun call!43955 () List!21902)

(assert (=> b!1038042 (= e!587183 call!43955)))

(declare-fun bm!43952 () Bool)

(assert (=> bm!43952 (= call!43953 call!43955)))

(declare-fun b!1038043 () Bool)

(assert (=> b!1038043 (= e!587180 call!43953)))

(declare-fun b!1038044 () Bool)

(assert (=> b!1038044 (= e!587182 call!43954)))

(declare-fun c!105389 () Bool)

(declare-fun b!1038045 () Bool)

(assert (=> b!1038045 (= e!587181 (ite c!105389 (t!31099 (toList!6897 lt!457364)) (ite c!105388 (Cons!21898 (h!23109 (toList!6897 lt!457364)) (t!31099 (toList!6897 lt!457364))) Nil!21899)))))

(declare-fun b!1038046 () Bool)

(assert (=> b!1038046 (= e!587183 e!587180)))

(assert (=> b!1038046 (= c!105389 (and ((_ is Cons!21898) (toList!6897 lt!457364)) (= (_1!7875 (h!23109 (toList!6897 lt!457364))) (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))))))))

(declare-fun bm!43950 () Bool)

(declare-fun c!105390 () Bool)

(assert (=> bm!43950 (= call!43955 ($colon$colon!604 e!587181 (ite c!105390 (h!23109 (toList!6897 lt!457364)) (tuple2!15729 (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))))))))

(declare-fun c!105387 () Bool)

(assert (=> bm!43950 (= c!105387 c!105390)))

(declare-fun d!125479 () Bool)

(assert (=> d!125479 e!587184))

(declare-fun res!692413 () Bool)

(assert (=> d!125479 (=> (not res!692413) (not e!587184))))

(assert (=> d!125479 (= res!692413 (isStrictlySorted!707 lt!457775))))

(assert (=> d!125479 (= lt!457775 e!587183)))

(assert (=> d!125479 (= c!105390 (and ((_ is Cons!21898) (toList!6897 lt!457364)) (bvslt (_1!7875 (h!23109 (toList!6897 lt!457364))) (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))))))))

(assert (=> d!125479 (isStrictlySorted!707 (toList!6897 lt!457364))))

(assert (=> d!125479 (= (insertStrictlySorted!374 (toList!6897 lt!457364) (_1!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))) lt!457775)))

(assert (= (and d!125479 c!105390) b!1038042))

(assert (= (and d!125479 (not c!105390)) b!1038046))

(assert (= (and b!1038046 c!105389) b!1038043))

(assert (= (and b!1038046 (not c!105389)) b!1038038))

(assert (= (and b!1038038 c!105388) b!1038044))

(assert (= (and b!1038038 (not c!105388)) b!1038041))

(assert (= (or b!1038044 b!1038041) bm!43951))

(assert (= (or b!1038043 bm!43951) bm!43952))

(assert (= (or b!1038042 bm!43952) bm!43950))

(assert (= (and bm!43950 c!105387) b!1038039))

(assert (= (and bm!43950 (not c!105387)) b!1038045))

(assert (= (and d!125479 res!692413) b!1038037))

(assert (= (and b!1038037 res!692412) b!1038040))

(declare-fun m!958651 () Bool)

(assert (=> b!1038039 m!958651))

(declare-fun m!958653 () Bool)

(assert (=> bm!43950 m!958653))

(declare-fun m!958655 () Bool)

(assert (=> b!1038037 m!958655))

(declare-fun m!958657 () Bool)

(assert (=> b!1038040 m!958657))

(declare-fun m!958659 () Bool)

(assert (=> d!125479 m!958659))

(declare-fun m!958661 () Bool)

(assert (=> d!125479 m!958661))

(assert (=> d!125069 d!125479))

(declare-fun d!125481 () Bool)

(declare-fun lt!457776 () Bool)

(assert (=> d!125481 (= lt!457776 (select (content!517 (toList!6897 lt!457578)) (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))

(declare-fun e!587186 () Bool)

(assert (=> d!125481 (= lt!457776 e!587186)))

(declare-fun res!692414 () Bool)

(assert (=> d!125481 (=> (not res!692414) (not e!587186))))

(assert (=> d!125481 (= res!692414 ((_ is Cons!21898) (toList!6897 lt!457578)))))

(assert (=> d!125481 (= (contains!6047 (toList!6897 lt!457578) (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))) lt!457776)))

(declare-fun b!1038047 () Bool)

(declare-fun e!587185 () Bool)

(assert (=> b!1038047 (= e!587186 e!587185)))

(declare-fun res!692415 () Bool)

(assert (=> b!1038047 (=> res!692415 e!587185)))

(assert (=> b!1038047 (= res!692415 (= (h!23109 (toList!6897 lt!457578)) (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))

(declare-fun b!1038048 () Bool)

(assert (=> b!1038048 (= e!587185 (contains!6047 (t!31099 (toList!6897 lt!457578)) (ite (or c!105176 c!105177) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))

(assert (= (and d!125481 res!692414) b!1038047))

(assert (= (and b!1038047 (not res!692415)) b!1038048))

(declare-fun m!958663 () Bool)

(assert (=> d!125481 m!958663))

(declare-fun m!958665 () Bool)

(assert (=> d!125481 m!958665))

(declare-fun m!958667 () Bool)

(assert (=> b!1038048 m!958667))

(assert (=> b!1037567 d!125481))

(declare-fun lt!457777 () Bool)

(declare-fun d!125483 () Bool)

(assert (=> d!125483 (= lt!457777 (select (content!517 (toList!6897 lt!457553)) (tuple2!15729 lt!457394 lt!457297)))))

(declare-fun e!587188 () Bool)

(assert (=> d!125483 (= lt!457777 e!587188)))

(declare-fun res!692416 () Bool)

(assert (=> d!125483 (=> (not res!692416) (not e!587188))))

(assert (=> d!125483 (= res!692416 ((_ is Cons!21898) (toList!6897 lt!457553)))))

(assert (=> d!125483 (= (contains!6047 (toList!6897 lt!457553) (tuple2!15729 lt!457394 lt!457297)) lt!457777)))

(declare-fun b!1038049 () Bool)

(declare-fun e!587187 () Bool)

(assert (=> b!1038049 (= e!587188 e!587187)))

(declare-fun res!692417 () Bool)

(assert (=> b!1038049 (=> res!692417 e!587187)))

(assert (=> b!1038049 (= res!692417 (= (h!23109 (toList!6897 lt!457553)) (tuple2!15729 lt!457394 lt!457297)))))

(declare-fun b!1038050 () Bool)

(assert (=> b!1038050 (= e!587187 (contains!6047 (t!31099 (toList!6897 lt!457553)) (tuple2!15729 lt!457394 lt!457297)))))

(assert (= (and d!125483 res!692416) b!1038049))

(assert (= (and b!1038049 (not res!692417)) b!1038050))

(declare-fun m!958669 () Bool)

(assert (=> d!125483 m!958669))

(declare-fun m!958671 () Bool)

(assert (=> d!125483 m!958671))

(declare-fun m!958673 () Bool)

(assert (=> b!1038050 m!958673))

(assert (=> b!1037526 d!125483))

(declare-fun d!125485 () Bool)

(declare-fun e!587189 () Bool)

(assert (=> d!125485 e!587189))

(declare-fun res!692418 () Bool)

(assert (=> d!125485 (=> res!692418 e!587189)))

(declare-fun lt!457781 () Bool)

(assert (=> d!125485 (= res!692418 (not lt!457781))))

(declare-fun lt!457778 () Bool)

(assert (=> d!125485 (= lt!457781 lt!457778)))

(declare-fun lt!457780 () Unit!33898)

(declare-fun e!587190 () Unit!33898)

(assert (=> d!125485 (= lt!457780 e!587190)))

(declare-fun c!105391 () Bool)

(assert (=> d!125485 (= c!105391 lt!457778)))

(assert (=> d!125485 (= lt!457778 (containsKey!566 (toList!6897 lt!457557) (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!125485 (= (contains!6046 lt!457557 (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))) lt!457781)))

(declare-fun b!1038051 () Bool)

(declare-fun lt!457779 () Unit!33898)

(assert (=> b!1038051 (= e!587190 lt!457779)))

(assert (=> b!1038051 (= lt!457779 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457557) (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))))

(assert (=> b!1038051 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457557) (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1038052 () Bool)

(declare-fun Unit!33932 () Unit!33898)

(assert (=> b!1038052 (= e!587190 Unit!33932)))

(declare-fun b!1038053 () Bool)

(assert (=> b!1038053 (= e!587189 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457557) (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))))))

(assert (= (and d!125485 c!105391) b!1038051))

(assert (= (and d!125485 (not c!105391)) b!1038052))

(assert (= (and d!125485 (not res!692418)) b!1038053))

(declare-fun m!958675 () Bool)

(assert (=> d!125485 m!958675))

(declare-fun m!958677 () Bool)

(assert (=> b!1038051 m!958677))

(assert (=> b!1038051 m!957853))

(assert (=> b!1038051 m!957853))

(declare-fun m!958679 () Bool)

(assert (=> b!1038051 m!958679))

(assert (=> b!1038053 m!957853))

(assert (=> b!1038053 m!957853))

(assert (=> b!1038053 m!958679))

(assert (=> d!125141 d!125485))

(declare-fun b!1038054 () Bool)

(declare-fun e!587191 () Option!636)

(assert (=> b!1038054 (= e!587191 (Some!635 (_2!7875 (h!23109 lt!457559))))))

(declare-fun d!125487 () Bool)

(declare-fun c!105392 () Bool)

(assert (=> d!125487 (= c!105392 (and ((_ is Cons!21898) lt!457559) (= (_1!7875 (h!23109 lt!457559)) (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))))))

(assert (=> d!125487 (= (getValueByKey!585 lt!457559 (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))) e!587191)))

(declare-fun b!1038055 () Bool)

(declare-fun e!587192 () Option!636)

(assert (=> b!1038055 (= e!587191 e!587192)))

(declare-fun c!105393 () Bool)

(assert (=> b!1038055 (= c!105393 (and ((_ is Cons!21898) lt!457559) (not (= (_1!7875 (h!23109 lt!457559)) (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))))))

(declare-fun b!1038056 () Bool)

(assert (=> b!1038056 (= e!587192 (getValueByKey!585 (t!31099 lt!457559) (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1038057 () Bool)

(assert (=> b!1038057 (= e!587192 None!634)))

(assert (= (and d!125487 c!105392) b!1038054))

(assert (= (and d!125487 (not c!105392)) b!1038055))

(assert (= (and b!1038055 c!105393) b!1038056))

(assert (= (and b!1038055 (not c!105393)) b!1038057))

(declare-fun m!958681 () Bool)

(assert (=> b!1038056 m!958681))

(assert (=> d!125141 d!125487))

(declare-fun d!125489 () Bool)

(assert (=> d!125489 (= (getValueByKey!585 lt!457559 (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))))

(declare-fun lt!457782 () Unit!33898)

(assert (=> d!125489 (= lt!457782 (choose!1709 lt!457559 (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))))

(declare-fun e!587193 () Bool)

(assert (=> d!125489 e!587193))

(declare-fun res!692419 () Bool)

(assert (=> d!125489 (=> (not res!692419) (not e!587193))))

(assert (=> d!125489 (= res!692419 (isStrictlySorted!707 lt!457559))))

(assert (=> d!125489 (= (lemmaContainsTupThenGetReturnValue!281 lt!457559 (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))) lt!457782)))

(declare-fun b!1038058 () Bool)

(declare-fun res!692420 () Bool)

(assert (=> b!1038058 (=> (not res!692420) (not e!587193))))

(assert (=> b!1038058 (= res!692420 (containsKey!566 lt!457559 (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1038059 () Bool)

(assert (=> b!1038059 (= e!587193 (contains!6047 lt!457559 (tuple2!15729 (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))))))

(assert (= (and d!125489 res!692419) b!1038058))

(assert (= (and b!1038058 res!692420) b!1038059))

(assert (=> d!125489 m!957847))

(declare-fun m!958683 () Bool)

(assert (=> d!125489 m!958683))

(declare-fun m!958685 () Bool)

(assert (=> d!125489 m!958685))

(declare-fun m!958687 () Bool)

(assert (=> b!1038058 m!958687))

(declare-fun m!958689 () Bool)

(assert (=> b!1038059 m!958689))

(assert (=> d!125141 d!125489))

(declare-fun b!1038060 () Bool)

(declare-fun res!692421 () Bool)

(declare-fun e!587198 () Bool)

(assert (=> b!1038060 (=> (not res!692421) (not e!587198))))

(declare-fun lt!457783 () List!21902)

(assert (=> b!1038060 (= res!692421 (containsKey!566 lt!457783 (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1038061 () Bool)

(declare-fun c!105395 () Bool)

(assert (=> b!1038061 (= c!105395 (and ((_ is Cons!21898) (toList!6897 lt!457393)) (bvsgt (_1!7875 (h!23109 (toList!6897 lt!457393))) (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))))))

(declare-fun e!587194 () List!21902)

(declare-fun e!587196 () List!21902)

(assert (=> b!1038061 (= e!587194 e!587196)))

(declare-fun e!587195 () List!21902)

(declare-fun b!1038062 () Bool)

(assert (=> b!1038062 (= e!587195 (insertStrictlySorted!374 (t!31099 (toList!6897 lt!457393)) (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1038063 () Bool)

(assert (=> b!1038063 (= e!587198 (contains!6047 lt!457783 (tuple2!15729 (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))))))

(declare-fun bm!43954 () Bool)

(declare-fun call!43957 () List!21902)

(declare-fun call!43956 () List!21902)

(assert (=> bm!43954 (= call!43957 call!43956)))

(declare-fun b!1038064 () Bool)

(assert (=> b!1038064 (= e!587196 call!43957)))

(declare-fun b!1038065 () Bool)

(declare-fun e!587197 () List!21902)

(declare-fun call!43958 () List!21902)

(assert (=> b!1038065 (= e!587197 call!43958)))

(declare-fun bm!43955 () Bool)

(assert (=> bm!43955 (= call!43956 call!43958)))

(declare-fun b!1038066 () Bool)

(assert (=> b!1038066 (= e!587194 call!43956)))

(declare-fun b!1038067 () Bool)

(assert (=> b!1038067 (= e!587196 call!43957)))

(declare-fun b!1038068 () Bool)

(declare-fun c!105396 () Bool)

(assert (=> b!1038068 (= e!587195 (ite c!105396 (t!31099 (toList!6897 lt!457393)) (ite c!105395 (Cons!21898 (h!23109 (toList!6897 lt!457393)) (t!31099 (toList!6897 lt!457393))) Nil!21899)))))

(declare-fun b!1038069 () Bool)

(assert (=> b!1038069 (= e!587197 e!587194)))

(assert (=> b!1038069 (= c!105396 (and ((_ is Cons!21898) (toList!6897 lt!457393)) (= (_1!7875 (h!23109 (toList!6897 lt!457393))) (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))))))

(declare-fun bm!43953 () Bool)

(declare-fun c!105397 () Bool)

(assert (=> bm!43953 (= call!43958 ($colon$colon!604 e!587195 (ite c!105397 (h!23109 (toList!6897 lt!457393)) (tuple2!15729 (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))))))

(declare-fun c!105394 () Bool)

(assert (=> bm!43953 (= c!105394 c!105397)))

(declare-fun d!125491 () Bool)

(assert (=> d!125491 e!587198))

(declare-fun res!692422 () Bool)

(assert (=> d!125491 (=> (not res!692422) (not e!587198))))

(assert (=> d!125491 (= res!692422 (isStrictlySorted!707 lt!457783))))

(assert (=> d!125491 (= lt!457783 e!587197)))

(assert (=> d!125491 (= c!105397 (and ((_ is Cons!21898) (toList!6897 lt!457393)) (bvslt (_1!7875 (h!23109 (toList!6897 lt!457393))) (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))))))

(assert (=> d!125491 (isStrictlySorted!707 (toList!6897 lt!457393))))

(assert (=> d!125491 (= (insertStrictlySorted!374 (toList!6897 lt!457393) (_1!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))) lt!457783)))

(assert (= (and d!125491 c!105397) b!1038065))

(assert (= (and d!125491 (not c!105397)) b!1038069))

(assert (= (and b!1038069 c!105396) b!1038066))

(assert (= (and b!1038069 (not c!105396)) b!1038061))

(assert (= (and b!1038061 c!105395) b!1038067))

(assert (= (and b!1038061 (not c!105395)) b!1038064))

(assert (= (or b!1038067 b!1038064) bm!43954))

(assert (= (or b!1038066 bm!43954) bm!43955))

(assert (= (or b!1038065 bm!43955) bm!43953))

(assert (= (and bm!43953 c!105394) b!1038062))

(assert (= (and bm!43953 (not c!105394)) b!1038068))

(assert (= (and d!125491 res!692422) b!1038060))

(assert (= (and b!1038060 res!692421) b!1038063))

(declare-fun m!958691 () Bool)

(assert (=> b!1038062 m!958691))

(declare-fun m!958693 () Bool)

(assert (=> bm!43953 m!958693))

(declare-fun m!958695 () Bool)

(assert (=> b!1038060 m!958695))

(declare-fun m!958697 () Bool)

(assert (=> b!1038063 m!958697))

(declare-fun m!958699 () Bool)

(assert (=> d!125491 m!958699))

(declare-fun m!958701 () Bool)

(assert (=> d!125491 m!958701))

(assert (=> d!125141 d!125491))

(assert (=> b!1037541 d!125235))

(assert (=> b!1037421 d!125263))

(assert (=> b!1037421 d!125265))

(declare-fun d!125493 () Bool)

(assert (=> d!125493 (= ($colon$colon!604 (removeStrictlySorted!56 (t!31099 (toList!6897 (map!14712 thiss!1427))) key!909) (h!23109 (toList!6897 (map!14712 thiss!1427)))) (Cons!21898 (h!23109 (toList!6897 (map!14712 thiss!1427))) (removeStrictlySorted!56 (t!31099 (toList!6897 (map!14712 thiss!1427))) key!909)))))

(assert (=> b!1037585 d!125493))

(declare-fun b!1038070 () Bool)

(declare-fun e!587201 () List!21902)

(assert (=> b!1038070 (= e!587201 Nil!21899)))

(declare-fun b!1038071 () Bool)

(assert (=> b!1038071 (= e!587201 ($colon$colon!604 (removeStrictlySorted!56 (t!31099 (t!31099 (toList!6897 (map!14712 thiss!1427)))) key!909) (h!23109 (t!31099 (toList!6897 (map!14712 thiss!1427))))))))

(declare-fun b!1038072 () Bool)

(declare-fun e!587200 () List!21902)

(assert (=> b!1038072 (= e!587200 e!587201)))

(declare-fun c!105398 () Bool)

(assert (=> b!1038072 (= c!105398 (and ((_ is Cons!21898) (t!31099 (toList!6897 (map!14712 thiss!1427)))) (not (= (_1!7875 (h!23109 (t!31099 (toList!6897 (map!14712 thiss!1427))))) key!909))))))

(declare-fun b!1038073 () Bool)

(declare-fun e!587199 () Bool)

(declare-fun lt!457784 () List!21902)

(assert (=> b!1038073 (= e!587199 (not (containsKey!566 lt!457784 key!909)))))

(declare-fun d!125495 () Bool)

(assert (=> d!125495 e!587199))

(declare-fun res!692423 () Bool)

(assert (=> d!125495 (=> (not res!692423) (not e!587199))))

(assert (=> d!125495 (= res!692423 (isStrictlySorted!707 lt!457784))))

(assert (=> d!125495 (= lt!457784 e!587200)))

(declare-fun c!105399 () Bool)

(assert (=> d!125495 (= c!105399 (and ((_ is Cons!21898) (t!31099 (toList!6897 (map!14712 thiss!1427)))) (= (_1!7875 (h!23109 (t!31099 (toList!6897 (map!14712 thiss!1427))))) key!909)))))

(assert (=> d!125495 (isStrictlySorted!707 (t!31099 (toList!6897 (map!14712 thiss!1427))))))

(assert (=> d!125495 (= (removeStrictlySorted!56 (t!31099 (toList!6897 (map!14712 thiss!1427))) key!909) lt!457784)))

(declare-fun b!1038074 () Bool)

(assert (=> b!1038074 (= e!587200 (t!31099 (t!31099 (toList!6897 (map!14712 thiss!1427)))))))

(assert (= (and d!125495 c!105399) b!1038074))

(assert (= (and d!125495 (not c!105399)) b!1038072))

(assert (= (and b!1038072 c!105398) b!1038071))

(assert (= (and b!1038072 (not c!105398)) b!1038070))

(assert (= (and d!125495 res!692423) b!1038073))

(declare-fun m!958703 () Bool)

(assert (=> b!1038071 m!958703))

(assert (=> b!1038071 m!958703))

(declare-fun m!958705 () Bool)

(assert (=> b!1038071 m!958705))

(declare-fun m!958707 () Bool)

(assert (=> b!1038073 m!958707))

(declare-fun m!958709 () Bool)

(assert (=> d!125495 m!958709))

(assert (=> d!125495 m!958599))

(assert (=> b!1037585 d!125495))

(declare-fun d!125497 () Bool)

(assert (=> d!125497 (arrayContainsKey!0 (_keys!11496 thiss!1427) lt!457570 #b00000000000000000000000000000000)))

(declare-fun lt!457787 () Unit!33898)

(declare-fun choose!13 (array!65337 (_ BitVec 64) (_ BitVec 32)) Unit!33898)

(assert (=> d!125497 (= lt!457787 (choose!13 (_keys!11496 thiss!1427) lt!457570 #b00000000000000000000000000000000))))

(assert (=> d!125497 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!125497 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11496 thiss!1427) lt!457570 #b00000000000000000000000000000000) lt!457787)))

(declare-fun bs!30382 () Bool)

(assert (= bs!30382 d!125497))

(assert (=> bs!30382 m!957869))

(declare-fun m!958711 () Bool)

(assert (=> bs!30382 m!958711))

(assert (=> b!1037546 d!125497))

(declare-fun d!125499 () Bool)

(declare-fun res!692428 () Bool)

(declare-fun e!587206 () Bool)

(assert (=> d!125499 (=> res!692428 e!587206)))

(assert (=> d!125499 (= res!692428 (= (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) lt!457570))))

(assert (=> d!125499 (= (arrayContainsKey!0 (_keys!11496 thiss!1427) lt!457570 #b00000000000000000000000000000000) e!587206)))

(declare-fun b!1038079 () Bool)

(declare-fun e!587207 () Bool)

(assert (=> b!1038079 (= e!587206 e!587207)))

(declare-fun res!692429 () Bool)

(assert (=> b!1038079 (=> (not res!692429) (not e!587207))))

(assert (=> b!1038079 (= res!692429 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun b!1038080 () Bool)

(assert (=> b!1038080 (= e!587207 (arrayContainsKey!0 (_keys!11496 thiss!1427) lt!457570 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125499 (not res!692428)) b!1038079))

(assert (= (and b!1038079 res!692429) b!1038080))

(assert (=> d!125499 m!957361))

(declare-fun m!958713 () Bool)

(assert (=> b!1038080 m!958713))

(assert (=> b!1037546 d!125499))

(declare-fun b!1038093 () Bool)

(declare-fun e!587215 () SeekEntryResult!9703)

(declare-fun lt!457794 () SeekEntryResult!9703)

(assert (=> b!1038093 (= e!587215 (MissingZero!9703 (index!41185 lt!457794)))))

(declare-fun b!1038094 () Bool)

(declare-fun e!587214 () SeekEntryResult!9703)

(assert (=> b!1038094 (= e!587214 Undefined!9703)))

(declare-fun d!125501 () Bool)

(declare-fun lt!457796 () SeekEntryResult!9703)

(assert (=> d!125501 (and (or ((_ is Undefined!9703) lt!457796) (not ((_ is Found!9703) lt!457796)) (and (bvsge (index!41184 lt!457796) #b00000000000000000000000000000000) (bvslt (index!41184 lt!457796) (size!31976 (_keys!11496 thiss!1427))))) (or ((_ is Undefined!9703) lt!457796) ((_ is Found!9703) lt!457796) (not ((_ is MissingZero!9703) lt!457796)) (and (bvsge (index!41183 lt!457796) #b00000000000000000000000000000000) (bvslt (index!41183 lt!457796) (size!31976 (_keys!11496 thiss!1427))))) (or ((_ is Undefined!9703) lt!457796) ((_ is Found!9703) lt!457796) ((_ is MissingZero!9703) lt!457796) (not ((_ is MissingVacant!9703) lt!457796)) (and (bvsge (index!41186 lt!457796) #b00000000000000000000000000000000) (bvslt (index!41186 lt!457796) (size!31976 (_keys!11496 thiss!1427))))) (or ((_ is Undefined!9703) lt!457796) (ite ((_ is Found!9703) lt!457796) (= (select (arr!31447 (_keys!11496 thiss!1427)) (index!41184 lt!457796)) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9703) lt!457796) (= (select (arr!31447 (_keys!11496 thiss!1427)) (index!41183 lt!457796)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9703) lt!457796) (= (select (arr!31447 (_keys!11496 thiss!1427)) (index!41186 lt!457796)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!125501 (= lt!457796 e!587214)))

(declare-fun c!105407 () Bool)

(assert (=> d!125501 (= c!105407 (and ((_ is Intermediate!9703) lt!457794) (undefined!10515 lt!457794)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65337 (_ BitVec 32)) SeekEntryResult!9703)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125501 (= lt!457794 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (mask!30230 thiss!1427)) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (_keys!11496 thiss!1427) (mask!30230 thiss!1427)))))

(assert (=> d!125501 (validMask!0 (mask!30230 thiss!1427))))

(assert (=> d!125501 (= (seekEntryOrOpen!0 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (_keys!11496 thiss!1427) (mask!30230 thiss!1427)) lt!457796)))

(declare-fun b!1038095 () Bool)

(declare-fun c!105408 () Bool)

(declare-fun lt!457795 () (_ BitVec 64))

(assert (=> b!1038095 (= c!105408 (= lt!457795 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587216 () SeekEntryResult!9703)

(assert (=> b!1038095 (= e!587216 e!587215)))

(declare-fun b!1038096 () Bool)

(assert (=> b!1038096 (= e!587214 e!587216)))

(assert (=> b!1038096 (= lt!457795 (select (arr!31447 (_keys!11496 thiss!1427)) (index!41185 lt!457794)))))

(declare-fun c!105406 () Bool)

(assert (=> b!1038096 (= c!105406 (= lt!457795 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1038097 () Bool)

(assert (=> b!1038097 (= e!587216 (Found!9703 (index!41185 lt!457794)))))

(declare-fun b!1038098 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65337 (_ BitVec 32)) SeekEntryResult!9703)

(assert (=> b!1038098 (= e!587215 (seekKeyOrZeroReturnVacant!0 (x!92451 lt!457794) (index!41185 lt!457794) (index!41185 lt!457794) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (_keys!11496 thiss!1427) (mask!30230 thiss!1427)))))

(assert (= (and d!125501 c!105407) b!1038094))

(assert (= (and d!125501 (not c!105407)) b!1038096))

(assert (= (and b!1038096 c!105406) b!1038097))

(assert (= (and b!1038096 (not c!105406)) b!1038095))

(assert (= (and b!1038095 c!105408) b!1038093))

(assert (= (and b!1038095 (not c!105408)) b!1038098))

(declare-fun m!958715 () Bool)

(assert (=> d!125501 m!958715))

(assert (=> d!125501 m!957367))

(declare-fun m!958717 () Bool)

(assert (=> d!125501 m!958717))

(assert (=> d!125501 m!957361))

(declare-fun m!958719 () Bool)

(assert (=> d!125501 m!958719))

(declare-fun m!958721 () Bool)

(assert (=> d!125501 m!958721))

(declare-fun m!958723 () Bool)

(assert (=> d!125501 m!958723))

(assert (=> d!125501 m!957361))

(assert (=> d!125501 m!958717))

(declare-fun m!958725 () Bool)

(assert (=> b!1038096 m!958725))

(assert (=> b!1038098 m!957361))

(declare-fun m!958727 () Bool)

(assert (=> b!1038098 m!958727))

(assert (=> b!1037546 d!125501))

(declare-fun d!125503 () Bool)

(assert (=> d!125503 (= (get!16493 (getValueByKey!585 (toList!6897 (+!3127 lt!457405 (tuple2!15729 lt!457400 lt!457297))) lt!457395)) (v!14927 (getValueByKey!585 (toList!6897 (+!3127 lt!457405 (tuple2!15729 lt!457400 lt!457297))) lt!457395)))))

(assert (=> d!125119 d!125503))

(declare-fun b!1038099 () Bool)

(declare-fun e!587217 () Option!636)

(assert (=> b!1038099 (= e!587217 (Some!635 (_2!7875 (h!23109 (toList!6897 (+!3127 lt!457405 (tuple2!15729 lt!457400 lt!457297)))))))))

(declare-fun d!125505 () Bool)

(declare-fun c!105409 () Bool)

(assert (=> d!125505 (= c!105409 (and ((_ is Cons!21898) (toList!6897 (+!3127 lt!457405 (tuple2!15729 lt!457400 lt!457297)))) (= (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457405 (tuple2!15729 lt!457400 lt!457297))))) lt!457395)))))

(assert (=> d!125505 (= (getValueByKey!585 (toList!6897 (+!3127 lt!457405 (tuple2!15729 lt!457400 lt!457297))) lt!457395) e!587217)))

(declare-fun b!1038100 () Bool)

(declare-fun e!587218 () Option!636)

(assert (=> b!1038100 (= e!587217 e!587218)))

(declare-fun c!105410 () Bool)

(assert (=> b!1038100 (= c!105410 (and ((_ is Cons!21898) (toList!6897 (+!3127 lt!457405 (tuple2!15729 lt!457400 lt!457297)))) (not (= (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457405 (tuple2!15729 lt!457400 lt!457297))))) lt!457395))))))

(declare-fun b!1038101 () Bool)

(assert (=> b!1038101 (= e!587218 (getValueByKey!585 (t!31099 (toList!6897 (+!3127 lt!457405 (tuple2!15729 lt!457400 lt!457297)))) lt!457395))))

(declare-fun b!1038102 () Bool)

(assert (=> b!1038102 (= e!587218 None!634)))

(assert (= (and d!125505 c!105409) b!1038099))

(assert (= (and d!125505 (not c!105409)) b!1038100))

(assert (= (and b!1038100 c!105410) b!1038101))

(assert (= (and b!1038100 (not c!105410)) b!1038102))

(declare-fun m!958729 () Bool)

(assert (=> b!1038101 m!958729))

(assert (=> d!125119 d!125505))

(declare-fun d!125507 () Bool)

(assert (=> d!125507 (= (isEmpty!933 lt!457444) (isEmpty!935 (toList!6897 lt!457444)))))

(declare-fun bs!30383 () Bool)

(assert (= bs!30383 d!125507))

(declare-fun m!958731 () Bool)

(assert (=> bs!30383 m!958731))

(assert (=> b!1037386 d!125507))

(declare-fun lt!457797 () Bool)

(declare-fun d!125509 () Bool)

(assert (=> d!125509 (= lt!457797 (select (content!517 (toList!6897 lt!457469)) (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))))))

(declare-fun e!587220 () Bool)

(assert (=> d!125509 (= lt!457797 e!587220)))

(declare-fun res!692430 () Bool)

(assert (=> d!125509 (=> (not res!692430) (not e!587220))))

(assert (=> d!125509 (= res!692430 ((_ is Cons!21898) (toList!6897 lt!457469)))))

(assert (=> d!125509 (= (contains!6047 (toList!6897 lt!457469) (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))) lt!457797)))

(declare-fun b!1038103 () Bool)

(declare-fun e!587219 () Bool)

(assert (=> b!1038103 (= e!587220 e!587219)))

(declare-fun res!692431 () Bool)

(assert (=> b!1038103 (=> res!692431 e!587219)))

(assert (=> b!1038103 (= res!692431 (= (h!23109 (toList!6897 lt!457469)) (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))))))

(declare-fun b!1038104 () Bool)

(assert (=> b!1038104 (= e!587219 (contains!6047 (t!31099 (toList!6897 lt!457469)) (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))))))

(assert (= (and d!125509 res!692430) b!1038103))

(assert (= (and b!1038103 (not res!692431)) b!1038104))

(declare-fun m!958733 () Bool)

(assert (=> d!125509 m!958733))

(declare-fun m!958735 () Bool)

(assert (=> d!125509 m!958735))

(declare-fun m!958737 () Bool)

(assert (=> b!1038104 m!958737))

(assert (=> b!1037412 d!125509))

(assert (=> b!1037561 d!125235))

(declare-fun d!125511 () Bool)

(declare-fun res!692432 () Bool)

(declare-fun e!587221 () Bool)

(assert (=> d!125511 (=> res!692432 e!587221)))

(assert (=> d!125511 (= res!692432 (and ((_ is Cons!21898) (toList!6897 lt!457408)) (= (_1!7875 (h!23109 (toList!6897 lt!457408))) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!125511 (= (containsKey!566 (toList!6897 lt!457408) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) e!587221)))

(declare-fun b!1038105 () Bool)

(declare-fun e!587222 () Bool)

(assert (=> b!1038105 (= e!587221 e!587222)))

(declare-fun res!692433 () Bool)

(assert (=> b!1038105 (=> (not res!692433) (not e!587222))))

(assert (=> b!1038105 (= res!692433 (and (or (not ((_ is Cons!21898) (toList!6897 lt!457408))) (bvsle (_1!7875 (h!23109 (toList!6897 lt!457408))) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))) ((_ is Cons!21898) (toList!6897 lt!457408)) (bvslt (_1!7875 (h!23109 (toList!6897 lt!457408))) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun b!1038106 () Bool)

(assert (=> b!1038106 (= e!587222 (containsKey!566 (t!31099 (toList!6897 lt!457408)) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125511 (not res!692432)) b!1038105))

(assert (= (and b!1038105 res!692433) b!1038106))

(assert (=> b!1038106 m!957361))

(declare-fun m!958739 () Bool)

(assert (=> b!1038106 m!958739))

(assert (=> d!125095 d!125511))

(declare-fun d!125513 () Bool)

(declare-fun res!692434 () Bool)

(declare-fun e!587223 () Bool)

(assert (=> d!125513 (=> res!692434 e!587223)))

(assert (=> d!125513 (= res!692434 (and ((_ is Cons!21898) (toList!6897 lt!457385)) (= (_1!7875 (h!23109 (toList!6897 lt!457385))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125513 (= (containsKey!566 (toList!6897 lt!457385) #b1000000000000000000000000000000000000000000000000000000000000000) e!587223)))

(declare-fun b!1038107 () Bool)

(declare-fun e!587224 () Bool)

(assert (=> b!1038107 (= e!587223 e!587224)))

(declare-fun res!692435 () Bool)

(assert (=> b!1038107 (=> (not res!692435) (not e!587224))))

(assert (=> b!1038107 (= res!692435 (and (or (not ((_ is Cons!21898) (toList!6897 lt!457385))) (bvsle (_1!7875 (h!23109 (toList!6897 lt!457385))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21898) (toList!6897 lt!457385)) (bvslt (_1!7875 (h!23109 (toList!6897 lt!457385))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1038108 () Bool)

(assert (=> b!1038108 (= e!587224 (containsKey!566 (t!31099 (toList!6897 lt!457385)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125513 (not res!692434)) b!1038107))

(assert (= (and b!1038107 res!692435) b!1038108))

(declare-fun m!958741 () Bool)

(assert (=> b!1038108 m!958741))

(assert (=> d!125109 d!125513))

(assert (=> b!1037495 d!125235))

(declare-fun lt!457798 () Bool)

(declare-fun d!125515 () Bool)

(assert (=> d!125515 (= lt!457798 (select (content!517 (toList!6897 lt!457586)) (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun e!587226 () Bool)

(assert (=> d!125515 (= lt!457798 e!587226)))

(declare-fun res!692436 () Bool)

(assert (=> d!125515 (=> (not res!692436) (not e!587226))))

(assert (=> d!125515 (= res!692436 ((_ is Cons!21898) (toList!6897 lt!457586)))))

(assert (=> d!125515 (= (contains!6047 (toList!6897 lt!457586) (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) lt!457798)))

(declare-fun b!1038109 () Bool)

(declare-fun e!587225 () Bool)

(assert (=> b!1038109 (= e!587226 e!587225)))

(declare-fun res!692437 () Bool)

(assert (=> b!1038109 (=> res!692437 e!587225)))

(assert (=> b!1038109 (= res!692437 (= (h!23109 (toList!6897 lt!457586)) (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun b!1038110 () Bool)

(assert (=> b!1038110 (= e!587225 (contains!6047 (t!31099 (toList!6897 lt!457586)) (ite (or c!105170 c!105171) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 thiss!1427)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(assert (= (and d!125515 res!692436) b!1038109))

(assert (= (and b!1038109 (not res!692437)) b!1038110))

(declare-fun m!958743 () Bool)

(assert (=> d!125515 m!958743))

(declare-fun m!958745 () Bool)

(assert (=> d!125515 m!958745))

(declare-fun m!958747 () Bool)

(assert (=> b!1038110 m!958747))

(assert (=> b!1037572 d!125515))

(declare-fun d!125517 () Bool)

(declare-fun e!587227 () Bool)

(assert (=> d!125517 e!587227))

(declare-fun res!692438 () Bool)

(assert (=> d!125517 (=> res!692438 e!587227)))

(declare-fun lt!457802 () Bool)

(assert (=> d!125517 (= res!692438 (not lt!457802))))

(declare-fun lt!457799 () Bool)

(assert (=> d!125517 (= lt!457802 lt!457799)))

(declare-fun lt!457801 () Unit!33898)

(declare-fun e!587228 () Unit!33898)

(assert (=> d!125517 (= lt!457801 e!587228)))

(declare-fun c!105411 () Bool)

(assert (=> d!125517 (= c!105411 lt!457799)))

(assert (=> d!125517 (= lt!457799 (containsKey!566 (toList!6897 lt!457536) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125517 (= (contains!6046 lt!457536 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) lt!457802)))

(declare-fun b!1038111 () Bool)

(declare-fun lt!457800 () Unit!33898)

(assert (=> b!1038111 (= e!587228 lt!457800)))

(assert (=> b!1038111 (= lt!457800 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457536) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1038111 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457536) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1038112 () Bool)

(declare-fun Unit!33933 () Unit!33898)

(assert (=> b!1038112 (= e!587228 Unit!33933)))

(declare-fun b!1038113 () Bool)

(assert (=> b!1038113 (= e!587227 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457536) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!125517 c!105411) b!1038111))

(assert (= (and d!125517 (not c!105411)) b!1038112))

(assert (= (and d!125517 (not res!692438)) b!1038113))

(assert (=> d!125517 m!957361))

(declare-fun m!958749 () Bool)

(assert (=> d!125517 m!958749))

(assert (=> b!1038111 m!957361))

(declare-fun m!958751 () Bool)

(assert (=> b!1038111 m!958751))

(assert (=> b!1038111 m!957361))

(declare-fun m!958753 () Bool)

(assert (=> b!1038111 m!958753))

(assert (=> b!1038111 m!958753))

(declare-fun m!958755 () Bool)

(assert (=> b!1038111 m!958755))

(assert (=> b!1038113 m!957361))

(assert (=> b!1038113 m!958753))

(assert (=> b!1038113 m!958753))

(assert (=> b!1038113 m!958755))

(assert (=> b!1037511 d!125517))

(declare-fun d!125519 () Bool)

(assert (=> d!125519 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457319) key!909))))

(declare-fun lt!457803 () Unit!33898)

(assert (=> d!125519 (= lt!457803 (choose!1710 (toList!6897 lt!457319) key!909))))

(declare-fun e!587229 () Bool)

(assert (=> d!125519 e!587229))

(declare-fun res!692439 () Bool)

(assert (=> d!125519 (=> (not res!692439) (not e!587229))))

(assert (=> d!125519 (= res!692439 (isStrictlySorted!707 (toList!6897 lt!457319)))))

(assert (=> d!125519 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457319) key!909) lt!457803)))

(declare-fun b!1038114 () Bool)

(assert (=> b!1038114 (= e!587229 (containsKey!566 (toList!6897 lt!457319) key!909))))

(assert (= (and d!125519 res!692439) b!1038114))

(assert (=> d!125519 m!957941))

(assert (=> d!125519 m!957941))

(assert (=> d!125519 m!957943))

(declare-fun m!958757 () Bool)

(assert (=> d!125519 m!958757))

(declare-fun m!958759 () Bool)

(assert (=> d!125519 m!958759))

(assert (=> b!1038114 m!957937))

(assert (=> b!1037581 d!125519))

(assert (=> b!1037581 d!125257))

(assert (=> b!1037581 d!125259))

(assert (=> b!1037575 d!125279))

(assert (=> b!1037575 d!125225))

(assert (=> b!1037579 d!125093))

(assert (=> b!1037514 d!125093))

(declare-fun d!125521 () Bool)

(declare-fun res!692440 () Bool)

(declare-fun e!587230 () Bool)

(assert (=> d!125521 (=> res!692440 e!587230)))

(assert (=> d!125521 (= res!692440 (or ((_ is Nil!21899) lt!457491) ((_ is Nil!21899) (t!31099 lt!457491))))))

(assert (=> d!125521 (= (isStrictlySorted!707 lt!457491) e!587230)))

(declare-fun b!1038115 () Bool)

(declare-fun e!587231 () Bool)

(assert (=> b!1038115 (= e!587230 e!587231)))

(declare-fun res!692441 () Bool)

(assert (=> b!1038115 (=> (not res!692441) (not e!587231))))

(assert (=> b!1038115 (= res!692441 (bvslt (_1!7875 (h!23109 lt!457491)) (_1!7875 (h!23109 (t!31099 lt!457491)))))))

(declare-fun b!1038116 () Bool)

(assert (=> b!1038116 (= e!587231 (isStrictlySorted!707 (t!31099 lt!457491)))))

(assert (= (and d!125521 (not res!692440)) b!1038115))

(assert (= (and b!1038115 res!692441) b!1038116))

(declare-fun m!958761 () Bool)

(assert (=> b!1038116 m!958761))

(assert (=> d!125089 d!125521))

(declare-fun d!125523 () Bool)

(declare-fun res!692442 () Bool)

(declare-fun e!587232 () Bool)

(assert (=> d!125523 (=> res!692442 e!587232)))

(assert (=> d!125523 (= res!692442 (or ((_ is Nil!21899) (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))) ((_ is Nil!21899) (t!31099 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))))))))

(assert (=> d!125523 (= (isStrictlySorted!707 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427)))) e!587232)))

(declare-fun b!1038117 () Bool)

(declare-fun e!587233 () Bool)

(assert (=> b!1038117 (= e!587232 e!587233)))

(declare-fun res!692443 () Bool)

(assert (=> b!1038117 (=> (not res!692443) (not e!587233))))

(assert (=> b!1038117 (= res!692443 (bvslt (_1!7875 (h!23109 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))) (_1!7875 (h!23109 (t!31099 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))))))))

(declare-fun b!1038118 () Bool)

(assert (=> b!1038118 (= e!587233 (isStrictlySorted!707 (t!31099 (toList!6897 (getCurrentListMap!3943 (_keys!11496 thiss!1427) (_values!6292 thiss!1427) (mask!30230 thiss!1427) (extraKeys!5999 thiss!1427) (zeroValue!6103 thiss!1427) (minValue!6105 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6269 thiss!1427))))))))

(assert (= (and d!125523 (not res!692442)) b!1038117))

(assert (= (and b!1038117 res!692443) b!1038118))

(assert (=> b!1038118 m!958427))

(assert (=> d!125089 d!125523))

(declare-fun d!125525 () Bool)

(declare-fun e!587234 () Bool)

(assert (=> d!125525 e!587234))

(declare-fun res!692444 () Bool)

(assert (=> d!125525 (=> res!692444 e!587234)))

(declare-fun lt!457807 () Bool)

(assert (=> d!125525 (= res!692444 (not lt!457807))))

(declare-fun lt!457804 () Bool)

(assert (=> d!125525 (= lt!457807 lt!457804)))

(declare-fun lt!457806 () Unit!33898)

(declare-fun e!587235 () Unit!33898)

(assert (=> d!125525 (= lt!457806 e!587235)))

(declare-fun c!105412 () Bool)

(assert (=> d!125525 (= c!105412 lt!457804)))

(assert (=> d!125525 (= lt!457804 (containsKey!566 (toList!6897 lt!457461) (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))))

(assert (=> d!125525 (= (contains!6046 lt!457461 (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))) lt!457807)))

(declare-fun b!1038119 () Bool)

(declare-fun lt!457805 () Unit!33898)

(assert (=> b!1038119 (= e!587235 lt!457805)))

(assert (=> b!1038119 (= lt!457805 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457461) (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))))

(assert (=> b!1038119 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457461) (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1038120 () Bool)

(declare-fun Unit!33934 () Unit!33898)

(assert (=> b!1038120 (= e!587235 Unit!33934)))

(declare-fun b!1038121 () Bool)

(assert (=> b!1038121 (= e!587234 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457461) (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))))))

(assert (= (and d!125525 c!105412) b!1038119))

(assert (= (and d!125525 (not c!105412)) b!1038120))

(assert (= (and d!125525 (not res!692444)) b!1038121))

(declare-fun m!958763 () Bool)

(assert (=> d!125525 m!958763))

(declare-fun m!958765 () Bool)

(assert (=> b!1038119 m!958765))

(assert (=> b!1038119 m!957551))

(assert (=> b!1038119 m!957551))

(declare-fun m!958767 () Bool)

(assert (=> b!1038119 m!958767))

(assert (=> b!1038121 m!957551))

(assert (=> b!1038121 m!957551))

(assert (=> b!1038121 m!958767))

(assert (=> d!125063 d!125525))

(declare-fun b!1038122 () Bool)

(declare-fun e!587236 () Option!636)

(assert (=> b!1038122 (= e!587236 (Some!635 (_2!7875 (h!23109 lt!457463))))))

(declare-fun d!125527 () Bool)

(declare-fun c!105413 () Bool)

(assert (=> d!125527 (= c!105413 (and ((_ is Cons!21898) lt!457463) (= (_1!7875 (h!23109 lt!457463)) (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))))))

(assert (=> d!125527 (= (getValueByKey!585 lt!457463 (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))) e!587236)))

(declare-fun b!1038123 () Bool)

(declare-fun e!587237 () Option!636)

(assert (=> b!1038123 (= e!587236 e!587237)))

(declare-fun c!105414 () Bool)

(assert (=> b!1038123 (= c!105414 (and ((_ is Cons!21898) lt!457463) (not (= (_1!7875 (h!23109 lt!457463)) (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))))))

(declare-fun b!1038124 () Bool)

(assert (=> b!1038124 (= e!587237 (getValueByKey!585 (t!31099 lt!457463) (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1038125 () Bool)

(assert (=> b!1038125 (= e!587237 None!634)))

(assert (= (and d!125527 c!105413) b!1038122))

(assert (= (and d!125527 (not c!105413)) b!1038123))

(assert (= (and b!1038123 c!105414) b!1038124))

(assert (= (and b!1038123 (not c!105414)) b!1038125))

(declare-fun m!958769 () Bool)

(assert (=> b!1038124 m!958769))

(assert (=> d!125063 d!125527))

(declare-fun d!125529 () Bool)

(assert (=> d!125529 (= (getValueByKey!585 lt!457463 (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))))

(declare-fun lt!457808 () Unit!33898)

(assert (=> d!125529 (= lt!457808 (choose!1709 lt!457463 (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))))

(declare-fun e!587238 () Bool)

(assert (=> d!125529 e!587238))

(declare-fun res!692445 () Bool)

(assert (=> d!125529 (=> (not res!692445) (not e!587238))))

(assert (=> d!125529 (= res!692445 (isStrictlySorted!707 lt!457463))))

(assert (=> d!125529 (= (lemmaContainsTupThenGetReturnValue!281 lt!457463 (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))) lt!457808)))

(declare-fun b!1038126 () Bool)

(declare-fun res!692446 () Bool)

(assert (=> b!1038126 (=> (not res!692446) (not e!587238))))

(assert (=> b!1038126 (= res!692446 (containsKey!566 lt!457463 (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1038127 () Bool)

(assert (=> b!1038127 (= e!587238 (contains!6047 lt!457463 (tuple2!15729 (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))))))

(assert (= (and d!125529 res!692445) b!1038126))

(assert (= (and b!1038126 res!692446) b!1038127))

(assert (=> d!125529 m!957545))

(declare-fun m!958771 () Bool)

(assert (=> d!125529 m!958771))

(declare-fun m!958773 () Bool)

(assert (=> d!125529 m!958773))

(declare-fun m!958775 () Bool)

(assert (=> b!1038126 m!958775))

(declare-fun m!958777 () Bool)

(assert (=> b!1038127 m!958777))

(assert (=> d!125063 d!125529))

(declare-fun b!1038128 () Bool)

(declare-fun res!692447 () Bool)

(declare-fun e!587243 () Bool)

(assert (=> b!1038128 (=> (not res!692447) (not e!587243))))

(declare-fun lt!457809 () List!21902)

(assert (=> b!1038128 (= res!692447 (containsKey!566 lt!457809 (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))))

(declare-fun c!105416 () Bool)

(declare-fun b!1038129 () Bool)

(assert (=> b!1038129 (= c!105416 (and ((_ is Cons!21898) (toList!6897 lt!457370)) (bvsgt (_1!7875 (h!23109 (toList!6897 lt!457370))) (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))))))

(declare-fun e!587239 () List!21902)

(declare-fun e!587241 () List!21902)

(assert (=> b!1038129 (= e!587239 e!587241)))

(declare-fun b!1038130 () Bool)

(declare-fun e!587240 () List!21902)

(assert (=> b!1038130 (= e!587240 (insertStrictlySorted!374 (t!31099 (toList!6897 lt!457370)) (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1038131 () Bool)

(assert (=> b!1038131 (= e!587243 (contains!6047 lt!457809 (tuple2!15729 (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))))))

(declare-fun bm!43957 () Bool)

(declare-fun call!43960 () List!21902)

(declare-fun call!43959 () List!21902)

(assert (=> bm!43957 (= call!43960 call!43959)))

(declare-fun b!1038132 () Bool)

(assert (=> b!1038132 (= e!587241 call!43960)))

(declare-fun b!1038133 () Bool)

(declare-fun e!587242 () List!21902)

(declare-fun call!43961 () List!21902)

(assert (=> b!1038133 (= e!587242 call!43961)))

(declare-fun bm!43958 () Bool)

(assert (=> bm!43958 (= call!43959 call!43961)))

(declare-fun b!1038134 () Bool)

(assert (=> b!1038134 (= e!587239 call!43959)))

(declare-fun b!1038135 () Bool)

(assert (=> b!1038135 (= e!587241 call!43960)))

(declare-fun b!1038136 () Bool)

(declare-fun c!105417 () Bool)

(assert (=> b!1038136 (= e!587240 (ite c!105417 (t!31099 (toList!6897 lt!457370)) (ite c!105416 (Cons!21898 (h!23109 (toList!6897 lt!457370)) (t!31099 (toList!6897 lt!457370))) Nil!21899)))))

(declare-fun b!1038137 () Bool)

(assert (=> b!1038137 (= e!587242 e!587239)))

(assert (=> b!1038137 (= c!105417 (and ((_ is Cons!21898) (toList!6897 lt!457370)) (= (_1!7875 (h!23109 (toList!6897 lt!457370))) (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))))))

(declare-fun c!105418 () Bool)

(declare-fun bm!43956 () Bool)

(assert (=> bm!43956 (= call!43961 ($colon$colon!604 e!587240 (ite c!105418 (h!23109 (toList!6897 lt!457370)) (tuple2!15729 (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))))))

(declare-fun c!105415 () Bool)

(assert (=> bm!43956 (= c!105415 c!105418)))

(declare-fun d!125531 () Bool)

(assert (=> d!125531 e!587243))

(declare-fun res!692448 () Bool)

(assert (=> d!125531 (=> (not res!692448) (not e!587243))))

(assert (=> d!125531 (= res!692448 (isStrictlySorted!707 lt!457809))))

(assert (=> d!125531 (= lt!457809 e!587242)))

(assert (=> d!125531 (= c!105418 (and ((_ is Cons!21898) (toList!6897 lt!457370)) (bvslt (_1!7875 (h!23109 (toList!6897 lt!457370))) (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))))))

(assert (=> d!125531 (isStrictlySorted!707 (toList!6897 lt!457370))))

(assert (=> d!125531 (= (insertStrictlySorted!374 (toList!6897 lt!457370) (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))) (_2!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))) lt!457809)))

(assert (= (and d!125531 c!105418) b!1038133))

(assert (= (and d!125531 (not c!105418)) b!1038137))

(assert (= (and b!1038137 c!105417) b!1038134))

(assert (= (and b!1038137 (not c!105417)) b!1038129))

(assert (= (and b!1038129 c!105416) b!1038135))

(assert (= (and b!1038129 (not c!105416)) b!1038132))

(assert (= (or b!1038135 b!1038132) bm!43957))

(assert (= (or b!1038134 bm!43957) bm!43958))

(assert (= (or b!1038133 bm!43958) bm!43956))

(assert (= (and bm!43956 c!105415) b!1038130))

(assert (= (and bm!43956 (not c!105415)) b!1038136))

(assert (= (and d!125531 res!692448) b!1038128))

(assert (= (and b!1038128 res!692447) b!1038131))

(declare-fun m!958779 () Bool)

(assert (=> b!1038130 m!958779))

(declare-fun m!958781 () Bool)

(assert (=> bm!43956 m!958781))

(declare-fun m!958783 () Bool)

(assert (=> b!1038128 m!958783))

(declare-fun m!958785 () Bool)

(assert (=> b!1038131 m!958785))

(declare-fun m!958787 () Bool)

(assert (=> d!125531 m!958787))

(declare-fun m!958789 () Bool)

(assert (=> d!125531 m!958789))

(assert (=> d!125063 d!125531))

(declare-fun d!125533 () Bool)

(assert (=> d!125533 (= (get!16493 (getValueByKey!585 (toList!6897 (+!3127 lt!457364 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))) lt!457369)) (v!14927 (getValueByKey!585 (toList!6897 (+!3127 lt!457364 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))) lt!457369)))))

(assert (=> d!125057 d!125533))

(declare-fun e!587244 () Option!636)

(declare-fun b!1038138 () Bool)

(assert (=> b!1038138 (= e!587244 (Some!635 (_2!7875 (h!23109 (toList!6897 (+!3127 lt!457364 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))))))))))

(declare-fun d!125535 () Bool)

(declare-fun c!105419 () Bool)

(assert (=> d!125535 (= c!105419 (and ((_ is Cons!21898) (toList!6897 (+!3127 lt!457364 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))))) (= (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457364 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))))) lt!457369)))))

(assert (=> d!125535 (= (getValueByKey!585 (toList!6897 (+!3127 lt!457364 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))) lt!457369) e!587244)))

(declare-fun b!1038139 () Bool)

(declare-fun e!587245 () Option!636)

(assert (=> b!1038139 (= e!587244 e!587245)))

(declare-fun c!105420 () Bool)

(assert (=> b!1038139 (= c!105420 (and ((_ is Cons!21898) (toList!6897 (+!3127 lt!457364 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))))) (not (= (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457364 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427)))))) lt!457369))))))

(declare-fun b!1038140 () Bool)

(assert (=> b!1038140 (= e!587245 (getValueByKey!585 (t!31099 (toList!6897 (+!3127 lt!457364 (tuple2!15729 lt!457371 (minValue!6105 thiss!1427))))) lt!457369))))

(declare-fun b!1038141 () Bool)

(assert (=> b!1038141 (= e!587245 None!634)))

(assert (= (and d!125535 c!105419) b!1038138))

(assert (= (and d!125535 (not c!105419)) b!1038139))

(assert (= (and b!1038139 c!105420) b!1038140))

(assert (= (and b!1038139 (not c!105420)) b!1038141))

(declare-fun m!958791 () Bool)

(assert (=> b!1038140 m!958791))

(assert (=> d!125057 d!125535))

(declare-fun d!125537 () Bool)

(declare-fun res!692449 () Bool)

(declare-fun e!587246 () Bool)

(assert (=> d!125537 (=> res!692449 e!587246)))

(assert (=> d!125537 (= res!692449 (and ((_ is Cons!21898) (toList!6897 lt!457386)) (= (_1!7875 (h!23109 (toList!6897 lt!457386))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125537 (= (containsKey!566 (toList!6897 lt!457386) #b1000000000000000000000000000000000000000000000000000000000000000) e!587246)))

(declare-fun b!1038142 () Bool)

(declare-fun e!587247 () Bool)

(assert (=> b!1038142 (= e!587246 e!587247)))

(declare-fun res!692450 () Bool)

(assert (=> b!1038142 (=> (not res!692450) (not e!587247))))

(assert (=> b!1038142 (= res!692450 (and (or (not ((_ is Cons!21898) (toList!6897 lt!457386))) (bvsle (_1!7875 (h!23109 (toList!6897 lt!457386))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21898) (toList!6897 lt!457386)) (bvslt (_1!7875 (h!23109 (toList!6897 lt!457386))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1038143 () Bool)

(assert (=> b!1038143 (= e!587247 (containsKey!566 (t!31099 (toList!6897 lt!457386)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125537 (not res!692449)) b!1038142))

(assert (= (and b!1038142 res!692450) b!1038143))

(declare-fun m!958793 () Bool)

(assert (=> b!1038143 m!958793))

(assert (=> d!125087 d!125537))

(declare-fun d!125539 () Bool)

(declare-fun e!587248 () Bool)

(assert (=> d!125539 e!587248))

(declare-fun res!692451 () Bool)

(assert (=> d!125539 (=> res!692451 e!587248)))

(declare-fun lt!457813 () Bool)

(assert (=> d!125539 (= res!692451 (not lt!457813))))

(declare-fun lt!457810 () Bool)

(assert (=> d!125539 (= lt!457813 lt!457810)))

(declare-fun lt!457812 () Unit!33898)

(declare-fun e!587249 () Unit!33898)

(assert (=> d!125539 (= lt!457812 e!587249)))

(declare-fun c!105421 () Bool)

(assert (=> d!125539 (= c!105421 lt!457810)))

(assert (=> d!125539 (= lt!457810 (containsKey!566 (toList!6897 lt!457444) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125539 (= (contains!6046 lt!457444 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457813)))

(declare-fun b!1038144 () Bool)

(declare-fun lt!457811 () Unit!33898)

(assert (=> b!1038144 (= e!587249 lt!457811)))

(assert (=> b!1038144 (= lt!457811 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457444) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1038144 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457444) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038145 () Bool)

(declare-fun Unit!33935 () Unit!33898)

(assert (=> b!1038145 (= e!587249 Unit!33935)))

(declare-fun b!1038146 () Bool)

(assert (=> b!1038146 (= e!587248 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457444) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125539 c!105421) b!1038144))

(assert (= (and d!125539 (not c!105421)) b!1038145))

(assert (= (and d!125539 (not res!692451)) b!1038146))

(declare-fun m!958795 () Bool)

(assert (=> d!125539 m!958795))

(declare-fun m!958797 () Bool)

(assert (=> b!1038144 m!958797))

(declare-fun m!958799 () Bool)

(assert (=> b!1038144 m!958799))

(assert (=> b!1038144 m!958799))

(declare-fun m!958801 () Bool)

(assert (=> b!1038144 m!958801))

(assert (=> b!1038146 m!958799))

(assert (=> b!1038146 m!958799))

(assert (=> b!1038146 m!958801))

(assert (=> b!1037390 d!125539))

(assert (=> d!125107 d!125077))

(declare-fun lt!457814 () Bool)

(declare-fun d!125541 () Bool)

(assert (=> d!125541 (= lt!457814 (select (content!517 (toList!6897 lt!457557)) (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))))

(declare-fun e!587251 () Bool)

(assert (=> d!125541 (= lt!457814 e!587251)))

(declare-fun res!692452 () Bool)

(assert (=> d!125541 (=> (not res!692452) (not e!587251))))

(assert (=> d!125541 (= res!692452 ((_ is Cons!21898) (toList!6897 lt!457557)))))

(assert (=> d!125541 (= (contains!6047 (toList!6897 lt!457557) (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))) lt!457814)))

(declare-fun b!1038147 () Bool)

(declare-fun e!587250 () Bool)

(assert (=> b!1038147 (= e!587251 e!587250)))

(declare-fun res!692453 () Bool)

(assert (=> b!1038147 (=> res!692453 e!587250)))

(assert (=> b!1038147 (= res!692453 (= (h!23109 (toList!6897 lt!457557)) (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))))

(declare-fun b!1038148 () Bool)

(assert (=> b!1038148 (= e!587250 (contains!6047 (t!31099 (toList!6897 lt!457557)) (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))))

(assert (= (and d!125541 res!692452) b!1038147))

(assert (= (and b!1038147 (not res!692453)) b!1038148))

(declare-fun m!958803 () Bool)

(assert (=> d!125541 m!958803))

(declare-fun m!958805 () Bool)

(assert (=> d!125541 m!958805))

(declare-fun m!958807 () Bool)

(assert (=> b!1038148 m!958807))

(assert (=> b!1037528 d!125541))

(assert (=> d!125099 d!125351))

(declare-fun b!1038149 () Bool)

(declare-fun e!587252 () Option!636)

(assert (=> b!1038149 (= e!587252 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457461)))))))

(declare-fun d!125543 () Bool)

(declare-fun c!105422 () Bool)

(assert (=> d!125543 (= c!105422 (and ((_ is Cons!21898) (toList!6897 lt!457461)) (= (_1!7875 (h!23109 (toList!6897 lt!457461))) (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))))))

(assert (=> d!125543 (= (getValueByKey!585 (toList!6897 lt!457461) (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))) e!587252)))

(declare-fun b!1038150 () Bool)

(declare-fun e!587253 () Option!636)

(assert (=> b!1038150 (= e!587252 e!587253)))

(declare-fun c!105423 () Bool)

(assert (=> b!1038150 (= c!105423 (and ((_ is Cons!21898) (toList!6897 lt!457461)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457461))) (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))))))

(declare-fun b!1038151 () Bool)

(assert (=> b!1038151 (= e!587253 (getValueByKey!585 (t!31099 (toList!6897 lt!457461)) (_1!7875 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))))

(declare-fun b!1038152 () Bool)

(assert (=> b!1038152 (= e!587253 None!634)))

(assert (= (and d!125543 c!105422) b!1038149))

(assert (= (and d!125543 (not c!105422)) b!1038150))

(assert (= (and b!1038150 c!105423) b!1038151))

(assert (= (and b!1038150 (not c!105423)) b!1038152))

(declare-fun m!958809 () Bool)

(assert (=> b!1038151 m!958809))

(assert (=> b!1037407 d!125543))

(declare-fun d!125545 () Bool)

(assert (=> d!125545 (= (get!16493 (getValueByKey!585 (toList!6897 lt!457385) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))) (v!14927 (getValueByKey!585 (toList!6897 lt!457385) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!125151 d!125545))

(assert (=> d!125151 d!125407))

(assert (=> d!125123 d!125111))

(assert (=> d!125123 d!125131))

(declare-fun d!125547 () Bool)

(assert (=> d!125547 (= (apply!916 (+!3127 lt!457387 (tuple2!15729 lt!457394 lt!457297)) lt!457392) (apply!916 lt!457387 lt!457392))))

(assert (=> d!125547 true))

(declare-fun _$34!1175 () Unit!33898)

(assert (=> d!125547 (= (choose!1707 lt!457387 lt!457394 lt!457297 lt!457392) _$34!1175)))

(declare-fun bs!30384 () Bool)

(assert (= bs!30384 d!125547))

(assert (=> bs!30384 m!957449))

(assert (=> bs!30384 m!957449))

(assert (=> bs!30384 m!957451))

(assert (=> bs!30384 m!957453))

(assert (=> d!125123 d!125547))

(assert (=> d!125123 d!125137))

(declare-fun d!125549 () Bool)

(declare-fun e!587254 () Bool)

(assert (=> d!125549 e!587254))

(declare-fun res!692454 () Bool)

(assert (=> d!125549 (=> res!692454 e!587254)))

(declare-fun lt!457818 () Bool)

(assert (=> d!125549 (= res!692454 (not lt!457818))))

(declare-fun lt!457815 () Bool)

(assert (=> d!125549 (= lt!457818 lt!457815)))

(declare-fun lt!457817 () Unit!33898)

(declare-fun e!587255 () Unit!33898)

(assert (=> d!125549 (= lt!457817 e!587255)))

(declare-fun c!105424 () Bool)

(assert (=> d!125549 (= c!105424 lt!457815)))

(assert (=> d!125549 (= lt!457815 (containsKey!566 (toList!6897 lt!457387) lt!457392))))

(assert (=> d!125549 (= (contains!6046 lt!457387 lt!457392) lt!457818)))

(declare-fun b!1038153 () Bool)

(declare-fun lt!457816 () Unit!33898)

(assert (=> b!1038153 (= e!587255 lt!457816)))

(assert (=> b!1038153 (= lt!457816 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457387) lt!457392))))

(assert (=> b!1038153 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457387) lt!457392))))

(declare-fun b!1038154 () Bool)

(declare-fun Unit!33936 () Unit!33898)

(assert (=> b!1038154 (= e!587255 Unit!33936)))

(declare-fun b!1038155 () Bool)

(assert (=> b!1038155 (= e!587254 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457387) lt!457392)))))

(assert (= (and d!125549 c!105424) b!1038153))

(assert (= (and d!125549 (not c!105424)) b!1038154))

(assert (= (and d!125549 (not res!692454)) b!1038155))

(declare-fun m!958811 () Bool)

(assert (=> d!125549 m!958811))

(declare-fun m!958813 () Bool)

(assert (=> b!1038153 m!958813))

(assert (=> b!1038153 m!957809))

(assert (=> b!1038153 m!957809))

(declare-fun m!958815 () Bool)

(assert (=> b!1038153 m!958815))

(assert (=> b!1038155 m!957809))

(assert (=> b!1038155 m!957809))

(assert (=> b!1038155 m!958815))

(assert (=> d!125123 d!125549))

(assert (=> d!125149 d!125035))

(assert (=> d!125149 d!125033))

(assert (=> d!125149 d!125039))

(declare-fun d!125551 () Bool)

(assert (=> d!125551 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457386) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!457819 () Unit!33898)

(assert (=> d!125551 (= lt!457819 (choose!1710 (toList!6897 lt!457386) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587256 () Bool)

(assert (=> d!125551 e!587256))

(declare-fun res!692455 () Bool)

(assert (=> d!125551 (=> (not res!692455) (not e!587256))))

(assert (=> d!125551 (= res!692455 (isStrictlySorted!707 (toList!6897 lt!457386)))))

(assert (=> d!125551 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457386) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457819)))

(declare-fun b!1038156 () Bool)

(assert (=> b!1038156 (= e!587256 (containsKey!566 (toList!6897 lt!457386) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125551 res!692455) b!1038156))

(assert (=> d!125551 m!957631))

(assert (=> d!125551 m!957631))

(assert (=> d!125551 m!957633))

(declare-fun m!958817 () Bool)

(assert (=> d!125551 m!958817))

(declare-fun m!958819 () Bool)

(assert (=> d!125551 m!958819))

(assert (=> b!1038156 m!957627))

(assert (=> b!1037428 d!125551))

(assert (=> b!1037428 d!125333))

(assert (=> b!1037428 d!125335))

(declare-fun d!125553 () Bool)

(declare-fun res!692456 () Bool)

(declare-fun e!587257 () Bool)

(assert (=> d!125553 (=> res!692456 e!587257)))

(assert (=> d!125553 (= res!692456 (and ((_ is Cons!21898) (toList!6897 lt!457385)) (= (_1!7875 (h!23109 (toList!6897 lt!457385))) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!125553 (= (containsKey!566 (toList!6897 lt!457385) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) e!587257)))

(declare-fun b!1038157 () Bool)

(declare-fun e!587258 () Bool)

(assert (=> b!1038157 (= e!587257 e!587258)))

(declare-fun res!692457 () Bool)

(assert (=> b!1038157 (=> (not res!692457) (not e!587258))))

(assert (=> b!1038157 (= res!692457 (and (or (not ((_ is Cons!21898) (toList!6897 lt!457385))) (bvsle (_1!7875 (h!23109 (toList!6897 lt!457385))) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))) ((_ is Cons!21898) (toList!6897 lt!457385)) (bvslt (_1!7875 (h!23109 (toList!6897 lt!457385))) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun b!1038158 () Bool)

(assert (=> b!1038158 (= e!587258 (containsKey!566 (t!31099 (toList!6897 lt!457385)) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125553 (not res!692456)) b!1038157))

(assert (= (and b!1038157 res!692457) b!1038158))

(assert (=> b!1038158 m!957361))

(declare-fun m!958821 () Bool)

(assert (=> b!1038158 m!958821))

(assert (=> d!125159 d!125553))

(declare-fun d!125555 () Bool)

(assert (=> d!125555 (= (get!16493 (getValueByKey!585 (toList!6897 lt!457398) lt!457396)) (v!14927 (getValueByKey!585 (toList!6897 lt!457398) lt!457396)))))

(assert (=> d!125139 d!125555))

(declare-fun b!1038159 () Bool)

(declare-fun e!587259 () Option!636)

(assert (=> b!1038159 (= e!587259 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457398)))))))

(declare-fun d!125557 () Bool)

(declare-fun c!105425 () Bool)

(assert (=> d!125557 (= c!105425 (and ((_ is Cons!21898) (toList!6897 lt!457398)) (= (_1!7875 (h!23109 (toList!6897 lt!457398))) lt!457396)))))

(assert (=> d!125557 (= (getValueByKey!585 (toList!6897 lt!457398) lt!457396) e!587259)))

(declare-fun b!1038160 () Bool)

(declare-fun e!587260 () Option!636)

(assert (=> b!1038160 (= e!587259 e!587260)))

(declare-fun c!105426 () Bool)

(assert (=> b!1038160 (= c!105426 (and ((_ is Cons!21898) (toList!6897 lt!457398)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457398))) lt!457396))))))

(declare-fun b!1038161 () Bool)

(assert (=> b!1038161 (= e!587260 (getValueByKey!585 (t!31099 (toList!6897 lt!457398)) lt!457396))))

(declare-fun b!1038162 () Bool)

(assert (=> b!1038162 (= e!587260 None!634)))

(assert (= (and d!125557 c!105425) b!1038159))

(assert (= (and d!125557 (not c!105425)) b!1038160))

(assert (= (and b!1038160 c!105426) b!1038161))

(assert (= (and b!1038160 (not c!105426)) b!1038162))

(declare-fun m!958823 () Bool)

(assert (=> b!1038161 m!958823))

(assert (=> d!125139 d!125557))

(declare-fun d!125559 () Bool)

(assert (=> d!125559 (= (get!16493 (getValueByKey!585 (toList!6897 lt!457385) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!14927 (getValueByKey!585 (toList!6897 lt!457385) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125101 d!125559))

(assert (=> d!125101 d!125315))

(declare-fun d!125561 () Bool)

(declare-fun res!692458 () Bool)

(declare-fun e!587261 () Bool)

(assert (=> d!125561 (=> res!692458 e!587261)))

(assert (=> d!125561 (= res!692458 (and ((_ is Cons!21898) (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))) (= (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))) lt!457379)))))

(assert (=> d!125561 (= (containsKey!566 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))) lt!457379) e!587261)))

(declare-fun b!1038163 () Bool)

(declare-fun e!587262 () Bool)

(assert (=> b!1038163 (= e!587261 e!587262)))

(declare-fun res!692459 () Bool)

(assert (=> b!1038163 (=> (not res!692459) (not e!587262))))

(assert (=> b!1038163 (= res!692459 (and (or (not ((_ is Cons!21898) (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))) (bvsle (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))) lt!457379)) ((_ is Cons!21898) (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))) (bvslt (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427)))))) lt!457379)))))

(declare-fun b!1038164 () Bool)

(assert (=> b!1038164 (= e!587262 (containsKey!566 (t!31099 (toList!6897 (+!3127 lt!457370 (tuple2!15729 lt!457374 (zeroValue!6103 thiss!1427))))) lt!457379))))

(assert (= (and d!125561 (not res!692458)) b!1038163))

(assert (= (and b!1038163 res!692459) b!1038164))

(declare-fun m!958825 () Bool)

(assert (=> b!1038164 m!958825))

(assert (=> d!125043 d!125561))

(declare-fun b!1038165 () Bool)

(declare-fun e!587263 () Option!636)

(assert (=> b!1038165 (= e!587263 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457574)))))))

(declare-fun d!125563 () Bool)

(declare-fun c!105427 () Bool)

(assert (=> d!125563 (= c!105427 (and ((_ is Cons!21898) (toList!6897 lt!457574)) (= (_1!7875 (h!23109 (toList!6897 lt!457574))) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (=> d!125563 (= (getValueByKey!585 (toList!6897 lt!457574) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) e!587263)))

(declare-fun b!1038166 () Bool)

(declare-fun e!587264 () Option!636)

(assert (=> b!1038166 (= e!587263 e!587264)))

(declare-fun c!105428 () Bool)

(assert (=> b!1038166 (= c!105428 (and ((_ is Cons!21898) (toList!6897 lt!457574)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457574))) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(declare-fun b!1038167 () Bool)

(assert (=> b!1038167 (= e!587264 (getValueByKey!585 (t!31099 (toList!6897 lt!457574)) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun b!1038168 () Bool)

(assert (=> b!1038168 (= e!587264 None!634)))

(assert (= (and d!125563 c!105427) b!1038165))

(assert (= (and d!125563 (not c!105427)) b!1038166))

(assert (= (and b!1038166 c!105428) b!1038167))

(assert (= (and b!1038166 (not c!105428)) b!1038168))

(declare-fun m!958827 () Bool)

(assert (=> b!1038167 m!958827))

(assert (=> b!1037564 d!125563))

(declare-fun b!1038169 () Bool)

(declare-fun e!587265 () Option!636)

(assert (=> b!1038169 (= e!587265 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457549)))))))

(declare-fun c!105429 () Bool)

(declare-fun d!125565 () Bool)

(assert (=> d!125565 (= c!105429 (and ((_ is Cons!21898) (toList!6897 lt!457549)) (= (_1!7875 (h!23109 (toList!6897 lt!457549))) (_1!7875 (tuple2!15729 lt!457400 lt!457297)))))))

(assert (=> d!125565 (= (getValueByKey!585 (toList!6897 lt!457549) (_1!7875 (tuple2!15729 lt!457400 lt!457297))) e!587265)))

(declare-fun b!1038170 () Bool)

(declare-fun e!587266 () Option!636)

(assert (=> b!1038170 (= e!587265 e!587266)))

(declare-fun c!105430 () Bool)

(assert (=> b!1038170 (= c!105430 (and ((_ is Cons!21898) (toList!6897 lt!457549)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457549))) (_1!7875 (tuple2!15729 lt!457400 lt!457297))))))))

(declare-fun b!1038171 () Bool)

(assert (=> b!1038171 (= e!587266 (getValueByKey!585 (t!31099 (toList!6897 lt!457549)) (_1!7875 (tuple2!15729 lt!457400 lt!457297))))))

(declare-fun b!1038172 () Bool)

(assert (=> b!1038172 (= e!587266 None!634)))

(assert (= (and d!125565 c!105429) b!1038169))

(assert (= (and d!125565 (not c!105429)) b!1038170))

(assert (= (and b!1038170 c!105430) b!1038171))

(assert (= (and b!1038170 (not c!105430)) b!1038172))

(declare-fun m!958829 () Bool)

(assert (=> b!1038171 m!958829))

(assert (=> b!1037523 d!125565))

(declare-fun d!125567 () Bool)

(assert (=> d!125567 (arrayContainsKey!0 (_keys!11496 lt!457298) lt!457567 #b00000000000000000000000000000000)))

(declare-fun lt!457820 () Unit!33898)

(assert (=> d!125567 (= lt!457820 (choose!13 (_keys!11496 lt!457298) lt!457567 #b00000000000000000000000000000000))))

(assert (=> d!125567 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!125567 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11496 lt!457298) lt!457567 #b00000000000000000000000000000000) lt!457820)))

(declare-fun bs!30385 () Bool)

(assert (= bs!30385 d!125567))

(assert (=> bs!30385 m!957861))

(declare-fun m!958831 () Bool)

(assert (=> bs!30385 m!958831))

(assert (=> b!1037542 d!125567))

(declare-fun d!125569 () Bool)

(declare-fun res!692460 () Bool)

(declare-fun e!587267 () Bool)

(assert (=> d!125569 (=> res!692460 e!587267)))

(assert (=> d!125569 (= res!692460 (= (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000) lt!457567))))

(assert (=> d!125569 (= (arrayContainsKey!0 (_keys!11496 lt!457298) lt!457567 #b00000000000000000000000000000000) e!587267)))

(declare-fun b!1038173 () Bool)

(declare-fun e!587268 () Bool)

(assert (=> b!1038173 (= e!587267 e!587268)))

(declare-fun res!692461 () Bool)

(assert (=> b!1038173 (=> (not res!692461) (not e!587268))))

(assert (=> b!1038173 (= res!692461 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 lt!457298))))))

(declare-fun b!1038174 () Bool)

(assert (=> b!1038174 (= e!587268 (arrayContainsKey!0 (_keys!11496 lt!457298) lt!457567 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125569 (not res!692460)) b!1038173))

(assert (= (and b!1038173 res!692461) b!1038174))

(assert (=> d!125569 m!957669))

(declare-fun m!958833 () Bool)

(assert (=> b!1038174 m!958833))

(assert (=> b!1037542 d!125569))

(declare-fun b!1038175 () Bool)

(declare-fun e!587270 () SeekEntryResult!9703)

(declare-fun lt!457821 () SeekEntryResult!9703)

(assert (=> b!1038175 (= e!587270 (MissingZero!9703 (index!41185 lt!457821)))))

(declare-fun b!1038176 () Bool)

(declare-fun e!587269 () SeekEntryResult!9703)

(assert (=> b!1038176 (= e!587269 Undefined!9703)))

(declare-fun d!125571 () Bool)

(declare-fun lt!457823 () SeekEntryResult!9703)

(assert (=> d!125571 (and (or ((_ is Undefined!9703) lt!457823) (not ((_ is Found!9703) lt!457823)) (and (bvsge (index!41184 lt!457823) #b00000000000000000000000000000000) (bvslt (index!41184 lt!457823) (size!31976 (_keys!11496 lt!457298))))) (or ((_ is Undefined!9703) lt!457823) ((_ is Found!9703) lt!457823) (not ((_ is MissingZero!9703) lt!457823)) (and (bvsge (index!41183 lt!457823) #b00000000000000000000000000000000) (bvslt (index!41183 lt!457823) (size!31976 (_keys!11496 lt!457298))))) (or ((_ is Undefined!9703) lt!457823) ((_ is Found!9703) lt!457823) ((_ is MissingZero!9703) lt!457823) (not ((_ is MissingVacant!9703) lt!457823)) (and (bvsge (index!41186 lt!457823) #b00000000000000000000000000000000) (bvslt (index!41186 lt!457823) (size!31976 (_keys!11496 lt!457298))))) (or ((_ is Undefined!9703) lt!457823) (ite ((_ is Found!9703) lt!457823) (= (select (arr!31447 (_keys!11496 lt!457298)) (index!41184 lt!457823)) (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9703) lt!457823) (= (select (arr!31447 (_keys!11496 lt!457298)) (index!41183 lt!457823)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9703) lt!457823) (= (select (arr!31447 (_keys!11496 lt!457298)) (index!41186 lt!457823)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!125571 (= lt!457823 e!587269)))

(declare-fun c!105432 () Bool)

(assert (=> d!125571 (= c!105432 (and ((_ is Intermediate!9703) lt!457821) (undefined!10515 lt!457821)))))

(assert (=> d!125571 (= lt!457821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000) (mask!30230 lt!457298)) (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000) (_keys!11496 lt!457298) (mask!30230 lt!457298)))))

(assert (=> d!125571 (validMask!0 (mask!30230 lt!457298))))

(assert (=> d!125571 (= (seekEntryOrOpen!0 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000) (_keys!11496 lt!457298) (mask!30230 lt!457298)) lt!457823)))

(declare-fun b!1038177 () Bool)

(declare-fun c!105433 () Bool)

(declare-fun lt!457822 () (_ BitVec 64))

(assert (=> b!1038177 (= c!105433 (= lt!457822 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587271 () SeekEntryResult!9703)

(assert (=> b!1038177 (= e!587271 e!587270)))

(declare-fun b!1038178 () Bool)

(assert (=> b!1038178 (= e!587269 e!587271)))

(assert (=> b!1038178 (= lt!457822 (select (arr!31447 (_keys!11496 lt!457298)) (index!41185 lt!457821)))))

(declare-fun c!105431 () Bool)

(assert (=> b!1038178 (= c!105431 (= lt!457822 (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000)))))

(declare-fun b!1038179 () Bool)

(assert (=> b!1038179 (= e!587271 (Found!9703 (index!41185 lt!457821)))))

(declare-fun b!1038180 () Bool)

(assert (=> b!1038180 (= e!587270 (seekKeyOrZeroReturnVacant!0 (x!92451 lt!457821) (index!41185 lt!457821) (index!41185 lt!457821) (select (arr!31447 (_keys!11496 lt!457298)) #b00000000000000000000000000000000) (_keys!11496 lt!457298) (mask!30230 lt!457298)))))

(assert (= (and d!125571 c!105432) b!1038176))

(assert (= (and d!125571 (not c!105432)) b!1038178))

(assert (= (and b!1038178 c!105431) b!1038179))

(assert (= (and b!1038178 (not c!105431)) b!1038177))

(assert (= (and b!1038177 c!105433) b!1038175))

(assert (= (and b!1038177 (not c!105433)) b!1038180))

(declare-fun m!958835 () Bool)

(assert (=> d!125571 m!958835))

(assert (=> d!125571 m!957663))

(declare-fun m!958837 () Bool)

(assert (=> d!125571 m!958837))

(assert (=> d!125571 m!957669))

(declare-fun m!958839 () Bool)

(assert (=> d!125571 m!958839))

(declare-fun m!958841 () Bool)

(assert (=> d!125571 m!958841))

(declare-fun m!958843 () Bool)

(assert (=> d!125571 m!958843))

(assert (=> d!125571 m!957669))

(assert (=> d!125571 m!958837))

(declare-fun m!958845 () Bool)

(assert (=> b!1038178 m!958845))

(assert (=> b!1038180 m!957669))

(declare-fun m!958847 () Bool)

(assert (=> b!1038180 m!958847))

(assert (=> b!1037542 d!125571))

(declare-fun d!125573 () Bool)

(declare-fun e!587272 () Bool)

(assert (=> d!125573 e!587272))

(declare-fun res!692462 () Bool)

(assert (=> d!125573 (=> (not res!692462) (not e!587272))))

(declare-fun lt!457825 () ListLongMap!13763)

(assert (=> d!125573 (= res!692462 (contains!6046 lt!457825 (_1!7875 (ite (or c!105210 c!105211) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!457298)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298))))))))

(declare-fun lt!457827 () List!21902)

(assert (=> d!125573 (= lt!457825 (ListLongMap!13764 lt!457827))))

(declare-fun lt!457826 () Unit!33898)

(declare-fun lt!457824 () Unit!33898)

(assert (=> d!125573 (= lt!457826 lt!457824)))

(assert (=> d!125573 (= (getValueByKey!585 lt!457827 (_1!7875 (ite (or c!105210 c!105211) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!457298)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298))))) (Some!635 (_2!7875 (ite (or c!105210 c!105211) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!457298)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298))))))))

(assert (=> d!125573 (= lt!457824 (lemmaContainsTupThenGetReturnValue!281 lt!457827 (_1!7875 (ite (or c!105210 c!105211) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!457298)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298)))) (_2!7875 (ite (or c!105210 c!105211) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!457298)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298))))))))

(assert (=> d!125573 (= lt!457827 (insertStrictlySorted!374 (toList!6897 (ite c!105210 call!43904 (ite c!105211 call!43902 call!43901))) (_1!7875 (ite (or c!105210 c!105211) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!457298)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298)))) (_2!7875 (ite (or c!105210 c!105211) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!457298)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298))))))))

(assert (=> d!125573 (= (+!3127 (ite c!105210 call!43904 (ite c!105211 call!43902 call!43901)) (ite (or c!105210 c!105211) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!457298)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298)))) lt!457825)))

(declare-fun b!1038181 () Bool)

(declare-fun res!692463 () Bool)

(assert (=> b!1038181 (=> (not res!692463) (not e!587272))))

(assert (=> b!1038181 (= res!692463 (= (getValueByKey!585 (toList!6897 lt!457825) (_1!7875 (ite (or c!105210 c!105211) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!457298)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298))))) (Some!635 (_2!7875 (ite (or c!105210 c!105211) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!457298)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298)))))))))

(declare-fun b!1038182 () Bool)

(assert (=> b!1038182 (= e!587272 (contains!6047 (toList!6897 lt!457825) (ite (or c!105210 c!105211) (tuple2!15729 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6103 lt!457298)) (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 lt!457298)))))))

(assert (= (and d!125573 res!692462) b!1038181))

(assert (= (and b!1038181 res!692463) b!1038182))

(declare-fun m!958849 () Bool)

(assert (=> d!125573 m!958849))

(declare-fun m!958851 () Bool)

(assert (=> d!125573 m!958851))

(declare-fun m!958853 () Bool)

(assert (=> d!125573 m!958853))

(declare-fun m!958855 () Bool)

(assert (=> d!125573 m!958855))

(declare-fun m!958857 () Bool)

(assert (=> b!1038181 m!958857))

(declare-fun m!958859 () Bool)

(assert (=> b!1038182 m!958859))

(assert (=> bm!43899 d!125573))

(assert (=> b!1037562 d!125235))

(assert (=> d!125133 d!125127))

(assert (=> d!125133 d!125141))

(declare-fun d!125575 () Bool)

(assert (=> d!125575 (contains!6046 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))) lt!457402)))

(assert (=> d!125575 true))

(declare-fun _$35!443 () Unit!33898)

(assert (=> d!125575 (= (choose!1708 lt!457393 lt!457397 (zeroValue!6103 thiss!1427) lt!457402) _$35!443)))

(declare-fun bs!30386 () Bool)

(assert (= bs!30386 d!125575))

(assert (=> bs!30386 m!957447))

(assert (=> bs!30386 m!957447))

(assert (=> bs!30386 m!957467))

(assert (=> d!125133 d!125575))

(declare-fun d!125577 () Bool)

(declare-fun e!587273 () Bool)

(assert (=> d!125577 e!587273))

(declare-fun res!692464 () Bool)

(assert (=> d!125577 (=> res!692464 e!587273)))

(declare-fun lt!457831 () Bool)

(assert (=> d!125577 (= res!692464 (not lt!457831))))

(declare-fun lt!457828 () Bool)

(assert (=> d!125577 (= lt!457831 lt!457828)))

(declare-fun lt!457830 () Unit!33898)

(declare-fun e!587274 () Unit!33898)

(assert (=> d!125577 (= lt!457830 e!587274)))

(declare-fun c!105434 () Bool)

(assert (=> d!125577 (= c!105434 lt!457828)))

(assert (=> d!125577 (= lt!457828 (containsKey!566 (toList!6897 lt!457393) lt!457402))))

(assert (=> d!125577 (= (contains!6046 lt!457393 lt!457402) lt!457831)))

(declare-fun b!1038183 () Bool)

(declare-fun lt!457829 () Unit!33898)

(assert (=> b!1038183 (= e!587274 lt!457829)))

(assert (=> b!1038183 (= lt!457829 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457393) lt!457402))))

(assert (=> b!1038183 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457393) lt!457402))))

(declare-fun b!1038184 () Bool)

(declare-fun Unit!33937 () Unit!33898)

(assert (=> b!1038184 (= e!587274 Unit!33937)))

(declare-fun b!1038185 () Bool)

(assert (=> b!1038185 (= e!587273 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457393) lt!457402)))))

(assert (= (and d!125577 c!105434) b!1038183))

(assert (= (and d!125577 (not c!105434)) b!1038184))

(assert (= (and d!125577 (not res!692464)) b!1038185))

(declare-fun m!958861 () Bool)

(assert (=> d!125577 m!958861))

(declare-fun m!958863 () Bool)

(assert (=> b!1038183 m!958863))

(declare-fun m!958865 () Bool)

(assert (=> b!1038183 m!958865))

(assert (=> b!1038183 m!958865))

(declare-fun m!958867 () Bool)

(assert (=> b!1038183 m!958867))

(assert (=> b!1038185 m!958865))

(assert (=> b!1038185 m!958865))

(assert (=> b!1038185 m!958867))

(assert (=> d!125133 d!125577))

(declare-fun d!125579 () Bool)

(declare-fun res!692465 () Bool)

(declare-fun e!587275 () Bool)

(assert (=> d!125579 (=> res!692465 e!587275)))

(assert (=> d!125579 (= res!692465 (and ((_ is Cons!21898) lt!457491) (= (_1!7875 (h!23109 lt!457491)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125579 (= (containsKey!566 lt!457491 #b1000000000000000000000000000000000000000000000000000000000000000) e!587275)))

(declare-fun b!1038186 () Bool)

(declare-fun e!587276 () Bool)

(assert (=> b!1038186 (= e!587275 e!587276)))

(declare-fun res!692466 () Bool)

(assert (=> b!1038186 (=> (not res!692466) (not e!587276))))

(assert (=> b!1038186 (= res!692466 (and (or (not ((_ is Cons!21898) lt!457491)) (bvsle (_1!7875 (h!23109 lt!457491)) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21898) lt!457491) (bvslt (_1!7875 (h!23109 lt!457491)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1038187 () Bool)

(assert (=> b!1038187 (= e!587276 (containsKey!566 (t!31099 lt!457491) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125579 (not res!692465)) b!1038186))

(assert (= (and b!1038186 res!692466) b!1038187))

(declare-fun m!958869 () Bool)

(assert (=> b!1038187 m!958869))

(assert (=> b!1037444 d!125579))

(declare-fun b!1038188 () Bool)

(declare-fun e!587277 () Option!636)

(assert (=> b!1038188 (= e!587277 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457493)))))))

(declare-fun d!125581 () Bool)

(declare-fun c!105435 () Bool)

(assert (=> d!125581 (= c!105435 (and ((_ is Cons!21898) (toList!6897 lt!457493)) (= (_1!7875 (h!23109 (toList!6897 lt!457493))) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297)))))))

(assert (=> d!125581 (= (getValueByKey!585 (toList!6897 lt!457493) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))) e!587277)))

(declare-fun b!1038189 () Bool)

(declare-fun e!587278 () Option!636)

(assert (=> b!1038189 (= e!587277 e!587278)))

(declare-fun c!105436 () Bool)

(assert (=> b!1038189 (= c!105436 (and ((_ is Cons!21898) (toList!6897 lt!457493)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457493))) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))))

(declare-fun b!1038190 () Bool)

(assert (=> b!1038190 (= e!587278 (getValueByKey!585 (t!31099 (toList!6897 lt!457493)) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 lt!457297))))))

(declare-fun b!1038191 () Bool)

(assert (=> b!1038191 (= e!587278 None!634)))

(assert (= (and d!125581 c!105435) b!1038188))

(assert (= (and d!125581 (not c!105435)) b!1038189))

(assert (= (and b!1038189 c!105436) b!1038190))

(assert (= (and b!1038189 (not c!105436)) b!1038191))

(declare-fun m!958871 () Bool)

(assert (=> b!1038190 m!958871))

(assert (=> b!1037446 d!125581))

(declare-fun d!125583 () Bool)

(declare-fun lt!457832 () (_ BitVec 32))

(assert (=> d!125583 (and (bvsge lt!457832 #b00000000000000000000000000000000) (bvsle lt!457832 (bvsub (size!31976 (_keys!11496 lt!457298)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!587279 () (_ BitVec 32))

(assert (=> d!125583 (= lt!457832 e!587279)))

(declare-fun c!105438 () Bool)

(assert (=> d!125583 (= c!105438 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 lt!457298))))))

(assert (=> d!125583 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 lt!457298))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31976 (_keys!11496 lt!457298)) (size!31976 (_keys!11496 lt!457298))))))

(assert (=> d!125583 (= (arrayCountValidKeys!0 (_keys!11496 lt!457298) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 lt!457298))) lt!457832)))

(declare-fun b!1038192 () Bool)

(declare-fun e!587280 () (_ BitVec 32))

(declare-fun call!43962 () (_ BitVec 32))

(assert (=> b!1038192 (= e!587280 (bvadd #b00000000000000000000000000000001 call!43962))))

(declare-fun bm!43959 () Bool)

(assert (=> bm!43959 (= call!43962 (arrayCountValidKeys!0 (_keys!11496 lt!457298) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31976 (_keys!11496 lt!457298))))))

(declare-fun b!1038193 () Bool)

(assert (=> b!1038193 (= e!587280 call!43962)))

(declare-fun b!1038194 () Bool)

(assert (=> b!1038194 (= e!587279 #b00000000000000000000000000000000)))

(declare-fun b!1038195 () Bool)

(assert (=> b!1038195 (= e!587279 e!587280)))

(declare-fun c!105437 () Bool)

(assert (=> b!1038195 (= c!105437 (validKeyInArray!0 (select (arr!31447 (_keys!11496 lt!457298)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!125583 c!105438) b!1038194))

(assert (= (and d!125583 (not c!105438)) b!1038195))

(assert (= (and b!1038195 c!105437) b!1038192))

(assert (= (and b!1038195 (not c!105437)) b!1038193))

(assert (= (or b!1038192 b!1038193) bm!43959))

(declare-fun m!958873 () Bool)

(assert (=> bm!43959 m!958873))

(assert (=> b!1038195 m!958291))

(assert (=> b!1038195 m!958291))

(assert (=> b!1038195 m!958293))

(assert (=> bm!43905 d!125583))

(declare-fun d!125585 () Bool)

(assert (=> d!125585 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457385) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun lt!457833 () Unit!33898)

(assert (=> d!125585 (= lt!457833 (choose!1710 (toList!6897 lt!457385) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!587281 () Bool)

(assert (=> d!125585 e!587281))

(declare-fun res!692467 () Bool)

(assert (=> d!125585 (=> (not res!692467) (not e!587281))))

(assert (=> d!125585 (= res!692467 (isStrictlySorted!707 (toList!6897 lt!457385)))))

(assert (=> d!125585 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457385) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) lt!457833)))

(declare-fun b!1038196 () Bool)

(assert (=> b!1038196 (= e!587281 (containsKey!566 (toList!6897 lt!457385) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125585 res!692467) b!1038196))

(assert (=> d!125585 m!957361))

(assert (=> d!125585 m!957875))

(assert (=> d!125585 m!957875))

(assert (=> d!125585 m!957911))

(assert (=> d!125585 m!957361))

(declare-fun m!958875 () Bool)

(assert (=> d!125585 m!958875))

(assert (=> d!125585 m!958139))

(assert (=> b!1038196 m!957361))

(assert (=> b!1038196 m!957907))

(assert (=> b!1037568 d!125585))

(assert (=> b!1037568 d!125405))

(assert (=> b!1037568 d!125407))

(assert (=> b!1037508 d!125083))

(declare-fun d!125587 () Bool)

(assert (=> d!125587 (not (contains!6046 (+!3127 lt!457530 (tuple2!15729 lt!457534 lt!457532)) lt!457533))))

(declare-fun lt!457834 () Unit!33898)

(assert (=> d!125587 (= lt!457834 (choose!1711 lt!457530 lt!457534 lt!457532 lt!457533))))

(declare-fun e!587282 () Bool)

(assert (=> d!125587 e!587282))

(declare-fun res!692468 () Bool)

(assert (=> d!125587 (=> (not res!692468) (not e!587282))))

(assert (=> d!125587 (= res!692468 (not (contains!6046 lt!457530 lt!457533)))))

(assert (=> d!125587 (= (addStillNotContains!245 lt!457530 lt!457534 lt!457532 lt!457533) lt!457834)))

(declare-fun b!1038197 () Bool)

(assert (=> b!1038197 (= e!587282 (not (= lt!457534 lt!457533)))))

(assert (= (and d!125587 res!692468) b!1038197))

(assert (=> d!125587 m!957755))

(assert (=> d!125587 m!957755))

(assert (=> d!125587 m!957757))

(declare-fun m!958877 () Bool)

(assert (=> d!125587 m!958877))

(declare-fun m!958879 () Bool)

(assert (=> d!125587 m!958879))

(assert (=> b!1037508 d!125587))

(declare-fun d!125589 () Bool)

(declare-fun e!587283 () Bool)

(assert (=> d!125589 e!587283))

(declare-fun res!692469 () Bool)

(assert (=> d!125589 (=> res!692469 e!587283)))

(declare-fun lt!457838 () Bool)

(assert (=> d!125589 (= res!692469 (not lt!457838))))

(declare-fun lt!457835 () Bool)

(assert (=> d!125589 (= lt!457838 lt!457835)))

(declare-fun lt!457837 () Unit!33898)

(declare-fun e!587284 () Unit!33898)

(assert (=> d!125589 (= lt!457837 e!587284)))

(declare-fun c!105439 () Bool)

(assert (=> d!125589 (= c!105439 lt!457835)))

(assert (=> d!125589 (= lt!457835 (containsKey!566 (toList!6897 (+!3127 lt!457530 (tuple2!15729 lt!457534 lt!457532))) lt!457533))))

(assert (=> d!125589 (= (contains!6046 (+!3127 lt!457530 (tuple2!15729 lt!457534 lt!457532)) lt!457533) lt!457838)))

(declare-fun b!1038198 () Bool)

(declare-fun lt!457836 () Unit!33898)

(assert (=> b!1038198 (= e!587284 lt!457836)))

(assert (=> b!1038198 (= lt!457836 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 (+!3127 lt!457530 (tuple2!15729 lt!457534 lt!457532))) lt!457533))))

(assert (=> b!1038198 (isDefined!435 (getValueByKey!585 (toList!6897 (+!3127 lt!457530 (tuple2!15729 lt!457534 lt!457532))) lt!457533))))

(declare-fun b!1038199 () Bool)

(declare-fun Unit!33938 () Unit!33898)

(assert (=> b!1038199 (= e!587284 Unit!33938)))

(declare-fun b!1038200 () Bool)

(assert (=> b!1038200 (= e!587283 (isDefined!435 (getValueByKey!585 (toList!6897 (+!3127 lt!457530 (tuple2!15729 lt!457534 lt!457532))) lt!457533)))))

(assert (= (and d!125589 c!105439) b!1038198))

(assert (= (and d!125589 (not c!105439)) b!1038199))

(assert (= (and d!125589 (not res!692469)) b!1038200))

(declare-fun m!958881 () Bool)

(assert (=> d!125589 m!958881))

(declare-fun m!958883 () Bool)

(assert (=> b!1038198 m!958883))

(declare-fun m!958885 () Bool)

(assert (=> b!1038198 m!958885))

(assert (=> b!1038198 m!958885))

(declare-fun m!958887 () Bool)

(assert (=> b!1038198 m!958887))

(assert (=> b!1038200 m!958885))

(assert (=> b!1038200 m!958885))

(assert (=> b!1038200 m!958887))

(assert (=> b!1037508 d!125589))

(declare-fun d!125591 () Bool)

(declare-fun e!587285 () Bool)

(assert (=> d!125591 e!587285))

(declare-fun res!692470 () Bool)

(assert (=> d!125591 (=> (not res!692470) (not e!587285))))

(declare-fun lt!457840 () ListLongMap!13763)

(assert (=> d!125591 (= res!692470 (contains!6046 lt!457840 (_1!7875 (tuple2!15729 lt!457534 lt!457532))))))

(declare-fun lt!457842 () List!21902)

(assert (=> d!125591 (= lt!457840 (ListLongMap!13764 lt!457842))))

(declare-fun lt!457841 () Unit!33898)

(declare-fun lt!457839 () Unit!33898)

(assert (=> d!125591 (= lt!457841 lt!457839)))

(assert (=> d!125591 (= (getValueByKey!585 lt!457842 (_1!7875 (tuple2!15729 lt!457534 lt!457532))) (Some!635 (_2!7875 (tuple2!15729 lt!457534 lt!457532))))))

(assert (=> d!125591 (= lt!457839 (lemmaContainsTupThenGetReturnValue!281 lt!457842 (_1!7875 (tuple2!15729 lt!457534 lt!457532)) (_2!7875 (tuple2!15729 lt!457534 lt!457532))))))

(assert (=> d!125591 (= lt!457842 (insertStrictlySorted!374 (toList!6897 lt!457530) (_1!7875 (tuple2!15729 lt!457534 lt!457532)) (_2!7875 (tuple2!15729 lt!457534 lt!457532))))))

(assert (=> d!125591 (= (+!3127 lt!457530 (tuple2!15729 lt!457534 lt!457532)) lt!457840)))

(declare-fun b!1038201 () Bool)

(declare-fun res!692471 () Bool)

(assert (=> b!1038201 (=> (not res!692471) (not e!587285))))

(assert (=> b!1038201 (= res!692471 (= (getValueByKey!585 (toList!6897 lt!457840) (_1!7875 (tuple2!15729 lt!457534 lt!457532))) (Some!635 (_2!7875 (tuple2!15729 lt!457534 lt!457532)))))))

(declare-fun b!1038202 () Bool)

(assert (=> b!1038202 (= e!587285 (contains!6047 (toList!6897 lt!457840) (tuple2!15729 lt!457534 lt!457532)))))

(assert (= (and d!125591 res!692470) b!1038201))

(assert (= (and b!1038201 res!692471) b!1038202))

(declare-fun m!958889 () Bool)

(assert (=> d!125591 m!958889))

(declare-fun m!958891 () Bool)

(assert (=> d!125591 m!958891))

(declare-fun m!958893 () Bool)

(assert (=> d!125591 m!958893))

(declare-fun m!958895 () Bool)

(assert (=> d!125591 m!958895))

(declare-fun m!958897 () Bool)

(assert (=> b!1038201 m!958897))

(declare-fun m!958899 () Bool)

(assert (=> b!1038202 m!958899))

(assert (=> b!1037508 d!125591))

(declare-fun d!125593 () Bool)

(declare-fun e!587286 () Bool)

(assert (=> d!125593 e!587286))

(declare-fun res!692472 () Bool)

(assert (=> d!125593 (=> (not res!692472) (not e!587286))))

(declare-fun lt!457844 () ListLongMap!13763)

(assert (=> d!125593 (= res!692472 (contains!6046 lt!457844 (_1!7875 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!457846 () List!21902)

(assert (=> d!125593 (= lt!457844 (ListLongMap!13764 lt!457846))))

(declare-fun lt!457845 () Unit!33898)

(declare-fun lt!457843 () Unit!33898)

(assert (=> d!125593 (= lt!457845 lt!457843)))

(assert (=> d!125593 (= (getValueByKey!585 lt!457846 (_1!7875 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!635 (_2!7875 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!125593 (= lt!457843 (lemmaContainsTupThenGetReturnValue!281 lt!457846 (_1!7875 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7875 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!125593 (= lt!457846 (insertStrictlySorted!374 (toList!6897 call!43909) (_1!7875 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7875 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!125593 (= (+!3127 call!43909 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!457844)))

(declare-fun b!1038203 () Bool)

(declare-fun res!692473 () Bool)

(assert (=> b!1038203 (=> (not res!692473) (not e!587286))))

(assert (=> b!1038203 (= res!692473 (= (getValueByKey!585 (toList!6897 lt!457844) (_1!7875 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!635 (_2!7875 (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1038204 () Bool)

(assert (=> b!1038204 (= e!587286 (contains!6047 (toList!6897 lt!457844) (tuple2!15729 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000) (get!16492 (select (arr!31448 (_values!6292 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2014 (defaultEntry!6269 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!125593 res!692472) b!1038203))

(assert (= (and b!1038203 res!692473) b!1038204))

(declare-fun m!958901 () Bool)

(assert (=> d!125593 m!958901))

(declare-fun m!958903 () Bool)

(assert (=> d!125593 m!958903))

(declare-fun m!958905 () Bool)

(assert (=> d!125593 m!958905))

(declare-fun m!958907 () Bool)

(assert (=> d!125593 m!958907))

(declare-fun m!958909 () Bool)

(assert (=> b!1038203 m!958909))

(declare-fun m!958911 () Bool)

(assert (=> b!1038204 m!958911))

(assert (=> b!1037508 d!125593))

(assert (=> d!125113 d!125117))

(assert (=> d!125113 d!125119))

(declare-fun d!125595 () Bool)

(assert (=> d!125595 (= (apply!916 (+!3127 lt!457405 (tuple2!15729 lt!457400 lt!457297)) lt!457395) (apply!916 lt!457405 lt!457395))))

(assert (=> d!125595 true))

(declare-fun _$34!1176 () Unit!33898)

(assert (=> d!125595 (= (choose!1707 lt!457405 lt!457400 lt!457297 lt!457395) _$34!1176)))

(declare-fun bs!30387 () Bool)

(assert (= bs!30387 d!125595))

(assert (=> bs!30387 m!957455))

(assert (=> bs!30387 m!957455))

(assert (=> bs!30387 m!957457))

(assert (=> bs!30387 m!957459))

(assert (=> d!125113 d!125595))

(assert (=> d!125113 d!125135))

(declare-fun d!125597 () Bool)

(declare-fun e!587287 () Bool)

(assert (=> d!125597 e!587287))

(declare-fun res!692474 () Bool)

(assert (=> d!125597 (=> res!692474 e!587287)))

(declare-fun lt!457850 () Bool)

(assert (=> d!125597 (= res!692474 (not lt!457850))))

(declare-fun lt!457847 () Bool)

(assert (=> d!125597 (= lt!457850 lt!457847)))

(declare-fun lt!457849 () Unit!33898)

(declare-fun e!587288 () Unit!33898)

(assert (=> d!125597 (= lt!457849 e!587288)))

(declare-fun c!105440 () Bool)

(assert (=> d!125597 (= c!105440 lt!457847)))

(assert (=> d!125597 (= lt!457847 (containsKey!566 (toList!6897 lt!457405) lt!457395))))

(assert (=> d!125597 (= (contains!6046 lt!457405 lt!457395) lt!457850)))

(declare-fun b!1038205 () Bool)

(declare-fun lt!457848 () Unit!33898)

(assert (=> b!1038205 (= e!587288 lt!457848)))

(assert (=> b!1038205 (= lt!457848 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457405) lt!457395))))

(assert (=> b!1038205 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457405) lt!457395))))

(declare-fun b!1038206 () Bool)

(declare-fun Unit!33939 () Unit!33898)

(assert (=> b!1038206 (= e!587288 Unit!33939)))

(declare-fun b!1038207 () Bool)

(assert (=> b!1038207 (= e!587287 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457405) lt!457395)))))

(assert (= (and d!125597 c!105440) b!1038205))

(assert (= (and d!125597 (not c!105440)) b!1038206))

(assert (= (and d!125597 (not res!692474)) b!1038207))

(declare-fun m!958913 () Bool)

(assert (=> d!125597 m!958913))

(declare-fun m!958915 () Bool)

(assert (=> b!1038205 m!958915))

(assert (=> b!1038205 m!957769))

(assert (=> b!1038205 m!957769))

(declare-fun m!958917 () Bool)

(assert (=> b!1038205 m!958917))

(assert (=> b!1038207 m!957769))

(assert (=> b!1038207 m!957769))

(assert (=> b!1038207 m!958917))

(assert (=> d!125113 d!125597))

(assert (=> b!1037460 d!125275))

(declare-fun d!125599 () Bool)

(declare-fun lt!457851 () Bool)

(assert (=> d!125599 (= lt!457851 (select (content!518 Nil!21902) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!587289 () Bool)

(assert (=> d!125599 (= lt!457851 e!587289)))

(declare-fun res!692476 () Bool)

(assert (=> d!125599 (=> (not res!692476) (not e!587289))))

(assert (=> d!125599 (= res!692476 ((_ is Cons!21901) Nil!21902))))

(assert (=> d!125599 (= (contains!6048 Nil!21902 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) lt!457851)))

(declare-fun b!1038208 () Bool)

(declare-fun e!587290 () Bool)

(assert (=> b!1038208 (= e!587289 e!587290)))

(declare-fun res!692475 () Bool)

(assert (=> b!1038208 (=> res!692475 e!587290)))

(assert (=> b!1038208 (= res!692475 (= (h!23112 Nil!21902) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1038209 () Bool)

(assert (=> b!1038209 (= e!587290 (contains!6048 (t!31108 Nil!21902) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125599 res!692476) b!1038208))

(assert (= (and b!1038208 (not res!692475)) b!1038209))

(assert (=> d!125599 m!958277))

(assert (=> d!125599 m!957361))

(declare-fun m!958919 () Bool)

(assert (=> d!125599 m!958919))

(assert (=> b!1038209 m!957361))

(declare-fun m!958921 () Bool)

(assert (=> b!1038209 m!958921))

(assert (=> b!1037576 d!125599))

(assert (=> bm!43906 d!125217))

(declare-fun b!1038210 () Bool)

(declare-fun e!587291 () Option!636)

(assert (=> b!1038210 (= e!587291 (Some!635 (_2!7875 (h!23109 (toList!6897 lt!457465)))))))

(declare-fun c!105441 () Bool)

(declare-fun d!125601 () Bool)

(assert (=> d!125601 (= c!105441 (and ((_ is Cons!21898) (toList!6897 lt!457465)) (= (_1!7875 (h!23109 (toList!6897 lt!457465))) (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427))))))))

(assert (=> d!125601 (= (getValueByKey!585 (toList!6897 lt!457465) (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))) e!587291)))

(declare-fun b!1038211 () Bool)

(declare-fun e!587292 () Option!636)

(assert (=> b!1038211 (= e!587291 e!587292)))

(declare-fun c!105442 () Bool)

(assert (=> b!1038211 (= c!105442 (and ((_ is Cons!21898) (toList!6897 lt!457465)) (not (= (_1!7875 (h!23109 (toList!6897 lt!457465))) (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))))))))

(declare-fun b!1038212 () Bool)

(assert (=> b!1038212 (= e!587292 (getValueByKey!585 (t!31099 (toList!6897 lt!457465)) (_1!7875 (tuple2!15729 lt!457377 (minValue!6105 thiss!1427)))))))

(declare-fun b!1038213 () Bool)

(assert (=> b!1038213 (= e!587292 None!634)))

(assert (= (and d!125601 c!105441) b!1038210))

(assert (= (and d!125601 (not c!105441)) b!1038211))

(assert (= (and b!1038211 c!105442) b!1038212))

(assert (= (and b!1038211 (not c!105442)) b!1038213))

(declare-fun m!958923 () Bool)

(assert (=> b!1038212 m!958923))

(assert (=> b!1037409 d!125601))

(declare-fun d!125603 () Bool)

(declare-fun e!587293 () Bool)

(assert (=> d!125603 e!587293))

(declare-fun res!692477 () Bool)

(assert (=> d!125603 (=> res!692477 e!587293)))

(declare-fun lt!457855 () Bool)

(assert (=> d!125603 (= res!692477 (not lt!457855))))

(declare-fun lt!457852 () Bool)

(assert (=> d!125603 (= lt!457855 lt!457852)))

(declare-fun lt!457854 () Unit!33898)

(declare-fun e!587294 () Unit!33898)

(assert (=> d!125603 (= lt!457854 e!587294)))

(declare-fun c!105443 () Bool)

(assert (=> d!125603 (= c!105443 lt!457852)))

(assert (=> d!125603 (= lt!457852 (containsKey!566 (toList!6897 lt!457521) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125603 (= (contains!6046 lt!457521 #b0000000000000000000000000000000000000000000000000000000000000000) lt!457855)))

(declare-fun b!1038214 () Bool)

(declare-fun lt!457853 () Unit!33898)

(assert (=> b!1038214 (= e!587294 lt!457853)))

(assert (=> b!1038214 (= lt!457853 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457521) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1038214 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457521) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038215 () Bool)

(declare-fun Unit!33940 () Unit!33898)

(assert (=> b!1038215 (= e!587294 Unit!33940)))

(declare-fun b!1038216 () Bool)

(assert (=> b!1038216 (= e!587293 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457521) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125603 c!105443) b!1038214))

(assert (= (and d!125603 (not c!105443)) b!1038215))

(assert (= (and d!125603 (not res!692477)) b!1038216))

(declare-fun m!958925 () Bool)

(assert (=> d!125603 m!958925))

(declare-fun m!958927 () Bool)

(assert (=> b!1038214 m!958927))

(assert (=> b!1038214 m!958175))

(assert (=> b!1038214 m!958175))

(declare-fun m!958929 () Bool)

(assert (=> b!1038214 m!958929))

(assert (=> b!1038216 m!958175))

(assert (=> b!1038216 m!958175))

(assert (=> b!1038216 m!958929))

(assert (=> bm!43901 d!125603))

(declare-fun d!125605 () Bool)

(declare-fun e!587295 () Bool)

(assert (=> d!125605 e!587295))

(declare-fun res!692478 () Bool)

(assert (=> d!125605 (=> res!692478 e!587295)))

(declare-fun lt!457859 () Bool)

(assert (=> d!125605 (= res!692478 (not lt!457859))))

(declare-fun lt!457856 () Bool)

(assert (=> d!125605 (= lt!457859 lt!457856)))

(declare-fun lt!457858 () Unit!33898)

(declare-fun e!587296 () Unit!33898)

(assert (=> d!125605 (= lt!457858 e!587296)))

(declare-fun c!105444 () Bool)

(assert (=> d!125605 (= c!105444 lt!457856)))

(assert (=> d!125605 (= lt!457856 (containsKey!566 (toList!6897 lt!457444) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125605 (= (contains!6046 lt!457444 #b0000000000000000000000000000000000000000000000000000000000000000) lt!457859)))

(declare-fun b!1038217 () Bool)

(declare-fun lt!457857 () Unit!33898)

(assert (=> b!1038217 (= e!587296 lt!457857)))

(assert (=> b!1038217 (= lt!457857 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457444) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1038217 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457444) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038218 () Bool)

(declare-fun Unit!33941 () Unit!33898)

(assert (=> b!1038218 (= e!587296 Unit!33941)))

(declare-fun b!1038219 () Bool)

(assert (=> b!1038219 (= e!587295 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457444) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125605 c!105444) b!1038217))

(assert (= (and d!125605 (not c!105444)) b!1038218))

(assert (= (and d!125605 (not res!692478)) b!1038219))

(declare-fun m!958931 () Bool)

(assert (=> d!125605 m!958931))

(declare-fun m!958933 () Bool)

(assert (=> b!1038217 m!958933))

(declare-fun m!958935 () Bool)

(assert (=> b!1038217 m!958935))

(assert (=> b!1038217 m!958935))

(declare-fun m!958937 () Bool)

(assert (=> b!1038217 m!958937))

(assert (=> b!1038219 m!958935))

(assert (=> b!1038219 m!958935))

(assert (=> b!1038219 m!958937))

(assert (=> d!125045 d!125605))

(assert (=> d!125045 d!125077))

(assert (=> bm!43896 d!125361))

(declare-fun d!125607 () Bool)

(declare-fun res!692479 () Bool)

(declare-fun e!587297 () Bool)

(assert (=> d!125607 (=> res!692479 e!587297)))

(assert (=> d!125607 (= res!692479 (and ((_ is Cons!21898) (toList!6897 lt!457408)) (= (_1!7875 (h!23109 (toList!6897 lt!457408))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!125607 (= (containsKey!566 (toList!6897 lt!457408) #b1000000000000000000000000000000000000000000000000000000000000000) e!587297)))

(declare-fun b!1038220 () Bool)

(declare-fun e!587298 () Bool)

(assert (=> b!1038220 (= e!587297 e!587298)))

(declare-fun res!692480 () Bool)

(assert (=> b!1038220 (=> (not res!692480) (not e!587298))))

(assert (=> b!1038220 (= res!692480 (and (or (not ((_ is Cons!21898) (toList!6897 lt!457408))) (bvsle (_1!7875 (h!23109 (toList!6897 lt!457408))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21898) (toList!6897 lt!457408)) (bvslt (_1!7875 (h!23109 (toList!6897 lt!457408))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1038221 () Bool)

(assert (=> b!1038221 (= e!587298 (containsKey!566 (t!31099 (toList!6897 lt!457408)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125607 (not res!692479)) b!1038220))

(assert (= (and b!1038220 res!692480) b!1038221))

(declare-fun m!958939 () Bool)

(assert (=> b!1038221 m!958939))

(assert (=> d!125075 d!125607))

(declare-fun d!125609 () Bool)

(declare-fun res!692481 () Bool)

(declare-fun e!587299 () Bool)

(assert (=> d!125609 (=> res!692481 e!587299)))

(assert (=> d!125609 (= res!692481 (and ((_ is Cons!21898) (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))) (= (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))) lt!457402)))))

(assert (=> d!125609 (= (containsKey!566 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))) lt!457402) e!587299)))

(declare-fun b!1038222 () Bool)

(declare-fun e!587300 () Bool)

(assert (=> b!1038222 (= e!587299 e!587300)))

(declare-fun res!692482 () Bool)

(assert (=> b!1038222 (=> (not res!692482) (not e!587300))))

(assert (=> b!1038222 (= res!692482 (and (or (not ((_ is Cons!21898) (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))) (bvsle (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))) lt!457402)) ((_ is Cons!21898) (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))) (bvslt (_1!7875 (h!23109 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427)))))) lt!457402)))))

(declare-fun b!1038223 () Bool)

(assert (=> b!1038223 (= e!587300 (containsKey!566 (t!31099 (toList!6897 (+!3127 lt!457393 (tuple2!15729 lt!457397 (zeroValue!6103 thiss!1427))))) lt!457402))))

(assert (= (and d!125609 (not res!692481)) b!1038222))

(assert (= (and b!1038222 res!692482) b!1038223))

(declare-fun m!958941 () Bool)

(assert (=> b!1038223 m!958941))

(assert (=> d!125127 d!125609))

(assert (=> d!125129 d!125121))

(assert (=> d!125129 d!125125))

(assert (=> d!125129 d!125139))

(declare-fun d!125611 () Bool)

(declare-fun e!587301 () Bool)

(assert (=> d!125611 e!587301))

(declare-fun res!692483 () Bool)

(assert (=> d!125611 (=> res!692483 e!587301)))

(declare-fun lt!457863 () Bool)

(assert (=> d!125611 (= res!692483 (not lt!457863))))

(declare-fun lt!457860 () Bool)

(assert (=> d!125611 (= lt!457863 lt!457860)))

(declare-fun lt!457862 () Unit!33898)

(declare-fun e!587302 () Unit!33898)

(assert (=> d!125611 (= lt!457862 e!587302)))

(declare-fun c!105445 () Bool)

(assert (=> d!125611 (= c!105445 lt!457860)))

(assert (=> d!125611 (= lt!457860 (containsKey!566 (toList!6897 lt!457398) lt!457396))))

(assert (=> d!125611 (= (contains!6046 lt!457398 lt!457396) lt!457863)))

(declare-fun b!1038224 () Bool)

(declare-fun lt!457861 () Unit!33898)

(assert (=> b!1038224 (= e!587302 lt!457861)))

(assert (=> b!1038224 (= lt!457861 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457398) lt!457396))))

(assert (=> b!1038224 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457398) lt!457396))))

(declare-fun b!1038225 () Bool)

(declare-fun Unit!33942 () Unit!33898)

(assert (=> b!1038225 (= e!587302 Unit!33942)))

(declare-fun b!1038226 () Bool)

(assert (=> b!1038226 (= e!587301 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457398) lt!457396)))))

(assert (= (and d!125611 c!105445) b!1038224))

(assert (= (and d!125611 (not c!105445)) b!1038225))

(assert (= (and d!125611 (not res!692483)) b!1038226))

(declare-fun m!958943 () Bool)

(assert (=> d!125611 m!958943))

(declare-fun m!958945 () Bool)

(assert (=> b!1038224 m!958945))

(assert (=> b!1038224 m!957841))

(assert (=> b!1038224 m!957841))

(declare-fun m!958947 () Bool)

(assert (=> b!1038224 m!958947))

(assert (=> b!1038226 m!957841))

(assert (=> b!1038226 m!957841))

(assert (=> b!1038226 m!958947))

(assert (=> d!125129 d!125611))

(declare-fun d!125613 () Bool)

(assert (=> d!125613 (= (apply!916 (+!3127 lt!457398 (tuple2!15729 lt!457403 (zeroValue!6103 thiss!1427))) lt!457396) (apply!916 lt!457398 lt!457396))))

(assert (=> d!125613 true))

(declare-fun _$34!1177 () Unit!33898)

(assert (=> d!125613 (= (choose!1707 lt!457398 lt!457403 (zeroValue!6103 thiss!1427) lt!457396) _$34!1177)))

(declare-fun bs!30388 () Bool)

(assert (= bs!30388 d!125613))

(assert (=> bs!30388 m!957465))

(assert (=> bs!30388 m!957465))

(assert (=> bs!30388 m!957475))

(assert (=> bs!30388 m!957461))

(assert (=> d!125129 d!125613))

(declare-fun d!125615 () Bool)

(declare-fun e!587303 () Bool)

(assert (=> d!125615 e!587303))

(declare-fun res!692484 () Bool)

(assert (=> d!125615 (=> res!692484 e!587303)))

(declare-fun lt!457867 () Bool)

(assert (=> d!125615 (= res!692484 (not lt!457867))))

(declare-fun lt!457864 () Bool)

(assert (=> d!125615 (= lt!457867 lt!457864)))

(declare-fun lt!457866 () Unit!33898)

(declare-fun e!587304 () Unit!33898)

(assert (=> d!125615 (= lt!457866 e!587304)))

(declare-fun c!105446 () Bool)

(assert (=> d!125615 (= c!105446 lt!457864)))

(assert (=> d!125615 (= lt!457864 (containsKey!566 (toList!6897 lt!457574) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(assert (=> d!125615 (= (contains!6046 lt!457574 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) lt!457867)))

(declare-fun b!1038227 () Bool)

(declare-fun lt!457865 () Unit!33898)

(assert (=> b!1038227 (= e!587304 lt!457865)))

(assert (=> b!1038227 (= lt!457865 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457574) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(assert (=> b!1038227 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457574) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun b!1038228 () Bool)

(declare-fun Unit!33943 () Unit!33898)

(assert (=> b!1038228 (= e!587304 Unit!33943)))

(declare-fun b!1038229 () Bool)

(assert (=> b!1038229 (= e!587303 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457574) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (= (and d!125615 c!105446) b!1038227))

(assert (= (and d!125615 (not c!105446)) b!1038228))

(assert (= (and d!125615 (not res!692484)) b!1038229))

(declare-fun m!958949 () Bool)

(assert (=> d!125615 m!958949))

(declare-fun m!958951 () Bool)

(assert (=> b!1038227 m!958951))

(assert (=> b!1038227 m!957891))

(assert (=> b!1038227 m!957891))

(declare-fun m!958953 () Bool)

(assert (=> b!1038227 m!958953))

(assert (=> b!1038229 m!957891))

(assert (=> b!1038229 m!957891))

(assert (=> b!1038229 m!958953))

(assert (=> d!125155 d!125615))

(declare-fun b!1038230 () Bool)

(declare-fun e!587305 () Option!636)

(assert (=> b!1038230 (= e!587305 (Some!635 (_2!7875 (h!23109 lt!457576))))))

(declare-fun d!125617 () Bool)

(declare-fun c!105447 () Bool)

(assert (=> d!125617 (= c!105447 (and ((_ is Cons!21898) lt!457576) (= (_1!7875 (h!23109 lt!457576)) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (=> d!125617 (= (getValueByKey!585 lt!457576 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) e!587305)))

(declare-fun b!1038231 () Bool)

(declare-fun e!587306 () Option!636)

(assert (=> b!1038231 (= e!587305 e!587306)))

(declare-fun c!105448 () Bool)

(assert (=> b!1038231 (= c!105448 (and ((_ is Cons!21898) lt!457576) (not (= (_1!7875 (h!23109 lt!457576)) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(declare-fun b!1038232 () Bool)

(assert (=> b!1038232 (= e!587306 (getValueByKey!585 (t!31099 lt!457576) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun b!1038233 () Bool)

(assert (=> b!1038233 (= e!587306 None!634)))

(assert (= (and d!125617 c!105447) b!1038230))

(assert (= (and d!125617 (not c!105447)) b!1038231))

(assert (= (and b!1038231 c!105448) b!1038232))

(assert (= (and b!1038231 (not c!105448)) b!1038233))

(declare-fun m!958955 () Bool)

(assert (=> b!1038232 m!958955))

(assert (=> d!125155 d!125617))

(declare-fun d!125619 () Bool)

(assert (=> d!125619 (= (getValueByKey!585 lt!457576 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) (Some!635 (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun lt!457868 () Unit!33898)

(assert (=> d!125619 (= lt!457868 (choose!1709 lt!457576 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun e!587307 () Bool)

(assert (=> d!125619 e!587307))

(declare-fun res!692485 () Bool)

(assert (=> d!125619 (=> (not res!692485) (not e!587307))))

(assert (=> d!125619 (= res!692485 (isStrictlySorted!707 lt!457576))))

(assert (=> d!125619 (= (lemmaContainsTupThenGetReturnValue!281 lt!457576 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) lt!457868)))

(declare-fun b!1038234 () Bool)

(declare-fun res!692486 () Bool)

(assert (=> b!1038234 (=> (not res!692486) (not e!587307))))

(assert (=> b!1038234 (= res!692486 (containsKey!566 lt!457576 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun b!1038235 () Bool)

(assert (=> b!1038235 (= e!587307 (contains!6047 lt!457576 (tuple2!15729 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (= (and d!125619 res!692485) b!1038234))

(assert (= (and b!1038234 res!692486) b!1038235))

(assert (=> d!125619 m!957885))

(declare-fun m!958957 () Bool)

(assert (=> d!125619 m!958957))

(declare-fun m!958959 () Bool)

(assert (=> d!125619 m!958959))

(declare-fun m!958961 () Bool)

(assert (=> b!1038234 m!958961))

(declare-fun m!958963 () Bool)

(assert (=> b!1038235 m!958963))

(assert (=> d!125155 d!125619))

(declare-fun b!1038236 () Bool)

(declare-fun res!692487 () Bool)

(declare-fun e!587312 () Bool)

(assert (=> b!1038236 (=> (not res!692487) (not e!587312))))

(declare-fun lt!457869 () List!21902)

(assert (=> b!1038236 (= res!692487 (containsKey!566 lt!457869 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun b!1038237 () Bool)

(declare-fun c!105450 () Bool)

(assert (=> b!1038237 (= c!105450 (and ((_ is Cons!21898) (toList!6897 call!43883)) (bvsgt (_1!7875 (h!23109 (toList!6897 call!43883))) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun e!587308 () List!21902)

(declare-fun e!587310 () List!21902)

(assert (=> b!1038237 (= e!587308 e!587310)))

(declare-fun b!1038238 () Bool)

(declare-fun e!587309 () List!21902)

(assert (=> b!1038238 (= e!587309 (insertStrictlySorted!374 (t!31099 (toList!6897 call!43883)) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))

(declare-fun b!1038239 () Bool)

(assert (=> b!1038239 (= e!587312 (contains!6047 lt!457869 (tuple2!15729 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun bm!43961 () Bool)

(declare-fun call!43964 () List!21902)

(declare-fun call!43963 () List!21902)

(assert (=> bm!43961 (= call!43964 call!43963)))

(declare-fun b!1038240 () Bool)

(assert (=> b!1038240 (= e!587310 call!43964)))

(declare-fun b!1038241 () Bool)

(declare-fun e!587311 () List!21902)

(declare-fun call!43965 () List!21902)

(assert (=> b!1038241 (= e!587311 call!43965)))

(declare-fun bm!43962 () Bool)

(assert (=> bm!43962 (= call!43963 call!43965)))

(declare-fun b!1038242 () Bool)

(assert (=> b!1038242 (= e!587308 call!43963)))

(declare-fun b!1038243 () Bool)

(assert (=> b!1038243 (= e!587310 call!43964)))

(declare-fun c!105451 () Bool)

(declare-fun b!1038244 () Bool)

(assert (=> b!1038244 (= e!587309 (ite c!105451 (t!31099 (toList!6897 call!43883)) (ite c!105450 (Cons!21898 (h!23109 (toList!6897 call!43883)) (t!31099 (toList!6897 call!43883))) Nil!21899)))))

(declare-fun b!1038245 () Bool)

(assert (=> b!1038245 (= e!587311 e!587308)))

(assert (=> b!1038245 (= c!105451 (and ((_ is Cons!21898) (toList!6897 call!43883)) (= (_1!7875 (h!23109 (toList!6897 call!43883))) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(declare-fun bm!43960 () Bool)

(declare-fun c!105452 () Bool)

(assert (=> bm!43960 (= call!43965 ($colon$colon!604 e!587309 (ite c!105452 (h!23109 (toList!6897 call!43883)) (tuple2!15729 (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))))))))

(declare-fun c!105449 () Bool)

(assert (=> bm!43960 (= c!105449 c!105452)))

(declare-fun d!125621 () Bool)

(assert (=> d!125621 e!587312))

(declare-fun res!692488 () Bool)

(assert (=> d!125621 (=> (not res!692488) (not e!587312))))

(assert (=> d!125621 (= res!692488 (isStrictlySorted!707 lt!457869))))

(assert (=> d!125621 (= lt!457869 e!587311)))

(assert (=> d!125621 (= c!105452 (and ((_ is Cons!21898) (toList!6897 call!43883)) (bvslt (_1!7875 (h!23109 (toList!6897 call!43883))) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))))))))

(assert (=> d!125621 (isStrictlySorted!707 (toList!6897 call!43883))))

(assert (=> d!125621 (= (insertStrictlySorted!374 (toList!6897 call!43883) (_1!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427))) (_2!7875 (tuple2!15729 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6105 thiss!1427)))) lt!457869)))

(assert (= (and d!125621 c!105452) b!1038241))

(assert (= (and d!125621 (not c!105452)) b!1038245))

(assert (= (and b!1038245 c!105451) b!1038242))

(assert (= (and b!1038245 (not c!105451)) b!1038237))

(assert (= (and b!1038237 c!105450) b!1038243))

(assert (= (and b!1038237 (not c!105450)) b!1038240))

(assert (= (or b!1038243 b!1038240) bm!43961))

(assert (= (or b!1038242 bm!43961) bm!43962))

(assert (= (or b!1038241 bm!43962) bm!43960))

(assert (= (and bm!43960 c!105449) b!1038238))

(assert (= (and bm!43960 (not c!105449)) b!1038244))

(assert (= (and d!125621 res!692488) b!1038236))

(assert (= (and b!1038236 res!692487) b!1038239))

(declare-fun m!958965 () Bool)

(assert (=> b!1038238 m!958965))

(declare-fun m!958967 () Bool)

(assert (=> bm!43960 m!958967))

(declare-fun m!958969 () Bool)

(assert (=> b!1038236 m!958969))

(declare-fun m!958971 () Bool)

(assert (=> b!1038239 m!958971))

(declare-fun m!958973 () Bool)

(assert (=> d!125621 m!958973))

(declare-fun m!958975 () Bool)

(assert (=> d!125621 m!958975))

(assert (=> d!125155 d!125621))

(declare-fun d!125623 () Bool)

(declare-fun e!587313 () Bool)

(assert (=> d!125623 e!587313))

(declare-fun res!692489 () Bool)

(assert (=> d!125623 (=> res!692489 e!587313)))

(declare-fun lt!457873 () Bool)

(assert (=> d!125623 (= res!692489 (not lt!457873))))

(declare-fun lt!457870 () Bool)

(assert (=> d!125623 (= lt!457873 lt!457870)))

(declare-fun lt!457872 () Unit!33898)

(declare-fun e!587314 () Unit!33898)

(assert (=> d!125623 (= lt!457872 e!587314)))

(declare-fun c!105453 () Bool)

(assert (=> d!125623 (= c!105453 lt!457870)))

(assert (=> d!125623 (= lt!457870 (containsKey!566 (toList!6897 lt!457549) (_1!7875 (tuple2!15729 lt!457400 lt!457297))))))

(assert (=> d!125623 (= (contains!6046 lt!457549 (_1!7875 (tuple2!15729 lt!457400 lt!457297))) lt!457873)))

(declare-fun b!1038246 () Bool)

(declare-fun lt!457871 () Unit!33898)

(assert (=> b!1038246 (= e!587314 lt!457871)))

(assert (=> b!1038246 (= lt!457871 (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457549) (_1!7875 (tuple2!15729 lt!457400 lt!457297))))))

(assert (=> b!1038246 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457549) (_1!7875 (tuple2!15729 lt!457400 lt!457297))))))

(declare-fun b!1038247 () Bool)

(declare-fun Unit!33944 () Unit!33898)

(assert (=> b!1038247 (= e!587314 Unit!33944)))

(declare-fun b!1038248 () Bool)

(assert (=> b!1038248 (= e!587313 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457549) (_1!7875 (tuple2!15729 lt!457400 lt!457297)))))))

(assert (= (and d!125623 c!105453) b!1038246))

(assert (= (and d!125623 (not c!105453)) b!1038247))

(assert (= (and d!125623 (not res!692489)) b!1038248))

(declare-fun m!958977 () Bool)

(assert (=> d!125623 m!958977))

(declare-fun m!958979 () Bool)

(assert (=> b!1038246 m!958979))

(assert (=> b!1038246 m!957825))

(assert (=> b!1038246 m!957825))

(declare-fun m!958981 () Bool)

(assert (=> b!1038246 m!958981))

(assert (=> b!1038248 m!957825))

(assert (=> b!1038248 m!957825))

(assert (=> b!1038248 m!958981))

(assert (=> d!125135 d!125623))

(declare-fun b!1038249 () Bool)

(declare-fun e!587315 () Option!636)

(assert (=> b!1038249 (= e!587315 (Some!635 (_2!7875 (h!23109 lt!457551))))))

(declare-fun d!125625 () Bool)

(declare-fun c!105454 () Bool)

(assert (=> d!125625 (= c!105454 (and ((_ is Cons!21898) lt!457551) (= (_1!7875 (h!23109 lt!457551)) (_1!7875 (tuple2!15729 lt!457400 lt!457297)))))))

(assert (=> d!125625 (= (getValueByKey!585 lt!457551 (_1!7875 (tuple2!15729 lt!457400 lt!457297))) e!587315)))

(declare-fun b!1038250 () Bool)

(declare-fun e!587316 () Option!636)

(assert (=> b!1038250 (= e!587315 e!587316)))

(declare-fun c!105455 () Bool)

(assert (=> b!1038250 (= c!105455 (and ((_ is Cons!21898) lt!457551) (not (= (_1!7875 (h!23109 lt!457551)) (_1!7875 (tuple2!15729 lt!457400 lt!457297))))))))

(declare-fun b!1038251 () Bool)

(assert (=> b!1038251 (= e!587316 (getValueByKey!585 (t!31099 lt!457551) (_1!7875 (tuple2!15729 lt!457400 lt!457297))))))

(declare-fun b!1038252 () Bool)

(assert (=> b!1038252 (= e!587316 None!634)))

(assert (= (and d!125625 c!105454) b!1038249))

(assert (= (and d!125625 (not c!105454)) b!1038250))

(assert (= (and b!1038250 c!105455) b!1038251))

(assert (= (and b!1038250 (not c!105455)) b!1038252))

(declare-fun m!958983 () Bool)

(assert (=> b!1038251 m!958983))

(assert (=> d!125135 d!125625))

(declare-fun d!125627 () Bool)

(assert (=> d!125627 (= (getValueByKey!585 lt!457551 (_1!7875 (tuple2!15729 lt!457400 lt!457297))) (Some!635 (_2!7875 (tuple2!15729 lt!457400 lt!457297))))))

(declare-fun lt!457874 () Unit!33898)

(assert (=> d!125627 (= lt!457874 (choose!1709 lt!457551 (_1!7875 (tuple2!15729 lt!457400 lt!457297)) (_2!7875 (tuple2!15729 lt!457400 lt!457297))))))

(declare-fun e!587317 () Bool)

(assert (=> d!125627 e!587317))

(declare-fun res!692490 () Bool)

(assert (=> d!125627 (=> (not res!692490) (not e!587317))))

(assert (=> d!125627 (= res!692490 (isStrictlySorted!707 lt!457551))))

(assert (=> d!125627 (= (lemmaContainsTupThenGetReturnValue!281 lt!457551 (_1!7875 (tuple2!15729 lt!457400 lt!457297)) (_2!7875 (tuple2!15729 lt!457400 lt!457297))) lt!457874)))

(declare-fun b!1038253 () Bool)

(declare-fun res!692491 () Bool)

(assert (=> b!1038253 (=> (not res!692491) (not e!587317))))

(assert (=> b!1038253 (= res!692491 (containsKey!566 lt!457551 (_1!7875 (tuple2!15729 lt!457400 lt!457297))))))

(declare-fun b!1038254 () Bool)

(assert (=> b!1038254 (= e!587317 (contains!6047 lt!457551 (tuple2!15729 (_1!7875 (tuple2!15729 lt!457400 lt!457297)) (_2!7875 (tuple2!15729 lt!457400 lt!457297)))))))

(assert (= (and d!125627 res!692490) b!1038253))

(assert (= (and b!1038253 res!692491) b!1038254))

(assert (=> d!125627 m!957819))

(declare-fun m!958985 () Bool)

(assert (=> d!125627 m!958985))

(declare-fun m!958987 () Bool)

(assert (=> d!125627 m!958987))

(declare-fun m!958989 () Bool)

(assert (=> b!1038253 m!958989))

(declare-fun m!958991 () Bool)

(assert (=> b!1038254 m!958991))

(assert (=> d!125135 d!125627))

(declare-fun b!1038255 () Bool)

(declare-fun res!692492 () Bool)

(declare-fun e!587322 () Bool)

(assert (=> b!1038255 (=> (not res!692492) (not e!587322))))

(declare-fun lt!457875 () List!21902)

(assert (=> b!1038255 (= res!692492 (containsKey!566 lt!457875 (_1!7875 (tuple2!15729 lt!457400 lt!457297))))))

(declare-fun c!105457 () Bool)

(declare-fun b!1038256 () Bool)

(assert (=> b!1038256 (= c!105457 (and ((_ is Cons!21898) (toList!6897 lt!457405)) (bvsgt (_1!7875 (h!23109 (toList!6897 lt!457405))) (_1!7875 (tuple2!15729 lt!457400 lt!457297)))))))

(declare-fun e!587318 () List!21902)

(declare-fun e!587320 () List!21902)

(assert (=> b!1038256 (= e!587318 e!587320)))

(declare-fun b!1038257 () Bool)

(declare-fun e!587319 () List!21902)

(assert (=> b!1038257 (= e!587319 (insertStrictlySorted!374 (t!31099 (toList!6897 lt!457405)) (_1!7875 (tuple2!15729 lt!457400 lt!457297)) (_2!7875 (tuple2!15729 lt!457400 lt!457297))))))

(declare-fun b!1038258 () Bool)

(assert (=> b!1038258 (= e!587322 (contains!6047 lt!457875 (tuple2!15729 (_1!7875 (tuple2!15729 lt!457400 lt!457297)) (_2!7875 (tuple2!15729 lt!457400 lt!457297)))))))

(declare-fun bm!43964 () Bool)

(declare-fun call!43967 () List!21902)

(declare-fun call!43966 () List!21902)

(assert (=> bm!43964 (= call!43967 call!43966)))

(declare-fun b!1038259 () Bool)

(assert (=> b!1038259 (= e!587320 call!43967)))

(declare-fun b!1038260 () Bool)

(declare-fun e!587321 () List!21902)

(declare-fun call!43968 () List!21902)

(assert (=> b!1038260 (= e!587321 call!43968)))

(declare-fun bm!43965 () Bool)

(assert (=> bm!43965 (= call!43966 call!43968)))

(declare-fun b!1038261 () Bool)

(assert (=> b!1038261 (= e!587318 call!43966)))

(declare-fun b!1038262 () Bool)

(assert (=> b!1038262 (= e!587320 call!43967)))

(declare-fun c!105458 () Bool)

(declare-fun b!1038263 () Bool)

(assert (=> b!1038263 (= e!587319 (ite c!105458 (t!31099 (toList!6897 lt!457405)) (ite c!105457 (Cons!21898 (h!23109 (toList!6897 lt!457405)) (t!31099 (toList!6897 lt!457405))) Nil!21899)))))

(declare-fun b!1038264 () Bool)

(assert (=> b!1038264 (= e!587321 e!587318)))

(assert (=> b!1038264 (= c!105458 (and ((_ is Cons!21898) (toList!6897 lt!457405)) (= (_1!7875 (h!23109 (toList!6897 lt!457405))) (_1!7875 (tuple2!15729 lt!457400 lt!457297)))))))

(declare-fun bm!43963 () Bool)

(declare-fun c!105459 () Bool)

(assert (=> bm!43963 (= call!43968 ($colon$colon!604 e!587319 (ite c!105459 (h!23109 (toList!6897 lt!457405)) (tuple2!15729 (_1!7875 (tuple2!15729 lt!457400 lt!457297)) (_2!7875 (tuple2!15729 lt!457400 lt!457297))))))))

(declare-fun c!105456 () Bool)

(assert (=> bm!43963 (= c!105456 c!105459)))

(declare-fun d!125629 () Bool)

(assert (=> d!125629 e!587322))

(declare-fun res!692493 () Bool)

(assert (=> d!125629 (=> (not res!692493) (not e!587322))))

(assert (=> d!125629 (= res!692493 (isStrictlySorted!707 lt!457875))))

(assert (=> d!125629 (= lt!457875 e!587321)))

(assert (=> d!125629 (= c!105459 (and ((_ is Cons!21898) (toList!6897 lt!457405)) (bvslt (_1!7875 (h!23109 (toList!6897 lt!457405))) (_1!7875 (tuple2!15729 lt!457400 lt!457297)))))))

(assert (=> d!125629 (isStrictlySorted!707 (toList!6897 lt!457405))))

(assert (=> d!125629 (= (insertStrictlySorted!374 (toList!6897 lt!457405) (_1!7875 (tuple2!15729 lt!457400 lt!457297)) (_2!7875 (tuple2!15729 lt!457400 lt!457297))) lt!457875)))

(assert (= (and d!125629 c!105459) b!1038260))

(assert (= (and d!125629 (not c!105459)) b!1038264))

(assert (= (and b!1038264 c!105458) b!1038261))

(assert (= (and b!1038264 (not c!105458)) b!1038256))

(assert (= (and b!1038256 c!105457) b!1038262))

(assert (= (and b!1038256 (not c!105457)) b!1038259))

(assert (= (or b!1038262 b!1038259) bm!43964))

(assert (= (or b!1038261 bm!43964) bm!43965))

(assert (= (or b!1038260 bm!43965) bm!43963))

(assert (= (and bm!43963 c!105456) b!1038257))

(assert (= (and bm!43963 (not c!105456)) b!1038263))

(assert (= (and d!125629 res!692493) b!1038255))

(assert (= (and b!1038255 res!692492) b!1038258))

(declare-fun m!958993 () Bool)

(assert (=> b!1038257 m!958993))

(declare-fun m!958995 () Bool)

(assert (=> bm!43963 m!958995))

(declare-fun m!958997 () Bool)

(assert (=> b!1038255 m!958997))

(declare-fun m!958999 () Bool)

(assert (=> b!1038258 m!958999))

(declare-fun m!959001 () Bool)

(assert (=> d!125629 m!959001))

(declare-fun m!959003 () Bool)

(assert (=> d!125629 m!959003))

(assert (=> d!125135 d!125629))

(declare-fun d!125631 () Bool)

(assert (=> d!125631 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457408) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun lt!457876 () Unit!33898)

(assert (=> d!125631 (= lt!457876 (choose!1710 (toList!6897 lt!457408) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!587323 () Bool)

(assert (=> d!125631 e!587323))

(declare-fun res!692494 () Bool)

(assert (=> d!125631 (=> (not res!692494) (not e!587323))))

(assert (=> d!125631 (= res!692494 (isStrictlySorted!707 (toList!6897 lt!457408)))))

(assert (=> d!125631 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457408) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) lt!457876)))

(declare-fun b!1038265 () Bool)

(assert (=> b!1038265 (= e!587323 (containsKey!566 (toList!6897 lt!457408) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125631 res!692494) b!1038265))

(assert (=> d!125631 m!957361))

(assert (=> d!125631 m!957615))

(assert (=> d!125631 m!957615))

(assert (=> d!125631 m!957661))

(assert (=> d!125631 m!957361))

(declare-fun m!959005 () Bool)

(assert (=> d!125631 m!959005))

(assert (=> d!125631 m!958093))

(assert (=> b!1038265 m!957361))

(assert (=> b!1038265 m!957657))

(assert (=> b!1037448 d!125631))

(assert (=> b!1037448 d!125309))

(assert (=> b!1037448 d!125207))

(declare-fun d!125633 () Bool)

(assert (=> d!125633 (isDefined!435 (getValueByKey!585 (toList!6897 lt!457385) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!457877 () Unit!33898)

(assert (=> d!125633 (= lt!457877 (choose!1710 (toList!6897 lt!457385) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587324 () Bool)

(assert (=> d!125633 e!587324))

(declare-fun res!692495 () Bool)

(assert (=> d!125633 (=> (not res!692495) (not e!587324))))

(assert (=> d!125633 (= res!692495 (isStrictlySorted!707 (toList!6897 lt!457385)))))

(assert (=> d!125633 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!397 (toList!6897 lt!457385) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457877)))

(declare-fun b!1038266 () Bool)

(assert (=> b!1038266 (= e!587324 (containsKey!566 (toList!6897 lt!457385) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125633 res!692495) b!1038266))

(assert (=> d!125633 m!957725))

(assert (=> d!125633 m!957725))

(assert (=> d!125633 m!957739))

(declare-fun m!959007 () Bool)

(assert (=> d!125633 m!959007))

(assert (=> d!125633 m!958139))

(assert (=> b!1038266 m!957735))

(assert (=> b!1037500 d!125633))

(assert (=> b!1037500 d!125313))

(assert (=> b!1037500 d!125315))

(declare-fun d!125635 () Bool)

(declare-fun lt!457878 () (_ BitVec 32))

(assert (=> d!125635 (and (bvsge lt!457878 #b00000000000000000000000000000000) (bvsle lt!457878 (bvsub (size!31976 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!587325 () (_ BitVec 32))

(assert (=> d!125635 (= lt!457878 e!587325)))

(declare-fun c!105461 () Bool)

(assert (=> d!125635 (= c!105461 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 thiss!1427))))))

(assert (=> d!125635 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31976 (_keys!11496 thiss!1427)) (size!31976 (_keys!11496 thiss!1427))))))

(assert (=> d!125635 (= (arrayCountValidKeys!0 (_keys!11496 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31976 (_keys!11496 thiss!1427))) lt!457878)))

(declare-fun b!1038267 () Bool)

(declare-fun e!587326 () (_ BitVec 32))

(declare-fun call!43969 () (_ BitVec 32))

(assert (=> b!1038267 (= e!587326 (bvadd #b00000000000000000000000000000001 call!43969))))

(declare-fun bm!43966 () Bool)

(assert (=> bm!43966 (= call!43969 (arrayCountValidKeys!0 (_keys!11496 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31976 (_keys!11496 thiss!1427))))))

(declare-fun b!1038268 () Bool)

(assert (=> b!1038268 (= e!587326 call!43969)))

(declare-fun b!1038269 () Bool)

(assert (=> b!1038269 (= e!587325 #b00000000000000000000000000000000)))

(declare-fun b!1038270 () Bool)

(assert (=> b!1038270 (= e!587325 e!587326)))

(declare-fun c!105460 () Bool)

(assert (=> b!1038270 (= c!105460 (validKeyInArray!0 (select (arr!31447 (_keys!11496 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!125635 c!105461) b!1038269))

(assert (= (and d!125635 (not c!105461)) b!1038270))

(assert (= (and b!1038270 c!105460) b!1038267))

(assert (= (and b!1038270 (not c!105460)) b!1038268))

(assert (= (or b!1038267 b!1038268) bm!43966))

(declare-fun m!959009 () Bool)

(assert (=> bm!43966 m!959009))

(assert (=> b!1038270 m!958067))

(assert (=> b!1038270 m!958067))

(assert (=> b!1038270 m!958071))

(assert (=> bm!43907 d!125635))

(declare-fun d!125637 () Bool)

(assert (=> d!125637 (= (apply!916 lt!457536 (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000)) (get!16493 (getValueByKey!585 (toList!6897 lt!457536) (select (arr!31447 (_keys!11496 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30389 () Bool)

(assert (= bs!30389 d!125637))

(assert (=> bs!30389 m!957361))

(assert (=> bs!30389 m!958753))

(assert (=> bs!30389 m!958753))

(declare-fun m!959011 () Bool)

(assert (=> bs!30389 m!959011))

(assert (=> b!1037515 d!125637))

(assert (=> b!1037515 d!125083))

(declare-fun mapNonEmpty!38420 () Bool)

(declare-fun mapRes!38420 () Bool)

(declare-fun tp!73776 () Bool)

(declare-fun e!587328 () Bool)

(assert (=> mapNonEmpty!38420 (= mapRes!38420 (and tp!73776 e!587328))))

(declare-fun mapRest!38420 () (Array (_ BitVec 32) ValueCell!11594))

(declare-fun mapKey!38420 () (_ BitVec 32))

(declare-fun mapValue!38420 () ValueCell!11594)

(assert (=> mapNonEmpty!38420 (= mapRest!38419 (store mapRest!38420 mapKey!38420 mapValue!38420))))

(declare-fun b!1038271 () Bool)

(assert (=> b!1038271 (= e!587328 tp_is_empty!24595)))

(declare-fun mapIsEmpty!38420 () Bool)

(assert (=> mapIsEmpty!38420 mapRes!38420))

(declare-fun b!1038272 () Bool)

(declare-fun e!587327 () Bool)

(assert (=> b!1038272 (= e!587327 tp_is_empty!24595)))

(declare-fun condMapEmpty!38420 () Bool)

(declare-fun mapDefault!38420 () ValueCell!11594)

(assert (=> mapNonEmpty!38419 (= condMapEmpty!38420 (= mapRest!38419 ((as const (Array (_ BitVec 32) ValueCell!11594)) mapDefault!38420)))))

(assert (=> mapNonEmpty!38419 (= tp!73775 (and e!587327 mapRes!38420))))

(assert (= (and mapNonEmpty!38419 condMapEmpty!38420) mapIsEmpty!38420))

(assert (= (and mapNonEmpty!38419 (not condMapEmpty!38420)) mapNonEmpty!38420))

(assert (= (and mapNonEmpty!38420 ((_ is ValueCellFull!11594) mapValue!38420)) b!1038271))

(assert (= (and mapNonEmpty!38419 ((_ is ValueCellFull!11594) mapDefault!38420)) b!1038272))

(declare-fun m!959013 () Bool)

(assert (=> mapNonEmpty!38420 m!959013))

(declare-fun b_lambda!16157 () Bool)

(assert (= b_lambda!16147 (or (and b!1037199 b_free!20875) b_lambda!16157)))

(declare-fun b_lambda!16159 () Bool)

(assert (= b_lambda!16131 (or (and b!1037199 b_free!20875 (= (defaultEntry!6269 thiss!1427) (defaultEntry!6269 lt!457298))) b_lambda!16159)))

(declare-fun b_lambda!16161 () Bool)

(assert (= b_lambda!16145 (or (and b!1037199 b_free!20875) b_lambda!16161)))

(declare-fun b_lambda!16163 () Bool)

(assert (= b_lambda!16153 (or (and b!1037199 b_free!20875) b_lambda!16163)))

(declare-fun b_lambda!16165 () Bool)

(assert (= b_lambda!16155 (or (and b!1037199 b_free!20875) b_lambda!16165)))

(check-sat (not b!1037893) (not b!1038190) (not d!125507) (not d!125269) (not d!125319) (not d!125203) (not d!125515) (not b!1037907) (not d!125589) (not bm!43960) (not d!125277) (not d!125191) (not d!125401) (not b!1038060) (not b!1038239) (not b!1037955) (not b!1037782) (not b!1038236) (not d!125363) (not b!1037937) (not d!125433) (not d!125261) (not d!125421) (not b!1038051) (not b!1038167) (not b!1037993) (not b!1037674) (not d!125237) (not b!1037716) (not b!1037889) (not d!125611) (not b!1038131) (not d!125283) (not b!1037742) (not b!1037866) (not b!1037938) (not d!125613) (not d!125257) (not b!1037799) (not d!125571) (not b!1037781) (not b!1037729) (not d!125591) (not b!1037702) (not b!1037826) (not b!1038207) (not b!1038214) (not d!125313) (not b!1037913) (not bm!43929) (not b!1037763) (not d!125587) (not b!1037724) (not b_lambda!16137) (not b!1038114) (not b!1038116) (not d!125599) (not d!125519) (not b!1037797) (not b!1037773) (not b!1038146) (not b!1037917) (not b!1037895) (not b!1038212) (not b!1037945) (not d!125185) (not bm!43937) (not b!1038232) (not d!125183) (not b!1037886) (not b!1037882) (not d!125437) (not b!1037977) (not d!125381) (not d!125375) (not b!1038181) (not d!125435) (not d!125391) (not d!125597) (not b!1038110) (not d!125603) (not b!1037764) (not b!1038174) (not b!1038158) (not bm!43959) (not d!125529) (not b!1037699) (not d!125361) (not b!1038221) (not b!1037613) (not b!1037856) (not d!125409) (not b!1037860) (not d!125443) (not d!125383) (not d!125271) (not d!125483) (not d!125573) (not bm!43963) (not b!1038113) (not d!125479) (not b!1037960) (not b!1037934) (not b!1037873) (not d!125619) (not b!1038246) (not b!1037914) (not b!1037744) (not b!1037593) (not b!1037927) (not d!125539) (not b!1037874) (not b!1037900) (not d!125175) b_and!33421 (not b!1038104) (not b!1037709) (not b!1037885) (not b!1038108) (not d!125333) (not d!125585) (not b!1038219) (not b!1038254) (not d!125439) (not b!1038164) (not b!1038144) (not d!125309) (not b!1037735) (not b!1038127) (not b_lambda!16161) (not d!125379) (not b!1037959) (not d!125631) (not b!1037703) (not bm!43944) (not b!1038028) (not d!125255) (not d!125577) (not b!1037848) (not b!1037706) (not d!125425) (not b_lambda!16125) (not d!125623) (not b!1037974) (not d!125307) (not b!1037762) (not d!125245) (not b!1037890) (not b!1037638) (not bm!43939) (not d!125445) (not b!1037594) (not b!1038009) (not b!1037888) (not b!1038126) (not b!1037870) (not b!1038006) (not b!1037749) (not d!125325) (not d!125249) (not b!1038205) (not b!1037693) (not d!125201) (not bm!43930) (not b!1037976) (not b!1037767) (not b!1037971) (not b!1038101) (not d!125453) (not b!1038039) (not bm!43928) (not b!1037665) (not b!1037904) (not b!1037718) (not bm!43925) (not d!125369) (not d!125293) (not b!1038155) (not b!1037863) (not b_next!20875) (not d!125273) (not d!125423) (not b!1037733) (not d!125227) (not d!125187) (not b!1038253) (not b!1038048) (not b!1038180) (not b!1037862) (not b!1038035) (not d!125345) (not b!1037815) (not b!1037877) (not b!1038053) (not d!125405) (not b!1037650) (not d!125485) (not b!1038224) (not b!1038196) (not bm!43940) (not b!1038200) (not b!1037820) (not b!1037705) (not b!1038229) (not b!1038187) (not b!1038016) (not b!1038251) (not b!1037897) (not d!125179) (not d!125279) (not b!1037910) (not b!1037671) (not d!125633) (not bm!43953) (not b!1038248) (not bm!43936) (not d!125517) (not b!1037740) (not d!125373) (not b!1037813) (not d!125463) (not b!1037653) (not d!125285) (not b_lambda!16159) (not b!1037801) (not b!1037803) (not b!1038018) (not b_lambda!16141) (not b!1037784) (not d!125549) (not b!1037909) (not b!1037794) (not b!1038004) (not b!1038255) (not d!125477) (not d!125455) (not b!1038040) (not b!1037596) (not b!1037691) (not b!1038161) (not b_lambda!16151) (not b!1037696) (not b!1037708) (not d!125471) (not b!1037775) (not b!1038106) (not d!125465) (not b!1037720) (not b!1037969) (not b!1038118) (not b!1037948) (not b!1037737) (not b!1037607) (not b!1038265) (not b!1037852) (not b_lambda!16139) (not b!1038030) (not b!1037800) (not d!125239) (not b!1037614) (not d!125229) (not b!1038080) (not d!125251) (not b!1037923) (not b!1037684) (not b!1037747) (not b_lambda!16163) (not d!125473) (not b!1038073) (not d!125541) (not d!125367) (not b!1038195) (not b!1038011) (not b!1037712) (not b!1037968) (not b_lambda!16123) (not b!1038008) (not b!1037933) (not b!1038062) (not b!1038226) (not bm!43947) (not d!125305) (not d!125299) (not d!125567) (not b!1037996) (not b!1038258) (not bm!43941) (not b!1038266) (not b!1038130) (not b!1038235) (not b!1038063) (not b!1038036) (not b!1037804) (not d!125389) (not bm!43950) (not d!125481) (not b!1037980) (not d!125593) (not b!1037978) (not b!1038020) (not b!1037670) (not d!125637) (not d!125429) (not d!125531) (not b!1037876) (not b!1037731) (not b!1038209) (not b!1037981) (not b!1038014) (not d!125501) (not b!1037591) (not b!1037757) (not b!1037957) (not b!1038143) (not d!125173) (not b!1037880) (not d!125289) (not d!125181) (not b!1038021) (not b!1038071) (not b!1037663) (not b!1037778) (not bm!43956) (not b!1037902) (not d!125629) (not d!125469) (not b!1037940) (not b!1038098) (not d!125377) (not b!1037884) (not d!125509) (not b!1038140) (not b!1037953) (not b!1037956) (not b!1038050) (not b!1038234) (not b!1037838) (not b!1038111) (not b!1037785) (not b!1037998) (not b!1037698) (not b!1037845) (not b!1038204) (not b!1038059) (not d!125615) (not b!1038227) (not b!1038257) (not b!1038183) (not d!125551) (not b!1037792) (not b!1038216) (not b!1037967) (not d!125253) (not b!1038151) (not bm!43966) (not b!1038056) (not b!1038033) (not bm!43933) (not b!1037637) (not b!1037672) (not d!125371) (not b!1037822) (not b!1037950) (not b!1038121) (not d!125243) (not b!1037891) (not d!125395) (not b!1037939) (not b!1037759) (not b!1038128) (not b!1037766) (not d!125547) (not d!125297) (not b_lambda!16149) (not mapNonEmpty!38420) (not d!125595) (not b!1038185) (not d!125489) (not d!125197) (not b!1038202) (not d!125403) (not b!1037658) (not b!1037726) (not b!1038156) (not b!1038198) (not b!1038058) (not b!1038119) (not d!125385) (not b!1037738) (not b!1038270) (not b!1037990) (not b!1037879) (not b!1038238) (not b!1038148) (not b!1037899) (not d!125497) (not b!1037780) (not d!125387) (not b!1037656) (not d!125301) (not b!1038171) (not d!125605) (not d!125495) (not b!1037668) (not b!1038124) (not d!125263) (not b!1037661) (not d!125491) (not b!1037931) (not b!1038203) (not b!1037817) (not b!1038153) (not b!1037867) (not b!1037871) tp_is_empty!24595 (not bm!43938) (not b!1037994) (not b_lambda!16143) (not b!1037760) (not b!1038017) (not b_lambda!16157) (not b!1037635) (not d!125525) (not b!1037755) (not d!125621) (not d!125365) (not b!1037919) (not b!1038217) (not b!1038037) (not b!1037830) (not b!1037752) (not b!1038223) (not d!125427) (not b!1037834) (not b!1038201) (not d!125247) (not d!125329) (not d!125193) (not d!125217) (not b_lambda!16117) (not b!1037916) (not b!1037947) (not b!1037771) (not d!125575) (not b!1037823) (not b!1037920) (not d!125627) (not b_lambda!16165) (not b!1037675) (not b!1038182) (not bm!43922))
(check-sat b_and!33421 (not b_next!20875))
